# ------------------------------------------------------------------------------
# Paper-Metadaten zum Thema "machine psychology" von OpenAlex herunterladen
#
# - nutzt die OpenAlex-REST-API (https://api.openalex.org/works)
# - Cursor-Paging, d.h. es werden *alle* Treffer geholt (nicht nur 200)
# - Abstracts werden aus dem "abstract_inverted_index" rekonstruiert
# - Ergebnis: CSV (flache Tabelle) + RDS (inkl. Listen-Spalten)
#
# Optional: API-Key als Umgebungsvariable setzen, z.B. in ~/.Renviron:
#   OPENALEX_API_KEY=dein_key
#   OPENALEX_MAILTO=deine@mail.de   # für den "polite pool"
# ------------------------------------------------------------------------------

library(httr2)
library(dplyr)
library(purrr)
library(tibble)
library(readr)


# Einstellungen ----------------------------------------------------------------

suchbegriff <- '"machine psychology"'   # Anführungszeichen = Phrasensuche
nur_titel_abstract <- TRUE              # TRUE: nur in Titel + Abstract suchen
                                        # FALSE: Volltextsuche (mehr Treffer, mehr Rauschen)
filter_zusatz <- NULL                   # z.B. "from_publication_date:2018-01-01"
max_treffer <- Inf                      # zum Testen z.B. 50
ausgabe_datei <- "openalex_machine_psychology"


# Hilfsfunktionen --------------------------------------------------------------

# Abstract aus invertiertem Index (Wort -> Positionen) zurückbauen
abstract_rekonstruieren <- function(inv_index) {
  if (is.null(inv_index) || length(inv_index) == 0) return(NA_character_)
  pos <- unlist(inv_index)
  woerter <- rep(names(inv_index), lengths(inv_index))
  paste(woerter[order(pos)], collapse = " ")
}

# NULL -> NA, damit tibble() nicht stolpert
`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

# Ein OpenAlex-"work" in eine Tabellenzeile umwandeln
work_zu_zeile <- function(w) {
  autoren <- map_chr(w$authorships %||% list(),
                     \(a) a$author$display_name %||% NA_character_)
  institutionen <- w$authorships %||% list() |>
    map(\(a) map_chr(a$institutions %||% list(), \(i) i$display_name %||% NA_character_)) |>
    unlist() |>
    unique()
  topics <- map_chr(w$topics %||% list(), \(t) t$display_name %||% NA_character_)
  keywords <- map_chr(w$keywords %||% list(), \(k) k$display_name %||% NA_character_)

  tibble(
    openalex_id      = w$id %||% NA_character_,
    doi              = w$doi %||% NA_character_,
    titel            = w$display_name %||% NA_character_,
    jahr             = w$publication_year %||% NA_integer_,
    datum            = w$publication_date %||% NA_character_,
    typ              = w$type %||% NA_character_,
    sprache          = w$language %||% NA_character_,
    quelle           = w$primary_location$source$display_name %||% NA_character_,
    verlag           = w$primary_location$source$host_organization_name %||% NA_character_,
    zitiert_von      = w$cited_by_count %||% NA_integer_,
    open_access      = w$open_access$is_oa %||% NA,
    oa_status        = w$open_access$oa_status %||% NA_character_,
    oa_url           = w$open_access$oa_url %||% NA_character_,
    n_autoren        = length(autoren),
    autoren          = paste(autoren, collapse = "; "),
    institutionen    = paste(institutionen, collapse = "; "),
    topics           = paste(topics, collapse = "; "),
    keywords         = paste(keywords, collapse = "; "),
    abstract         = abstract_rekonstruieren(w$abstract_inverted_index),
    referenzen       = list(unlist(w$referenced_works %||% list()))
  )
}


# Anfrage aufbauen -------------------------------------------------------------

basis_req <- request("https://api.openalex.org/works") |>
  req_user_agent("R httr2 openalex-download") |>
  req_retry(max_tries = 5, backoff = \(i) 2^i) |>
  req_throttle(rate = 5)   # max. 5 Anfragen/Sekunde

such_param <- if (nur_titel_abstract) {
  list(filter = paste(c(paste0("title_and_abstract.search:", suchbegriff),
                        filter_zusatz), collapse = ","))
} else {
  list(search = suchbegriff,
       filter = if (!is.null(filter_zusatz)) filter_zusatz)
}

api_key <- Sys.getenv("OPENALEX_API_KEY")
mailto  <- Sys.getenv("OPENALEX_MAILTO")

basis_req <- basis_req |>
  req_url_query(!!!compact(such_param),
                `per-page` = 200,
                api_key = if (nzchar(api_key)) api_key,
                mailto  = if (nzchar(mailto)) mailto)


# Alle Seiten per Cursor abholen -----------------------------------------------

cursor <- "*"
alle_works <- list()
seite <- 0

repeat {
  seite <- seite + 1
  antwort <- basis_req |>
    req_url_query(cursor = cursor) |>
    req_perform() |>
    resp_body_json()

  if (seite == 1) {
    message("Treffer laut OpenAlex: ", antwort$meta$count)
  }

  ergebnisse <- antwort$results
  if (length(ergebnisse) == 0) break

  alle_works <- c(alle_works, ergebnisse)
  message("Seite ", seite, ": ", length(alle_works), " Works geladen")

  cursor <- antwort$meta$next_cursor
  if (is.null(cursor) || length(alle_works) >= max_treffer) break
}

alle_works <- head(alle_works, max_treffer)


# In Tabelle umwandeln und speichern -------------------------------------------

papers <- map(alle_works, work_zu_zeile) |>
  list_rbind() |>
  distinct(openalex_id, .keep_all = TRUE) |>
  arrange(desc(jahr), desc(zitiert_von))

saveRDS(papers, paste0(ausgabe_datei, ".rds"))
papers |>
  select(-referenzen) |>
  write_csv(paste0(ausgabe_datei, ".csv"))

message("Fertig: ", nrow(papers), " Papers gespeichert in ",
        ausgabe_datei, ".csv / .rds")


# Export für Zotero ------------------------------------------------------------
# 1) RIS-Datei: in Zotero über "Datei → Importieren…" einlesen
# 2) DOI-Liste: in Zotero über den Zauberstab ("Eintrag über Identifikator
#    hinzufügen") einfügen – Zotero holt die Metadaten dann selbst

ris_typ <- function(typ) {
  case_when(
    typ == "book"         ~ "BOOK",
    typ == "book-chapter" ~ "CHAP",
    typ == "dissertation" ~ "THES",
    typ == "preprint"     ~ "UNPB",
    typ == "report"       ~ "RPRT",
    typ == "dataset"      ~ "DATA",
    .default = "JOUR"
  )
}

# Mehrteilige Felder ("a; b; c") in einzelne RIS-Zeilen aufteilen
ris_mehrfach <- function(tag, wert) {
  if (is.na(wert) || !nzchar(wert)) return(character(0))
  paste0(tag, "  - ", strsplit(wert, "; ", fixed = TRUE)[[1]])
}

ris_feld <- function(tag, wert) {
  if (is.na(wert) || !nzchar(as.character(wert))) return(character(0))
  paste0(tag, "  - ", gsub("[\r\n]+", " ", wert))
}

papers_ris <- papers |>
  mutate(doi_kurz = sub("^https?://(dx\\.)?doi\\.org/", "", doi))

ris_zeilen <- pmap(papers_ris, function(...) {
  p <- list(...)
  c(
    paste0("TY  - ", ris_typ(p$typ)),
    ris_feld("TI", p$titel),
    ris_mehrfach("AU", p$autoren),
    ris_feld("PY", p$jahr),
    ris_feld("DA", gsub("-", "/", p$datum)),
    ris_feld("T2", p$quelle),
    ris_feld("PB", p$verlag),
    ris_feld("DO", p$doi_kurz),
    ris_feld("UR", coalesce(p$oa_url, p$doi, p$openalex_id)),
    ris_feld("LA", p$sprache),
    ris_feld("AB", p$abstract),
    ris_mehrfach("KW", p$keywords),
    ris_feld("N1", paste0("OpenAlex: ", p$openalex_id,
                          " | zitiert von: ", p$zitiert_von)),
    "ER  - ",
    ""
  )
}) |> unlist()

writeLines(enc2utf8(ris_zeilen), paste0(ausgabe_datei, ".ris"), useBytes = TRUE)

papers_ris |>
  filter(!is.na(doi_kurz)) |>
  pull(doi_kurz) |>
  writeLines(paste0(ausgabe_datei, "_dois.txt"))

message("Zotero-Export: ", ausgabe_datei, ".ris (", nrow(papers), " Einträge), ",
        ausgabe_datei, "_dois.txt (", sum(!is.na(papers_ris$doi_kurz)), " DOIs)")


# Kurzer Überblick -------------------------------------------------------------

papers |> count(jahr, sort = FALSE) |> print(n = Inf)
papers |> select(jahr, zitiert_von, titel) |> head(10) |> print()

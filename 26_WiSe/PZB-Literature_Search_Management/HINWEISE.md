# Quarto Scientific Writing -- Kurzreferenz

## Dateien

| Datei | Zweck |
|---|---|
| `paper.qmd` | Hauptdokument |
| `references.bib` | BibTeX-Bibliografie |
| `apa.csl` | Zitierstil (muss heruntergeladen werden, s.u.) |

## Setup in Positron

1. Positron erkennt `.qmd`-Dateien automatisch (Quarto-Extension vorausgesetzt)
2. Rendern: Cmd/Ctrl+Shift+K **oder** im Terminal:
   ```bash
   quarto render paper.qmd --to html
   quarto render paper.qmd --to pdf   # LaTeX erforderlich
   ```

## APA-CSL-Datei holen

```bash
# Im Projektordner:
curl -O https://raw.githubusercontent.com/citation-style-language/styles/master/apa.csl
```

Alternativ: Zotero Style Repository → https://www.zotero.org/styles

## Zitier-Syntax

| Syntax | Ergebnis |
|---|---|
| `@kruschke2014` | Kruschke (2014) |
| `[@kruschke2014]` | (Kruschke, 2014) |
| `[@kruschke2014, S. 15]` | (Kruschke, 2014, S. 15) |
| `[@a2020; @b2021]` | (A, 2020; B, 2021) |
| `-@kruschke2014` | nur Jahreszahl: (2014) |

## Journal-Templates (optional)

Quarto unterstützt offizielle Journal-Templates:

```bash
# Beispiel: JASA
quarto use template quarto-journals/jasa

# Weitere:
# quarto-journals/plos     (PLOS ONE)
# quarto-journals/elsevier
# quarto-journals/acm
# quarto-journals/biometrics
```

Liste aller Templates: https://github.com/quarto-journals

## Zotero-Integration

In `_quarto.yml` oder YAML-Header:
```yaml
bibliography: references.bib   # exportiert aus Zotero als BibTeX
```

Mit dem **Zotero Connector** und dem **quarto-zotero**-Plugin
lassen sich Zitate direkt aus Zotero einfügen (Zotero muss laufen).

## Typische Code-Chunk-Optionen

```r
#| label: fig-name        # Referenz mit @fig-name im Text
#| fig-cap: "Beschriftung"
#| echo: false            # Code ausblenden
#| cache: true            # Ergebnis cachen
```

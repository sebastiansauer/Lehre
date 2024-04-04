# Das ist eine R-Skript-Datei - R wartet auf Ihre Befehle.

# Rechnen:
1+3


# Variablen zuweisen:
Ort <- "Ansbach"

# Aufgabe: Definieren Sie eine Variable "Alter" mit Ihrem Alter als Inhalt
alter <- 45
Alter <- 0
alter <- "45"

alter <- Alter

# Aufgabe: Verdoppeln Sie den Wert der Variable "alter"

alter + alter
alter_doppelt <- alter * 2

# Shortcut für "Run-Button": Strg+Enter

# Variablen auslesen
Ort


# "Liste" definieren:

namen_liste <- c("Anna", "Berta", "Carla") 

# Aufgabe:
# Erstellen Sie eine "Altersliste"!

alter_liste <- c(42, 45, 48)

mean(alter_liste)

alter_liste - 1

# Aufgabe: Verdopeln Sie jeden Wert Ihrer Altersliste!
# Bonus: Speichern Sie das Ergebnis als neue Variable.

alter_liste_doppelt <- alter_liste * 2

# Fehlende Werte

alter_freunde <- c(20, 21, NA)  # not available: fehlend.

# Hey R, ignoriere die fehlende Werte:
mean(alter_freunde, na.rm = TRUE)

# Häh, R?
mean(c(20, 21))

# Pakete starten per Befehl:
library(tidyverse)

# Datensatz "Mariokart" importieren:
mariokart <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")

namensliste <- c("Anna", "Berta", "Carla")

# Was macht dieser Befehl?
mean(mariokart$total_pr)

# Mit runden:
round(49.88049, 1)

# Zwei Befehle verschachtelt:
round(mean(mariokart$total_pr), 1)

# Weisen Sie den Mittelwert einer Variable zu.
# Runden Sie dann diese Variable (1 Dezimale).


total_pr_mean <- mean(mariokart$total_pr)
round(total_pr_mean, 1)



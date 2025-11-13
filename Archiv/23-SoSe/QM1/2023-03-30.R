# 2023-03-30


# Die Pfeife

# Daten einlesen:

library(easystats)  # Das Paket muss installiert sein
mariokart <- data_read("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")

# Pakete starten:
library(tidyverse)


# Jetzt kommt die Pfeife, Kap. 4.6 (Shortcut: Strg-Shift-M):

mariokart_wheels <- 
  mariokart %>% 
  group_by(wheels) %>% 
  summarise(pr_mean = mean(total_pr),
            count_n = n())  # n() gibt die Anzahl der Zeilen pro Gruppe an

mariokart_wheels



# Aufgabe "affairs_dplyr"




affairs_path <- "https://vincentarelbundock.github.io/Rdatasets/csv/AER/Affairs.csv"
affairs <- read.csv(affairs_path)

affairs %>% 
  filter(affairs > 0


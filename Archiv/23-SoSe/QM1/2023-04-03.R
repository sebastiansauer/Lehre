# 2023-04-03

# Daten einlesen:
mariokart <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")


# Pakete starten:
library(easystats)
library(tidyverse)
library(DataExplorer)


# Histogramm:
mariokart %>% 
  select(total_pr) %>% 
  filter(total_pr < 100) %>%  # ohne Extremwerte
  plot_histogram()


# Dichtediagramm:
mariokart %>% 
  select(total_pr) %>% 
  filter(total_pr < 100) %>%  # ohne Extremwerte
  plot_density()

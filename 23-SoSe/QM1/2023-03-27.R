
# 20223-03-27


# Vorbereitung:
library(easystats)
library(tidyverse)


# Daten importieren:
mariokart <- data_read("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")


# Sortieren:

mariokart2 <- arrange(mariokart, total_pr)

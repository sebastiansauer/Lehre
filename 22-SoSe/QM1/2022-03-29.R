# Syntax 2022-03-29

library(tidyverse)
data(mtcars)

# Filter mit die Karren mit 8 Zylindern

filter(mtcars, cyl < 6)
# synonym:
filter(mtcars, cyl == 8)  # ZWEI !!! Istgleichzeichen

# Aufgabe: Filtern Sie alle Karren mit Automatik-Getriebe
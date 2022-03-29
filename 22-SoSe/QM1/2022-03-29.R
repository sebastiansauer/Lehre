# Syntax 2022-03-29

library(tidyverse)
data(mtcars)

# Filter mit die Karren mit 8 Zylindern

filter(mtcars, cyl > 6)
# synonym:
filter(mtcars, cyl == 8)  # ZWEI !!! Istgleichzeichen

# Aufgabe: Filtern Sie alle Karren mit Automatik-Getriebe!
# Tipp: am == 0

filter(mtcars, am == 0)

# UND-Filtern
# Aufgabe, filter: Automatik, cyl > 6

filter(mtcars, am == 0, cyl > 6)


# ODER-Filtern
# filter mir Automatik ODER cyl > 6
filter(mtcars, am == 0 | cyl > 6)  # |, Mac: Option-7



mtcars2 <- arrange(mtcars, hp)

# Was macht wohl der folgende Arrange-Befehl?
mtcars3 <- arrange(mtcars, am, hp)


# Aufgabe
# Selektieren Sie die Spalten 2,3,5,7,11

select(mtcars, 2,3,5,7,11)
# synonym:
select(mtcars, c(2,3,5,7,11))

# Wählen Sie die Spalten für PS, Zylinder und Spritverbrauch und speichern Sie die Tabelle als mtcars4.


mtcars4 <- select(mtcars, cyl, mpg, hp)

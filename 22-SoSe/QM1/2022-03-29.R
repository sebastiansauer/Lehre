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


# Was macht wohl dieser Arrange-Befehl?

mtcars3 <- arrange(mtcars, am ,hp)



>>>>>>> a6c6beb1adf60d816b5cb240e6f77ea447d7567e

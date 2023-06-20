

# Erster Schritt :-)

# Variablen definieren

antwort = 42  # strg-enter

fach = "QM1"

neue_antwort = antwort
neue_antwort <- antwort

# lösche das Objekt "fach":
rm(fach)


# Rechnen  mit R:

1+1
antwort <- antwort + 1  # nicht vergessen: Strg-Enter zum Ausführen


73 / 2
73/3


# Vektorielles Rechnen mit R

best_buddies <- c("Anna", "Berta", "Carla")

noten <- c(1, 2, 3)

noten2 <- noten + 1

# Erster Statistik-Befehl!

mean(noten)

zeugnis <- mean(noten)

mean(noten)


noten2 <- c(2, 3, NA)

mean(noten2)

mean(noten2, na.rm = TRUE)


library(easystats)  # Das Paket muss installiert sein
d <- data_read("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")

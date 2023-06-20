# 2024-04-24-QM1

# Aufgabe: https://datenwerk.netlify.app/posts/mw-berechnen/mw-berechnen.html

zahlen <- c(0.27 ,-0.06, -0.80, -0.94)
mean(zahlen)



mariokart <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")
library(tidyverse)

# MW berechnen:
mariokart %>% 
  summarise(preis_mw = mean(total_pr))

# Oder so, kommt das Gleiche raus: 
lm(total_pr ~ 1, data = mariokart)

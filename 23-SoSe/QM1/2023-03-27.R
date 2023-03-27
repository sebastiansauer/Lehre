
# 20223-03-27


# Vorbereitung:
library(easystats)
library(tidyverse)  # startet das Paket tidyverse


# Verben des Datenjudos: Tidyverse -> Paket muss gestartet sein


# Daten importieren:
mariokart <- data_read("https://vincentarelbundock.github.io/Rdatasets/csv/openintro/mariokart.csv")


# Sortieren:

mariokart2 <- arrange(mariokart, total_pr)

arrange(mariokart, total_pr)



# Filtern


mariokart3 <- filter(mariokart, stock_photo == "yes" & cond == "new")


# Summarise:

summarise(mariokart, preis_mw = mean(total_pr))



# Gruppieren und Zusammenfassen



Zusammenfassen:
  

mariokart_gruppiert <- group_by(mariokart, stock_photo)
mariokart_klein <- summarise(mariokart_gruppiert, max_preis = max(total_pr)) 
mariokart_klein

mariokart_klein %>% 
  summarise(max_preis_mw = mean(max_preis))

1 + 1


# Strg+Enter zum Ausführen:
mariokart <- read.csv(paste0(
  "https://vincentarelbundock.github.io/Rdatasets/",
  "csv/openintro/mariokart.csv"
))


library(tidyverse)
glimpse(mariokart) # wohnt im Tidyverse

# Visualisierung:
library(ggpubr)

ggscatter(
  data = mariokart,
  x = "start_pr",
  y = "total_pr"
)

# Sortieren:

arrange(mariokart, -wheels)


# Filter:

mariokart_neu <-
  filter(mariokart, stock_photo == "yes")



# Summarize:


mariokart_mittelwert <-
  summarise(mariokart,
    preis_mw = mean(total_pr)
  )

mariokart_mittelwert


# Gruppieren:

mariokart_gruppiert <- group_by(mariokart, cond)



# zuerst gruppieren:
mariokart_gruppiert_foto <-
  group_by(mariokart, stock_photo)

mariokart_verkaufspreis_foto <-
  summarise(mariokart_gruppiert_foto,
    total_pr_avg = mean(total_pr)
  )

mariokart_verkaufspreis_foto

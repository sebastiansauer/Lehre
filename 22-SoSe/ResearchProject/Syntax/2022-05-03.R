# 2022-05-03

data_url <- "https://github.com/sebastiansauer/fopra/raw/main/Material/einkaufserlebnis/data_wenige_zeilen.xlsx"

library(tidyverse)
library(rio)

data("mtcars")

wilcox.test(mpg ~ am, data = mtcars)  # av ~ uv


library(rstanarm)

lm1 <-lm(mpg ~ am, data = mtcars)

summary(lm1)

remotes::install_github("IndrajeetPatil/ggstatsplot")

library("ggstatsplot")

ggbetweenstats(
  data = mtcars,
  x = am,
  y = mpg
)


# Aufgabe: Exportieren Sie eine Tabelle!

# 1. Erstellen Sie eine Häufigkeitstabelle für mtcars (mpg ~ am)
# 2. Visualisieren Sie die Tabelle (Tipp: Paket `gt` oder `flextable`)
# 3. Exportieren Sie nach Word!

library(tidyverse)
library(gt)

# ad 1
tab1 <-
mtcars %>% 
  count(am) 
  
# ad2
tab1 %>% 
  gt()


# ad 3
# copy-paste der Tabelle oder:
flextable(tab1)



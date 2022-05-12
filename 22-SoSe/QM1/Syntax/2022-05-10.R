# 2022-05-10



# Vorbereitung ------------------------------------------------------------
library(tidyverse)

# Dateiname mit Pfad:
d_url <- "/home/sebastian/Documents/datasets/women-in-parliament/API_SG.GEN.PARL.ZS_DS2_en_csv_v2_4025756.csv"

# Importieren mit Skippen der ersten 4 Zeilen:
d <- read_csv(d_url, skip = 4)

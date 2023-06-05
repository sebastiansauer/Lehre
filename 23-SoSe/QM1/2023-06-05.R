# 2023-06-05

# Kap. 10.3.1

# Pakete starten:
library(tidyverse)
library(easystats)


# Daten importieren:
wetter_path <- "https://raw.githubusercontent.com/sebastiansauer/datasets/main/csv/precip_temp_DWD.csv"
wetter <- read.csv(wetter_path)

# 1. Modell berechnen:
lm_wetter1 <- lm(temp ~ year, data = wetter)
parameters(lm_wetter1)

estimate_relation(lm_wetter1) %>% plot()
plot(estimate_relation(lm_wetter1))  # synonym


# 2. Modell berechnen:

# ... mit aggregierten Daten:
wetter_summ <-
  wetter %>% 
  group_by(year) %>% 
  summarise(temp = mean(temp),
            precip = mean(precip))


lm_wetter1a <- lm(temp ~ year, data = wetter_summ)
parameters(lm_wetter1a)


estimate_relation(lm_wetter1a) %>% plot()

# Daten für "nur Bayern:

wetter_bayern <- 
wetter %>% 
  filter(region == "Bayern")















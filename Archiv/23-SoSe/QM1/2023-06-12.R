# 2023-06-12


wetter_path <- "https://raw.githubusercontent.com/sebastiansauer/datasets/main/csv/precip_temp_DWD.csv"
wetter <- read.csv(wetter_path)


# Sie können Regressionsmodelle für Forschungsfragen mit binärer, nominaler und metrischer UV erläutern und in R anwenden.
# Sie können Interaktionseffekte in Regressionsmodellen erläutern und in R anwenden.
# Sie können den Anwendungszweck von Zentrieren und z-Transformationen zur besseren Interpretation von Regressionsmodellen erläutern und in R anwenden.
# Sie können Modelle nutzen, um Vorhersagen anhand neuer Daten zu erstellen.

wetter <-
  wetter %>% 
  mutate(after_1950 = year > 1950) %>% 
  filter(region != "Deutschland")  # ohne Daten für Gesamt-Deutschland

lm_wetter_bin_uv <- lm(temp ~ after_1950, data = wetter)

parameters(lm_wetter_bin_uv)

estimate_expectation(lm_wetter_bin_uv) %>% plot()



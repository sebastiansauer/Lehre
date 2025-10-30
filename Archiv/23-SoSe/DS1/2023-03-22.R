# 2023-03-22

x <- c(10, 2, 3)

x[1]


y <- "a"

y[1]


gender <- factor(c("w", "m", "w", "w", "w"))



eine_liste <- list(titel = "Einführung",
                   woche = c(1, 2),
                   datum = c("2022-03-14", "2202-03-21"),
                   lernziele = c("dies", "jenes", "und noch mehr"),
                   lehre = c(TRUE, TRUE, TRUE)
)


# Indizieren Sie das 4. Element

eine_liste[[2]]

library(tidyverse)

pluck(eine_liste, 4, 1) 




vlibrary(tidyverse)

key_crop_yields <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/key_crop_yields.csv")
land_use <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-01/land_use_vs_yield_change_in_cereal_production.csv")



top_countries <- land_use %>%
  janitor::clean_names() %>%
  filter(!is.na(code), entity != "World") %>%
  group_by(entity) %>%
  filter(year == max(year)) %>%
  ungroup() %>%
  slice_max(total_population_gapminder, n = 30) %>%
  pull(entity)

top_countries

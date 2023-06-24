# Aufgabe: p(b1 > 0)? Bayes-Statistik
# mpg ~ hp (mtcars)

library(rstanarm)
library(easystats)
library(tidyverse)


data(mtcars)


m1 <- stan_glm(mpg ~ hp, data = mtcars)
parameters(m1)

parameters(m1) %>% plot()

estimate_expectation(m1) %>% plot()

# Wo sind die 4000 Stichproben, hey Stan?

m1_stipros <- as_tibble(m1)

m1_stipros

m1_stipros %>% 
  count(hp > -0.05)

190/4000


eti(m1) %>% plot()


# Antwort: 0%, besser Anteil: 0.00




# Daten importieren -------------------------------------------------------

d_url <- "https://vincentarelbundock.github.io/Rdatasets/csv/reshape2/tips.csv"

d <- read_csv(d_url)  # tidyverse, alternativ: read.csv




# Wskt av=0 geg. uv-Wert a oder UV-Wert b



m2 <- stan_glm(mpg ~ drat, data = mtcars)
# mpg = 20, drat = 3 vs. 5

estimate_expectation(m2) %>% plot()


d <-
  tibble(i1 = 1,
         i2 = NA,
         i3 = 3)

d <-
  d %>% 
  mutate(extra_mw = 

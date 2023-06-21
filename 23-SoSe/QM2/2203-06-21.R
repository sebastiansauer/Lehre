# Aufgabe: p(b1 > 0)? Bayes-Statistik
# mpg ~ hp (mtcars)

library(rstanarm)
library(easystats)
library(tidyverse)


data(mtcars)


m1 <- stan_glm(mpg ~ hp, data = mtcars)
parameters(m1)

parameters(m1) %>% plot()

# Wo sind die 4000 Stichproben, hey Stan?

m1_stipros <- as_tibble(m1)

m1_stipros

m1_stipros %>% 
  count(hp > 0)


eti(m1) %>% plot()


# Antwort: 0%, besser Anteil: 0.00
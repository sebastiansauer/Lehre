
# Setup -------------------------------------------------------------------

library(tidyverse)
library(easystats)
library(rstanarm)

Kung_path <- "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/Howell1a.csv"

d <- read_csv(Kung_path)

d2 <- d %>% filter(age > 18


# Zentrieren des Prädiktors -----------------------------------------------


d3 <-
  d2 %>% 
  mutate(weight_c = weight - mean(weight))



# Modell berechnen --------------------------------------------------------


m43a <-
  stan_glm(
    height ~ weight_c,  # Regressionsformel
    prior = normal(5, 3),  # Regressionsgewicht (beta 1)
    prior_intercept = normal(178, 20),  # mu
    prior_aux = exponential(0.1),  # sigma
    refresh = 0,  # zeig mir keine Details
    seed = 42,  # lege die Zufallszahlen fest für Reproduzierbarkeit
    data = d3)



# Modellergebnisse --------------------------------------------------------

parameters(m43a)

plot(parameters(m43a))
plot(parameters(m43a), show_intercept = TRUE)

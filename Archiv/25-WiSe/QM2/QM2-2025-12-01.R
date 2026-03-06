# 2025-12-01

library(tidyverse)
library(easystats)
library(rstanarm)  # Bayes-Golem
library(ggpubr)  # Datenvisualisierung

Kung_path <- "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/Howell1a.csv"

kung <- read.csv(Kung_path)



kung_erwachsen <- kung %>% filter(age > 18)


kung_zentriert <-
  kung_erwachsen %>% 
  mutate(weight_c = weight - mean(weight))


m_kung_gewicht_c <-
  stan_glm(
    height ~ weight_c,  # Regressionsformel
    prior = normal(0, 10),  # Regressionsgewicht (beta 1)
    prior_intercept = normal(178, 20),  # beta 0
    prior_aux = exponential(0.1),  # sigma
    refresh = 0,  # zeig mir keine Details
    data = kung_zentriert)

parameters(m_kung_gewicht_c)

hdi(m_kung_gewicht_c, ci = 0.95)

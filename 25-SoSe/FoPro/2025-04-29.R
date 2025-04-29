# 2025-04-29

# Effekt von Geschlecht (X) auf das Gewicht von Pinguinen (Y)


# Setup:

library(tidyverse)
library(easystats)
library(rstanarm)
library(palmerpenguins)
data("penguins")


# Modell berechnen:

lm_sex_weight <- stan_glm(body_mass_g ~ sex, data = penguins)

# Parameter:
plot(parameters(lm_sex_weight))


# Modellgüte:
r2(lm_sex_weight)

# Der Effekt ist signifikant!

# Effektstärke_

d <- (m1 - m2) / s 


# Effektstärke (Cohen's d):


penguins |> 
  group_by(sex) |> 
  drop_na(sex, body_mass_g) |>
  summarise(gewicht_pro_gruppe = mean(body_mass_g),
            sd_pro_gruppe = sd(body_mass_g)) 


d_sex_on_weight <- 
  (4545 - 3862) / 700

d_sex_on_weight
  



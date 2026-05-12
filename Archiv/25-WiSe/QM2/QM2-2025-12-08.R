# 2025-12-08


# Setup

library(rstanarm)   # Bayes-Modelle
library(tidyverse)
library(easystats)
library(palmerpenguins)  # Datensatz "penguins"

penguins_url <- "https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv"

penguins <- read.csv(penguins_url)


# Penguins Modell 1 (Geschlecht)

data(penguins, package = "palmerpenguins")
penguins_nona <-
  penguins |> drop_na(sex, body_mass_g)  # keine fehlenden Werte

m_penguins_sex <- 
  stan_glm(body_mass_g ~ sex, data = penguins_nona)

parameters(m_penguins_sex)

# Sigma erhält man so:

sigma(m_penguins_sex)
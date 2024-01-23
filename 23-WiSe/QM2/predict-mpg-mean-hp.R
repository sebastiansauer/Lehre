# setup:
library(rstanarm)
library(tidyverse)
library(easystats)

data(mtcars)
data(penguins, package = "palmerpenguins")


# Was ist der Spritverbrauch einer Karre mit mittlerer PS-Zahl?

mtcars |> 
  summarise(mean(hp))

# standardisieren (z-Transformation):
d_z <- standardize(mtcars, append = TRUE)  # synonym:


# Modell berechnen:

mod <- stan_glm(mpg ~ hp_z, 
                data = d_z,
                seed = 42)

# Modellparameter:

parameters(mod)

# bei einem nicht z-transformierten Modell:
predict(mod, newdata = data.frame(hp = 147))


# EDA:

library(DataExplorer)


mtcars |> 
  select(mpg) |> 
  plot_histogram()


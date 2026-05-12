library(rstanarm)   # Bayes-Modelle
library(tidyverse)
library(easystats)

penguins_url <- "https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv"

penguins <- read.csv(penguins_url)



m <- stan_glm(body_mass_g ~ species, 
              data = penguins
)
parameters(m)
sigma(m)


install.packages("MCMCpack")

library(mcmcpack)

library(arm)


m <- bayesglm(mpg ~ cyl, data = mtcars)
display(m)

str(m)
summary(m)

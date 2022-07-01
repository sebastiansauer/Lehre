# 2022-07-01


# Setup -------------------------------------------------------------------


library(tidymodels)
library(tidyverse)
data("penguins", package = "palmerpenguins")


d_train <- penguins %>% slice(1:(344/2))
d_test <- penguins %>% slice(173:nrow(penguins))

# AV: Gewicht


d_split <- initial_split(d_train)

d_analysis <- training(d_split)
d_assessment <- testing(d_split)

# Def workflow ------------------------------------------------------------

m1 <- 
  linear_reg()


wf1 <-
  workflow(body_mass_g ~ .) %>% 
  add_model(m1)
  

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

rec1 <-
  recipe(body_mass_g ~ ., data = d_analysis) %>% 
  step_impute_knn()


wf1 <-
  workflow() %>% 
  add_recipe(rec1) %>% 
  add_model(m1)


cv_scheme <- vfold_cv(d_analysis)


# Fitting ----------------------------------------------------------------


fit1 <-
  wf1 %>% 
  tune_grid(resamples = cv_scheme)


show_best(fit1)

wf1_final <-
  wf1 %>% 
  finalize_workflow(show_best(fit1))


wf1_final


# Modellgüte --------------------------------------------------------------



fit1_final <-
  wf1_final %>% 
  last_fit(d_split)


collect_metrics(fit1_final)

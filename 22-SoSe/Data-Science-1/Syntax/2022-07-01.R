# 2022-07-01





# Setup -------------------------------------------------------------------


library(tidymodels)
library(tidyverse)
library(easystats)
data("penguins", package = "palmerpenguins")


penguins2 <-
  penguins %>% 
  sample_n(size = nrow(.))



d_train <- penguins2 %>% slice(1:(344/2))
d_test <- penguins2 %>% slice(173:nrow(penguins))

# AV: Gewicht


d_split <- initial_split(d_train)

d_analysis <- training(d_split)
d_assessment <- testing(d_split)




# Prüfe Rezept ------------------------------------------------------------


d_analysis_baked <- 
rec1 %>% 
  prep() %>% 
  bake(new_data = NULL)


describe_distribution(d_analysis_baked)


# Def WF ------------------------------------------------------------------

m1 <- 
  linear_reg()

rec1 <-
  recipe(body_mass_g ~ ., data = d_analysis) %>% 
  step_impute_knn(all_predictors()) %>% 
  step_normalize(all_numeric(), -all_outcomes())



wf1 <-
  workflow() %>% 
  add_recipe(rec1) %>% 
  add_model(m1)


cv_scheme <- vfold_cv(d_analysis, v = 1)


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



fit1_train <-
  wf1_final %>% 
  fit(d_train)


fit1_test <-
  fit1_train %>% 
  predict(d_test)

head(fit1_test)


# Submitten ---------------------------------------------------------------


subm_df <-
  d_test %>% 
  mutate(id = 173:344) %>% 
  bind_cols(fit1_test) %>% 
  select(id, .pred) %>% 
  rename(pred = .pred)


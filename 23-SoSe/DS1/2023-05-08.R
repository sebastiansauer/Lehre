# 2023-05-08


# Setup:
library(tidymodels)
library(tidyverse)
library(tictoc)


# Data:
d_path <- "https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv"
d <- read_csv(d_path)

d_split <- initial_split(d)
d_train <- training(d_split)
d_test <- testing(d_split)


# model:
mod_bag <-
  bag_tree(mode = "regression",
           cost_complexity = tune())


# cv:
rsmpl <- vfold_cv(d_train)


# recipe:
rec1_plain <- recipe(body_mass_g ~  ., data = d_train)


# workflow:
wf1 <-
  workflow() %>% 
  add_model(mod_bag) %>% 
  add_recipe(rec1_plain)


# tuning:
tic()
wf1_fit <-
  wf1 %>% 
  tune_grid(
    resamples = rsmpl)
toc()

# best candidate:
show_best(wf1_fit)


# finalize wf:
wf1_final <-
  wf1 %>% 
  finalize_workflow(select_best(wf1_fit))


wf1_fit_final <-
  wf1_final %>% 
  last_fit(d_split)


# Modellgüte im Test-Set:
collect_metrics(wf1_fit_final)

library(targets)



define_mtcars_recipe <- function(training_data) {
  recipe(training_data) %>%
    update_role(everything(), new_role = "support") %>% 
    update_role(am, new_role = "outcome") %>%
    update_role(hp, cyl, new_role = "predictor"
    ) %>%
    step_mutate(am = factor(am)) %>% 
    step_normalize(all_numeric(), -all_outcomes())
}







tar_option_set(packages = c("tidyverse", "tidymodels"))

list(
  tar_target(
    mtcars_data, mtcars
  ),
  tar_target(
    mtcars_recipe, 
    define_mtcars_recipe(mtcars_data)
    ),
  tar_target(
    model1,
    logistic_reg(penalty = tune(), mixture = 1) %>%
      set_mode("classification") %>%
      set_engine("glmnet")
  ),
  tar_target(
    workflow1,
    workflow() %>% add_recipe(mtcars_recipe) %>% add_model(model1)
  ),
  tar_target(grid1,
             grid_regular(penalty(), levels = 3)
  ),
  tar_target(
    grid_fitted,
    tune_grid(workflow1, 
              resamples = vfold_cv(mtcars_data, v = 2),
              grid = grid1)
    )
)

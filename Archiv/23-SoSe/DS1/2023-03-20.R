
library(nycflights13)
library(tidyverse)
library(easystats)
library(tidymodels)

data(flights)



# Train- vs Test-Sample ---------------------------------------------------


flights_split <- initial_split(flights, 
                               strata = dep_delay)

set.seed(42)  # Reproduzierbarkeit
flights_train <- training(flights_split)
flights_test <- testing(flights_split)


# Einfaches Modell --------------------------------------------------------


lm1 <- lm(dep_delay ~ distance, data = flights_train)

r2(lm1)  # R2 im Train-Sample (aus Paket ˋeasystatsˋ)


# R2 im Test-Sample -------------------------------------------------------



flights_test <-
  flights_test |> 
  mutate(pred_lm1 = predict(lm1, newdata = flights_test))

rsq(flights_test,truth = dep_delay, estimate = pred_lm1)



compute_r2_test <- function(model) {
  
  flights_test2 <-
    flights_test |> 
    select(dep_delay) |> 
    mutate(pred = predict(model, newdata = flights_test))

  out <- rsq(flights_test2, truth = dep_delay, estimate = pred)  
  return(out)

}

compute_r2_test(lm1)


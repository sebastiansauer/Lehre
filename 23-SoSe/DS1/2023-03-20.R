
library(nycflights13)
library(tidyverse)
library(easystats)
library(tidymodels)

data(flights)

flights_split <- initial_split(flights, 
                               strata = dep_delay)

set.seed(42)  # Reproduzierbarkeit
flights_train <- training(flights_split)
flights_test <- testing(flights_split)

lm1 <- lm(dep_delay ~ distance, data = flights_train)

r2(lm1)

flights_test <-
  flights_test |> 
  mutate(pred_lm1 = predict(lm1, newdata = flights_test))

rsq(flights_test,truth = dep_delay, estimate = pred_lm1)

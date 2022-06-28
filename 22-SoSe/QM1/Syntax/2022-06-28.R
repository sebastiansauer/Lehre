library("tidymodels")  # Datenmodellierung
library("tidyverse")  # data wrangling
library("conflicted")  # Name clashes finden
library("leaps")  # Rohe Gewalt
library("skimr")  # deskriptive Statistiken komfortabel
library("ggfortify")  # Modellannahmen grafisch prüfen
library("tictoc")  # Rechenzeit messen
library("easystats")
library("nycflights13")
data(flights)


flights2 <-
  flights %>% 
  select(-c(year, arr_delay)) %>% 
  drop_na(dep_delay) %>% 
  mutate(id = row_number()) %>% 
  select(id, everything())  # id nach vorne ziehen


flights_split <- initial_split(flights2, 
                               strata = dep_delay,
                               na.rm = TRUE)




set.seed(42)  # Reproduzierbarkeit
flights_train2 <- training(flights_split)
flights_test2 <- testing(flights_split)

lm0 <- lm(dep_delay ~ 1, data = flights_train2)

lm1 <- lm(dep_delay ~ origin, data = flights_train2)




# logististche Regression mit Tidymodels
# AV: am (mtcars)

library(tidymodels)
data(mtcars)

mtcars2 <-
  mtcars %>% 
  mutate(am_f = factor(am)) %>% 
  select(-am)

fit1 <- fit(logistic_reg(),
            am_f ~ ., data = mtcars2)

fit1


mtcars3 <-
  mtcars2 %>% 
  cbind(predict(fit1, new_data = NULL))


accuracy(mtcars3,
         truth = am_f,
          estimate = .pred_class)

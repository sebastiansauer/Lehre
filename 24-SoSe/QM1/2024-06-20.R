
# Setup -------------------------------------------------------------------

library(easystats)
library(tidyverse)


mariokart_train <- read.csv("https://raw.githubusercontent.com/sebastiansauer/statistik1/main/daten/mariokart_train.csv")

mariokart_test <- read.csv("https://raw.githubusercontent.com/sebastiansauer/statistik1/main/daten/mariokart_test.csv")



# Modell "all-in" ---------------------------------------------------------



lm_allin <- lm(total_pr ~ ., data = mariokart_train)
r2(lm_allin)  


predict(lm_allin, newdata = mariokart_test)




# Modell "all in ohne Titelspalte" ----------------------------------------


mariokart_train2 <-
  mariokart_train %>% 
  select(-c(title, V1, id))


lm_allin_no_title <- lm(total_pr ~ ., data = mariokart_train2)
r2(lm_allin_no_title) 


performance::rmse(lm_allin_no_title)
## [1] 20.22998


lm_allin_predictions <- predict(lm_allin_no_title, newdata = mariokart_test)


mariokart_test <-
  mariokart_test %>% 
  mutate(lm_allin_predictions = 
           predict(lm_allin_no_title, newdata = mariokart_test))





# Modellgüte im Testset ---------------------------------------------------

library(yardstick)


yardstick::rmse(data = mariokart_test,
                truth = total_pr,  # echter Verkaufspreis
                estimate = lm_allin_predictions)  # Ihre Vorhersage




# `rsq ` ist auch aus dem Paket yardstick:
rsq(data = mariokart_test,
    truth = total_pr,  # echter Verkaufspreis
    estimate = lm_allin_predictions)  # Ihre Vorhersage




# Einzureichende Dateien bereit machen


## 1. CSV-Datei mit Prognose

subm_df <- 
  mariokart_test |> 
  select(X, lm_allin_predictions) 


names(subm_df) <- c("id", "pred")


write_csv(subm_df, "Sauer_Sebastian_01234567_prognose.csv")


















# Vorhersage von Film-Einnahmen
# https://www.kaggle.com/c/tmdb-box-office-prediction


# R-Pakete laden

library(tidyverse)


# Import data
# Die Daten liegen *relativ zu meinem Projektordner* hier:

d_train <- read_csv("data/tmdb-box-office-prediction/train.csv")
d_test <- read_csv("data/tmdb-box-office-prediction/test.csv")


# *ALTERNATIV* können Sie die Daten per *absoluten Pfad* von dieser Quelle beziehen:

d_train_path <- "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/tmdb-box-office-prediction/train.csv"
d_test_path <- "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/tmdb-box-office-prediction/test.csv"


d_train <- read_csv(d_train_path)
d_train <- read_csv(d_test_path)



glimpse(d_train)
glimpse(d_test)



# Datenjudo


d_train2 <-
  d_train %>%
  mutate(budget = case_when(
    budget <= 0 ~ 10,
    budget > 0 ~ budget
  )) %>% 
  mutate(budget_log = log(budget)) %>%
  select(budget_log, status, popularity, revenue) %>%
  drop_na()

# Haben wir (viele) Zeilen verloren durch `drop_na()?
nrow(d_train2)  # Nein, zum Glück nicht

head(d_train2)


# Verteilung der Variablen betrachten:
library(easystats)

describe_distribution(d_train2)

# Modell

lm1 <- lm(revenue ~ budget_log, popularity, data = d_train2)


# Vorhersagen im Test-Sample


d_test2 <- 
  d_test %>% 
  mutate(budget = case_when(
    budget <= 0 ~ 10,
    budget > 0 ~ budget
  )) %>% 
  mutate(budget_log = log(budget)) %>%
  select(budget_log, status, popularity, id) 


d_test3 <-
  d_test2 %>%
  mutate(revenue = predict(lm1, newdata = .))

submission_df <-
  d_test3 %>% 
  select(id, revenue)




# Beispiel Submission File mal anschauen:

submission_example <- read_csv("data/tmdb-box-office-prediction/sample_submission.csv")
# Sieht gut aus. `submission_df` hat die gleichen Spaltennamen und die gleiche Anzahl an Zeilen.

# Submission abspeichern:

write_csv(submission_df, file = "data/tmdb-box-office-prediction/submission1.csv")


# So, jetzt mal bei Kaggle einreichen und schauen, wie gut das Modell ist!

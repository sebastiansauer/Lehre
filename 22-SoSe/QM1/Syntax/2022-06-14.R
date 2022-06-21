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
d_test <- read_csv(d_test_path)

library(readr)
train <- read_csv("data/tmdb-box-office-prediction/train.csv")


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

describe_distribution(d_train)

ggplot(d_train) +
  aes(x = revenue) +
  geom_histogram()


# Zeigen Sie die 10 Filme mit höchstem Umsatz!

d_train %>% 
  select(id, budget, popularity, revenue, original_title) %>% 
  arrange(-revenue) %>%  # Minus dreht Sortierhreihenfolge um
  slice(1:10)

# synonym:
d_train %>% 
  select(id, budget, popularity, revenue, original_title) %>% 
  slice_max(order_by = revenue, n = 5)


# Identifizieren Sie Variablen, die hoch mit der AV korreliert sind!


d_train %>% 
  select(budget, revenue, popularity, runtime) %>% 
  drop_na() %>% 
  summarise(korr1 = cor(budget, revenue),
            korr2 = cor(popularity, revenue),
            korr3 = cor(runtime, revenue))



# Modell 1:

lm1 <- lm(revenue ~ budget + popularity, 
          data = d_train)
summary(lm1)


lm1a <- lm(revenue ~ budget, 
          data = d_train)
summary(lm1a)


ggplot(d_train) +
  aes(x = budget, y = revenue) +
  geom_point() +
  geom_smooth(method = "lm")


# Modell 2

lm2 <- lm(revenue ~ budget_log + popularity, data = d_train2)


# Vorhersagen im Test-Sample



predict(lm1, newdata = tibble(budget = 3e+08, popularity = 5))
predict(lm1, newdata = d_test)


d_test2a <- 
  d_test %>% 
  mutate(revenue = predict(lm1, newdata = d_test))


submission_df2 <- 
  d_test2a %>% 
  select(id, revenue)


# Einreichen:
write_csv(submission_df2, file = "submission_df2.csv")


# Andres Modell predicten:
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

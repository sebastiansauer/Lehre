
# ------------------------------------------------------------
# Bayes made simple
#  -----------------------------------------------------------




# Vorbereitung ------------------------------------------------------------



library(rstanarm)  # Bayes
library(tidyverse)  # Datenjudo
library(easystats)  # Stats made simple
library(ggstatsplot)  # Daten visualisieren

data(mtcars)

# Quelle: https://stats-nutshell.netlify.app/regression1.html




# Explorative Analyse -----------------------------------------------------



ggscatterstats(data = mtcars,
               x = hp,
               y = mpg)


# Modell 1 ----------------------------------------------------------------

lm1_freq <- lm(mpg ~ hp, data = mtcars)
parameters(lm1_freq)
plot(parameters(lm1_freq))


lm1_bayes <- stan_glm(mpg ~ hp, data = mtcars, refresh = 0)
parameters(lm1_bayes)
plot(parameters(lm1_bayes))


lm1_pred <- estimate_relation(lm1_bayes)
lm1_pred

plot(lm1_pred)


# Bayes members only

# What's the probability of the effect being, say, negative?


lm1_bayes_tibble <- as_tibble(lm1_bayes)  # cast as a tibble (table)

head(lm1_bayes_tibble)  # show the first few rows


gghistostats(data = lm1_bayes_tibble,
             x = hp)



lm1_bayes_tibble %>% 
  count(hp < 0)

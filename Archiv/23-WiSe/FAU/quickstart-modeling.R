
# ------------------------------------------------------------
# Bayes made simple
#  -----------------------------------------------------------




# Preparation ------------------------------------------------------------




library(tidyverse)  # Datenjudo
library(rstanarm)  # Bayes
library(easystats)  # Stats made simple
library(ggstatsplot)  # Daten visualisieren

data(mtcars)

# souce: https://stats-nutshell.netlify.app/regression1.html




# Explorative Analysis -----------------------------------------------------



ggscatterstats(data = mtcars,
               x = hp,
               y = mpg)


# Model 1 ----------------------------------------------------------------

lm1_freq  <-       lm(mpg ~ hp, data = mtcars)  # Frequentist
lm1_bayes <- stan_glm(mpg ~ hp, data = mtcars)  # Bayes

parameters(lm1_bayes)  
plot(parameters(lm1_bayes))

r2(lm1_bayes)





# predict values on regression line:
lm1_pred <- estimate_relation(lm1_bayes)


lm1_pred

# plot predicted regression line:
plot(lm1_pred)


# Bayes members only

# What's the probability of the effect being, say, negative?


lm1_bayes_tibble <- as_tibble(lm1_bayes)  # cast as a tibble (table)

head(lm1_bayes_tibble)  # show the first few rows
  

gghistostats(data = lm1_bayes_tibble,
             x = hp)



lm1_bayes_tibble %>% 
  count(hp < 0)

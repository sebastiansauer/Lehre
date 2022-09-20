# 2022-09-20 FAU

# Ex:
# Compute model mpg ~ wt
# Report 95% CI on the effect



library(tidyverse)
library(easystats)
library(rstanarm)  # optional

data("mtcars")

lm2_freq <- lm(mpg ~ wt, data = mtcars)
parameters(lm2_freq)
r2(lm2_freq)

plot(parameters(lm2_freq))



lm2_bayes <- stan_glm(mpg ~ wt, data = mtcars, refresh = 0)
parameters(lm2_bayes)
r2(lm2_bayes)

plot(parameters(lm2_bayes))



data(mtcars)


# Ex:
# Compute this model: mpg ~ vs
# Report the group means with their 95% CI




mtcars4 <-
  mtcars %>% 
  mutate(vs_f = factor(vs)) 

lm4a <- lm(mpg ~ vs_f, data = mtcars4)
parameters(lm4a)

lm4a_means <- estimate_means(lm4a, at = "vs")
lm4a_means 

plot(lm4a_means)


# Ex: Use the data set "palmer penguins"
# compute Model: weight as a function of species
# Report group means

d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")











lm5 <- lm(body_mass_g ~ species, data = d)
lm5_means <- estimate_means(lm5)
plot(lm5_means)







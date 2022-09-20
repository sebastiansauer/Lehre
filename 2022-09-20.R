# 2022-09-20 FAU

# Ex:
# Compute model mpg ~ wt
# Report 95% CI on the effect



library(tidyverse)
library(easystats)
library(rstanarm)

data("mtcars")

lm2_freq <- lm(mpg ~ wt, data = mtcars)
parameters(lm2_freq)
r2(lm2_freq)

plot(parameters(lm2_freq))



lm2_bayes <- stan_glm(mpg ~ wt, data = mtcars, refresh = 0)
parameters(lm2_bayes)
r2(lm2_bayes)

plot(parameters(lm2_bayes))

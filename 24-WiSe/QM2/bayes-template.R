library(tidyverse)
library(rstanarm)
library(easystats)


data(mtcars)

m1 <- stan_glm(mpg ~ hp, data = mtcars)
parameters(m1)

rope(m1)

plot(rope(m1))

# ex 1: compute the following model and report the coefficients:
# mpg ~ am (data: mtcars)


lm1 <- lm(mpg ~ am, data = mtcars)

library(rstanarm)
lm1_bayes <- stan_glm(mpg ~ am, data = mtcars)

library(easystats)

parameters(lm1)

library(ggpubr)
library(ggstatsplot)


ggscatter(data = mtcars,
          x = "am",
          y = "mpg",
          add = "reg.line")


# R-squared  (Tipp: r2)

r2(lm1)  # this function comes from `easystats`

summary(lm1)



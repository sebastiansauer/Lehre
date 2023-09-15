# ex 1: compute the following model and report the coefficients:
# mpg ~ am (data: mtcars)


lm(mpg ~ am, data = mtcars)

library(ggpubr)
library(ggstatsplot)


ggscatter(data = mtcars,
          x = "am",
          y = "mpg",
          add = "reg.line")



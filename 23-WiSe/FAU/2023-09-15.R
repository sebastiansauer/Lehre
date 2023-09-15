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



m2 <- lm(mpg ~ am + hp + cyl, data = mtcars)

parameters(m2)
r2(m2)




# ex: compute the following model and report coefficients:
# mpg is a function of am and hp and the interaction of the two factors

data(mtcars)  # not strictly needed, but useful


m3 <- lm(mpg ~ hp + am + am:hp, data = mtcars)
parameters(m3)



mtcars %>% 
  mutate(am = factor(am)) %>%  # it's a grouping var. (nominal), NO NUMBER, R!
  ggplot() +
  aes(x = hp, color = am, group = am, y = mpg) +
  geom_point() +
  geom_smooth(method = "lm")


# different visualization approach:


mtcars2 <-
  mtcars %>% 
  mutate(am = factor(am))

m4 <- lm(mpg ~ hp + am + am:hp, data = mtcars2)
parameters(m4)


estimate_relation(m4) %>% plot()



#ex: try to find an interaction in mtcars! 
# that's explorative research in all it's glory...







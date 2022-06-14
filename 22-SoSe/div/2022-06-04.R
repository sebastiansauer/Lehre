# 2022-06-04 Midsummer Stats Night

i01:i10

data(mtcars)

library(tidyverse)



mtcars1 <- 
mtcars %>% 
  mutate(gruppe = case_when(
    am == 0 ~ "Frau",
    am == 1 ~ "Mann"
  ))


mtcars1 %>% 
  ggplot() +
  aes(x = gruppe) +
  geom_bar() +
  labs(x = "Getriebeart", y = "Anzahl")


library(rstanarm)


lm1 <- stan_glm(mpg ~ hp, data = mtcars, refresh = 0)

lm1

posterior_interval(lm1, prob = .95)
plot(lm1)




lm2 <- lm(mpg ~ hp + am + cyl, data = mtcars)

lm2

summary(lm2)

predict(lm2, newdata = d_test)


ggplot(mtcars) +
  aes(x = hp, y = mpg, color = factor(am)) +
  geom_point() +
  geom_smooth(method = "lm")






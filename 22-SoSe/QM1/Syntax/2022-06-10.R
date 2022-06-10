# 2022-06-10

data("mtcars")
library(tidyverse)

lm(mpg ~ hp, data = mtcars)

mtcars %>% 
  ggplot(aes(x = hp, y = mpg)) +
  geom_point( ) +
  geom_smooth(method = "lm")


lm1 <- lm(mpg ~ hp + am, data = mtcars)


mtcars %>% 
  mutate(am = factor(am)) %>% 
  ggplot(aes(x = hp, y = mpg, color = am)) +
  geom_point( ) +
  geom_smooth(method = "lm")


# Sagen wir, wir ham ne Karre mit 200 PS und am=1
# Hängt davon ab, wie Ihr Auto frisiert ist
y <- 26.58 + 200*(-0.06) + 1*5.27
y

# oder so:
predict(lm1, newdata = tibble(hp = 200, am = 1))

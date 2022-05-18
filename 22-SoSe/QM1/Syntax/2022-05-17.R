# 2022-05-17

library(tidyverse)
data(mtcars)

ggplot(mtcars) +
  aes(x = hp, y = mpg) +
  geom_point() +
  geom_smooth(method = "lm")

lm(mpg ~  hp, data = mtcars)
# gibt Steigung und Achsenabschnitt der Gerade aus

# Aufgabe:
# Rechnen Sie Meilen in pro 100 PS um,
# und berechnen Sie das lm erneut!


mtcars2 <- 
  mtcars %>% 
  mutate(hp100 = hp / 100)


ggplot(mtcars2) +
  aes(x = hp100, y = mpg) +
  geom_point() +
  geom_smooth(method = "lm")

mein_erstes_lm <- lm(mpg ~  hp100, data = mtcars2)

predict(mein_erstes_lm, newdata = tibble(hp100 = 2.5))

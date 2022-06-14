# Syntax 2022-06-14

data(mtcars)

library(easystats)
library(tidyverse)
library(rstanarm)
cohens_d(mpg  ~ am, data = mtcars)

t.test(mpg ~ am, data = mtcars)
aov(mpg ~ am, data = mtcars) %>% summary()
model1  <- lm(mpg ~ am, data = mtcars) %>% summary()

model2 <- stan_glm(mpg ~ am, data = mtcars)

rope2 <- rope(model2) 

plot(rope2)
rope2 %>% 
  slice(2)


mtcars2 <-
  mtcars %>% 
  mutate(am_f = factor(am, levels = c(1, 0)),
         am_f = relevel(am_f, ref = 2))

levels(mtcars2$am_f)



# Moderatoranalyse (=Interaktion)


lm2 <- stan_glm(mpg ~ hp + am + hp:am, data = mtcars,
                refresh = 0)
lm2

ggplot(data = mtcars, aes(x = hp, y = mpg , color = factor(am))) +
  geom_point() +
  geom_smooth(method = "lm")


# Cronbachs Alpha

library(psych)

alpha(tab)



# Inferenzstatistik mit Bayes


# Schritt 1:
model2 <- stan_glm(mpg ~ am, data = mtcars)

# Schritt 2: Lass dir die Koeffizienten ausgeben:
model2

hdi(model2)

plot(model2)

plot(parameters(model2))

# Schritt 3: ROPE
rope(model2)
plot(rope(model2))

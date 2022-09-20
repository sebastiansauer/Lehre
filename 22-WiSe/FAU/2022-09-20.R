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
# Report group means along with 95% CI

d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")




lm_pengis <- lm(body_mass_g ~ species, data = d)
parameters(lm_pengis)

lm_pengis_means <- estimate_means(lm_pengis)
lm_pengis_means 

plot(lm_pengis_means)





lm_pengis_bayes <- stan_glm(body_mass_g ~ species, data = d)
parameters(lm_pengis_bayes)

lm_pengis_means_bayes <- estimate_means(lm_pengis_bayes)
lm_pengis_means_bayes 

plot(lm_pengis_means_bayes)



# Ex (penguins)
# Compute: weight as function of species and bill length
# Report typical stats and interpret it
# Bonus question: Do we see an interaction effect?







lm6 <- lm(body_mass_g ~ bill_length_mm + species, data = d)
parameters(lm6)

lm6_means <- estimate_means(lm6)
lm6_means 
plot(lm6_means)

lm6_preds <- estimate_relation(lm6)
plot(lm6_preds)







# Ex: Add an interaction effect to the last model: body_mass_g ~ bill_length_mm + species
# Bonus question: Compare the R2 of this and the last model.






p5 <- lm(body_mass_g ~ bill_length_mm + species + bill_length_mm:species, data = d)
parameters(p5)

p5_pred <- estimate_relation(p5)
plot(p5_pred)

p5_means <- estimate_means(p5)
plot(p5_means)



r2(lm5)
r2(p5)













lm7 <- lm(body_mass_g ~ bill_length_mm + species + bill_length_mm:species, data = d)
parameters(lm7)

lm7_means <- estimate_means(lm7)
lm7_means 
plot(lm7_means)

lm7_preds <- estimate_relation(lm7)
plot(lm7_preds)




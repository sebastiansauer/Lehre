
# Course "Modelling your research data"
# 2024-03-014


# start packages:
library(tidyverse)
library(easystats)


# import data:
penguins <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")
data(mtcars)


lm1_freq <- lm(mpg ~ hp, data = mtcars)

# dont' forget to load the packag easystats:
parameters(lm1_freq)  # coming from R package `easystats`

plot(parameters(lm1_freq))
plot(estimate_expectation(lm1_freq))

# Exercise 1:
# Build a model using the penguins data
# y: weight 
# x: bill 


# Is the average weight positively related with bill length?
# "The longer the bill, the heavier the animal (on average)"


lm2 <- lm(body_mass_g ~ bill_length_mm, data = penguins)

parameters(lm2)
estimate_expectation(lm2)
plot(estimate_expectation(lm2))

r2(lm2)


# Exercise 2:
#  Is the average weight (y) positively related with flipper length (x)?


lm3 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)

parameters(lm3)
estimate_expectation(lm3)
plot(estimate_expectation(lm3))

r2(lm3)

library(ggpubr)

ggscatter(penguins, 
          x = "flipper_length_mm",
          y = "body_mass_g",
          add = "reg.line"
          )


# binary predictor (x), y (numeric)


# Exercise 3:
# x: sex, y: weight


penguins_nona <- na.omit(penguins) 

describe_distribution(penguins_nona)  # easystats

# how to get rid of the empty strings:

# from tidyverse:
penguins3 <- read_csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

penguins2 <- 
  read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv",
           na.strings = c("NA", ""))


# filtering using the tidyverse:
penguins_sex_fm <- 
penguins |> # control-shift-m  #THEN DO..."
  filter(sex == "female" | sex == "male")


lm4 <- lm(body_mass_g ~ sex, data = penguins2)


parameters(lm4)
estimate_expectation(lm4)
plot(estimate_expectation(lm4))

r2(lm4)



# Exercise

# mtcars: y: mpg, x = am



lm5 <- lm(mpg ~ am, data = mtcars)


parameters(lm5)
#estimate_expectation(lm5)
plot(estimate_expectation(lm5))

r2(lm5)


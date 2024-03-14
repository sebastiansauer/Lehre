
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

# Exercise:
# Build a model using the penguins data
# y: weight 
# x: bill 





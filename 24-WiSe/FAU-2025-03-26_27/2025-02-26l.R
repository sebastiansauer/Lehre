# Enough statistics too be dangerous
# 2025-02-26

# R packages needed:
library(tidyverse)
library(visdat)
library(easystats)


age = 46  # Contrl+Enter
age_before <-  45  # smaller-than minus

age = age_before
age <- age_before


friends <- c("Anna", "Berta", "Carla")  # c to make a vector

#ex:
vec <- c(1:3)
vec <- 1:3
vec <- c(1,2,3)
vec2 <- c(1,2.1,4)


d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

head(d)  # see the first few rows, the "head" of the table




vis_dat(penguins)


# kick out NA (missing data):


d_no_na <- 
d |> # Contrl-Shift-M, read as "then do..."
  drop_na() #



# Summarise Data:
# needs easystats running
d_no_na |> 
  describe_distribution(select = body_mass_g)




















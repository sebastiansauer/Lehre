# https://stats-nutshell.netlify.app/basics.html#initial-quiz


# Exercise 2.1 (Define a variable) Define in R the variable age and assign the value 42

age <- 42  # Contrl-Enter



# Exercise 2.2 (Define a variable as a string)

name <- "me"
name <- "name"



# Exercise 2.3 (Define a variable by another variable) 

age <- name


# Exercise 2.4 (Call a function) 

date()



# Exercise 2.5 (Define a vector)

x <- c(1, 2, 3)   # "list" - "vector"



# Exercise 2.6 (Vector wise computation)

x^2



# Exercise 2.7 (Vector wise computation 2) 


squares <- x^2  # step 1: square each element

sum(squares)  # step 2: sum them up


result <- sum(x^2)  # two steps in one go


# Exercise 2.8 (Vector wise computation 3) Square each value in the vector x, sum up the values, and divide by 3



sum(x^2)/3
mean(squares)




# Exercise 2.9 (Compute the variance) 

var(x)
sd(x) 
sqrt(var(x))




# Exercise 2.10 (Work with NA)

y <- c(1,2,NA)  # not available




# how to "read" a variable
x  # just enter its name and execute the line



# Importing data


library(easystats) # execute this line: start the package
library(rio)  # alternative to easystats for data import


d <- data_read(path = "data/penguins.csv")  # from "easystats"
# import(file = "data/penguins.csv")  # similar as above (from "rio")
# 
# 
# # builtin csv import:
# read.csv("data/penguins.csv")
# 
# # 
# library(readxl)
# read_xlsx("data/penguins.xlsx")





# EDA

# sample data:
d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

library(DataExplorer)

introduce(d)

plot_missing(d)
plot_histogram(d)
plot_correlation(d)



library(tidyverse)
d %>% 
  drop_na() %>% 
  plot_correlation()



d_no_missings <- na.omit(d)

plot_correlation(d_no_missings)



# Data viz


library(ggpubr)


# Comparing two (or more) groups in some quantitative y


ggboxplot(data = d,
          x = "species",
          y  = "bill_length_mm",
          fill = "species",
          add = "jitter"
          )


ggviolin(data = d,
          x = "species",
          y  = "bill_length_mm",
          fill = "species",
         add = "jitter",
         draw_quantiles = .5) +
  scale_y_continuous(breaks = c(10, 50, 100)) 


ggplot(d) +
  aes(x = species, 
      y = bill_length_mm) +
  geom_boxplot() +
  geom_jitter(width = .2, alpha = .5) 



d <-
  d %>% 
  mutate(species = 
           case_when(
             species == "Adelie" ~ "Type1",
             TRUE ~ species
  ))



ggscatter(data = d,
          x  = "bill_length_mm",
          y = "body_mass_g",
          add = "reg.line"
)






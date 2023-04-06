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
# library(rio)
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


# R grammar


# $ operator

# assign, define a variable: define x as holding the values 1,2,3

x <- c(1,2,3)


data(mtcars)

mtcars


mtcars$hp

hp

library(ggpubr)
# plot (boxplot) with am on the x axis, and fuel economy (mpg) on the y axis:

ggviolin(data = mtcars,
         x = "am",
         y = "mpg")

ggplot(data = mtcars) +
  aes(x = factor(am), y = mpg) +
  geom_violin()


# ex: compute the mean "hp" value in mtcars!

mean(mtcars$hp)

# a caveat, in case of missing values, rather write:

mean(mtcars$hp, na.rm = TRUE)



# selecting columns:
library(tidyverse)

select(mtcars, mpg, hp, am)

mtcars2 <- select(mtcars, mpg, hp, am)

# export dataset:
write.csv(mtcars, "mtcars.csv")

# filtering rows:


filter(mtcars, hp > 200)


# ex: please exclude outliers in "mpg", that is values 3sd (or more) above mean


mean(mtcars$mpg)
sd(mtcars$mpg)

# threshold for outliers is approx. 38
threshold <- 20 + 3*6
threshold <-mean(mtcars$mpg) + 3 * sd(mtcars$mpg)  # more robust as line above  


mtcars3 <- filter(mtcars, mpg <= 38)


# ex: with your own data, compute the mean of output (Y) variable, and exclude Y outliers



# regression in R 

lm(y ~ x, data = my_data_set)  # template

# ex: run a regression with mpg as y variable, and hp as input variable. Tell me the coefficient of x.


lm1 <- lm(mpg ~ hp, data = mtcars)
lm1

library(easystats)

# plot:
lm1_pred <- estimate_relation(lm1)
plot(lm1_pred)




# ex: run a regression with your favorite Y (DV) and your favorite IV (2-value GROUP variable) (X). Report the results.
# penguins, as alternative

d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

lm2 <- lm(bill_length_mm ~ species, data = d)
lm2


lm2_pred <- estimate_relation(lm2)  # from package easystats

plot(lm2_pred)  # use eg ggpubr as an alternative




# multiple regression: more than 1 IV (X) variable

lm(y ~ x1 + x2, data = my_data)  # template of multiple regr

mtcars$am <- factor(mtcars$am) # works also

# ex: run an regr: mtcars: mpg ~ hp + factor(am)

lm3 <- lm(mpg ~ hp + am, data = mtcars)
lm3

lm3_pred <- estimate_relation(lm3)  
plot(lm3_pred)


# R2 
r2(lm3)  # from easystats

summary(lm3)  # alternatively, without easystats


# ex: run your own analysis (penguins), run a mutiple regression, compute R2, interpret results
# bonus: check_model(lm3)  # check the model assumptions


# BAYES

# p-value: difficult to interpret,
# not what researchers want (often times)
# p-value IS NOT the probability of your hypothesis!

library(rstanarm)  # for Bayes


lm1 <- lm(mpg ~ hp, data = mtcars)
lm1_bayes <- stan_glm(mpg ~ hp, data = mtcars)  # BAYES!

parameters(lm1)  # from easystats


parameters(lm1_bayes)  
summary(lm1_bayes)  # without easystats

r2_bayes(lm1_bayes)

plot(parameters(lm1)) #easystats
plot(parameters(lm1_bayes))


# ex: run a Bayes regr similar to lm1

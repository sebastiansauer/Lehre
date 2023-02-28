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














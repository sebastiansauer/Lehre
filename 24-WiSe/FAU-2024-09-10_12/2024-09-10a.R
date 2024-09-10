
1+1  # Command+Enter to execute a command


# define a variable: use "=" or "<-" (smaller-than followed by minus)
first_name <- "Sebastian"   # Command+Enter

other_name <- "Richard"

first_name <- other_name



# calling a function

print("Hello World!")



# defining a vector ("list" of values):

x <- c(1, 2, 3)  # hit Command-Enter


# Exercise:
# Use the function "mean" to compute the mean of the variable x.


mean(c(1,2,3))  # same thing as:
mean(X)


# Ex:
# Check out the R quiz here: https://datenwerk.netlify.app/posts/r-quiz/r-quiz



sum((x - mean(x))^2) / (length(x)-1)

var(x)


y <- c(1, 2, NA)
mean(y)


y <- c(1, 2, NA)
mean(y, na.rm = TRUE)  # ignore missing values



# Importing data!



library(readr)
test <- read_csv("24-WiSe/FAU-2024-09-10_12/test.csv")
View(test)

# alternative to "read_csv" is "read.csv":
test <- read.csv("24-WiSe/FAU-2024-09-10_12/test.csv")

# use this command to load built-in datasets:
data(mtcars)


# you can also import from internet sources:
d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")  # hit command-enter

head(d)  # see the first few rows, the "head" of the table






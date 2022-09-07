

# Zählt die Anzahl der NAs in einem num. Vektor

num_vec <- c(1, NA, 3)

# Weg 1:
s1 <- is.na(num_vec)
s2 <- sum(s1)

# Weg 2:
sum(is.na(num_vec))

# Weg 3:
library(tidyverse)
num_vec %>% is.na() %>% sum()

na_n <- function(num_vec) {
  
  
  
}


data(mtcars)

mtcars[1,2] <- NA







# fun has_two-values ------------------------------------------------------

has_two_values <- function(vec){
  
  # input: vector of any type
  # value: number of unique values (double)
  
  step1 <- unique(vec)
  step2 <- length(step1)
  step3 <- if(step2 == 2) {
    out <- TRUE
  } else {
    out <- FALSE
  }
  
  out <- step2
  return(out)
  
}





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
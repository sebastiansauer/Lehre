# 2022-10-18

library(tidyverse)

x_simu <- runif(n = 1e5, min = 0, max = 10)

x_simu_df <-
  tibble(id = 1:1e5,
         x = x_simu)


x_simu_df %>% 
  count(x <= 5)

# Binomialverteilung

# Wie groß ist die Wahrscheinlichkeit,
# bei 4 Münzwürfen 2 Treffer zu erzielen?
# Für *einen* Ast beträgt die Wahrscheinlichkeit:

p1 <- (2/5)^2 * (3/5)^2
p1

# Wie viele Möglichkeiten gibt es,
# bei 4 Zügen 2 Treffer zu erzielen
# (bei einer Binomialverteilung)?
choose(4, 2)

# Also beträgt die Summe der W. aller 6 Äste:

p <- 6 * p1
p

# Das gleiche Ergebnis bekommt man so:

dbinom(x = 2, size = 4, prob = 2/5)

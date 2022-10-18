# 2022-10-18

library(tidyverse)

x_simu <- runif(n = 1e5, min = 0, max = 10)

x_simu_df <-
  tibble(id = 1:1e5,
         x = x_simu)


x_simu_df %>% 
  count(x <= 5)



# Wie viele Möglichkeiten gibt es,
# bei 4 Zügen 2 Treffer zu erzielen
# (bei einer Binomialverteilung)?
choose(4, 2)
# 2022-10-18

library(tidyverse)

x_simu <- runif(n = 1e5, min = 0, max = 10)

x_simu_df <-
  tibble(id = 1:1e5,
         x = x_simu)


x_simu_df %>% 
  count(x <= 5)

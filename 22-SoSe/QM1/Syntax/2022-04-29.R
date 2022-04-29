# Praxisprobleme


data(mtcars)
library(tidyverse)

mtcars$mpg[1] <- NA  # NA erzeugen

# Mean value of mpg:

mtcars %>% 
  summarise(mpg_mean = mean(mpg))


# Zeilen mit fehlenden Werten löschen:

mtcars %>% 
  drop_na() %>%  # kicks out all rows with NAs
  summarise(mpg_mean = mean(mpg))


# Bonus: Compute median and SD of mpg as well!
mtcars %>% 
  drop_na() %>%  # kicks out all rows with NAs
  summarise(mpg_mean = mean(mpg),
            mpg_md = median(mpg),
            mpg_sd = sd(mpg))


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


mtcars %>% 
  summarise(mpg_nas = sum(is.na(mpg)))


alter <- c(20, 23, 22, NA)

is.na(alter)

sum(is.na(alter))  # number of NAs in "alter"

mtcars2 <-
  mtcars %>% 
  drop_na()  # how many rows remain?



# Count missing values


mtcars %>% 
  summarise(mpg_nas = sum(is.na(mpg)))

# Replace missing values: 

mtcars3 <- 
  mtcars %>% 
  mutate(mpg_repaired = replace_na(mpg, 20)) %>% 
  relocate(mpg_repaired, .after = mpg)



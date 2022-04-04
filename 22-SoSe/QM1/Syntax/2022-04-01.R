# 2022-04-01

library(tidyverse)  
# dplyr is included in tidyverse


data(mtcars)

# Exercise:
# Take mtcars, select am, hp, mpg, filter hp > 100, group by am, summarise mpg mean

# Shortcut for the pipe: Cntl-Shift-M %>% 

mtcars_cool_pipeline <-
mtcars %>% 
  select(am, hp, mpg) %>% 
  filter(hp > 100) %>% 
  group_by(am) %>% 
  summarise(mean(mpg))


select(mtcars, am, hp, mpg)



# compute mpg in km (not in miles):

mtcars2 <-
  mtcars %>% 
  mutate(mpg_km = mpg * 1.6)

# same as:

mtcars2 <-
  mutate(mtcars, mpg_km = mpg * 1.6)
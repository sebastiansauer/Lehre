# 2022-04-01

library(tidyverse)

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


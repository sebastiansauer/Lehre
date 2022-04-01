# 2022-04-01

library(tidyverse)

data(mtcars)

# Exercise:
# Take mtcars, select am, hp, mpg, filter hp > 100, group by am, summarise mpg mean

mtcars %>% 
  select(am, hp, mpg) %>% 
  filter(hp > 100) %>% 
  group_by(am) %>% 
  summarise(mpg_mean_per_group = mean(mpg))
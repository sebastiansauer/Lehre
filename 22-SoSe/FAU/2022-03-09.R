# R crash course 2202-03-09




# Setup -------------------------------------------------------------------



library(moderndive)
library(tidyverse)


data(evals)  # loading from a started package

evals_ch5 <- evals %>%
  select(ID, score, bty_avg, age)

data(evals)




# EDA ---------------------------------------------------------------------


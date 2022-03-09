# R crash course 2202-03-09




# Setup -------------------------------------------------------------------



library(moderndive)
library(tidyverse)


data(evals)  # loading from a started package

evals_ch5 <- evals %>%
  select(ID, score, bty_avg, age)

data(evals)




# EDA ---------------------------------------------------------------------



# Exercises:

# 1) Provide (invent) an alternative *causal* explanation of the correlation of beauty and teaching evaluation (where beauty is not the cause of teaching evaluation)!
# 2) What's the difference between a correlation coefficient (r) and a regression coefficient (b)?
# 3) Visualize the assocation of beauty and evaluation!
# 4) Compute the correlation!


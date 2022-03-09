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



# ad 3)



ggplot(evals_ch5, aes(x = bty_avg, y = score)) +
  geom_jitter() +
  labs(x = "Beauty Score", 
       y = "Teaching Score",
       title = "Scatterplot of relationship of teaching and beauty scores") +
  geom_smooth(method = "lm", se = FALSE) 


# ad 4)


evals_ch5 %>% 
  summarise(cor(bty_avg, score))

.187^2

evals_ch5 %>% 
  get_correlation(score ~ bty_avg)


# R formula: "y ~ x"  - > y = f(x)




lm1 <- lm(score ~ bty_avg, data = evals_ch5)




# Get regression table (for coefficients):
get_regression_table(lm1)


# Get summary (for R squared and more):
summary(lm1)



# Ex
# lm: score ~ age, intercept, b, R^2 



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



ggplot(evals_ch5, aes(x = bty_avg, y = age)) +
  geom_jitter() +
  labs(x = "Age", 
       y = "Teaching Score") +
  geom_smooth(method = "lm", se = FALSE) 

# ad 4)


evals_ch5 %>% 
  summarise(cor(bty_avg, score))

.187^2

evals_ch5 %>% 
  get_correlation(score ~ bty_avg)


# R formula: "y ~ x"  - > y = f(x)




# Modelling ---------------------------------------------------------------




lm1 <- lm(score ~ bty_avg, data = evals_ch5)




# Get regression table (for coefficients):
get_regression_table(lm1)


# Get summary (for R squared and more):
summary(lm1)



# Ex
# lm: score ~ age, intercept, b, R^2 


lm2 <- 
  lm(score ~ age, data = evals_ch5)

lm2


summary(lm2)



# 5.2 One categorical explanatory variable


# Ex

# 1) Build a linear model with a categorical independent variable (IV) having 2 levels! Use "score" as outupt variable (y/ dependent variable). Interpret the coefficients. Gauge the model precision.
# 2) Visualize the model.
# 3) Compare to a t-Test (optional).



score_model3 <- lm(score ~ gender, data = evals)
# Get regression table:
get_regression_table(score_model3)

summary(score_model3)



evals %>% 
  ggplot(aes(x = gender, y = score)) +
  geom_jitter(width = .1) +
  geom_abline(slope = 0.142, intercept = 4.09, color = "blue")




# Codebook of the data set can be accessed like this:

help(evals)











# How linear is linear? ---------------------------------------------------




# Ex

# 1) Compute a variable "age_squared", add it to the data frame. Then build a linear model with age_squared as predictor (DV: score). Is it a linear model? Check the results. Visualize it.

# Hint: to square a variable, type: "age*age" or "age^2".


# 2) Compute a variable "score_log" (natural log), add it to the data frame. Then build a linear model with this variable as output variable and beauty as predictor. Check the results. Visualize it.



# ad 1)

evals_ch6 <- evals %>%
  select(ID, score, age, gender, bty_avg, pic_outfit)



evals_ch6 <- 
  evals_ch6 %>% 
  mutate(age_sqr = age^2)%>%
  mutate(score_log = log(score))



ggplot(evals_ch6, aes(x = age_sqr, y = score)) +
  geom_point() +
  labs(x = "Age^2", y = "Teaching Score") +
  geom_smooth(method = "lm")



# Fit regression model:
score_model <- lm(score ~ age_sqr, data = evals_ch6)
score_model2 <- lm(score_log ~ age_sqr, data = evals_ch6)

# Get regression table:
get_regression_table(score_model)


summary(score_model)



# ad 2)

#log(y) = x  | exponentiate, de-log
#y  = e^x








# categorical IV with many levels -----------------------------------------



# Ex

# 1) Run a model with `rank` of the professor as IV (score as DV). Interpret the results. Visualize the model. What's the baseline value (group) of `rank`? 

# 2) Is there any difference between the (3) values (levels) of rank at all w.r.t. the DV? 

# 3) Bonus (optional): How to change the baseline level (group) of the DV? Try to google it.






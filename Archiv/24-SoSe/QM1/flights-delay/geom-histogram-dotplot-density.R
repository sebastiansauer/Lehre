library(tidyverse)
library(ggplot2)

ggplot(mtcars) +
  aes(x = mpg) +
  geom_histogram(alpha = .5, binwidth = 1, center = 0) +
  geom_dotplot(binwidth = 1, method = "histodot")


data("mariokart", package = "openintro")

mariokart %>% 
  filter(total_pr < 100) %>% 
  ggplot(aes(x = total_pr)) +
  geom_histogram(bins = 10)

m2 <- 
mariokart %>% 
  filter(total_pr < 55, total_pr > 30)


m2 %>% 
  ggplot(aes(x = n_bids)) +
  geom_histogram(bins = 10) +
  labs(caption = paste0("n=", nrow(m2)))  +
  geom_dotplot(method = "histodot")

m2 %>% 
  ggplot(aes(y = ..density.., x = total_pr)) +
  geom_histogram(bins = 10) +
  geom_density(color = "red") +
  labs(caption = paste0("n=", nrow(m2))) +
  scale_y_continuous(breaks = c(0, 0.025, 0.05))


m2 %>% 
  ggplot(aes(x = duration)) +
  geom_histogram(binwidth = 1) +
  labs(caption = paste0("n=", nrow(m2))) +
  scale_x_continuous(breaks = 1:10)


m2 %>% 
  ggplot(aes(y = ..density.., x = duration)) +
  geom_histogram(binwidth = 1) +
  geom_density(color = "red") +
  labs(caption = paste0("n=", nrow(m2))) +
  scale_x_continuous(breaks = 1:10)






mtcars %>% 
  ggplot(aes(x = mpg)) +
  geom_density()










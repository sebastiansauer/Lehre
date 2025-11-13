set.seed(42)  # For reproducibility
x1 = rnorm(mean = 0, sd = 1, n=  100)
x2 = rnorm(mean = 0, sd = 1, n=  100)
y = 3 + 2*x1 + x2 + rnorm(mean = 0, sd = 0.1, n=  100)

d <-
  tibble(x1, x2, y)


lm1 <- lm(y ~ x1 + x2)
library(tidyverse)

my_grid <- expand_grid(x1 = seq(-3, 3, by = 0.10), 
                       x2 = seq(-3, 3, by = 0.10))


my_grid2 <- 
  my_grid %>% 
  mutate(lm1 = predict(lm1, newdata = data.frame(x1, x2)))


grid_wide <- 
  my_grid2 %>% 
  pivot_wider(names_from = x2, values_from = lm1) %>% 
  select(-1) %>%  # kick the name's column out
  as.matrix()

library(plotly)
p1 <- plot_ly(d,
              x = ~ x1,
              y = ~ x2,
              z = ~ y,
              type = "scatter3d")



p2 <- add_trace(p = p1,
                z = grid_wide,
                x = seq(-3, 3, by = .10),
                y = seq(-3, 3, by = .10),
                type = "surface")
p2

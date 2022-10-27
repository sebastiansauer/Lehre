#2022-10-20


library(tidyverse)

n <- 1e3

muenze_oft <- 
  sample(x = c(0, 1), size = n, replace = TRUE) 


muenze_oft %>% 
  sum()

replicate(n = 100,
          sample(x = c(0, 1), size = 10, replace = TRUE) %>% sum())
        

muenz_df <-
  tibble(
    x = replicate(1e4, sample(x = c(0,1), size = 10, replace = TRUE) %>% sum()))


# Aufgabe:
# Visualisieren Sie das Ergebnis der wiederholten Zufallsexperimente
# mit einem Balkendiagramm!
# Tipp: ggplot, geom_bar



ggplot(data = muenz_df) +
  aes(x = x) +
  geom_bar()



n <- 1e4
d <- 
  tibble(
    id = 1:n,
    x = rnorm(n = n, mean = 1002, sd = 1.5)
  )

head(d)



d %>% 
  count(x < 1000)

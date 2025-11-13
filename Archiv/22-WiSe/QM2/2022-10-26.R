# 2022-10-26


# Rethink Rethink_2m1


library(tidyverse)

dist <- 
  tibble(
    # Gridwerte bestimmen:
    p_grid = seq(from = 0, to = 1, length.out = 20),
    # Priori-Wskt bestimmen:
    prior = rep(1, times = 20)) %>%
  mutate(
    # Likelihood berechnen:
    likelihood_1 = dbinom(3, size = 3, prob = p_grid),  # WWW
   # unstand. Posterior-Wskt:
    unstand_post_1 = likelihood_1 * prior,
    # stand. Post-Wskt:
    std_post_1 = unstand_post_1 / sum(unstand_post_1),
 ) 


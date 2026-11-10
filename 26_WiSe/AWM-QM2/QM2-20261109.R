library(tidyverse)

# EXAKTE Bayesbox bauen:
n_success <- 6          
n_trials  <- 9
p_grid <- seq(from = 0, to = 1, by = .1)
L <- dbinom(n_success, size = n_trials, prob = p_grid)

bayesbox_6w_9v <-
  tibble(p_grid = p_grid,prior  = 1) |> 
  mutate(likelihood = L) |> 
  mutate(unstand_post = (likelihood * prior),
         post = unstand_post / sum(unstand_post))

# Stichproben-Post-Verteilung bauen:
samples_6w_9v <-
  bayesbox_6w_9v |>  # nimm die Tabelle mit Posteriori-Daten,
  slice_sample(  # Ziehe daraus eine Stichprobe,
    n = 100,  # mit insgesamt n=10000 Zeilen,
    weight_by = post,  # Gewichte nach Post-Wskt.,
    replace = T)  |>  # Ziehe mit Zurücklegen
  select(p_grid)


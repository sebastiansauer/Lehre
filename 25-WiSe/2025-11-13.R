# 2025-11-13

# Aufgabe: eti-hdi

n_success <- 10
n_trials <- 10

library(prada) # für bayesbox
library(tidyverse)
library(knitr) # schöne HTML-Tabellen
library(ggpubr)
library(easystats) # für hdi, eti


p_grid <-
  seq(from = 0, to = 1, length.out = 101) |>
  # auf zwei Dezimalen runden
  round(2)

p_grid

L <- dbinom(n_success, size = n_trials, prob = p_grid)
L

bb <- bayesbox(hyps = p_grid, priors = 1, liks = L) # aus "prada"

bb

ggline(bb, x = "hyps", y = "post_std")

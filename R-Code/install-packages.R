pckgs2 <- 
  c(
    "tidyverse",
    "tidybayes",
    "rstanarm",
    "bayesplot",
    "rstatix",
    "forcats",
    "tidytext",
    "janeaustenr",
    "stringr",
    "wordcloud",
    "gutenbergr",
    "forcats",
    "scales",
    "janitor",
    "tidymodels",
    "modelr",
    "leaps",
    "parallel",
    "corrr",
    "ggfortify",
    "fastDummies",
    "nycflights13",
    "arm",
    "hrbrthemes",
    "viridis",
    "GGally",
    "cowplot",
    "skimr",
    "see"
  )

pckgs_bayes <-
  c("rstan",
    "rstanarm",
    "bayesplot",
    "bayestestR",
    "tidybayes")

pacman::p_load(char = pckgs2)
  
pacman::p_load(char = pckgs_bayes)

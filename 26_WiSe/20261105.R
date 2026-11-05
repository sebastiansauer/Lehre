hyps <- c(0.5, 0.9)
apriori <- c(1, 1)
apriori2 <- c(99, 1)
size10 <- 10
likelihoods <- dbinom(x = 8, size = size10, prob = hyps)

size30 <- 30
l_24_von_30 <- dbinom(x = 24, size = 30, prob = hyps)

library(tidyverse)

bayesbox1 <-
  tibble(
    hyps = hyps,
    liks = likelihoods,
    apriori = apriori,
  )



bayesbox1 <-
bayesbox |> 
  mutate(
    post_unstand = apriori * liks,
    evidenz = sum(post_unstand),
    post = post_unstand / evidenz,
  )





bayesbox2 <-
  tibble(
    hyps = hyps,
    liks = likelihoods,
    apriori = apriori2,
    n = size10
  )


bayesbox2_breit <- 
bayesbox2 |> 
  mutate(
    post_unstand = apriori * liks,
    evidenz = sum(post_unstand),
    post = post_unstand / evidenz,
  )

bayesbox2_breit



bayesbox3 <-
  tibble(
    hyps = hyps,
    Liks = l_24_von_30,
    apriori = apriori,  # indifferent
  )

bayesbox3_breit <-
  bayesbox3 |> 
  mutate(
    post_unstand = apriori * Liks,
    evidenz = sum(post_unstand),
    post = post_unstand / evidenz,
  )

bayesbox3_breit









bayesbox4 <-
  tibble(
    hyps = hyps,
    liks = l_24_von_30,
    apriori = apriori2,  # 1 vs 99
  )

bayesbox4_breit <-
  bayesbox4 |> 
  mutate(
    post_unstand = apriori * liks,
    evidenz = sum(post_unstand),
    post = post_unstand / evidenz,
  )

bayesbox4_breit




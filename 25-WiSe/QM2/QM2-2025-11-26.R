# 2025-11-27

library(rstanarm)
library(tidyverse)
library(easystats)

Kung_path <-  
  "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/Howell1a.csv"  

kung <- read.csv(Kung_path) 

head(kung)

kung_erwachsen <- kung %>% 
  filter(age >= 18)

nrow(kung_erwachsen)
## [1] 352


m_kung <- stan_glm(height ~ 1, data = kung_erwachsen, refresh = 0)  # aus Paket rstanarm

parameters(m_kung)  # aus Paket `easystats`

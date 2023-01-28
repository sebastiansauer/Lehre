library(rstanarm)
library(easystats)
library(tidyverse)


Kung_path <-  
  "https://raw.githubusercontent.com/sebastiansauer/Lehre/main/data/Howell1a.csv"  

d <- data_read(Kung_path)  # aus dem Paket `easystats`


head(d)

d2 <- d %>% 
  filter(age >= 18)

m41 <- stan_glm(height ~ 1, data = d2, refresh = 0)
m41_post <- as_tibble(m41)  # Modellergebnis in Tabelle umwandeln
names(m41_post) <- c("mu", "sigma")  # schönere Namen für die Spalten

# Post befragen, z.B.:
m41_post %>% 
  count(between(mu, 154, 155))


parameters(m41)




#2023-12-19
library(tidyverse)
library(rstanarm)
library(easystats)

set.seed(42)  # Reproduzierbarkeit
N <- 1e03  

d_eignung <-
  tibble(
    iq = rnorm(N),  # normalverteilt mit MW=0, sd=1
    fleiss = rnorm(N),
    glueck = rnorm(N, mean = 0, sd = .1),
    eignung = 1/2 * iq + 1/2 * fleiss + glueck,
    # nur wer geeignet ist, studiert (in unserem Modell):
    studium = ifelse(eignung > 0, 1, 0) 
  )


m_eignung <-
  stan_glm(iq ~ fleiss, 
           data = d_eignung %>%  filter(studium == 1), 
           refresh = 0)

hdi(m_eignung)
plot(estimate_relation(m_eignung))


m_eignung_gesamtpop <-
  stan_glm(iq ~ fleiss, 
           data = d_eignung , 
           refresh = 0)

plot(estimate_relation(m_eignung_gesamtpop))

hdi(m_eignung_gesamtpop)

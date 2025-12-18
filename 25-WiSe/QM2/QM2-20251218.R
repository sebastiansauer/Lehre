
# Aufgabe: Bike Sharing 1


### Vorbereitung

library(tidyverse)
library(easystats)
library(rstanarm)
library(ggpubr)

day <- read_csv("C:/Users/sebastian.sauer/Downloads/bike+sharing+dataset/day.csv")



### Modell 

m_cnt_workingday <- 
  stan_glm(cnt ~ workingday, data = day, seed = 42)

parameters(m_cnt_workingday)  


# Clevere Auto-Complete - Bot: Github CoPilot


# Visualisieren:

parameters(m_cnt_workingday) |> plot()



ggviolin(day, x = "workingday", y = "cnt",
         add = "mean")
        

ggboxplot(day, x = "workingday", y = "cnt",
         add = "mean")




# 20260505


library(tidyverse)  # Datenjudo
library(sjmisc)  # recode
library(psych)  # Itemanalyse


data_url <- "https://raw.githubusercontent.com/sebastiansauer/modar/master/datasets/extra.csv"
extra <- read_csv(data_url)


extra_items <- extra %>% 
  select(i01:i10) %>% 
  drop_na()

psych::alpha(extra_items)

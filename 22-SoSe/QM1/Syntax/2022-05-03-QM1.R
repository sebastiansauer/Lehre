# 2022-05-03-QM1

library("ggplot2")

chic <- readr::read_csv("https://raw.githubusercontent.com/Z3tt/ggplot-courses/master/data/chicago-nmmaps.csv")
chic$year <- factor(chic$year, levels = as.character(1997:2000))
tibble::glimpse(chic)

# 2024-09-17

1+1  # Control+Enter

antwort <- 42

antwort2 <- 73

antwort2 <- antwort

# Ex1

antwort <- antwort2
antwort <- "42"
antwort <- 42



# "Liste":

drei_freunde <- c("anna", "berta", "carla")

drei_zahlen <- c(1, 2, 3)

mean(drei_zahlen)

drei_zahlen - 1


x <- c(1, 2, 3)
sum(1,2,3)  # OHNO
sum(x)   # oh yes!
sum(c(1,2,3))  # oh yes, geht auch



y <- c(1, 2, NA)
mean(y, na.rm = TRUE)



date()

read.csv()

mean()

sd()

d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

head(d)  # see the first few rows, the "head" of the table




library(easystats)  # once per session
describe_distribution(d)











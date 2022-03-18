1+1

richtige_antwort <- 42
falsche_antwort <- 43   # Shortcut Strg-Enter
typ <- "Antwort"
typ

ist_korrekt <- FALSE


die_summe <- falsche_antwort + richtige_antwort
die_summe


Antworten <- c(42, 43)
mean(Antworten)


mtcars <- read_csv("https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv")



library("rstatix")


get_summary_stats(mtcars)

get_summary_stats(mtcars, type = "mean_sd")

get_summary_stats(mtcars, mpg, type = "mean_sd")


freq_table(mtcars, am, cyl)


ggboxplot(mtcars, x = "am", y = "mpg")
ggscatter(mtcars, x = "hp", y = "mpg", xlab = "PS-Zahl", color = "pink")


lm(mpg ~ am, data = mtcars)

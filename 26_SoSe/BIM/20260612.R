alter <- c(20, 21, 22)

mean(alter)
median(alter)


gehalt <- c(100, 102, 1000000000)
mean(gehalt)
median(gehalt)

gehalt2 <- c(1, 2, 3, 4)
gehalt2a <- c(1, 2.5, 4)

# fehlender Werte: NA "not available"

alter2 <- c(20, 21, NA)

mean(alter2)

mean(alter2,
  na.rm = TRUE
)


schalte_glotze_an()
schalte_glotz_an(kanal = "ard")


mean(x = alter2, na.rm = TRUE)
# identisch zu:
mean(alter2, 0, TRUE)

mean(na.rm = TRUE, x = alter2)

# AUFGABE: Richtig oder falsch?

# GEHT NICHT:
mean(TRUE, alter2)


x <- 42
x <- 42


a <- 1
b <- 2


a <- b
a <- b
b <- a

a -> b


mtcars
data(mtcars)


mtcars$hp



# Problematischer Pfad:


daten <- read.csv("C:/Users/Desktop/Projekt/meine_daten.csv")




x <- c(10, 20, 30)

x == 20

mean(x == 20)

mean(c(0,1,0))

mtcars2 <-
mtcars %>% 
  select(hp, mpg) %>% 
  filter(hp > 200) %>% 
  arrange(-mpg)



mtcars %>% 
  summarise(mean(mpg))



mtcars %>% 
  group_by(am) %>% 
  summarise(mean(mpg))



tabelle %>%
  arrange(spalte)
  
# identisch zu:
arrange(tabelle, spalte)





# Autos: hp > 200 UND cyl = 6

mtcars %>% 
  filter(hp > 200 & cyl == 8)

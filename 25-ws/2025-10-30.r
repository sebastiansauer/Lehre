<<<<<<< HEAD
# 2025-10-30

# Binomialverteilung
# Bsp: 3 Lose ziehen, 2 Gewinnlose/Treffer
# Was ist die Wahrscheinlichkeit, genau 2 Gewinnlose zu ziehen?

# Man kann einen Baum zeichnen!
# Manb kann aber auch die Binomialverteilung verwenden mit Hilfe von R.

dbinom(x = 2, size = 3, prob = 2/5)
# Bsp: 5.2
# x = Anzahl der Erfolge (Treffer)
# size = Anzahl der Versuche
# prob = Wahrscheinlichkeit für Erfolg bei einem Versuch


dbinom(x = 1, size = 3, prob = 2/5)
dbinom(x = 0, size = 3, prob = 2/5)
dbinom(x = 3, size = 3, prob = 2/5)


pbinom(q = 2, size = 3, prob = 2/5)
# 0,1,2 Treffer - höchstens 2 Treffer





# Wahrscheinlichkeitsverteilung plotten
x <- 0:3
y <- dbinom(x = x, size = 3, prob = 2/5)
plot(x, y, type = "h", lwd = 2, 
     main = "Binomialverteilung: n = 3, p = 2/5",
     xlab = "Anzahl der Treffer", ylab = "Wahrscheinlichkeit")
||||||| 19aac4b
# 2025-10-30
=======
# 2025-10-30

# Binomialverteilung
# Bsp: 3 Lose ziehen, 2 Gewinnlose/Treffer
# Was ist die Wahrscheinlichkeit, genau 2 Gewinnlose zu ziehen?

# Man kann einen Baum zeichnen!
# Manb kann aber auch die Binomialverteilung verwenden mit Hilfe von R.

dbinom(x = 2, size = 3, prob = 2/5)
# Bsp: 5.2
# x = Anzahl der Erfolge (Treffer)
# size = Anzahl der Versuche
# prob = Wahrscheinlichkeit für Erfolg bei einem Versuch


>>>>>>> d9e77f99a6faad6a3a2a96f77ee693d349072916

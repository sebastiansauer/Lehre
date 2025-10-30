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



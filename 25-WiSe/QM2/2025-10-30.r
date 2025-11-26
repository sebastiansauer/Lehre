
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



# Github CoPilot - hilft beim Coden



# Aufgabe:
# Was ist die Wskt., die Klausur durch Raten zu bestehen? (d.h. min 50% richtig, also 10 oder mehr Punkte?)
# s. Beispiel 5.4! - sehr ähnlich

# Schritt 1: Wskt, durchzufallen:
# 0-9 Punkte - dann fällt man durch
p_fail <- pbinom(q = 9, size = 20, prob = 0.5) #  Wskt 0-9 Treffer
p_fail
# Schritt 2: Wskt, zu bestehen:
p_pass <- 1 - p_fail
p_pass



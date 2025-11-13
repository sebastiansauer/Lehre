# 2023-10-17

# Aufgabe:
# Geg: n=10 Münzwürfe mit fairer Münze
# Ges: Pr. für x=1 Treffer


dbinom(x = 1,  # Anzahl Treffer
       size = 10,  # Größes des Versuchs, d.h. Anzahl (n) Münzen
       prob = 1/2  # Wskt für einen Treffer
       )

# Binomialkoeffizient in R

choose(n = 10,
       k = 1)


# interessanter: k = 5 Treffer bei n = 10 Würfen

anz_kombis <- choose(n = 10, k = 5)

Pr_5_10 <- anz_kombis * (1/2)^1 * (1/2)^9  # ca. 24%






# 2022-04-05, QM1


# MAD vs. SD

# Definiere die Messwerte:
x <- c(1, 10, 11)

# MAD:
# 1. Abstände d_i von x_i zum MW
# 2. MW d_i

# Berechne MW:
x_m <- mean(x)
x_m

# Berechne Abstand der Messwerte zum MW von X:
d <- x - x_m

# Berechne Absolutabstände:
d_abs <- abs(d)

# MAD als MW der Abstolutabstände:
mad_x <- mean(d_abs)

# Varianz/SD

# Abweichungsquadrate (Vorstufe zur Varianz):
d_sq <- d^2
d_sq

# Varianz:
var_x <- mean(d_sq)
var_x    

# Ziehe Wurzel, um von Varianz zu SD zu kommen:
sd_x <- sqrt(var_x)
sd_x

# Step 0: upfront preparation


# install.packages("tidyverse")
library("tidyverse")  # starting the extension, run this each time you open RStudio


# Step 1: Import your data

library(readr)
Affair <- read_csv("~/datasets/Affair.csv")
View(Affair)


mtcars_path <- "https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv"


library(readr)
mtcars <- read_csv("https://vincentarelbundock.github.io/Rdatasets/csv/datasets/mtcars.csv")
View(mtcars)  # Contrl-Enter Shortcut, very useful


# Step 2: Have a look

library(nycflights13)

alaska_flights <- flights %>% 
  filter(carrier == "AS")

ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_point()


ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_point(alpha = 0.2)


# Geom "bin2d":
ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_bin2d()



# Geom "hex":
ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_hex()



# Geom "density 2d filled":
ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_density_2d_filled()



# Geom "density 2d filled":
ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay)) + 
  geom_density_2d()



# boxplot


ggplot(data = weather, mapping = aes(x = factor(month), y = temp)) +
  geom_boxplot()

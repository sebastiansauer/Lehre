
# Upfront preparation -----------------------------------------------------





# Step 0: upfront preparation


# install.packages("tidyverse")
library("tidyverse")  # starting the extension, run this each time you open RStudio




# Importing data ----------------------------------------------------------



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



# Make data available from R package:

data(flights)



# Data Wrangling ----------------------------------------------------------





# Data Wrangling

# "Lego system" of dplyr:

mtcars %>%   # Shortcut Cntrl-Shift-M
  filter(cyl == 6) %>% 
  select(cyl, mpg, hp, am) %>% 
  group_by(am) %>% 
  summarise(mpg_mean = mean(mpg))



# Exercise:
# Filter the `flights` data set to all flights departing from JFK in January 2013, and save it as a new R table.

# preparation, only needed if you have not yet done so:
library(nycflights13)
library(tidyverse)
data(flights)


nyc_january <- 
  flights %>%  # Shortcut Contrl-shift-m
  filter(origin == "JFK", month == 1)
  

# Summarise data

# Research Question: What's the mean delay in Jan 2013 from JFK?



nyc_january %>% 
  
  





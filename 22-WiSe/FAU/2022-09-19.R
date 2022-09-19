
# ex 2.1
x <- 42

# ex 2.2
name <- "me"

me <- "Sebastian"

# Ex 2.3:
name <- me

# both ok, synonymous:
x <- 42  # preferred
x = 42

x = me # a bit ambigous
x <- me
me -> x  # more precise


name == "Sebastian"  # NOT assignment - assertion, or check

name == 42  # FALSE


x <- c(1, 2, 3) # "c"ombine, "c"oncatenate, gives a vector


x * 2 # vectorized function, arithmetic


1.2 == 1.2 


mean(x)

y <- c(1,2, NA)  # not available

mean(y, na.rm = TRUE)



# Importing data


d <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/palmerpenguins/penguins.csv")

head(d)  # see the first few rows, the "head" of the table





# EDA!


install.packages("DataExplorer")

library(DataExplorer)

introduce(d)


## Plot basic description for airquality data
plot_intro(d)



## View missing value distribution for airquality data
plot_missing(d)

plot_bar(penguins)
plot_histogram(d)
plot_density(d)


d %>%   #it's called the pipe, "then do"
  group_by(species) %>% 
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE),
            sd_bill_length = sd(bill_length_mm, na.rm = TRUE))


install.packages("tidyverse")  # install it first
library(tidyverse)  # then load it


d %>%   # Shortcut for pipe: "Control-Shift-M"
  filter(species == "Adelie") %>% 
  plot_density()



plot_qq(d)

# tidyverse approach:
library(tidyverse)


d %>% 
  distinct(year)



d %>%   # pipe, "and then"
  select(year) %>% 
  plot_qq() +
  scale_y_continuous(breaks = c(2007, 2008, 2009)) +
  labs(title = "QQ plot of year")  # throws erorr!




## View overall correlation heatmap
plot_correlation(d)
  

# one way of dropping NA:
d2 <- 
  d %>% 
  drop_na()


# another way to drop NA
plot_correlation(d, cor_args = list(use = "complete.obs"))


# synonymous:
d %>% 
  drop_na() %>% 
  plot_correlation()






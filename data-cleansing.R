# data cleansing!


# deleting dubs, missing values, add columns, outliers


data(mtcars)

library(tidyverse)

# exr1: cyl < 6 

filter(mtcars, cyl≥ < 6)

# exr2: save the filter tab as new tab

tab2 <- filter(mtcars, cyl < 6)

# exr3: visualize research question "mpg ~ hp" (in tab2)
# mpg: fuel economy (consumption)
# hp: horse power

library(ggpubr)

ggscatter(tab2, x = "hp", y = "mpg")
# remenber that "tab2" must be defined


# ex4: same as, but mpg ~ cyl
# bonus: add regression line (hint: see online docs)


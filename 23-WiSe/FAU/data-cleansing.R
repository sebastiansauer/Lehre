# data cleansing!


# deleting dubs, missing values, add columns, outliers


data(mtcars)

library(tidyverse)  # work horse for data wrangling!

# exr1: cyl < 6 

filter(mtcars, cyl < 6)

# exr2: save the filter tab as new tab

tab2 <- filter(mtcars, cyl < 6)

# exr3: visualize research question "mpg ~ hp" (in tab2)
# mpg: fuel economy (consumption)
# hp: horse power


library(ggpubr)
ggscatter(tab2, x = "hp", y = "mpg")
# remember that "tab2" must be defined




# alternative  ggplot:
library(tidyverse)
ggplot(data = mtcars) +
  aes(x = hp, y = mpg) +
  geom_point()


# ex4: same as, but mpg ~ cyl
# bonus: add regression line (hint: see online docs)

# alternative:
library(ggstatsplot)
ggscatterstats(tab2, x = hp, y = mpg)  # different syntax to ggpubr

ggscatter(tab2, x = "hp", y = "mpg",
               add = "reg.line")  # different syntax to ggpubr


library(tidyverse)
ggplot(data = tab2) +
  aes(x = hp, y = mpg) +
  geom_point() +
  geom_smooth(method = "lm")



# ex5: kick out missing values

# create a missing value
mtcars$mpg[1] <- NA


tab3 <- drop_na(mtcars)


# ex6: deal with extreme values
mtcars$mpg[2] <- 1000  # makes artificial extreme value

tab4 <- mtcars

# pipe!
tab5 <- 
  tab4 %>%  # shortcut for pipe: contrl-shift-m
  mutate(mpg_is_outlier = mpg > 50)  # mutate changes columns/variables


# approach 1: kick it out

tab6 <-
  tab5 %>% 
  filter(mpg_is_outlier == FALSE)

# approach 2: change it to the mean, if outlier

library(easystats)  # if not yet started
describe_distribution(tab5)


# mutating values depending on some case/condition:
tab7 <- 
tab6 %>% 
  mutate(mpg = case_when(
    mpg_is_outlier == TRUE ~ 50,
    mpg_is_outlier == FALSE ~ mpg
  ))


# mind the difference:
x = 10  # assigns 10 to the object x
x == 10 # checks whether/if x equals 10



# ex9: convert `wt` from 1000 pounds to kg
# 


tab8 <-
  mtcars %>% 
  mutate(wt_kg = (wt * 1000)/2)


# ex10: mutate mpg to `log(mpg)`

tab9 <-
  mtcars %>% 
  mutate(mpg_logged = log(mpg))  # log10 is also possible



  

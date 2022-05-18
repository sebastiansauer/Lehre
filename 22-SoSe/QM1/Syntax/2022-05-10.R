# 2022-05-10



# Vorbereitung ------------------------------------------------------------
library(tidyverse)
library(here)
# Dateiname mit Pfad:
d_url <- "/home/sebastian/Documents/datasets/women-in-parliament/API_SG.GEN.PARL.ZS_DS2_en_csv_v2_4025756.csv"


library(readr)
wip <- read_csv("~/Documents/datasets/women-in-parliament/API_SG.GEN.PARL.ZS_DS2_en_csv_v2_4025756.csv", 
              skip = 4)

# Importieren mit Skippen der ersten 4 Zeilen:
d <- read_csv(d_url, skip = 4)


women_in_parliament <- wip


wip <- read_csv(here("data-wip", "WB-WiP.csv"),
                skip = 4)

names(wip) <- make.names(names(wip))


# Hilfe -------------------------------------------------------------------

# Bild zum Pivotieren: https://fromthebottomoftheheap.net/2019/10/25/pivoting-tidily/



# Spaltennamen

names(wip)

head(names(wip))


wip2 <- wip %>%
  select(-Indicator.Name, -Indicator.Code) %>%
  rename(Country=Country.Name, Code=Country.Code)


WP <- wip2 %>%
  pivot_longer(starts_with("X"),
               names_to = "YearC",
               values_to = "pctWiP",
               values_drop_na = TRUE) %>%
  mutate(Year = parse_number(YearC),
         Ratio = (100-pctWiP)/pctWiP) %>%
  select(Country, Code, Year, pctWiP, Ratio) %>%
  arrange(Country, Year)



WP %>%
  filter(Country=="Portugal") %>%
  ggplot(aes(Year, pctWiP)) +
  geom_line() + geom_point() +
  scale_y_continuous(limits=c(0, 50)) +
  ylab("Percentage Women in Parliament")


WP %>%
  filter(Country %in% c("Portugal", "Sweden",
                        "Spain", "Hungary", "Romania", "Finland",
                        "Germany", "European Union")) %>%
  ggplot(aes(Year, pctWiP, colour=Country)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks=seq(1995, 2020, 5)) +
  scale_y_continuous(limits=c(0, 50),
                     breaks=seq(0, 50, by=10)) +
  ggtitle("Women in Parliament: EU Countries") +
  ylab("% Women in Parliament")

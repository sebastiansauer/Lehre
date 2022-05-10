# title: Data preparating


library(tidyverse)
library(easystats)
library(janitor)
library(lubridate)
library(sjmisc)

d_raw <- data_read("data/data-raw/2_Limesurvey_Pop-up-Stores_Location_n506_2020-08-03_Roh.csv")



d <-
  d_raw %>%
  clean_names()


names(d) <- sprintf("v%03d", 1:ncol(d))

# slice some rows to be published ahead of time:
d1a <-
  d %>%
  filter(v023 %in% c(1, 2, 3)) %>%
  group_by(v023) %>%
  sample_n(30) %>%
  ungroup()


write_csv(d1a, file = "data/d1a.csv")
rio::export(d1a, file = "data/d1a.xlsx")

# Create codebook ---------------------------------------------------------




compute_codebook <- function(d) {
  codebook <-
    tibble(
      id = 1:length(names(d)),
      var_label = sprintf("v%03d", id),
      var_names = names(d),
      var_type = map(d, typeof),
      var_class = map(d, class),
      NA_n = map(d, ~ sum(is.na(.))),
      max_value = map(d, max, na.rm = TRUE),
      min_value = map(d, min, na.rm = TRUE),
      n_unique = map(d, n_unique)
    )

  return(codebook)
}


codebook <- compute_codebook(d)


write_csv(codebook, file = "docs/codebook.csv")
rio::export(codebook, file = "docs/codebook.xlsx")


# Clean data --------------------------------------------------------------






d2 <-
  d %>%
  remove_constant() %>%
  remove_empty() %>%
  mutate(NA_n = rowSums(is.na(.)))




# check which string values are used to decode NA:
d2$v033 %>% unique()
d2$v059 %>% unique()
d2$v089 %>% unique()
d2$v107 %>% unique()
# ok: "" and "N/A" are used to decode missing values (NA)
na_strings <- c("", "N/A")



# na_if does not work with date/time objects for some reason, so kick those cols out:
d3 <-
  d2 %>%
  select(-c(v002, v006, v007))







# Replace "N/A" with NA etc. ----------------------------------------------


d4 <-
  d3 %>%
  map_df(~ na_if(., "")) %>%
  map_df(~ na_if(., "N/A"))





# Recode ------------------------------------------------------------------



d5 <-
  d4 %>%
  mutate(across(
    .cols = c(v033:v056, v087:v104),
    .fns = ~ recode(.,
      "lehne voll und ganz ab" = -3,
      "lehne ab" = -2,
      "lehne eher ab" = -1,
      "weder/noch" = 0,
      "stimme eher zu" = 1,
      "stimme zu" = 2,
      "stimme voll und ganz zu" = 3,
      .default = NA_real_
    )
  ))






# Compute row means -------------------------------------------------------



d6 <-
  d5 %>%
  rowwise() %>%
  mutate(
    exp_avg = mean(c_across(v033:v039), na.rm = TRUE),
    neu_avg = mean(c_across(v040:v042), na.rm = TRUE),
    att_avg = mean(c_across(v043:v047), na.rm = TRUE),
    ka_avg = mean(c_across(v048:v053), na.rm = TRUE), 
    wom_avg = mean(c_across(v054:v056), na.rm = TRUE),
    innp_avg = mean(c_across(v087:v092), na.rm = TRUE),
    imp_avg = mean(c_across(v093:v096), na.rm = TRUE),
    hedo_avg = mean(c_across(v097:v100), na.rm = TRUE),
    sho1_avg = mean(c_across(v101:v104), na.rm = TRUE)
  ) %>%
  relocate(ends_with("_avg"), .after = v008)


write_csv(d6, file = "data/d6.csv")
rio::export(d6, file = "data/d6.xlsx")

# Reduce data -------------------------------------------------------------



d7 <-
  d6 %>%
  filter(v023 %in% c(1, 2, 3)) %>%
  group_by(v023) %>%
  sample_n(30) %>%
  ungroup()


d8 <-
  d7 %>% 
  select(
    v001_id = v001,
    ends_with("_avg"), 
    v023_rand = v023,
    v108_sex = v108)


write_csv(d8, file = "data/d8.csv")
rio::export(d8, file = "data/d8.csv")

vars_reduced <- names(d8)

codebook_reduced <-
  codebook %>%
  filter(var_label %in% vars_reduced)


write_csv(codebook_reduced, file = "docs/codebook_reduced.csv")
rio::export(codebook_reduced, file = "docs/codebook_reduced.xlsx")


# EDA ---------------------------------------------------------------------

library(easystats)
library(gt)

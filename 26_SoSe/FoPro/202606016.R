#20260616


data_path <- "https://raw.githubusercontent.com/sebastiansauer/pradadata/refs/heads/master/data-raw/extra.csv"


library(tidyverse)


extra_raw <- read_csv(data_path)



d_raw <-
  tibble(
    start_time = "2026-06-16 08:00:00",
    end_time = "2026-06-16 09:00:00"
  )


d_raw |> 
  mutate(start_time = as_datetime(start_time),
         end_time  = as_datetime(end_time)) |> 
  mutate(duration = end_time - start_time)

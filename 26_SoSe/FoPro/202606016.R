#20260616



library(tidyverse)

# Zeitdauer der Bearbeitung der Umfrage (pro Versuchsperson) berechnen:

d_raw <-
  tibble(
    start_time = c("2026-06-16 08:00:00", "2026-06-16 08:01:00"),
    end_time = c("2026-06-16 09:00:00", "2026-06-16 08:02:00")
  )


d_raw |> 
  mutate(start_time = as_datetime(start_time),
         end_time  = as_datetime(end_time)) |> 
  mutate(duration = end_time - start_time) |> 
  mutate(too_fast = duration < "5 mins")

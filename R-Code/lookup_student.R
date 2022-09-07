


lookup_name <- function(csv_file, student_id){
  
  require(tidyverse)
  
    d <- readr::read_csv(csv_file)
  
  out <-
    d %>% 
    dplyr::filter(id == {{student_it}}) %>% 
    select(id)
  
}


lookup_studentid <- function(csv_file, lastname) {
  
  require(tidyverse)
  
  d <- rio::import(csv_file)
  
  
  out <-
    d %>% 
    dplyr::filter(Nachname == {{lastname}}) %>% 
    select(id, Nachname, Vorname)
}

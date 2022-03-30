# Functions to render the course sections in markdown format




compute_course_dates <- function(dates_file, # input yaml file
                                 output_file = "course_dates.csv",
                                 write_to_disk = FALSE){
  
  # this function builds a dataframe with course dates
  # basing on a yaml file with basic infos
  
  
  library(tidyverse)
  library(lubridate)
  library(yaml)
  library(assertthat)
  
  yml_file <- dates_file
  
  dates <- read_yaml(yml_file)
  week1 <-  week(ymd(dates$first_day))
  weeks_vec <- week(ymd(dates$first_day)):(week(ymd(dates$first_day))+dates$weeks_n-1)
  teaching_vec <- rep(TRUE, dates$weeks_n)
  teaching_vec[dates$weeks_off] <- FALSE
  teaching_comments <- rep(NA, dates$weeks_n)
  
  course_dates <-
    tibble(
      ID = 1:length(weeks_vec),
      KW = weeks_vec,
      Lehre = teaching_vec,
      lehrfrei = !Lehre,
      Kurswoche = cumsum(Lehre),
      Datum_Beginn = ymd(dates$first_day) + ID * 7 - 7,
      Datum_Ende = (ymd(dates$first_day)+6) + ID * 7 - 7
    )
  
  
  if (write_to_disk) write_csv(course_dates, output_file)
  
  return(course_dates)
  
}


build_master_course_table <- function(course_dates_file,
                                      content_file) {
  # this function reads two yaml files 
  # and builds the master table with course descriptors per topic
  # the two yaml file are the dates files, and the descriptors file
  
  
  
  # read source files:
  course_dates <- compute_course_dates(course_dates_file)
  course_topics_l <- yaml::read_yaml(content_file)
  
  #  build tables with course description:
  course_topics <-
    tibble(
      Titel = course_topics_l %>% map_chr("Titel")) %>%
    mutate(Lernziele = list(course_topics_l %>% map("Lernziele"))) %>%
    mutate(Vorbereitung = list(course_topics_l %>% map("Vorbereitung"))) %>%
    mutate(Literatur = list(course_topics_l %>% map("Literatur"))) %>%
    mutate(Videos = list(course_topics_l %>% map("Videos"))) %>%
    mutate(Skript = list(course_topics_l %>% map("Skript"))) %>%
    mutate(Aufgaben = list(course_topics_l %>% map("Aufgaben"))) %>%
    mutate(Vertiefung = list(course_topics_l %>% map("Vertiefung"))) %>%
    mutate(Hinweise = list(course_topics_l %>% map("Hinweise")))
  
  # check if the number of rows are identical:
  assert_that(nrow(course_dates) == nrow(course_topics))
  
  # build master table:
  master_table <-
    course_dates %>%
    bind_cols(course_topics)
  # warning: columns are just bind next to eacher other, no ID is checked
  # make sure the order of the rows match.
  
  return(master_table)
  
}



build_master_course_table2 <- function(course_dates_file,
                                       content_file) {
  # this function reads two yaml files 
  # and builds the master table with course descriptors per topic
  # the two yaml file are the dates files, and the descriptors file
  # descriptors: name of first level keys (descriptors) to be rendered. 
  # If NULL, all will be rendered.
  
  
  
  # read source files:
  course_dates <- compute_course_dates(course_dates_file)
  course_topics_l <- yaml::read_yaml(content_file)
  
  
  course_topics <-
    tibble(ID = 1:length(course_topics_l))
  
  descriptors_all <- names(course_topics_l[[1]])
  
  
  
  d <-
    enframe(course_topics_l)
  
  d2 <-
    d %>% 
    unnest_wider(2)
  
  
  
  # check if the number of rows are identical:
  assert_that(nrow(course_dates) == nrow(course_topics))
  
  # build master table:
  master_table <-
    course_dates %>%
    bind_cols(d2)
  # warning: columns are just bind next to eacher other, no ID is checked
  # make sure the order of the rows match.
  
  return(master_table)
  
}




render_section <- function(course_dates_file,
                           content_file, 
                           name,  # descriptor name (such as literature, exercises,...)
                           i, # this is the index variable giving the entry number (such as topic/week 2)
                           header_level = 2){  # how many '#' to prepend
  
  library(tidyverse)
  library(assertthat)
  
  # this function renders the markdown code for one item of the course description.
  
  master_table <- 
    build_master_course_table2(course_dates_file,
                               content_file)
  
  assert_that(name %in% names(master_table))
  
  
  # first, deal with the simpler, non-list columns:
  if (class(master_table[[name]]) != "list") {
    
    cat("\n")
    cat(paste0(str_c(rep("#", header_level + 1), collapse = "")," ", name, " \n"))
    cat("\n")
    out <- as.character(unname(master_table[[name]][i]))
    cat(out)
    cat("\n")
  }
  
  # then, deal with the list cols:
  if (class(master_table[[name]]) == "list") {
    
    # look in column 'name', and read the i'th element:
    # i give the the row number which corresponds to the row/course number
    out <- master_table[[name]][[i]]
    # nb: we need to `[[` as we want the actual character vector with multiple elements
    # only one `[` would leave us with a single element list, so we could not splice multiple bullet points
    
    if (!is.null(out)){
      cat(paste0(str_c(rep("#", header_level + 1), collapse = "")," ", name, " \n"))
      cat("\n")
      for (i in out) {
        cat(paste0("- ", i))
        cat("\n")
      }
      
      cat("\n")
      cat("\n")
    }
  }
  
  cat("\n")
  
}




render_course_outline <- function(
  course_dates_file, # yaml file with course dates
  content_file,   # course contents/description
  header_level = 2, # start to render text at header level 2
  descriptors = NULL,  # which descriptors from the yaml file should be rendered? Null: All
  small_table = FALSE)  # render all columns or only a subset?
  {
  
  # this function generates markdown code
  # using the information provided from two yaml files, one with dates, one with content
  
  
  master_table <-
    build_master_course_table2(course_dates_file,
                               content_file)
   

  # get headers:
  chapters <-
    master_table %>%
    pull(Titel) %>%
    simplify()
  
  # get descriptors of course (such das date, literature, ... for each topic/week):
  
  subsections <-
    master_table %>%
    names()

  # if argument `descriptors` is not NULL, only the selected descriptors will be rendered
   if (!is.null(descriptors)) {
     assertthat::assert_that(all(descriptors %in% subsections))
    
     subsections <-
       subsections %>% 
       keep(~ .x %in% descriptors)
  }
  

    
  
  if (small_table == FALSE){
    
    for (i in seq_along(chapters)){
      
      # oberabschnitt:
      
      cat(paste0(str_c(rep("#", header_level), collapse = "")," ", chapters[i], "\n"))
      cat("\n")
      
      
      # unterabschnitte, eine Ebene tiefer:
      
      
      for (j in subsections){
        
        render_section(course_dates_file,
                       content_file,
                       name = j,
                       header_level = header_level,
                       i = i)
      }
      
      
      # Leerzeilen, bevor neues Thema anfängt
      cat("\n")
      cat("\n")
      
    }
  } else {
    master_table %>%
      filter(Lehre == TRUE) %>%
      select(Kurswoche, KW, Titel, contains("Datum")) %>%
      gt::gt()
    
  }
  
}

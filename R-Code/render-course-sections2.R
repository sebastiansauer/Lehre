

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


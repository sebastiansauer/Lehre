

exam2yamlrmd <- function(examfile, 
                         path_output, 
                         ex_sol_str = c("Exercise", "Solution", "Categories"),
                         print_categories = FALSE,
                         separate_ex_sol = rep("</br>", 10),
                         verbose = TRUE,
                         header_level = 1){
  # This function reads a R/exams exercise file and converts it to a yaml-headed Rmd file.
  
  parse_examfile <- function(examfile) {
    
    require(yaml)
    
    require(dplyr)
    
    require(stringr) 
    
    require(lubridate)
    
    stopifnot(file.exists(examfile))
    ex_str <- readLines(examfile)
    
    
    # get pre-question:
    
    start_pos <- 1
    end_pos <- which(ex_str == "Question")
    ex_pre_question <-
      ex_str[1:(end_pos-1)]
    
    
    # get question:
    
    start_pos <- which(ex_str == "Question")
    end_pos <- which(ex_str == "Solution")
    ex_question <- 
      ex_str[(start_pos+3):(end_pos-1)]
    
    
    
    # get solution:
    
    start_pos <- which(ex_str == "Solution")
    end_pos <- which(ex_str == "Meta-information")
    ex_solution <- 
      ex_str[(start_pos+3):(end_pos-1)]
    
    # get metadata:
    
    start_pos <- which(ex_str == "Meta-information")
    
    ex_metadata <- 
      ex_str[start_pos:length(ex_str)] %>% 
      magrittr::extract(-c(1,2)) 
    
    title <- str_extract(examfile, "([^/]+$)") %>% 
      str_remove("\\.Rmd")
    
    # remove backticks from metadata, as it cannot be parsed:
    ex_metadata_clean <- str_remove_all(ex_metadata, "`")
    ex_metadata_yaml <- ex_metadata_clean %>% yaml.load()
    
    ex_metadata_yaml$date <- as.character(Sys.Date())
    ex_metadata_yaml$slug <- title
    ex_metadata_yaml$title <- title
    
    # we need at least 2 values, otherwise yaml won't take it as a vector, which will then in turn not work in blogdown:
    if (length(ex_metadata_yaml$tags) == 1) ex_metadata_yaml$tags <- 
      c(ex_metadata_yaml$tags, "stats")
    if (length(ex_metadata_yaml$categories) == 1) ex_metadata_yaml$categories <- 
      c(ex_metadata_yaml$categories, Sys.Date() %>% lubridate::year())
    
    
    examfile_info <- 
      list(
        ex_pre_question = ex_pre_question,
        ex_question = ex_question,
        ex_solution = ex_solution,
        ex_metadata = ex_metadata_yaml %>% as.yaml(),
        ex_metadata_yaml = ex_metadata_yaml)
    
    return(examfile_info)
    
    if (verbose) cat("Exam exercise file has been parsed.\n")
    
  }
  

  ex_parsed <- parse_examfile(examfile = examfile)

    header_level_hashes <- rep("#", header_level) %>% str_c(collapse = "")
    
    
    
  # now build the yaml-rmd file:
    yamlrmdfile <- 
      # metadata:
      c("---", ex_parsed$ex_metadata, "---", "", "",
        # pre-question:
        ex_parsed$ex_pre_question, "",
        # header for "Exercise":
        str_c(c(header_level_hashes, " ", ex_sol_str[1]), collapse = ""), "",
        # exercise:
        ex_parsed$ex_question, "", 
        # separation between exercise and solution:
        separate_ex_sol, "",
        # solution:
        str_c(c(header_level_hashes, " ", ex_sol_str[2]), collapse = ""), "",
        ex_parsed$ex_solution, "")
  
  if (print_categories) {
    yamlrmdfile <-
     c(yamlrmdfile,"", "---", "", paste0(ex_sol_str[3], ": "), "", as.yaml(ex_parsed$ex_metadata_yaml$categories))
  }
  
  
  path_output_ex <- paste0(path_output,"/", ex_parsed$ex_metadata_yaml$exname)
  
  filename_output <- 
    paste0(path_output_ex, "/", ex_parsed$ex_metadata_yaml$exname,".Rmd")
  
  if (!file.exists(path_output_ex)) 
      dir.create(path = path_output_ex)
  
  writeLines(text = yamlrmdfile, con = filename_output)
  
  if (verbose) cat(paste0("Yaml-Rmd-Exercise file has been written to output dir: ",filename_output, "\n"))

}




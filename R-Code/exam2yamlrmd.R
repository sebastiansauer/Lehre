

exam2yamlrmd <- function(examfile, 
                         path_output, 
                         ex_sol_str = c("Exercise", "Solution", "Categories"),
                         print_categories = FALSE,
                         header_level = 1){
  # This function reads a R/exams exercise file and converts it to a yaml-headed Rmd file.
  
  parse_examfile <- function(examfile) {
    
    require(yaml)
    
    require(dplyr)
    
    require(stringr) 
    
    ex_str <- readLines(examfile)
    
    
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
    
    ex_metadata_yaml <- ex_metadata %>% yaml.load()
    
    ex_metadata_yaml$date <- as.character(Sys.Date())
    ex_metadata_yaml$slug <- title
    ex_metadata_yaml$title <- title
    
    examfile_info <- 
      list(ex_question = ex_question,
           ex_solution = ex_solution,
           ex_metadata = ex_metadata_yaml %>% as.yaml(),
           ex_metadata_yaml = ex_metadata_yaml)
    
    return(examfile_info)
    
  }
  

  ex_parsed <- parse_examfile(examfile = examfile)

    header_level_hashes <- rep("#", header_level) %>% str_c(collapse = "")
  
  yamlrmdfile <- 
    c("---", ex_parsed$ex_metadata, "---", "", "", 
      str_c(c(header_level_hashes, " ", ex_sol_str[1]), collapse = ""), "", ex_parsed$ex_question, "", 
      str_c(c(header_level_hashes, " ", ex_sol_str[2]), collapse = ""), "", ex_parsed$ex_solution, "")
  
  if (print_categories) {
    yamlrmdfile <-
     c(yamlrmdfile,"", "---", "", paste0(ex_sol_str[3], ": "), "", as.yaml(ex_parsed$ex_metadata_yaml$categories))
  }
  
  
  path_output_ex <- paste0(path_output,"/", ex_parsed$ex_metadata_yaml$exname)
  
  filename_output <- 
    paste0(path_output_ex, "/", ex_parsed$ex_metadata_yaml$exname,".Rmd")
  
  dir.create(path = path_output)
  
  write_lines(yamlrmdfile, filename_output)

}






exam2yamlrmd <- function(examfile, 
                         path_output, 
                         ex_sol_str = c("Exercise", "Solution", "Categories"),
                         print_categories = FALSE,
                         separate_ex_sol = rep("</br>", 10),
                         verbose = TRUE,
                         header_level = 1){
  # This function reads a R/exams exercise file and converts it to a yaml-headed Rmd file.
  
  source("https://raw.githubusercontent.com/sebastiansauer/Lehre/main/R-Code/parse_examfile.R")
  
  ex_parsed <- parse_examfile(examfile = examfile)
  
 source("https://raw.githubusercontent.com/sebastiansauer/Lehre/main/R-Code/write_yamlrmdfile.R")

  write_yamlrmdfile(ex_parsed, 
                    path_output, 
                    ex_sol_str, 
                    print_categories, 
                    separate_ex_sol, 
                    verbose = verbose,
                    header_level)
}




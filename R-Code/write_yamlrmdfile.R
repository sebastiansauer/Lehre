write_yamlrmdfile <- function(ex_parsed, 
                              path_output,
                              ex_sol_str = c("Exercise", "Solution", "Categories"),
                              print_categories = TRUE,
                              separate_ex_sol = rep("</br>", 10),
                              verbose = TRUE,
                              header_level = 1){
  
  
  header_level_hashes <- rep("#", header_level) %>% str_c(collapse = "")
  
  
  # now build the yaml-rmd file:
  yamlrmdfile <- 
    # metadata:
    # starting with 3 dashes, opening yaml header:
    c("---", 
      ex_parsed$ex_metadata,  # meta data
      "---", "", "",  # 3 dashed closing metadata
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
  
  # add "categories" if desired:
  if (print_categories) {
    yamlrmdfile <-
      c(yamlrmdfile,"", "---", "", paste0(ex_sol_str[3], ": "), "", as.yaml(ex_parsed$ex_metadata_yaml$categories))
  }
  
  # build path:
  path_output_ex <- paste0(path_output,"/", ex_parsed$ex_metadata_yaml$title)
  
  # add filename
  filename_output <- 
    paste0(path_output_ex, "/", ex_parsed$ex_metadata_yaml$title,".Rmd")
  
  if (!file.exists(path_output_ex)) 
    dir.create(path = path_output_ex)
  
  writeLines(text = yamlrmdfile, con = filename_output)
  
  if (verbose) cat(paste0("Yaml-Rmd-Exercise file has been written to output dir: ",filename_output, "\n"))
}

source()

examfile <- "/Users/sebastiansaueruser/github-repos/rexams-exercises/exercises/sebastiansauer/de/Statistical-Learning/predictioncontest1.Rmd"

examfile <- "/Users/sebastiansaueruser/github-repos/rexams-exercises/exercises/sebastiansauer/de/Statistical-Learning/tmdb05.Rmd"

path_output <- "/Users/sebastiansaueruser/github-repos/datenwerk/content/post"

debug(exam2yamlrmd)
exam2yamlrmd(examfile = examfile,
             path_output = path_output,
             verbose = TRUE,
             print_categories = TRUE)



ex_parsed <- parse_examfile(examfile)
ex_parsed
ex_parsed$ex_metadata


write_yamlrmdfile(ex_parsed, 
                  path_output = path_output, 
                  print_categories = TRUE, 
                  header_level = 1)



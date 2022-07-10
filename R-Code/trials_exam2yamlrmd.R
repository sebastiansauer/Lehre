
source()

examfile <- "/Users/sebastiansaueruser/github-repos/rexams-exercises/exercises/sebastiansauer/de/Statistical-Learning/predictioncontest1.Rmd"

examfile <- "/Users/sebastiansaueruser/github-repos/rexams-exercises/exercises/sebastiansauer/de/Inferenz/vorhersageintervall1.Rmd"

path_output <- "/Users/sebastiansaueruser/github-repos/datenwerk/content/post"

exam2yamlrmd(examfile = examfile,
             path_output = path_output,
             print_categories = TRUE)



ex_parsed$ex_metadata_yaml$date %>% as.character() %>%  str()

ex_parsed$ex_metadata

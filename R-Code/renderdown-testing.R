# testing renderdown tools

source("R-Code/render-course-sections.R")

dates_file <- "R-Code/course-dates.yaml"
content_file <- "R-Code/modul-inhalte.yaml"

link_stump <- "https://sebastiansauer.github.io/vorhersagemodellierung/"
link_stump <- "https://sebastiansauer.github.io/datascience1/"

dates <- compute_course_dates(dates_file = dates_file)

master_table <- build_master_course_table(dates_file, content_file)

render_section(dates_file, 
               content_file = content_file,
               i = 1, 
               link_stump = NULL,
               name = "Literatur")


Titel <- master_table$Titel[6]
paste0("[", Titel,"](", link_stump, clean_title(Titel), ".html)")

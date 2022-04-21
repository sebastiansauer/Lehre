# testing renderdown tools


dates_file <- "R-Code/course-dates.yaml"
content_file <- "R-Code/modul-inhalte.yaml"

link_stump <- "https://sebastiansauer.github.io/vorhersagemodellierung/index.html#"


dates <- compute_course_dates(dates_file = dates_file)

master_table <- build_master_course_table(dates_file, content_file)

render_section(dates_file, 
               content_file = content_file,
               i = 1, 
               link_stump = NULL,
               name = "Literatur")




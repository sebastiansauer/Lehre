# testing renderdown tools


dates_file <- "R-Code/course-dates.yaml"
content_file <- "R-Code/modul-inhalte.yaml"


dates <- compute_course_dates(dates_file = dates_file)

master_table <- build_master_course_table(dates_file, content_file)

render_section(dates_file, content_file = content_file,i = 1, name = "Literatur")

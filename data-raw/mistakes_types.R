#mistakes_names <- yaml::read_yaml("data-raw/config/mistakes_types.yml")[[1]]
library(oanalyser)
con_db <- connect_to_db()

mistakes_df <- DBI::dbGetQuery(con_db, "SELECT * FROM mistakes_types")

usethis::use_data(mistakes_df, overwrite = T)

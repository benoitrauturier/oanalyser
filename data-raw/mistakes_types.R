mistakes_names <- yaml::read_yaml("data-raw/config/mistakes_types.yml")[[1]]

mistakes_df <- plyr::ldply(mistakes_names, data.frame)

usethis::use_data(mistakes_df, overwrite = T)

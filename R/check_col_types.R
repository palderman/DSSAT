check_col_types <- function(col_types,col_names){

  # Extract cols object
  cols_new <- col_types$cols

  cols_new <- names(cols_new) %>%
    str_replace_all(c(' '='','\\.'='','\\*'='','\\\\'='','\\+'='')) %>%
    name_to_regex() %>%
    str_c('((?<=^)|(?<= ))',.,'((?=$)|(?= ))') %>%
    # Check to see which of column types are present in col_names
    map_lgl(~any(str_detect(col_names,.))) %>%
    # Drop column types not in col_names
    {cols_new[.]}

  # Set names of cols to matches from col_names
  names(cols_new) <- names(cols_new) %>%
    str_replace_all(c(' '='','\\.'='','\\*'='','\\\\'='','\\+'='')) %>%
    name_to_regex() %>%
    str_c('((?<=^)|(?<= ))',.,'((?=$)|(?= ))') %>%
    map_chr(~str_subset(col_names,.))

  col_types$cols <- cols_new

  return(col_types)

}

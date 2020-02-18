#' @importFrom stringr str_remove_all str_c str_detect str_subset
#' @importFrom purrr map_lgl map_chr
#' @importFrom dplyr "%>%"
#'
check_col_types <- function(col_types,col_names){

  # Extract cols object
  cols_new <- col_types$cols

  cols_new <- names(cols_new) %>%
    de_regex() %>%
    name_to_regex() %>%
    str_remove_all(c('^ +'='')) %>%
    str_c('((?<=^)|(?<= ))',.,'((?=$)|(?= ))') %>%
    # Check to see which of column types are present in col_names
    map_lgl(~any(str_detect(col_names,.))) %>%
    # Drop column types not in col_names
    {cols_new[.]}

  if(length(cols_new) > 0){
  # Set names of cols to matches from col_names
    names(cols_new) <- names(cols_new) %>%
      de_regex() %>%
      name_to_regex() %>%
      str_remove_all(c('^ +'='')) %>%
      str_c('((?<=^)|(?<= ))',.,'((?=$)|(?= ))') %>%
      map_chr(~str_subset(col_names,.))

    col_types$cols <- cols_new
  }else{
    col_types <- cols()
  }
  return(col_types)

}

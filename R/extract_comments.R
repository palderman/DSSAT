#' @importFrom dplyr "%>%"
#' @importFrom stringr str_extract str_subset
extract_comments <- function(raw_lines){
  comments <- raw_lines %>%
    str_subset('!') %>%
    str_extract('!.*')
  return(comments)
}

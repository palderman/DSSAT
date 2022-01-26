#' @importFrom dplyr "%>%"
#' @importFrom stringr str_extract str_subset str_remove_all
extract_comments <- function(raw_lines){
  comments <- raw_lines %>%
    str_subset('!') %>%
    str_extract('(?<=!).*') %>%
    str_remove_all("(^ +)|( +$)")
  return(comments)
}

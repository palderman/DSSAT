#' @importFrom dplyr "%>%"
#' @importFrom stringr str_subset str_replace_all
sanitize_raw_lines <- function(raw_lines){
  sanitized <- raw_lines %>%
    str_subset('^(?!\032) *([^ ]+)') %>%  # exclude lines that are all spaces or lines with EOF in initial position
    str_subset('^(!|\\*|$)',negate=TRUE) %>%
    str_replace_all(c('\\cz'='',
                      '^ +$'='',
                      '!.*'=''))
  return(sanitized)
}

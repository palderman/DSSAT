#' @importFrom dplyr "%>%"
#' @importFrom stringr str_replace_all
#'
de_regex <- function(the_regex){
  the_string <- the_regex %>%
    str_replace_all(c('\\(\\?=[^\\)]+\\)'='',
                      '\\(\\?\\![^\\)]+\\)'='',
                      '\\(\\?<=[^\\)]+\\)'='',
                      '\\(\\?<\\![^\\)]+\\)'='',
                      ' (\\*)|(\\+)'='','\\.'='','\\*'='','\\\\'='',
                      '\\+'='','\\^'='','\\|'='',
                      '\\^'='','\\$'=''))
  return(the_string)
}

#' @importFrom dplyr "%>%"
#' @importFrom stringr str_replace_all
#'
de_regex_orig <- function(the_regex){
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

#' Convert column names to a regex
#'
#' @export
#'
#' @keywords internal
#'
#' @param cnames A character vector that contains column names
#'
#' @return A character vector with escaped special characters (e.g.
#' parentheses, periods, asterisks)
#'
#' @importFrom stringr str_replace_all
#'
#' @examples
#'
#' name_to_regex("TB(1)")
#'

name_to_regex <- function(cnames){

  regex <- str_replace_all(cnames,c('\\(([^\\?]+)\\)'='\\\\(\\1\\\\)',
                                    # '\\*'='\\\\*',
                                    # '\\.'='\\\\.',
                                    '\\?(?![\\=\\!<])'='\\\\?'))
  return(regex)

}

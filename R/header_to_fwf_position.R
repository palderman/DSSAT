#' Converts header line into a vector of column names
#'
#' @export
#'
#' @keywords internal
#'
#' @param header A length-one character vector of a header line
#' from a DSSAT format output file
#'
#' @param left_justified A character vector of column names that
#' should be left justified
#'
#' @return a tibble containing the begin position, end position,
#'  and name for each column from the original header line
#'
#' @importFrom stringr str_replace_all str_detect str_c str_split
#'  str_subset str_extract str_remove_all
#' @importFrom purrr map_lgl map_chr
#' @importFrom dplyr "%>%" mutate arrange tibble filter last pull
#' @importFrom readr fwf_positions
#'
#' @examples
#'
#' header_line <-
#'   "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D"
#' header_to_fwf_position(header_line)

header_to_fwf_position <- function(header,
                                   left_justified='EXCODE',
                                   col_types = NULL,
                                   col_names = NULL,
                                   read_only = NULL){

  # Replace @ sign and | with space
  header <- header %>%
    str_replace_all(c('@'=' ',
                      '\\|'=' ',
                      '!.*'=''))

  if(is.null(left_justified)) left_justified <- character()

  if(is.null(col_types)){
    col_types_names <- character()
  }else{
    col_types_names <- names(col_types$cols)
  }

  if(is.null(col_names)) col_names <- character()

  if(is.null(read_only)) read_only <- character()

  # Extract names, infer column positions, and convert to
  #   fixed widths for use with read_fwf()
  fwf_pos <- header_to_fwf_position_cpp(header, col_types_names,
                                        left_justified, col_names,
                                        read_only)

  return(fwf_pos)
}

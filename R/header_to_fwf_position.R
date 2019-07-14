#' Converts header line into a vector of column names
#'
#' @export
#'
#' @keywords internal
#'
#' @param header A length-one character vector of a header line
#' from a DSSAT format output file
#'
#' @return a tibble containing the begin position, end position,
#'  and name for each column from the original header line
#'
#' @examples
#'
#' header_line <-
#'   "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10"
#' header_to_fwf_position(header_line)

header_to_fwf_position <- function(header){
  # Load required packages
  require(dplyr)
  require(stringr)
  require(readr)

  # Replace @ sign with space
  header <- header %>%
    str_replace('@',' ')

  # Extract column names
  col_names <- header %>%
    str_split('(?<=([^ ])) +(?=([^ ]))') %>%
    unlist() %>%
    str_remove_all(' +')

  # Infer column positions based on header
  start_end <- str_locate_all(header,' +[^ ]+') %>%
    {.[[1]]}

  # Check column positions for special cases
  if('EXCODE'%in%col_names){
    s <- str_which(col_names,'EXCODE')
    d <- diff(start_end[s,])
    if(d<10){
      start_end[s,2] <- start_end[s,2] + (10 - d)
      start_end[s+1,1] <- start_end[s+1,1] + (10 - d)
    }
  }

  # Convert column positions to fixed widths for use with read_fwf()
  fwf_pos <- fwf_positions(start=start_end[,1],end=start_end[,2],col_names=col_names)

  return(fwf_pos)
}

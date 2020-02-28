#' Reads time series data from a single DSSAT file T
#'
#' @export read_filet
#'
#' @inheritParams read_tier_data
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom dplyr "%>%" arrange_at
#' @importFrom stringr str_subset str_remove
#' @importFrom readr cols
#'
#' @examples
#'
#' sample_filet <- c(
#' "*EXP.DATA (T): SATO8901 SC LAMERCY RAINFED SUGARCANE VALIDATION EXP.      ",
#' "",
#' "@TRNO  DATE  LGDMD LAITD SUCMD SMDMD  L#SD  T#AD",
#' "     1 90032 22.40  3.00  2.10  8.40  8.00  20.0",
#' "     1 90093 35.00  4.30  7.60 19.40 10.10  16.6",
#' "     1 90155 47.00  3.40 14.10 30.20 11.30  15.0",
#' "     1 90213 52.10  2.70 17.10 33.80  6.50  15.1")
#'
#'\dontrun{
#'
#' write(sample_filet,'SAMPLE.CRT')
#'
#' read_filet('SAMPLE.CRT')
#'
#' }

read_filet <- function(file_name,col_types=NULL,col_names=NULL,na_strings=NULL){

  raw_lines <- readLines(file_name)

  experiment <- raw_lines %>%
    str_subset('\\*EXP\\. *DATA *\\([AT]\\): *') %>%
    str_remove('\\*EXP\\. *DATA *\\([AT]\\): *')

  comments <- extract_comments(raw_lines)

  col_types <- cols(` TRNO `=col_double()) %>%
  {.$cols <- c(.$cols,col_types$cols);.}


  filet <- read_tier(raw_lines = raw_lines,
                     col_types = col_types,
                     col_names = c(col_names,' TRNO '),
                     na_strings=na_strings)

  trno_date_cols <- intersect(c('TRNO','DATE'),colnames(filet))

  if(length(trno_date_cols) > 0 ){
    filet <- filet %>%
      arrange_at(trno_date_cols)
  }

  attr(filet,'experiment') <- experiment
  attr(filet,'comments') <- comments

  filet <- as_DSSAT_tbl(filet)

  return(filet)
}

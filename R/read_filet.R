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
#' # Extract FileT path for sample file
#' sample_filet <- system.file('extdata','SAMPLE.CRT',package='DSSAT')
#'
#' read_filet(sample_filet)
#'

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

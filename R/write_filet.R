#' Writes data to a single DSSAT file T
#'
#' @export
#'
#' @param filet a tibble containing the data to write to a DSSAT file T
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `filet` will be written
#'
#' @return NULL
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
#' write(sample_filet,'SAMPLE.CRT')
#'
#' filet <- read_filet('SAMPLE.CRT')
#'
#' write_filet(filet,'SAMPLE2.CRT')

write_filet <- function(filet,file_name){

  experiment <- attr(filet,'experiment') %>%
    c('*EXP. DATA (T): ',.) %>%
    str_c(collapse='')

  comments <- attr(filet,'comments')

  tier_output <- write_tier(filet) %>%
    c(experiment,'',comments,.)

  write(tier_output,file_name)

  return(invisible(NULL))
}

#' Writes data to a single DSSAT file A
#'
#' @export
#'
#' @param filea a tibble containing the data to write to a DSSAT file A
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `filea` will be written
#'
#' @return NULL
#'
#' @examples
#'
#' sample_filea <- c(
#' "*EXP. DATA (A): SATO8902SC LAMERCY DATA    SUCARCANE VALIDATION EXP.                   ",
#' "! File last edited on day 05/22/2007 at 10:27:03 AM",
#' "!",
#' "@TRNO   HWAH  BWAH  LAID  SWAD  CHTD  L#SD  HIAM  CWAD  LI%D  LT#D  CWAM  SDAH",
#' "     1 16800 10900   2.6 34700 1.792   7.8  48.2   -99  87.5   -99  6900  13.2",
#' "     2 13000  8200   2.6 26700 1.685   9.2  48.7   -99  81.5   -99  5700  13.2",
#' "     3 14700 10800   2.8 33400 2.083   9.8  44.0   -99  74.0   -99  5700  14.5",
#' "     4 14700 10100   3.7 34700 2.209  10.4  42.2   -99  86.5   -99  7100  13.4")
#'
#' write(sample_filea,'SAMPLE.CRA')
#'
#' filea <- read_filea('SAMPLE.CRA')
#'
#' write_filea(filea,'SAMPLE2.CRA')

write_filea <- function(filea,file_name,drop_duplicate_rows=TRUE){

  experiment <- attr(filea,'experiment') %>%
    c('*EXP. DATA (A): ',.) %>%
    str_c(collapse='')

  comments <- attr(filea,'comments')

  tier_output <- write_tier(filea,drop_duplicate_rows = drop_duplicate_rows) %>%
    c(experiment,'',comments,.)

  write(tier_output,file_name)

  return(invisible(NULL))
}

#' Reads data from a single DSSAT file A
#'
#' @export
#'
#' @inheritParams read_tier_data
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
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
#' read_filea('SAMPLE.CRA')

read_filea <- function(file_name,col_types=NULL,col_names=NULL,na_strings=NULL){
  filea <- read_filet(file_name=file_name,
                      col_types=col_types,
                      col_names=col_names,
                      na_strings=na_strings)

  filea <- as_DSSAT_tbl(filea)

  return(filea)
}

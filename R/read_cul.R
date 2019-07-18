#' Reads parameters from a single DSSAT cultivar parameter file (*.CUL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @examples
#'
#' sample_cul <- c(
#' "*MAIZE CULTIVAR COEFFICIENTS: MZCER047 MODEL"
#' "!"
#' "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT",
#' "!                                        1     2     3     4     5     6",
#' "PC0001 2500-2600 GDD        . IB0001 160.0 0.750 780.0 750.0  8.50 49.00",
#' "PC0002 2600-2650 GDD        . IB0001 185.0 0.750 850.0 800.0  8.50 49.00",
#' "PC0003 2650-2700 GDD        . IB0001 212.0 0.750 850.0 800.0  8.50 49.00")
#'
#' write(sample_cul,'SAMPLE.CUL')
#'
#' read_cul('SAMPLE.CUL')

read_cul <- function(file_name,col_types=NULL,col_names=NULL,
                     left_justified=c('VAR#','VARNAME','VAR-NAME')){
  require(readr)

  cul_col_types <- cols(`VAR#`=col_character(),
                        `VARNAME`=col_character(),
                        `VAR-NAME`=col_character())

  if(!is.null(col_types)){
    cul_col_types$cols <- c(cul_col_types$cols,col_types$cols)
  }

  cul <- read_dssat(file_name,cul_col_types,col_names,
                     left_justified,guess_max=Inf)

  return(cul)
}

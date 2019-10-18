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
#' cul <- read_cul('SAMPLE.CUL')
#'
#' write_cul(cul,'SAMPLE2.CUL')
#'

write_cul <- function(cul,file_name){

  first_line <- attr(cul,'first_line')

  comments <- attr(cul,'comments')

  tier_output <- write_tier(cul) %>%
    c(first_line,'',comments,.)

  write(tier_output,file_name)

  return(invisible(NULL))
}

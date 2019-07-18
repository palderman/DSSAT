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
#' sample_eco <- c(
#' "*MAIZE ECOTYPE COEFFICIENTS: MZCER047 MODEL",
#' "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
#' "!                            1     2    3     4     5     6     7     8      9    10    11",
#' "IB0001 GENERIC MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
#' "IB0002 GENERIC MIDWEST2    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.5   0.85",
#' "IB0003 GENERIC MIDWEST3    8.0 34.0  34.0  12.5   4.0   6.0   170.  2.0   0.85",
#' "IB0004 +5% RUE MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.4   0.85",
#' "DFAULT DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85")
#'
#' write(sample_eco,'SAMPLE.ECO')
#'
#' read_eco('SAMPLE.ECO')

read_eco <- function(file_name,col_types=NULL,col_names=NULL,
                     left_justified=c('ECO#','ECONAME','ECO-NAME')){
  require(readr)

  eco_col_types <- cols(`ECO#`=col_character(),
                        `ECONAME`=col_character(),
                        `ECO-NAME`=col_character())

  if(!is.null(col_types)){
    eco_col_types$cols <- c(eco_col_types$cols,col_types$cols)
  }

  eco <- read_dssat(file_name,cul_col_types,col_names,
                     left_justified,guess_max=Inf)

  return(eco)
}

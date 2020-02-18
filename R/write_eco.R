#' Reads parameters from a single DSSAT ecotype parameter file (*.ECO)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @param eco a DSSAT_tbl containing the contents of a DSSAT ecotype parameter file
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom stringr str_detect
#' @importFrom dplyr "%>%"
#'
#' @examples
#'
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
#'\dontrun{
#'
#' write(sample_eco,'SAMPLE.ECO')
#'
#' eco <- read_eco('SAMPLE.ECO')
#'
#' write_eco(eco,'SAMPLE2.ECO')
#'
#' }

write_eco <- function(eco,file_name){

  first_line <- attr(eco,'first_line')

  comments <- attr(eco,'comments')

  if(str_detect(file_name,'SCCSP')){
    tier_output <- write_casupro_eco(eco) %>%
      c(first_line,'',comments,.)
  }else{
    tier_output <- write_tier(eco,
                            pad_name = c('ECONAME','ECO-NAME')) %>%
      c(first_line,'',comments,.)
  }

  write(tier_output,file_name)

  return(invisible(NULL))
}

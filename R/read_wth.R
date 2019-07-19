#' Reads weather input data from a single DSSAT weather file (*.WTH)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @examples
#'
#' sample_wth <- c(
#' "*WEATHER DATA : Gainesville,Florida,USA",
#' "",
#' "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
#' "  UFGA   29.630  -82.370    10  21.3  13.0   2.0   3.0",
#' "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
#' "06001   7.6  26.8  14.1   0.5                          ",
#' "06002   9.5  27.8  19.4   0.5                          ",
#' "06003   6.1  24.9  11.7   0.0                          ",
#' "06004  12.5  21.8   6.6   0.0                          ",
#' "06005  12.3  22.3   7.5   0.0                          ")
#'
#' write(sample_wth,'EXAMPLE.WTH')
#'
#' read_wth('EXAMPLE.WTH')

read_wth <- function(file_name,col_types=NULL,col_names=NULL,id_soil=NULL){

  # Load required packages
  require(dplyr)
  require(stringr)
  require(purrr)

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Find beginning of each weather header
  begin <- raw_lines %>%
    str_which('^@')

  # Calculate end of each section based on beginning of next section
  end <- c(begin[-1]-1,length(raw_lines))

  # Extract all tiers
  all_tiers <- map(1:length(begin),
                   ~read_tier_data(raw_lines[begin[.]:end[.]]))

  return(all_tiers)
}

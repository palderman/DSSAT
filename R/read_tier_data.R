#' Reads data from a single tier of a DSSAT output file
#'
#' @export
#'
#' @keywords internal
#'
#' @param raw_lines a character vector that includes the contents
#' of a single tier of data (including headline, but excluding version
#'  stamp and other header information) from a DSSAT output file
#'
#' @param col_types One of NULL, a cols() specification, or a string.
#' See \code{\link[readr]{read_fwf}} or \code{vignette("readr")} for
#' more details.
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @examples
#'
#' sample_data_tier <- c(
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035   0.032   0.639",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036   0.033   0.662",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046   0.042   0.843")
#'
#' read_tier_data(sample_tier)

read_tier_data <- function(raw_lines,col_types=NULL){
  # Load required packages
  require(dplyr)
  require(stringr)

  # Find header line
  skip <- str_which(raw_lines,'^@')
  headline <- raw_lines[skip]

  # Process header into fixed-width format positions
  fwf_pos <- header_to_fwf_position(headline)

  # Read data from tier
  tier_data <- read_fwf(raw_lines,
                   fwf_pos,
                   comment = '!',
                   skip = skip,
                   skip_empty_rows = TRUE,
                   guess_max = 5,
                   col_types=col_types)
  if({colnames(tier_data) %>%
        {c('YEAR','DOY') %in% .} %>%
         all()}
     ){
    tier_data <- tier_data %>%
      mutate(DATE={paste0(YEAR,DOY) %>% as.POSIXct(format='%Y%j')}) %>%
      select(-YEAR,-DOY)
  }

  return(tier_data)
}

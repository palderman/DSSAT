#' Reads data from a single DSSAT file
#'
#' @export
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT output file
#'
#' @param col_types One of NULL, a cols() specification, or a string.
#' See \code{\link[readr]{read_fwf}} or \code{vignette("readr")} for
#' more details.
#'
#' @param col_names A character vector of column names; primarily
#' helpful for cases where there are no white spaces between column
#' names within the header line
#'
#' @param na_strings A character vector containing strings that should be interpreted as
#' missing values
#'
#' @param left_justified A character vector of column names that
#' should be left justified
#'
#' @param guess_max An integer indicating the maximum number of lines
#' that should be used to guess the type of a column
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom stringr str_subset str_which
#' @importFrom purrr map reduce
#'
#' @examples
#'
#' # Extract file path for sample output file path
#' sample_output <- system.file('extdata','SAMPLE.OUT',package='DSSAT')
#'
#' read_dssat(sample_output)
#'

read_dssat <- function(file_name,col_types=NULL,col_names=NULL,na_strings=NULL,
                       left_justified='EXCODE',guess_max=10){

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Find beginning of each section
  begin <- raw_lines %>%
    str_which('^\\*DSSAT')

  if(length(begin)==0) begin <- 1

  # Calculate end of each section based on beginning of next section
  end <- c(begin[-1]-1,length(raw_lines))

  # Read each section of output file
  all_tiers <- map(1:length(begin),
                   ~read_tier(raw_lines[begin[.]:end[.]],
                              col_types = col_types,
                              col_names = col_names,
                              na_strings = na_strings,
                              left_justified = left_justified)) %>%
    reduce(combine_tiers) %>%
    as_DSSAT_tbl()

  return(all_tiers)
}

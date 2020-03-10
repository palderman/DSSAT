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
#' # Extract FileA path for sample file
#' sample_filea <- system.file('extdata','SAMPLE.CRA',package='DSSAT')
#'
#' filea <- read_filea(sample_filea)
#'

read_filea <- function(file_name,col_types=NULL,col_names=NULL,na_strings=NULL){
  filea <- read_filet(file_name=file_name,
                      col_types=col_types,
                      col_names=col_names,
                      na_strings=na_strings)

  filea <- as_DSSAT_tbl(filea)

  return(filea)
}

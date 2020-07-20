#' Reads parameters from a single DSSAT cultivar parameter file (*.CUL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @param cul a DSSAT_tbl containing the contents of a DSSAT cultivar parameter file
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom dplyr "%>%"
#'
#' @examples
#'
#' # Extract file path for sample cultivar file path
#' sample_cul_file <- system.file('extdata','SAMPLE.CUL',package='DSSAT')
#'
#' # Read sample cultivar file
#' cul <- read_cul(sample_cul_file)
#'
#' # Create example cultivar file path
#' sample_cul_file2 <- paste0(tempdir(),'/SAMPLE.CUL')
#'
#' # Write out sample cultivar file
#' write_cul(cul,sample_cul_file2)
#'

write_cul <- function(cul,file_name){

  first_line <- attr(cul,'first_line')

  comments <- attr(cul,'comments')

  tier_output <- write_tier(cul,
                            pad_name = c('VAR-NAME','VRNAME')) %>%
    c(first_line,'',comments,.)

  write(tier_output,file_name)

  return(invisible(NULL))
}

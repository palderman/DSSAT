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
#' @examples
#'
#' # Extract file path for sample ecotype file path
#' sample_eco_file <- system.file('extdata','SAMPLE.ECO',package='DSSAT')
#'
#' # Read sample ecotype file
#' eco <- read_eco(sample_eco_file)
#'
#' # Create example ecotype file path
#' sample_eco_file2 <- paste0(tempdir(),'/SAMPLE.ECO')
#'
#' # Write out sample ecotype file
#' write_eco(eco,sample_eco_file2)
#'

write_eco <- function(eco, file_name){

  first_line <- attr(eco,'first_line')

  comments <- fmt_comments(eco)

  if(any(grepl('SCCSP', file_name))){
    prm_section <- write_casupro_eco(eco)
  }else{
    prm_section <- write_tier(eco,
                              pad_name = c('ECONAME','ECO-NAME'))
  }

  tier_output <- c(
    first_line,
    "",
    comments,
    "",
    prm_section)

  write(tier_output, file_name)

  return(invisible(NULL))
}

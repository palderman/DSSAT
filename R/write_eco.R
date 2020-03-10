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

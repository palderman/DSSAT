#' Writes data to a single DSSAT file T
#'
#' @export
#'
#' @inheritParams write_tier
#'
#' @param filet a tibble containing the data to write to a DSSAT file T
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `filet` will be written
#'
#' @return NULL
#'
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c
#'
#' @examples
#'
#' # Extract FileT path for sample file
#' sample_filet <- system.file('extdata','SAMPLE.CRT',package='DSSAT')
#'
#' filet <- read_filet(sample_filet)
#'
#' # Create example FileT file path
#' sample_filet2 <- paste0(tempdir(),'/SAMPLE.CRT')
#'
#' # Write out sample FileA
#' write_filet(filet,sample_filet2)
#'

write_filet <- function(filet,file_name,drop_duplicate_rows=TRUE){

  experiment <- attr(filet,'experiment') %>%
    c('*EXP. DATA (T): ',.) %>%
    str_c(collapse='')

  comments <- attr(filet,'comments')

  tier_output <- write_tier(filet,drop_duplicate_rows=drop_duplicate_rows) %>%
    c(experiment,'',comments,.)

  write(tier_output,file_name)

  return(invisible(NULL))
}

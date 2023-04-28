#' Writes data to a single DSSAT file A
#'
#' @export
#'
#' @inheritParams write_tier
#'
#' @param filea a tibble containing the data to write to a DSSAT file A
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `filea` will be written
#'
#' @return NULL
#'
#' @examples
#'
#' # Extract FileA path for sample file
#' sample_filea <- system.file('extdata','SAMPLE.CRA',package='DSSAT')
#'
#' filea <- read_filea(sample_filea)
#'
#' # Create example FileA file path
#' sample_filea2 <- paste0(tempdir(),'/SAMPLE.CRA')
#'
#' # Write out sample FileA
#' write_filea(filea,sample_filea2)
#'

write_filea <- function(filea, file_name, drop_duplicate_rows=TRUE){

  experiment <- paste0('*EXP. DATA (A): ', attr(filea,'experiment'))

  comments <- fmt_comments(filea)

  tier_output <- c(
    experiment,
    "",
    comments,
    "",
    write_tier(filea,
               drop_duplicate_rows = drop_duplicate_rows))

  write(tier_output, file_name)

  return(invisible(NULL))
}

#' Reads data from a single DSSAT batch file
#'
#' @export
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT batch file
#'
#' @return a tibble containing the data from the DSSAT batch file
#'
#' @importFrom dplyr "%>%"
#'
#' @examples
#'
#' # Create example batch file path
#' batch_file_path <- paste0(tempdir(),'/DSSBatch.V47')
#'
#' # Write example batch file
#' write_dssbatch(x='UFGA0601.BMX',trtno=1:4,file_name = batch_file_path)
#'
#' # Read example batch file
#' dssbatch <- read_dssbatch(batch_file_path)
#'

read_dssbatch <- function(file_name='DSSBatch.V47'){

  batch_file <- read_dssat(file_name,left_justified = 'FILEX') %>%
    as_DSSAT_tbl()

  return(batch_file)
}

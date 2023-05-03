#' Clear output files
#'
#' A function to delete DSSAT output files (\*.OUT) and intermediate files
#' (\*.INH, \*.INP and \*.LST) from a directory
#'
#' @export
#'
#' @param dir_name a length-one character vector indicating the directory in
#'   which to delete output files (by default the current working directory)
#'
#' @param file_ext a character vector of file extensions to delete
#'
clear_output <- function(dir_name = getwd(),
                         file_ext = c("OUT", "LST", "INP", "INH")){

  # Construct file search pattern
  file_pattern <- paste0(
    paste0("\\.", file_ext, "$"),
    collapse = "|")

  # Generate list of files to delete
  file_list <- list.files(path = dir_name,
                          pattern = file_pattern,
                          full.names = TRUE)

  # Remove all files
  file.remove(file_list)

}

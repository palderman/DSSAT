#' Constructs and writes a DSSAT simulation batch file
#'
#' @export
#'
#' @inheritParams write_dssbatch.default
#'
#' @return invisibly returns a character vector containing the
#' content of a DSSAT batch file
#'
#' @examples
#'
#' # Create example batch file path
#' batch_file_path <- paste0(tempdir(),'/DSSBatch.V47')
#'
#' # Write example batch file
#' write_dssbatch(x='UFGA0601.BMX', trtno=1:4, file_name = batch_file_path)
#'
#' # Construct tibble for DSSAT batch file
#' batch_tbl <- data.frame(FILEX='UFGA0601.BMX',
#'                     TRTNO=1:4,
#'                     RP=1,
#'                     SQ=0,
#'                     OP=0,
#'                     CO=0)
#'
#' # Write example batch file
#' write_dssbatch(batch_tbl, file_name = batch_file_path)
#'

write_dssbatch <- function(x, trtno = 1, rp = 1, sq = 0, op = 0, co = 0,
                           file_name = NULL){
  UseMethod("write_dssbatch")
}

#' tbl_df method for write_dssbatch()
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams write_dssbatch.default
#'
#' @importFrom dplyr as_tibble "%>%"
#'
write_dssbatch.data.frame <- function(x, trtno = 1, rp = 1, sq = 0, op = 0, co = 0,
                                  file_name = NULL){
  batch_output <- as_tibble(x) %>%
    write_dssbatch.tbl_df(file_name = file_name)

  return(invisible(batch_output))
}

#' tbl_df method for write_dssbatch()
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams write_dssbatch.default
#'
write_dssbatch.tbl_df <- function(x, trtno = 1, rp = 1, sq = 0, op = 0, co = 0,
                                  file_name = NULL){

  if(is.null(file_name)){
    version <- get_dssat_version()
    file_name <- str_c('DSSBatch.V',version)
   }

  header <- c('%-92s',rep('%7s',5)) %>%
    # Write individual column headers
    sprintf(c('@FILEX','TRTNO','RP','SQ','OP','CO')) %>%
    # Collapse into a single column header line
    str_c(collapse='') %>%
    # Add batch file header label on line previous to column header line
    c('$BATCH',.)

  # To prevent "no visible binding for global variable" from R CMD check for group_by()
  # statement below:
  FILEX <- NULL

  column_output <- x %>%
    # Expand filex name to full width
    mutate(FILEX=sprintf('%-92s',.data$FILEX)) %>%
    # Write out all other columns
    mutate_at(vars(-FILEX),~sprintf('%7i',.)) %>%
    # Combine columns into character vector
    glue_data('{FILEX}{TRTNO}{RP}{SQ}{OP}{CO}')

  # Combine header lines and column data
  batch_output <- c(header,column_output)

  # Write batch_output to file
  write(batch_output,file=file_name)

  # Invisibly return batch_output
  return(invisible(batch_output))
}

#' Default method for write_dssbatch()
#'
#' @export
#'
#' @keywords internal
#'
#' @param x a tibble/data frame or character vector; if a tibble, it should contain all
#' required columns of a DSSAT batch file (FILEX, TRTNO, RP, SQ, OP, CO);
#' if a character vector, it should contain FileX file names
#'
#' @param file_name an optional character vector of the intended
#' batch file name
#'
#' @param trtno,rp,sq,op,co a numeric vector
#'
#' @importFrom stringr str_c
#' @importFrom dplyr "%>%" tibble mutate mutate_at
#' @importFrom glue glue_data
#'
write_dssbatch.default <- function(x, trtno = 1, rp = 1, sq = 0, op = 0, co = 0,
                                   file_name = NULL){

  # Construct batch_tbl
  batch_tbl <- tibble(FILEX=x,
                      TRTNO=trtno,
                      RP=rp,
                      SQ=sq,
                      OP=op,
                      CO=co)

  batch_output <- write_dssbatch.tbl_df(x = batch_tbl, file_name = file_name)

  # Invisibly return batch_output
  return(invisible(batch_output))
}


#' Constructs and writes a DSSAT simulation batch file
#'
#' @export
#'
#' @param batch_tbl a data frame or tibble that contains all
#' required columns of a DSSAT batch file (FILEX, TRTNO, RP,
#' SQ, OP, CO)
#'
#' @param filex a character vector
#'
#' @param trtno,rp,sq,op,co a numeric vector
#'
#' @param file_name an optional character vector of the intended
#' batch file name
#'
#' @return invisibly returns a character vector containing the
#' content of a DSSAT batch file
#'
#' @examples
#'
#' write_dssbatch(filex='UFGA0601.BMX',trtno=1:4)
#'
#' batch_tbl <- tibble(FILEX='UFGA0601.BMX',
#'                     TRTNO=1:4,
#'                     RP=1,
#'                     SQ=0,
#'                     OP=0,
#'                     CO=0)
#'
#' write_dssbatch(batch_tbl)
#'

write_dssbatch <- function(batch_tbl=NULL,filex='',trtno=1,rp=1,sq=0,op=0,co=0,
                           file_name=NULL){

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

  # Construct batch_tbl if not passed in as argument
  if(is.null(batch_tbl)) batch_tbl <- tibble(FILEX=filex,
                                             TRTNO=trtno,
                                             RP=rp,
                                             SQ=sq,
                                             OP=op,
                                             CO=co)

  column_output <- batch_tbl %>%
    # Expand filex name to full width
    mutate(FILEX=sprintf('%-92s',FILEX)) %>%
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


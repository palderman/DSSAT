#' Writes data to a single DSSAT FileX
#'
#' @export
#'
#' @inheritParams write_tier
#'
#' @param filex a list of tibbles containing the data to write to a DSSAT file X
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `filet` will be written
#'
#' @param force_std_fmt a logical value indicating whether to override the
#' variable format stored within the FileX object with standard DSSAT formatting
#'
#' @return NULL
#'

write_filex <- function(filex, file_name, drop_duplicate_rows=TRUE, force_std_fmt=TRUE){

  experiment <- paste0('*EXP.DETAILS: ', attr(filex,'experiment'))

  comments <- fmt_comments(filex)

  file_body <- unlist(
    lapply( names(filex),
    function(sec_name){
      if(force_std_fmt){
        attr(filex[[sec_name]],'v_fmt') <- v_fmt_filex(sec_name)
        attr(filex[[sec_name]],'tier_info') <- tier_info_filex(sec_name)
      }
      if(any(grepl('(IRRIGATION)|(INITIAL)|(SOIL)', sec_name))){
        tier_out <- write_dual_tier_section(filex[[sec_name]],
                               drop_duplicate_rows=drop_duplicate_rows)
      }else if(any(grepl('SIMULATION CONTROLS', sec_name))){
        tier_out <- write_sim_ctrl_section(filex[[sec_name]])
      }else if(any(grepl('GENERAL', sec_name))){
        tier_out <- write_tier(filex[[sec_name]],
                               pad_name=c('HARM'),
                               drop_duplicate_rows=drop_duplicate_rows,
                               drop_na_rows=FALSE)
      }else{
        tier_out <- write_tier(filex[[sec_name]],
                               pad_name=c('TNAME','XCRD','YCRD','ELEV','AREA','SLEN','FLWR','SLAS','WSTA','CHT'),
                               drop_duplicate_rows=drop_duplicate_rows)
      }
      tier_out <- c(
        paste0('*', sec_name),
        tier_out,
        '')
      return(tier_out)
    })
    )

  tier_output <- c(
    experiment,
    '',
    comments,
    file_body)

  write(tier_output, file_name)

  return(invisible(NULL))
}

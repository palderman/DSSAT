#' Writes data to a single DSSAT weather file
#'
#' @export
#'
#' @param wth a tibble containing the data to write to a DSSAT
#' weather file
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `wth` will be written
#'
#' @return NULL
#'
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c
#' @importFrom purrr map
#'

write_wth <- function(wth,file_name){

  location <- attr(wth,'location') %>%
    c('*WEATHER: ',.) %>%
    str_c(collapse='')

  comments <- attr(wth,'comments')

  # Determine if wth was read from old or new file format
  general <- attr(wth,'GENERAL')

  old_format <- is.data.frame(general)

  if(old_format){
    gen_out <- write_tier(general,drop_na_rows = FALSE) %>%
      c(.,'')
  }else{
    gen_out <- general %>%
      map(write_tier,drop_na_rows=FALSE) %>%
      map(~{c(.,'')}) %>%
      unlist() %>%
      c('*GENERAL',.,'*DAILY DATA')
  }

  tier_output <- wth %>%
    write_tier(drop_na_rows = FALSE) %>%
    c(location,'',comments,'',gen_out,.)

  write(tier_output,file_name)

  return(invisible())
}

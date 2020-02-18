#' Converts a column to POSIXct
#'
#' @export
#'
#' @keywords internal
#'
#' @param d a numeric or character vector
#'
#' @return a POSIXct vector
#'
#' @importFrom dplyr "%>%"
#' @importFrom lubridate years
#'
#' @examples
#'
#' convert_to_date('2018031')
#'

convert_to_date <- function(d){
  if(all(is.na(d))){
    d <- as.POSIXct(d,origin='1970-01-01',tz='UTC')
  }else if( ! 'POSIXct' %in% class(d) ){
    if(max(nchar(as.character(d)),na.rm=TRUE) < 7){
      d <- as.integer(d) %>%
        sprintf('%5.5d',.) %>%
        as.POSIXct(format='%y%j',tz='UTC')
    }else{
      d <- as.character(d) %>%
        as.POSIXct(format='%Y%j',tz='UTC')
    }
    if(!all(is.na(d))){
      if(any( d[!is.na(d)] > Sys.time() )){
        d[!is.na(d)] <- d[!is.na(d)] %>%
        {. - years(100)}
      }
    }
  }
  return(d)
}

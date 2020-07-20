#' Adds variable format information to a tibble
#'
#' @export
#'
#' @importFrom dplyr "%>%"
#'
#' @param input_tbl a tibble
#'
#' @param v_fmt a named vector containing variable format information to be
#'  added to `input_tbl`
#'
#' @return a tibble containing the original tibble with an additional attribute
#' that contains variable format information
#'
#' @examples
#'
#' # Extract file path for sample ecotype file
#' sample_eco_file <- system.file('extdata','SAMPLE.ECO',package='DSSAT')
#'
#' # Read sample ecotype file
#' eco <- read_eco(sample_eco_file)
#'
#' # Replace formats for TSEN and CDAY parameters
#' eco <- add_v_fmt(eco,v_fmt=c(TSEN='%6.1f',CDAY='%6.1f'))
#'

add_v_fmt <- function(input_tbl,
                      v_fmt=NULL){

  if(!is.null(v_fmt)){
    in_tbl_attr <- attributes(input_tbl)
    if(!'v_fmt'%in%names(in_tbl_attr)){
      attr(input_tbl,'v_fmt') <- v_fmt
    }else{
      attr(input_tbl,'v_fmt') <- in_tbl_attr$v_fmt %>%
        {.[!names(.)%in%names(v_fmt)]} %>%
        c(.,v_fmt)
    }
  }

  return(input_tbl)
}

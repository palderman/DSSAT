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
#' sample_eco <- c(
#' "*MAIZE ECOTYPE COEFFICIENTS: MZCER047 MODEL",
#' "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
#' "!                            1     2    3     4     5     6     7     8      9    10    11",
#' "IB0001 GENERIC MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
#' "IB0002 GENERIC MIDWEST2    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.5   0.85",
#' "IB0003 GENERIC MIDWEST3    8.0 34.0  34.0  12.5   4.0   6.0   170.  2.0   0.85",
#' "IB0004 +5% RUE MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.4   0.85",
#' "DFAULT DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85")
#'
#'\dontrun{
#'
#' write(sample_eco,'SAMPLE.ECO')
#'
#' eco <- read_eco('SAMPLE.ECO')
#'
#' eco <- add_v_fmt(eco,v_fmt=c(TSEN='%6.1f',CDAY='%6.1f'))
#'}

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

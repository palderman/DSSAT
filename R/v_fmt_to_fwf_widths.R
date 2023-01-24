#'
#' @importFrom magrittr "%>%"
#' @importFrom stringr str_extract
#' @importFrom readr fwf_widths
#'
v_fmt_to_fwf_widths <- function(v_fmt){
  v_fmt %>%
    str_extract("(?<=%)[[:digit:]]+") %>%
    as.numeric() %>%
    fwf_widths(col_names = names(v_fmt))
}

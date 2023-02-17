#'
#' @importFrom magrittr "%>%"
#' @importFrom stringr str_extract str_remove_all str_length
#' @importFrom readr fwf_widths
#'
v_fmt_to_fwf_widths <- function(v_fmt){
  width <- v_fmt %>%
    str_extract("(?<=%)-*[[:digit:]]+") %>%
    as.numeric() %>%
    abs()

  nspaces <- v_fmt %>%
    str_remove_all("[^ ]") %>%
    str_length()

  {width + nspaces} %>%
    fwf_widths(col_names = names(v_fmt))
}

#'
#' @importFrom magrittr "%>%"
#' @importFrom stringr str_extract str_c
#'
v_fmt_to_col_types <- function(v_fmt){
  v_fmt %>%
    str_extract("[a-z]") %>%
    switch("f" = "d", "s" = "c") %>%
    str_c(collapse = "")
}

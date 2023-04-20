#'
#' @importFrom magrittr "%>%"
#' @importFrom stringr str_extract str_c str_replace_all
#' @importFrom readr cols
#' @importFrom stats setNames
#'
v_fmt_to_col_types <- function(v_fmt){
  v_fmt %>%
    str_extract("[a-z]") %>%
    map(~switch(.,
                "f" = "d",
                "s" = "c")) %>%
    setNames(names(v_fmt)) %>%
    do.call(cols, .)
}

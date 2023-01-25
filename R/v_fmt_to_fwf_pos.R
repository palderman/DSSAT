#'
#' @importFrom magrittr "%>%"
#' @importFrom tibble as_tibble
#' @importFrom dplyr mutate
#' @importFrom stringr str_c str_locate
#'
v_fmt_to_fwf_pos <- function(v_fmt, header = NULL){

  if(!is.null(header)){
    v_name_regex <- names(v_fmt) %>%
      str_c("(^|@| |\\.)", ., "($| |\\.)")

    loc <- str_locate(header, v_name_regex) %>%
      {.[,1]}

    v_fmt <- v_fmt[!is.na(loc)]

    v_fmt <- loc[!is.na(loc)] %>%
      order() %>%
      {v_fmt[.]}
  }

  fwf_pos <- v_fmt_to_fwf_widths(v_fmt)

  return(fwf_pos)
}

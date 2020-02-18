#' @importFrom dplyr "%>%" tibble mutate summarize
#' @importFrom stringr str_extract str_c
#' @importFrom tidyr replace_na
#' @importFrom glue glue_data
#' @importFrom rlang .data
reconcile_v_fmt <- function(v_fmt){
    v_fmt_tbl <- tibble(v_fmt=v_fmt) %>%
      mutate(leading_chars = {str_extract(v_fmt,'^.*(?=%)') %>%
                                replace_na('')},
             width = {str_extract(v_fmt,'(?<!\\.)[0-9]+') %>%
                      replace_na('')},
             digits = {str_extract(v_fmt,'(?<=\\.)[0-9]+') %>%
                       as.numeric() %>%
                       {ifelse(is.na(.),-1,.)}},
             justification = {str_extract(v_fmt,'-') %>%
                              replace_na('')},
             type = str_extract(v_fmt,'[a-z]')) %>%
      summarize(leading_chars = {table(.data$leading_chars) %>%
                                  sort(decreasing = TRUE) %>%
                                  head(1) %>%
                                  names()},
                width = {table(.data$width) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()},
                justification = {table(.data$justification) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()},
                type = {table(.data$type) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()},
                digits = {max(.data$digits,na.rm=TRUE) %>%
                          {ifelse(. < 0,'',str_c('.',.))}}
      ) %>%
      glue_data('{leading_chars}%{justification}{width}{digits}{type}')
  return(v_fmt_tbl)
}

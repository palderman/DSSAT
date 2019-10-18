#' reconcile f_fmt
#'
#' @export
#'
reconcile_v_fmt <- function(v_fmt){
    v_fmt_tbl <- tibble(v_fmt=v_fmt) %>%
      mutate(leading_spaces = {str_extract(v_fmt,'^ +') %>%
                                replace_na('')},
             width = {str_extract(v_fmt,'(?<!\\.)[0-9]+') %>%
                      replace_na('')},
             digits = {str_extract(v_fmt,'(?<=\\.)[0-9]+') %>%
                       as.numeric()},
             justification = {str_extract(v_fmt,'-') %>%
                              replace_na('')},
             type = str_extract(v_fmt,'[a-z]')) %>%
      summarize(leading_spaces = {table(leading_spaces) %>%
                                  sort(decreasing = TRUE) %>%
                                  head(1) %>%
                                  names()},
                width = {table(width) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()},
                digits = {max(digits,na.rm=TRUE) %>%
                          {ifelse(. == -Inf,'',str_c('.',.))}},
                justification = {table(justification) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()},
                type = {table(type) %>%
                    sort(decreasing = TRUE) %>%
                    head(1) %>%
                    names()}
                ) %>%
      glue_data('{leading_spaces}%{justification}{width}{digits}{type}')
  return(v_fmt_tbl)
}

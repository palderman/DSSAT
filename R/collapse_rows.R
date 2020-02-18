#' @importFrom dplyr "%>%" group_vars summarize summarize_all ungroup mutate_if group_by_at vars one_of
#' @importFrom purrr map_dbl
#'
collapse_rows <- function(tbl){
  prev_grps <- group_vars(tbl)
  n <- tbl %>%
    summarize(n=n()) %>%
    {.$n}
  if(any(n>1)){
    new_tbl <- tbl %>%
      summarize_all(~list(.)) %>%
      ungroup() %>%
      mutate_if(~{is.list(.) && max(map_dbl(.,~length(.))) == 1},
                ~do.call(c,.))
    if(!is.null(prev_grps)){
      new_tbl <- new_tbl %>%
        group_by_at(vars(one_of(prev_grps)))
    }
  }else{
    new_tbl <- tbl
  }
  return(new_tbl)
}

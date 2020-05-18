#' @importFrom dplyr "%>%" group_vars summarize summarize_all ungroup mutate_if group_by_at vars one_of pull
#' @importFrom purrr map_dbl
#'
collapse_rows <- function(tbl){
  prev_grps <- group_vars(tbl)
  n_per_grp <- tbl %>%
    summarize(n_per_grp=dplyr::n()) %>%
    pull(n_per_grp)
  if(any(n_per_grp>1)){
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

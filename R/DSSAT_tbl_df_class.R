#' Convert tibble to DSSAT_tbl
#'
#' @export
#'
#' @param tbl_in a tibble
#' @param v_fmt a character vector specifying the sprintf() format for each column
#' @param tier_info a list of character vectors storing the history of which original
#' table that columns came from for tibbles that are comprised of multiple joined tables
#'
#' @return a tibble of class DSSAT_tbl
#'
as_DSSAT_tbl <- function(tbl_in,v_fmt=NULL,tier_info=NULL){
  UseMethod("as_DSSAT_tbl")
}

#' @export
as_DSSAT_tbl.spec_tbl_df <- function(tbl_in,v_fmt=NULL,tier_info=NULL){

  if(is.null(v_fmt)) v_fmt <- attr(tbl_in,'v_fmt')

  if(is.null(tier_info)) tier_info <- attr(tbl_in,'tier_info')

  location <- attr(tbl_in,'location')
  first_line <- attr(tbl_in,'first_line')
  experiment <- attr(tbl_in,'experiment')
  title <- attr(tbl_in,'title')
  comments <- attr(tbl_in,'comments')

  tbl_out <- tbl_in[]

  class(tbl_out) <- c('DSSAT_tbl',class(tbl_out))

  attr(tbl_out,'v_fmt') <- v_fmt

  attr(tbl_out,'tier_info') <- tier_info

  if(!is.null(location)) attr(tbl_out,'location') <- location
  if(!is.null(first_line)) attr(tbl_out,'first_line') <- first_line
  if(!is.null(experiment)) attr(tbl_out,'experiment') <- experiment
  if(!is.null(title)) attr(tbl_out,'title') <- title
  if(!is.null(comments)) attr(tbl_out,'comments') <- comments

  return(tbl_out)

}

#' @export
as_DSSAT_tbl.default <- function(tbl_in,v_fmt=NULL,tier_info=NULL){

  if(class(tbl_in)[1] != "DSSAT_tbl"){

    if(is.null(v_fmt)) v_fmt <- attr(tbl_in,'v_fmt')

    if(is.null(tier_info)) tier_info <- attr(tbl_in,'tier_info')

    location <- attr(tbl_in,'location')
    first_line <- attr(tbl_in,'first_line')
    experiment <- attr(tbl_in,'experiment')
    title <- attr(tbl_in,'title')
    comments <- attr(tbl_in,'comments')

    tbl_out <- as_tibble(tbl_in)

    class(tbl_out) <- c('DSSAT_tbl',class(tbl_out))

    attr(tbl_out,'v_fmt') <- v_fmt

    attr(tbl_out,'tier_info') <- tier_info

    if(!is.null(location)) attr(tbl_out,'location') <- location
    if(!is.null(first_line)) attr(tbl_out,'first_line') <- first_line
    if(!is.null(experiment)) attr(tbl_out,'experiment') <- experiment
    if(!is.null(title)) attr(tbl_out,'title') <- title
    if(!is.null(comments)) attr(tbl_out,'comments') <- comments

  }else{
    tbl_out <- tbl_in
  }

  return(tbl_out)

}

#' @export
#'
#' @importFrom dplyr "%>%" rowwise mutate
#' @importFrom purrr map_lgl reduce
#' @importFrom stringr str_c
#' @importFrom rlang '!!!' quos get_expr set_expr parse_expr as_label
#'
mutate.DSSAT_tbl <- function(.data,...){

  v_fmt <- attr(.data,'v_fmt')
  tier_info <- attr(.data,'tier_info')

  location <- attr(.data,'location')
  first_line <- attr(.data,'first_line')
  experiment <- attr(.data,'experiment')
  title <- attr(.data,'title')
  comments <- attr(.data,'comments')

  list_cols <- map_lgl(.data,is.list)

  .dots <- quos(...)

  list_cols <- list_cols %>%
    {.[names(.dots)]} %>%
    {names(.)[is.na(.)] <- names(.dots)[is.na(.)]
     .[is.na(.)] <- FALSE
     .}

  if(any(list_cols)){
    new_dots <- .dots
    for(i in 1:length(.dots)){
      if(list_cols[i]){
        new_dots[[i]] <- get_expr(.dots[[i]]) %>%
          as_label() %>%
          str_c('list(',.,')') %>%
          parse_expr() %>%
          set_expr(.dots[[i]],.)
      }
    }

    attr(new_dots,'class') <- "quosures"

    tbl_out <- .data %>%
      rowwise() %>%
      mutate(!!!new_dots)

  }else{

    tbl_out <- NextMethod()

  }

  tbl_out <- as_DSSAT_tbl(tbl_out, v_fmt=v_fmt, tier_info = tier_info)

  if(!is.null(location)) attr(tbl_out,'location') <- location
  if(!is.null(first_line)) attr(tbl_out,'first_line') <- first_line
  if(!is.null(experiment)) attr(tbl_out,'experiment') <- experiment
  if(!is.null(title)) attr(tbl_out,'title') <- title
  if(!is.null(comments)) attr(tbl_out,'comments') <- comments

  return(tbl_out)
}

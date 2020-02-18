#' Adds width as a attribute to each column from a list of tibbles
#'
#' @export
#'
#' @keywords internal
#'
#' @param tbl_list a list of tibbles
#' @param fwf_pos a list of returns from \code{fwf_position()} with
#' length that matches length of \code{tbl_list}
#'
#' @importFrom dplyr mutate_at
#' @importFrom purrr map
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
add_col_widths <- function(tbl_list,fwf_pos){
  tbl_list <- map(1:length(tbl_list),function(i){
    tbl <- tbl_list[[i]]
    widths <- fwf_pos[[i]]$end - fwf_pos[[i]]$begin
    cnames <- fwf_pos[[i]]$col_names
    for(cl in 1:length(cnames)){
      tbl <- mutate_at(tbl,cnames[cl],~structure(.,width=widths[cl]))
    }
    return(tbl)
  })
  return(tbl_list)
}

#' Splice column name into vector of column names
#'
#' @export
#'
#' @keywords internal
#'
#' @param col_names A length-one character vector of a header line
#' from a DSSAT format output file
#'
#' @param new_name A length-one character vector that contains a
#' column name suspected to be a substring of one of the existing
#' elements of the \code{col_names} vector.
#'
#' @return  If \code{new_name} matches a substring, the function will
#' return a new character vector with it spliced into the existing
#' \code{col_names} in the position immediately before the element
#' that contained the matching substring. Otherwise the original
#' \code{col_names} will be returned.
#'
#' @examples
#'
#' cnames <-
#'   c("@VAR#","VAR-NAME........","EXPNO","ECO#","TB(1)TO1(1)TO2(1)","TM(1)")
#'
#' splice_in_col_name(cnames,"TB(1)")

splice_in_col_name <- function(col_names,new_name){

  # Convert new_name to regex
  new_name_regex <- name_to_regex(new_name) %>%
    str_c('((?<=^)|(?<= ))',.,'((?=$)|(?= ))')

  # Check if new_name is in col_names
  if(any(str_detect(col_names,new_name_regex))){

    # Find element that contains new_name
    i <- str_which(col_names,new_name_regex)

    # Splice in new_name
    col_names <- new_name_regex %>%
      str_split(col_names[i],.) %>%
      {.[[1]]} %>%
      {c(.[1],new_name,.[2])} %>%
      {.[.!=""]} %>%
      c(col_names[-i:-length(col_names)],
        .,
        col_names[-1:-i]) %>%
        {.[!is.na(.)]}
  }
  return(col_names)
}
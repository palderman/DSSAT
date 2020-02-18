#' Convenience function that allows mutating a subset of rows
#'
#' @export
#'
#' @param .data a tibble
#'
#' @param condition a logical vector for subsetting rows of `.data`
#'
#' @param ... Name-value pairs of expressions to be evaluated by
#' `mutate()`
#'
#' @param envir environment within which expressions should be evaluated
#'
#' @details Original code taken from \url{https://stackoverflow.com/questions/34096162/dplyr-mutate-replace-several-columns-on-a-subset-of-rows}
#'
#' @return a tibble with specified rows modified
#'
#' @importFrom dplyr "%>%" mutate
#'
mutate_cond <- function(.data, condition, ..., envir = parent.frame()) {
  # Taken from https://stackoverflow.com/questions/34096162/dplyr-mutate-replace-several-columns-on-a-subset-of-rows
  condition <- eval(substitute(condition), .data, envir)
  .data[condition, ] <- .data[condition, ] %>% mutate(...)
  .data
}

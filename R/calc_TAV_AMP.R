#' Calculate long-term temperature average (TAV)
#'
#' @export
#'
#' @importFrom magrittr "%>%"
#' @importFrom dplyr group_by mutate summarize pull
#'
calc_TAV <- function(wth){

  TAV <- wth %>%
    summarize(TAV = mean((TMAX + TMIN)/2, na.rm = TRUE)) %>%
    pull(TAV)

  return(TAV)
}

#' Calculate long-term temperature amplitude (AMP)
#'
#' @export
#'
#' @importFrom magrittr "%>%"
#' @importFrom lubridate month
#' @importFrom dplyr group_by mutate summarize pull
#'
calc_AMP <- function(wth){

  AMP <- wth %>%
    mutate(mo = month(DATE)) %>%
    group_by(mo) %>%
    summarize(mo_TAV = mean((TMAX + TMIN)/2, na.rm = TRUE)) %>%
    summarize(AMP = (max(mo_TAV)-min(mo_TAV))/2) %>%
    pull(AMP)

  return(AMP)
}

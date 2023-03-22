#' Calculate long-term temperature average (TAV)
#'
#' @export
#'
#' @param wth a data frame that contains weather data formatted
#'  as would be generated using \link{read_wth}, namely
#'  including columns TMAX and TMIN.
#'
#' @importFrom magrittr "%>%"
#' @importFrom dplyr group_by mutate summarize pull
#'
calc_TAV <- function(wth){

  # To prevent "no visible binding for global variable" from R CMD check for select()
  # statement below:
  TMAX <- TMIN <- NULL

  TAV <- wth %>%
    summarize(TAV = mean((TMAX + TMIN)/2, na.rm = TRUE)) %>%
    pull(TAV)

  return(TAV)
}

#' Calculate long-term temperature amplitude (AMP)
#'
#' @export
#'
#' @param wth a data frame that contains weather data formatted
#'  as would be generated using \link{read_wth}, namely
#'  including columns DATE, TMAX and TMIN.
#'
#' @importFrom magrittr "%>%"
#' @importFrom lubridate month
#' @importFrom dplyr group_by mutate summarize pull
#'
calc_AMP <- function(wth){

  # To prevent "no visible binding for global variable" from R CMD check for select()
  # statement below:
  DATE <- mo <- TMAX <- TMIN <- mo_TAV <- NULL

  AMP <- wth %>%
    mutate(mo = month(DATE)) %>%
    group_by(mo) %>%
    summarize(mo_TAV = mean((TMAX + TMIN)/2, na.rm = TRUE)) %>%
    summarize(AMP = (max(mo_TAV)-min(mo_TAV))/2) %>%
    pull(AMP)

  return(AMP)
}

#'
#' @param expand a logical value indicating whether or not to use [tidyr::expand_grid()]
#' to generate combinations of any input values supplied as a vector
#'
#' @importFrom magrittr "%>%"
#' @importFrom tidyr expand_grid
#' @importFrom tibble tibble
#' @importFrom dplyr mutate select n
#'
filex_template_cultivars <- function(CR = "FA", INGENO = "IB0001", CNAME = "",
                                     expand = FALSE){
  if(expand){
    cultivars <- expand_grid(
      CR = CR, INGENO = INGENO, CNAME = CNAME
    )
  }else{
    cultivars <- tibble(
      CR = CR, INGENO = INGENO, CNAME = CNAME

    )
  }

  cultivars <- cultivars %>%
    mutate(C = as.numeric(1:n())) %>%
    select(C, everything())

  return(cultivars)
}

#' Generate a template TREATMENTS section of File X
#'
#' @export
#'
#' @param expand a logical value indicating whether or not to use [tidyr::expand_grid()]
#' to generate combinations of any input values supplied as a vector
#'
#' @importFrom magrittr "%>%"
#' @importFrom tidyr expand_grid
#' @importFrom tibble tibble
#' @importFrom dplyr mutate select n
#'
filex_template_treatments <- function(R = 0, O = 0, C = 0, TNAME = "",
                                      CU = 1, FL = 1, SA = 0, IC = 0, MP = 0,
                                      MI = 0, MF = 0, MR = 0, MC = 0, MT = 0,
                                      ME = 0, MH = 0, SM = 1, expand = FALSE){
  if(expand){
    treatments <- expand_grid(
      R = R, O = O, C = C, TNAME = TNAME,
      CU = CU, FL = FL, SA = SA, IC = IC, MP = MP,
      MI = MI, MF = MF, MR = MR, MC = MC, MT = MT,
      ME = ME, MH = MH, SM = SM
    )
  }else{
    treatments <- tibble(
      R = R, O = O, C = C, TNAME = TNAME,
      CU = CU, FL = FL, SA = SA, IC = IC, MP = MP,
      MI = MI, MF = MF, MR = MR, MC = MC, MT = MT,
      ME = ME, MH = MH, SM = SM
    )
  }

  treatments <- treatments %>%
    mutate(N = as.numeric(1:n())) %>%
    select(N, everything())

  return(treatments)
}

#' Generate a template FERTILIZERS section of File X
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
filex_template_fertilizers <-
  function(F = NA_real_, FDATE = as.POSIXct(NA), FMCD = NA_character_,
           FACD = NA_character_, FDEP = NA_real_, FAMN = NA_real_,
           FAMP = NA_real_, FAMK = NA_real_, FAMC = NA_real_,
           FAMO = NA_real_, FOCD = NA_character_, FERNAME = NA_character_,
           expand = FALSE){

  if(is.na(F)) F <- 1

  if(expand){
    fertilizers <- expand_grid(
      F = F, FDATE = FDATE, FMCD = FMCD, FACD = FACD, FDEP = FDEP,
      FAMN = FAMN, FAMP = FAMP, FAMK = FAMK, FAMC = FAMC, FAMO = FAMO,
      FOCD = FOCD, FERNAME = FERNAME
    )
  }else{
    fertilizers <- tibble(
      F = F, FDATE = FDATE, FMCD = FMCD, FACD = FACD, FDEP = FDEP,
      FAMN = FAMN, FAMP = FAMP, FAMK = FAMK, FAMC = FAMC, FAMO = FAMO,
      FOCD = FOCD, FERNAME = FERNAME
    )
  }

  return(fertilizers)
}

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
      R = R, O = O, TNAME = TNAME,
      CU = CU, FL = FL, SA = SA, IC = IC, MP = MP,
      MI = MI, MF = MF, MR = MR, MC = MC, MT = MT,
      ME = ME, MH = MH, SM = SM
    )
  }else{
    treatments <- tibble(
      R = R, O = O, TNAME = TNAME,
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

#'
#' @param expand a logical value indicating whether or not to use [tidyr::expand_grid()]
#' to generate combinations of any input values supplied as a vector
#'
#' @importFrom magrittr "%>%"
#' @importFrom tidyr expand_grid
#' @importFrom tibble tibble
#' @importFrom dplyr mutate select n
#'
filex_template_fields <- function(ID_FIELD = NA_character_, WSTA, FLSA = NA_character_,
                                  FLOB = NA_real_, FLDT = NA_character_, FLDD = NA_real_,
                                  FLDS = NA_real_, FLST = NA_character_,
                                  SLTX = NA_character_, SLDP = NA_real_, ID_SOIL,
                                  FLNAME = NA_character_,
                                  XCRD = NA_real_, YCRD = NA_real_, ELEV = NA_real_,
                                  AREA = NA_real_, SLEN = NA_real_, FLWR = NA_real_,
                                  SLAS = NA_real_, FLHST = NA_character_,
                                  FHDUR = NA_real_, expand = FALSE){
  if(expand){
    fields <- expand_grid(
      ID_FIELD = ID_FIELD, WSTA = WSTA, FLSA = FLSA, FLOB = FLOB, FLDT = FLDT,
      FLDD = FLDD, FLDS = FLDS, FLST = FLST, SLTX = SLTX, SLDP = SLDP,
      ID_SOIL = ID_SOIL, FLNAME = FLNAME,
      XCRD = XCRD, YCRD = YCRD, ELEV = ELEV, AREA = AREA, SLEN = SLEN,
      FLWR = FLWR, SLAS = SLAS, FLHST = FLHST, FHDUR = FHDUR
    )
  }else{
    fields <- tibble(
      ID_FIELD = ID_FIELD, WSTA = WSTA, FLSA = FLSA, FLOB = FLOB, FLDT = FLDT,
      FLDD = FLDD, FLDS = FLDS, FLST = FLST, SLTX = SLTX, SLDP = SLDP,
      ID_SOIL = ID_SOIL, FLNAME = FLNAME,
      XCRD = XCRD, YCRD = YCRD, ELEV = ELEV, AREA = AREA, SLEN = SLEN,
      FLWR = FLWR, SLAS = SLAS, FLHST = FLHST, FHDUR = FHDUR
    )
  }

  fields <- fields %>%
    mutate(L = as.numeric(1:n())) %>%
    select(L, everything())

  return(fields)
}

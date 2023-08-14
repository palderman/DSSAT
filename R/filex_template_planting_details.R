# Generate a template PLANTING DETAILS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_planting_details <- function(PDATE = as.POSIXct(NA),
                                            EDATE = as.POSIXct(NA),
                                            PPOP = NA_real_, PPOE = NA_real_,
                                            PLME = NA_character_,
                                            PLDS = NA_character_, PLRS = NA_real_,
                                            PLRD = NA_real_, PLDP = NA_real_,
                                            PLWT = NA_real_, PAGE = NA_real_,
                                            PENV = NA_real_, PLPH = NA_real_,
                                            SPRL = NA_real_,
                                            PLNAME = NA_character_,
                                            expand = FALSE){

  if(expand){
    plant_details <- expand_grid(
      PDATE = PDATE, EDATE = EDATE, PPOP = PPOP, PPOE = PPOE,
      PLME = PLME, PLDS = PLDS, PLRS = PLRS, PLRD = PLRD, PLDP = PLDP,
      PLWT = PLWT, PAGE = PAGE, PENV = PENV, PLPH = PLPH, SPRL = SPRL,
      PLNAME = PLNAME
    )
  }else{
    plant_details <- data.frame(
      PDATE = PDATE, EDATE = EDATE, PPOP = PPOP, PPOE = PPOE,
      PLME = PLME, PLDS = PLDS, PLRS = PLRS, PLRD = PLRD, PLDP = PLDP,
      PLWT = PLWT, PAGE = PAGE, PENV = PENV, PLPH = PLPH, SPRL = SPRL,
      PLNAME = PLNAME
    )
  }

  plant_details <- add_level_column(plant_details, "P")

  return(plant_details)
}

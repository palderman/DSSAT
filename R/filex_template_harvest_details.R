# Generate a template HARVEST DETAILS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_harvest_details <- function(HDATE = as.POSIXct(NA),
                                           HSTG = NA_character_,
                                           HCOM = NA_character_,
                                           HSIZE = NA_character_,
                                           HPC = NA_real_,
                                           HBPC = NA_real_,
                                           HNAME = NA_character_,
                                           expand = FALSE){

  if(expand){
    harvest_details <- expand_grid(
      HDATE = HDATE, HSTG = HSTG, HCOM = HCOM, HSIZE = HSIZE,
      HPC = HPC, HBPC = HBPC, HNAME = HNAME
    )
  }else{
    harvest_details <- data.frame(
      HDATE = HDATE, HSTG = HSTG, HCOM = HCOM, HSIZE = HSIZE,
      HPC = HPC, HBPC = HBPC, HNAME = HNAME
    )
  }

  harvest_details <- add_level_column(harvest_details, "H")

  return(harvest_details)
}

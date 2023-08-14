# Generate a template FERTILIZERS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_fertilizers <-
  function(F = NA_real_, FDATE = as.POSIXct(NA), FMCD = NA_character_,
           FACD = NA_character_, FDEP = NA_real_, FAMN = NA_real_,
           FAMP = NA_real_, FAMK = NA_real_, FAMC = NA_real_,
           FAMO = NA_real_, FOCD = NA_character_, FERNAME = NA_character_,
           expand = FALSE){

  F[is.na(F)] <- 1

  if(expand){
    fertilizers <- expand_grid(
      F = F, FDATE = FDATE, FMCD = FMCD, FACD = FACD, FDEP = FDEP,
      FAMN = FAMN, FAMP = FAMP, FAMK = FAMK, FAMC = FAMC, FAMO = FAMO,
      FOCD = FOCD, FERNAME = FERNAME
    )
  }else{
    fertilizers <- data.frame(
      F = F, FDATE = FDATE, FMCD = FMCD, FACD = FACD, FDEP = FDEP,
      FAMN = FAMN, FAMP = FAMP, FAMK = FAMK, FAMC = FAMC, FAMO = FAMO,
      FOCD = FOCD, FERNAME = FERNAME
    )
  }

  return(fertilizers)
}

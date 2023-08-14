# Generate a template TREATMENTS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_treatments <- function(R = 0, O = 0, C = 0, TNAME = "",
                                      CU = 1, FL = 1, SA = 0, IC = 0, MP = 1,
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
    treatments <- data.frame(
      R = R, O = O, C = C, TNAME = TNAME,
      CU = CU, FL = FL, SA = SA, IC = IC, MP = MP,
      MI = MI, MF = MF, MR = MR, MC = MC, MT = MT,
      ME = ME, MH = MH, SM = SM
    )
  }

  treatments <- add_level_column(treatments, "N")

  return(treatments)
}

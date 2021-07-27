tier_info_sol <- function(){
  tier_info <- list(
    c("PEDON", "SOURCE", "TEXTURE", "DEPTH", "DESCRIPTION"),
    c("SITE", "COUNTRY", "LAT", "LONG", "SCS FAMILY"),
    c("SCOM", "SALB", "SLU1", "SLDR", "SLRO", "SLNF",
      "SLPF", "SMHB", "SMPX", "SMKE"),
    c("SLB", "SLMH", "SLLL", "SDUL", "SSAT", "SRGF",
      "SSKS", "SBDM", "SLOC", "SLCL", "SLSI", "SLCF",
      "SLNI", "SLHW", "SLHB", "SCEC", "SADC"),
    c("SLB", "SLPX", "SLPT", "SLPO", "CACO3", "SLAL",
      "SLFE", "SLMN", "S", "SLPA", "SLPB", "SLKE",
      "SLMG", "SLNA", "SLSU", "SLEC", "SLCA"),
    c("SLB", "ALFVG", "MVG", "NVG", "WCRES"))
  return(tier_info)
}

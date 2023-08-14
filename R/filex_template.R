# Generate File X template
#
# @export
#
# @param expand a logical value indicating whether or not to generate expanded
# combinations of any input values supplied as a vector
#
filex_template <- function(...){

  flx_args <- list(...)

  general_args <- c("PEOPLE", "ADDRESS", "SITE", "PAREA", "PRNO", "PLEN", "PLDR",
                    "PLSP", "PLAY", "HAREA", "HRNO", "HLEN", "HARM", "NOTES")

  treatments_args <- c("R", "O", "C", "TNAME", "CU", "FL", "SA", "IC", "MP",
                       "MI", "MF", "MR", "MC", "MT", "ME", "MH", "SM",
                       "expand")

  fields_args <- c("ID_FIELD", "WSTA", "FLSA", "FLOB", "FLDT", "FLDD", "FLDS",
                   "FLST", "SLTX", "SLDP", "ID_SOIL", "FLNAME", "XCRD", "YCRD",
                   "ELEV", "AREA", "SLEN", "FLWR", "SLAS", "FLHST", "FHDUR",
                   "expand")

  cultivars_args <- c("CR", "INGENO", "CNAME", "expand")

  planting_args <- c("P", "PDATE", "EDATE", "PPOP", "PPOE", "PLME", "PLDS",
                     "PLRS", "PLRD", "PLDP", "PLWT", "PAGE", "PENV", "PLPH",
                     "SPRL", "PLNAME", "expand")

  sim_control_args <- c("GENERAL", "NYERS", "NREPS", "START", "SDATE", "RSEED",
                        "SNAME", "SMODEL", "OPTIONS", "WATER", "NITRO", "SYMBI",
                        "PHOSP", "POTAS", "DISES", "CHEM", "TILL", "CO2", "METHODS",
                        "WTHER", "INCON", "LIGHT", "EVAPO", "INFIL", "PHOTO", "HYDRO",
                        "NSWIT", "MESOM", "MESEV", "MESOL", "MANAGEMENT", "PLANT",
                        "IRRIG", "FERTI", "RESID", "HARVS", "OUTPUTS", "FNAME", "OVVEW",
                        "SUMRY", "FROPT", "GROUT", "CAOUT", "WAOUT", "NIOUT", "MIOUT",
                        "DIOUT", "VBOSE", "CHOUT", "OPOUT", "FMOPT", "PLANTING", "PFRST",
                        "PLAST", "PH2OL", "PH2OU", "PH2OD", "PSTMX", "PSTMN",
                        "IRRIGATION", "IMDEP", "ITHRL", "ITHRU", "IROFF", "IMETH",
                        "IRAMT", "IREFF", "NITROGEN", "NMDEP", "NMTHR", "NAMNT", "NCODE",
                        "NAOFF", "RESIDUES", "RIPCN", "RTIME", "RIDEP", "HARVEST",
                        "HFRST", "HLAST", "HPCNP", "HPCNR", "SIMDATES", "ENDAT", "SDUR",
                        "FODAT", "FSTRYR", "FENDYR", "FWFILE", "FONAME",
                        "expand")

  filex <- list(

    GENERAL = do.call(filex_template_general,
                      flx_args[names(flx_args) %in% general_args]),

    TREATMENTS = do.call(filex_template_treatments,
                         flx_args[names(flx_args) %in% treatments_args]),

    CULTIVARS = do.call(filex_template_cultivars,
                        flx_args[names(flx_args) %in% cultivars_args]),

    FIELDS = do.call(filex_template_fields,
                     flx_args[names(flx_args) %in% fields_args]),

    `PLANTING DETAILS` = do.call(filex_template_planting_details,
                                 flx_args[names(flx_args) %in% planting_args]),

    `SIMULATION CONTROLS` = do.call(filex_template_simulation_controls,
                                    flx_args[names(flx_args) %in% sim_control_args])

  )

  fertilizers_args <-c("F", "FDATE", "FMCD", "FACD", "FDEP", "FAMN", "FAMP",
                       "FAMK", "FAMC", "FAMO", "FOCD", "FERNAME", "expand")

  if(any(names(flx_args) %in% fertilizers_args)){

    filex$FERTILIZERS <- do.call(filex_template_fertilizers,
                                 flx_args[names(flx_args) %in% fertilizers_args])

  }

  filex_sections <- c("GENERAL", "TREATMENTS", "CULTIVARS", "FIELDS",
                      "INITIAL CONDITIONS", "PLANTING DETAILS",
                      "IRRIGATION AND WATER MANAGEMENT", "FERTILIZERS",
                      "SIMULATION CONTROLS")

  filex_sections <- filex_sections[filex_sections %in% names(filex)]

  filex <- filex[filex_sections]

  return(filex)

}

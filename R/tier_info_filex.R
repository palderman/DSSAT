#' @importFrom stringr str_detect

tier_info_filex <- function(sec_name){

  if(str_detect(sec_name,'CHEMICAL')){

    tier_info <- list(
      c("C", "CDATE", "CHCOD", "CHAMT", "CHME",
        "CHDEP", "CHT", "CHNAME")
    )

  }else if(str_detect(sec_name,'CULTIVARS')){

    tier_info <- list(
      c("C", "CR", "INGENO", "CNAME")
    )


  }else if(str_detect(sec_name,'ENVIRONMENT')){

    tier_info <- list(
      c("E", "ODATE", "EDAY", "ERAD", "EMAX", "EMIN",
        "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME")
    )

  }else if(str_detect(sec_name,'FERTILIZERS')){

    tier_info <- list(
      c("F", "FDATE", "FMCD", "FACD", "FDEP", "FAMN",
        "FAMP", "FAMK", "FAMC", "FAMO", "FOCD", "FERNAME")
    )

  }else if(str_detect(sec_name,'FIELDS')){

    tier_info <- list(
      c("L", "ID_FIELD", "WSTA", "FLSA", "FLOB", "FLDT",
        "FLDD", "FLDS", "FLST", "SLTX", "SLDP", "ID_SOIL",
        "FLNAME"),
      c("L", "XCRD", "YCRD", "ELEV", "AREA", "SLEN", "FLWR",
        "SLAS", "FLHST", "FHDUR"))

  }else if(str_detect(sec_name,'GENERAL')){

    tier_info <- list(
      "PEOPLE", "ADDRESS", "SITE",
      c("PAREA", "PRNO", "PLEN", "PLDR", "PLSP", "PLAY",
        "HAREA", "HRNO", "HLEN", "HARM"),
      "NOTES"
      )

  }else if(str_detect(sec_name,'HARVEST')){

    tier_info <- list(
      c("H", "HDATE", "HSTG", "HCOM", "HSIZE",
        "HPC", "HBPC", "HNAME")
    )

  }else if(str_detect(sec_name,'INITIAL CONDITIONS')){

    tier_info <- list(
      c("C", "PCR", "ICDAT", "ICRT", "ICND",
        "ICRN", "ICRE", "ICWD", "ICRES", "ICREN",
        "ICREP", "ICRIP", "ICRID", "ICNAME"),
      c("C", "ICBL", "SH2O", "SNH4", "SNO3")
      )

  }else if(str_detect(sec_name,'IRRIGATION')){

    tier_info <- list(
      c("I", "EFIR", "IEFF", "IDEP", "ITHR", "IEPT",
        "IOFF", "IAME", "IAMT", "IRNAME"),
      c("I", "IDATE", "IROP", "IRVAL")
    )

  }else if(str_detect(sec_name,'PLANTING DETAILS')){

    tier_info <- list(
      c("P", "PDATE", "EDATE", "PPOP", "PPOE",
        "PLME", "PLDS", "PLRS", "PLRD", "PLDP",
        "PLWT", "PAGE", "PENV", "PLPH", "SPRL",
        "PLNAME")
    )

  }else if(str_detect(sec_name,'RESIDUES')){

    tier_info <- list(
      c("R", "RDATE", "RCOD", "RAMT", "RESN",
        "RESP", "RESK", "RINP", "RDEP", "RMET",
        "RENAME")
    )

  }else if(str_detect(sec_name,'SIMULATION CONTROLS')){

    tier_info <- list(
      c("N", "GENERAL", "NYERS", "NREPS", "START", "SDATE",
        "RSEED", "SNAME", "SMODEL"),
      c("N", "OPTIONS", "WATER", "NITRO", "SYMBI", "PHOSP",
        "POTAS", "DISES", "CHEM", "TILL", "CO2"),
      c("N", "METHODS", "WTHER", "INCON", "LIGHT", "EVAPO",
        "INFIL", "PHOTO", "HYDRO", "NSWIT", "MESOM",
        "MESEV", "MESOL"),
      c("N", "MANAGEMENT", "PLANT", "IRRIG", "FERTI", "RESID",
        "HARVS"),
      c("N", "OUTPUTS", "FNAME", "OVVEW", "SUMRY", "FROPT",
        "GROUT", "CAOUT", "WAOUT", "NIOUT", "MIOUT",
        "DIOUT", "VBOSE", "CHOUT", "OPOUT", "FMOPT"),
      c("N", "PLANTING", "PFRST", "PLAST", "PH2OL", "PH2OU",
        "PH2OD", "PSTMX", "PSTMN"),
      c("N", "IRRIGATION", "IMDEP", "ITHRL", "ITHRU", "IROFF",
        "IMETH", "IRAMT", "IREFF"),
      c("N", "NITROGEN", "NMDEP", "NMTHR", "NAMNT", "NCODE",
        "NAOFF"),
      c("N", "RESIDUES", "RIPCN", "RTIME", "RIDEP"),
      c("N", "HARVEST", "HFRST", "HLAST", "HPCNP", "HPCNR"),
      c("N", "SIMDATES", "ENDAT", "SDUR", "FODAT", "FSTRYR",
        "FENDYR", "FWFILE", "FONAME")
    )

  }else if(str_detect(sec_name,'SOIL ANALYSIS')){

    tier_info <- list(
      c("A", "SADAT", "SMHB", "SMPX", "SMKE", "SANAME"),
      c("A", "SABL", "SADM", "SAOC", "SANI", "SAPHW",
        "SAPHB", "SAPX", "SAKE", "SASC")
    )

  }else if(str_detect(sec_name,'TILLAGE')){

    tier_info <- list(
      c("T", "TDATE", "TIMPL", "TDEP", "TNAME")
    )

  }else if(str_detect(sec_name,'TREATMENTS')){

    tier_info <- list(
      c("N", "R", "O", "C", "TNAME", "CU", "FL", "SA",
        "IC", "MP", "MI", "MF", "MR", "MC", "MT",
        "ME", "MH", "SM")
    )

  }

  return(tier_info)
}

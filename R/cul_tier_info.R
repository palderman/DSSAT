cul_tier_info <- function(cul_file){

  model_code <- substr(basename(cul_file), 1, 5)

  if(model_code %in% c("ALFRM", "BMFRM", "BRFRM", "GGFRM")){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "CSDL", "PPSEN",
                  "EM-FL", "FL-SH", "FL-SD", "SD-PM", "FL-LF", "LFMAX",
                  "SLAVR", "SIZLF", "XFRT", "WTPSD", "SFDUR", "SDPDV",
                  "PODUR", "THRSH", "SDPRO", "SDLIP")

  }else if(model_code %in% c("BHGRO", "BNGRO", "BRGRO",
                             "CBGRO", "CHGRO", "CIGRO",
                             "CNGRO", "COGRO", "CPGRO",
                             "FBGRO", "G0GRO", "GBGRO",
                             "PNGRO", "PPGRO", "PRGRO",
                             "QUGRO", "SBGRO", "SFGRO",
                             "SUGRO", "TMGRO", "VBGRO")){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "CSDL", "PPSEN",
                  "EM-FL", "FL-SH", "FL-SD", "SD-PM", "FL-LF", "LFMAX",
                  "SLAVR", "SIZLF", "XFRT", "WTPSD", "SFDUR", "SDPDV",
                  "PODUR", "THRSH", "SDPRO", "SDLIP")

  }else if(model_code == "BACER"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "P1V", "P1D",
                  "P5", "G1", "G2", "G3", "PHINT")

  }else if(model_code == "BACRP"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "P1", "P2", "P3",
                  "P4", "P5", "P6", "P7", "P8", "VREQ", "VBASE", "VEFF",
                  "PPS1", "PPS2", "PHINT", "LA1S", "LAFV", "LAFR", "SHWTS",
                  "G#WTS", "GWTS")

  }else if(model_code == "BSCER"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "P1", "P2", "P5",
                  "G2", "G3", "PHINT")

  }else if(model_code == "CSCAS"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "PPS1", "B01ND",
                  "B12ND", "B23ND", "B34ND", "B45ND", "B56ND", "SR#WT",
                  "SRFR", "HMPC", "PHINT", "LA1S", "LAXS", "LAXND", "LAXN2",
                  "LAFS", "LAFND", "SLAS", "LLIFA", "LPEFR", "STFR")

  }else if(model_code == "CSYCA"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "B01ND", "B12ND",
                  "B23ND", "B34ND", "BR1FX", "BR2FX", "BR3FX", "BR4FX",
                  "LAXS", "SLAS", "LLIFA", "LPEFR", "LNSLP", "NODWT",
                  "NODLT")

  }else if(model_code == "MLCER"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P2O",
                  "P2R", "P5", "G1", "G4", "PHINT", "GT", "G5")

  }else if(model_code == "MZCER"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "P1", "P2", "P5",
                  "G2", "G3", "PHINT")

  }else if(model_code == "MZIXM"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "P1", "P2", "P5",
                  "G2", "G3", "PHINT", "AX", "ALL")

  }else if(model_code == "PIALO"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "TC", "P1",
                  "P2", "P3", "P4", "P5", "P6", "P7", "P8", "G1", "G2",
                  "G3", "PHINT")

  }else if(model_code == "PTSUB"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "G2", "G3",
                  "PD", "P2", "TC")

  }else if(model_code == "RICER"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P2R",
                  "P5", "P2O", "G1", "G2", "G3", "PHINT", "THOT", "TCLDP",
                  "TCLDF")

  }else if(model_code == "SCCAN"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "MaxPARCE",
                  "APFMX", "STKPFMAX", "SUCA", "TBFT", "LFMAX", "MXLFAREA",
                  "MXLFARNO", "PI1", "PI2", "PSWITCH", "TTPLNTEM", "TTRATNEM",
                  "CHUPIBASE", "TT_POPGROWTH", "POPTT16", "TAR0", "TDELAY",
                  "LER0", "SER0", "LG_AMBASE", "AQP_UP5")

  }else if(model_code == "SCCSP"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "LFMAX", "PHTMX",
                  "Stalk", "Sucro", "Null1", "PLF1", "PLF2", "Gamma",
                  "StkB", "StkM", "Null3", "SIZLF", "LIsun", "LIshd",
                  "Null4", "TB_1", "TO1_1", "TO2_1", "TM_1", "PI1", "PI2",
                  "DTPI", "LSFAC", "Null5", "LI1", "TELOM", "TB_2", "TO1_2",
                  "TO2_2", "TM_2", "Ph1P", "Ph1R", "Ph2", "Ph3", "Ph4",
                  "StHrv", "RTNFC", "MinGr", "Null7", "RE30C", "RL30C",
                  "R30C2")

  }else if(model_code == "SCSAM"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "MAXGL", "N_LF_STK_EM",
                  "N_LF_IT_FORM", "MAXDGL", "AMAX", "EFF", "CHUSTK",
                  "CHUPEAK", "CHUDEC", "CHUMAT", "POPMAT", "POPPEAK",
                  "TILLOCHRON", "PHYLLOCHRON", "SLA", "MLA", "PLASTOCHRON",
                  "INIT_LF_AREA", "MAX_INI_LA", "MAX_IT_DW", "MID_TT_IT_GRO",
                  "END_TT_IT_GRO", "MID_TT_LF_GRO", "END_TT_LF_GRO")

  }else if(model_code == "SGCER"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P2",
                  "P2O", "P2R", "PANTH", "P3", "P4", "P5", "PHINT", "G1",
                  "G2", "PBASE", "PSAT")

  }else if(model_code == "SUOIL"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "P1", "P2", "P5",
                  "G2", "G3", "O1")

  }else if(model_code == "SWCER"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "P1", "P2", "P5",
                  "G2", "G3", "PHINT")

  }else if(model_code == "TFAPS"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "VSEN", "PPSEN",
                  "P1", "P5", "PHINT", "GRNO", "MXFIL", "STMMX", "SLAP1")

  }else if(model_code == "TFCER"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P2R",
                  "P5", "P2O", "G1", "G2", "G3", "PHINT", "THOT", "TCLDP",
                  "TCLDF")

  }else if(model_code == "TNARO"){


    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P3",
                  "P4", "P5", "G2", "G3", "G4", "PHINT", "PCINT", "PCGRD")

  }else if(model_code == "TRARO"){

    tier_info = c("VAR#", "VAR-NAME", "EXPNO", "ECO#", "P1", "P3",
                  "P4", "P5", "G2", "G3", "G4", "PHINT", "PCINT", "PCGRD")

  }else if(model_code == "WHAPS"){

    tier_info = c("VAR#", "VRNAME", "EXPNO", "ECO#", "VSEN", "PPSEN",
                  "P1", "P5", "PHINT", "GRNO", "MXFIL", "STMMX", "SLAP1")

  }else if(model_code == "WHCER"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "P1V", "P1D",
                  "P5", "G1", "G2", "G3", "PHINT")

  }else if(model_code == "WHCRP"){

    tier_info = c("VAR#", "VAR-NAME", "EXP#", "ECO#", "P1", "P2", "P3",
                  "P4", "P5", "P6", "P7", "P8", "VREQ", "VBASE", "VEFF",
                  "PPS1", "PPS2", "PHINT", "LA1S", "LAFV", "LAFR", "SHWTS",
                  "G#WTS", "GWTS")

  }else{

    tier_info <- NULL

  }

  return(list(tier_info))
}


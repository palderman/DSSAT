eco_tier_info <- function(cul_file){

  model_code <- substr(basename(cul_file), 1, 5)

  if(model_code %in% c("ALFRM", "BMFRM", "BRFRM", "GGFRM")){

    tier_info = c("ECO#", "ECONAME", "MG", "TM", "THVAR", "PL-EM",
                  "EM-V1", "V1-JU", "JU-R0", "PM06", "PM09", "LNGSH",
                  "R7-R8", "FL-VS", "TRIFL", "RWDTH", "RHGHT", "R1PPO",
                  "OPTBI", "SLOBI", "RDRMT", "RDRMG", "RDRMM", "RCHDP"
    )

  }else if(model_code %in% c("BHGRO", "BNGRO", "BRGRO",
                             "CBGRO", "CHGRO", "CIGRO",
                             "CNGRO", "COGRO", "CPGRO",
                             "FBGRO", "G0GRO", "GBGRO",
                             "PNGRO", "PPGRO", "PRGRO",
                             "QUGRO", "SBGRO", "SFGRO",
                             "SUGRO", "TMGRO", "VBGRO")){

    tier_info = c("ECO#", "ECONAME", "MG", "TM", "THVAR", "PL-EM",
                  "EM-V1", "V1-JU", "JU-R0", "PM06", "PM09", "LNGSH",
                  "R7-R8", "FL-VS", "TRIFL", "RWDTH", "RHGHT", "R1PPO",
                  "OPTBI", "SLOBI", "PP-SS", "LNHSH", "KCAN", "THRSH",
                  "SDPRO", "SDLIP")

  }else if(model_code == "BACER"){

    tier_info = c("ECO#", "P1", "P2FR1", "P2", "P3", "P4FR1", "P4FR2",
                  "P4", "VEFF", "PARUE", "PARU2", "PHL2", "PHF3", "LA1S",
                  "LAFV", "LAFR", "SLAS", "LSPHS", "LSPHE", "TIL#S",
                  "TIPHE", "TIFAC", "TDPHS", "TDPHE", "TDFAC", "RDGS",
                  "HTSTD", "AWNS", "KCAN", "RS%S", "GN%S", "GN%MN", "TKFH"
    )

  }else if(model_code == "BACRP"){

    tier_info = c("ECO#", "ECONAME", "PARUE", "PARU2", "PHL2", "PHF3",
                  "SLAS", "LSENI", "LSPHS", "LSPHE", "TIL#S", "TIPHE",
                  "TIFAC", "TDPHS", "TDPHE", "TDFAC", "TDSF", "RDGS",
                  "HTSTD", "AWNS", "KCAN", "RS%A", "GN%S", "GN%MN", "GM%H",
                  "TKFH", "SSPHS", "SSPHE", "GWTAF", "GWTAT", "G#RF",
                  "RTNUP", "NUPNF", "NUPWF")

  }else if(model_code == "BSCER"){

    tier_info = c("ECO", "ECONAME", "TBASE", "TOPT", "ROPT", "P20",
                  "DJTI", "GDDE", "DSGFT", "RUE", "KCAN", "TSEN", "CDAY"
    )

  }else if(model_code == "CSCAS"){

    tier_info = c("ECO#", "ECONAME", "PARUE", "HTSTD", "DUSRI", "SRN%S",
                  "BR1FX", "BR2FX", "BR3FX", "BR4FX", "BR5FX", "BR6FX"
    )

  }else if(model_code == "CSYCA"){

    tier_info = c("ECO#", "ECONAME", "PARUE", "TBLSZ", "SRN%S", "KCAN",
                  "PGERM", "PPS1", "PPS2", "PPS3", "PHTV", "PHSV", "RDGS",
                  "RLWR", "WFSU", "RSUSE", "HMPC")

  }else if(model_code == "MLCER"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "DJTI",
                  "GDDE", "RUE", "KCAN")

  }else if(model_code == "MZCER"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "P20",
                  "DJTI", "GDDE", "DSGFT", "RUE", "KCAN", "TSEN", "CDAY"
    )

  }else if(model_code == "MZIXM"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "P20",
                  "DJTI", "GDDE", "DSGFT", "RUE", "KCAN", "PSTM", "PEAR",
                  "TSEN", "CDAY")

  }else if(model_code == "PTSUB"){

    tier_info = c("ECO#", "ECONAME", "RUE1", "RUE2")

  }else if(model_code == "SCCAN"){

    tier_info = c("ECO#", "ECO-NAME", "DELTTMAX", "SWDF2AMP", "EXTCFN",
                  "EXTCFST", "LFNMXEXT", "AREAMX_CF(2)", "AREAMX_CF(3)",
                  "WIDCOR", "WMAX_CF(1)", "WMAX_CF(2)", "WMAX_CF(3)",
                  "POPDECAY", "TTBASEEM", "TTBASELFEX", "LG_AMRANGE",
                  "LG_GP_REDUC", "LDG_FI_REDUC", "LMAX_CF(1)", "LMAX_CF(2)",
                  "LMAX_CF(3)", "MAXLFLENGTH", "MAXLFWIDTH", "TBASE_GE_EM",
                  "TOPT_GE_EM", "TFin_GE_EM", "TBASE_LFEM", "TOPT_LFEM",
                  "TFin_LFEM", "TBASE_TLREM", "TOPT_TLREM", "TFin_TLREM",
                  "TBASE_LFSEN", "TOPT_LFSEN", "TFin_LFSEN", "TBASE_STKEX",
                  "TOPT_STKEX", "TFin_STKEX", "TBASE_LFEX", "TOPT_LFEX",
                  "TFin_LFEX", "TBASE_REX", "TOPT_REX", "TFin_REX", "TOPT_PHOT",
                  "TOPT_PHO2", "TFin_PHOT", "TBASE_RESP", "TOPT_RESP",
                  "TFin_RESP")

  }else if(model_code == "SCCSP"){

    tier_info = c("ECO#", "ECONAME",
                  "KCAN_ECO", "SMAX", "CAB", "CanLmtFac", "LfShdFac",
                  "MINSHD", "StkSenFrac", "SENDAY", "XDAY", "YSLA", "XLI",
                  "YVTR", "XVSHT", "YVSHT", "ZVSDI", "YVSWH", "XLFNUM",
                  "YLFSZ", "XStkNum", "YLfFac", "XFRSU", "YFRSU", "XSENMX",
                  "SENMAX", "XShdMX", "ShdMAX", "XSTAGE", "SENPOR", "XTMIN",
                  "YLOSS")

  }else if(model_code == "SCSAM"){

    tier_info = c("ECO#", "ECO-NAME", "NS_LF_TIL", "N_LF_MAX_ILA",
                  "TB0PHO", "TB1PHO", "TB2PHO", "TBFPHO", "TBPER", "TBMAX_PER",
                  "LTTHRESHOLD", "FDEADLF", "RDM", "DPERCOEFF", "RWUEP1",
                  "RWUEP2", "T_MAX_WS_PHO", "T_MID_WS_PHO", "T_MIN_WS_PHO",
                  "T_MAX_WS_EXP", "T_MID_WS_EXP", "T_MIN_WS_EXP", "FRAC_SUC_BG",
                  "FRAC_HEX_BG", "INIT_PD_RAT", "IT_STR_TB_INI", "IT_STR_TO1",
                  "IT_STR_TO2", "IT_STR_TB_END", "IT_STR_PF_MAX", "IT_STR_PF_MIN",
                  "IT_STR_PF_TB", "IT_STR_PF_TM", "IT_STR_PF_TE", "IT_STR_PF_D",
                  "IT_STR_T_RED", "IT_STR_W_RED", "MAX_PER_IT", "DSWAT_DDWS",
                  "DSWAT_DSUC", "HEX_MIN", "SUC_ACC_INI", "DSUC_FRAC_TS",
                  "TT_CHUMAT_LT")

  }else if(model_code == "SGCER"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "GDDE",
                  "RUE", "KCAN", "STPC", "RTPC", "TILFC", "PLAM")

  }else if(model_code == "SUOIL"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "P20",
                  "DJTI", "GDDE", "DSGFT", "RUE", "KCAN", "TSEN", "CDAY"
    )

  }else if(model_code == "SWCER"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "P20",
                  "DJTI", "GDDE", "DSGFT", "RUE", "KCAN", "TSEN", "CDAY"
    )

  }else if(model_code == "TFAPS"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "TTOP",
                  "P20", "VREQ", "GDDE", "DSGFT", "RUE1", "RUE2", "KVAL1",
                  "KVAL2", "SLAP2", "TC1P1", "TC1P2", "DTNP1", "PLGP1",
                  "PLGP2", "P2AF", "P3AF", "P4AF", "P5AF", "P6AF", "ADLAI",
                  "ADTIL", "ADPHO", "STEMN", "MXNUP", "MXNCR", "WFNU",
                  "PNUPR", "EXNO3", "MNNO3", "EXNH4", "MNNH4", "INGWT",
                  "INGNC", "FREAR", "MNNCR", "GPPSS", "GPPES", "MXGWT",
                  "MNRTN", "NOMOB", "RTDP1", "RTDP2", "FOZ1", "SFOZ1",
                  "TSEN", "CDAY")

  }else if(model_code == "WHAPS"){

    tier_info = c("ECO#", "ECONAME", "TBASE", "TOPT", "ROPT", "TTOP",
                  "P20", "VREQ", "GDDE", "DSGFT", "RUE1", "RUE2", "KVAL1",
                  "KVAL2", "SLAP2", "TC1P1", "TC1P2", "DTNP1", "PLGP1",
                  "PLGP2", "P2AF", "P3AF", "P4AF", "P5AF", "P6AF", "ADLAI",
                  "ADTIL", "ADPHO", "STEMN", "MXNUP", "MXNCR", "WFNU",
                  "PNUPR", "EXNO3", "MNNO3", "EXNH4", "MNNH4", "INGWT",
                  "INGNC", "FREAR", "MNNCR", "GPPSS", "GPPES", "MXGWT",
                  "MNRTN", "NOMOB", "RTDP1", "RTDP2", "FOZ1", "SFOZ1",
                  "TSEN", "CDAY")

  }else if(model_code == "WHCER"){

    tier_info = c("ECO#", "P1", "P2FR1", "P2", "P3", "P4FR1", "P4FR2",
                  "P4", "VEFF", "PARUE", "PARU2", "PHL2", "PHF3", "LA1S",
                  "LAFV", "LAFR", "SLAS", "LSPHS", "LSPHE", "TIL#S",
                  "TIPHE", "TIFAC", "TDPHS", "TDPHE", "TDFAC", "RDGS",
                  "HTSTD", "AWNS", "KCAN", "RS%S", "GN%S", "GN%MN", "TKFH"
    )

  }else if(model_code == "WHCRP"){

    tier_info = c("ECO#", "ECONAME", "PARUE", "PARU2", "PHL2", "PHF3",
                  "SLAS", "LSENI", "LSPHS", "LSPHE", "TIL#S", "TILPE",
                  "TIFAC", "TDPHS", "TDPHE", "TDFAC", "TDSF", "RDGS",
                  "HTSTD", "AWNS", "KCAN", "RS%A", "GN%S", "GN%MN", "GM%H",
                  "TKFH", "SSPHS", "SSPHE")

  }else{

    tier_info <- NULL

  }

  return(list(tier_info))
}


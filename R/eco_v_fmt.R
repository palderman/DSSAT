eco_v_fmt <- function(cul_file){

  model_code <- substr(basename(cul_file), 1, 5)

  if(model_code %in% c("ALFRM", "BMFRM", "BRFRM", "GGFRM")){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", MG = "%2.0f",
              TM = "%3.0f", THVAR = "%6.0f", "PL-EM" = "%6.0f",
              "EM-V1" = "%6.0f", "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
              PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
              "R7-R8" = "%6.0f", "FL-VS" = "%6.0f", TRIFL = "%6.2f",
              RWDTH = "%6.0f", RHGHT = "%6.0f", R1PPO = "%6.0f",
              OPTBI = "%6.0f", SLOBI = "%6.0f", RDRMT = "%6.3f",
              RDRMG = "%6.0f", RDRMM = "%6.3f", RCHDP = "%6.0f"
    )

  }else if(model_code %in% c("BHGRO", "BNGRO", "BRGRO",
                             "CBGRO", "CHGRO", "CIGRO",
                             "CNGRO", "COGRO", "CPGRO",
                             "FBGRO", "G0GRO", "GBGRO",
                             "PNGRO", "PPGRO", "PRGRO",
                             "QUGRO", "SBGRO", "SFGRO",
                             "SUGRO", "TMGRO", "VBGRO")){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", MG = "%2.0f",
              TM = "%3.0f", THVAR = "%6.0f", "PL-EM" = "%6.2f",
              "EM-V1" = "%6.1f", "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
              PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.0f",
              "R7-R8" = "%6.2f", "FL-VS" = "%6.2f", TRIFL = "%6.2f",
              RWDTH = "%6.2f", RHGHT = "%6.2f", R1PPO = "%6.3f",
              OPTBI = "%6.0f", SLOBI = "%6.3f", "PP-SS" = "%6.0f",
              LNHSH = "%6.1f", KCAN = "%6f", THRSH = "%6.0f",
              SDPRO = "%6.3f", SDLIP = "%6.3f")

  }else if(model_code == "BACER"){

    v_fmt = c("ECO#" = "%-6s", P1 = "%6.0f", P2FR1 = "%6.2f",
              P2 = "%6.0f", P3 = "%6.0f", P4FR1 = "%6.2f",
              P4FR2 = "%6.2f", P4 = "%6.0f", VEFF = "%6.1f",
              PARUE = "%6.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
              PHF3 = "%6.1f", LA1S = "%6.1f", LAFV = "%6.2f",
              LAFR = "%6.2f", SLAS = "%6.0f", LSPHS = "%6.1f",
              LSPHE = "%6.1f", "TIL#S" = "%6.1f", TIPHE = "%6.1f",
              TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.0f",
              TDFAC = "%6.1f", RDGS = "%6.0f", HTSTD = "%6.0f",
              AWNS = "%6.0f", KCAN = "%6.2f", "RS%S" = "%6.0f",
              "GN%S" = "%6.1f", "GN%MN" = "%6.0f", TKFH = "%6.0f"
    )

  }else if(model_code == "BACRP"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", PARUE = "%5.1f",
              PARU2 = "%6.1f", PHL2 = "%6.0f", PHF3 = "%6.1f",
              SLAS = "%6.0f", LSENI = "%6.1f", LSPHS = "%6.1f",
              LSPHE = "%6.1f", "TIL#S" = "%6.1f", TIPHE = "%6.0f",
              TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.1f",
              TDFAC = "%6.1f", TDSF = "%6.0f", RDGS = "%6.0f",
              HTSTD = "%6.0f", AWNS = "%6.0f", KCAN = "%6.2f",
              "RS%A" = "%6.0f", "GN%S" = "%6.0f", "GN%MN" = "%6.1f",
              "GM%H" = "%6.0f", TKFH = "%6.0f", SSPHS = "%6.1f",
              SSPHE = "%6.1f", GWTAF = "%6.1f", GWTAT = "%6.0f",
              "G#RF" = "%6.2f", RTNUP = "%6.3f", NUPNF = "%6.1f",
              NUPWF = "%6.0f")

  }else if(model_code == "BSCER"){

    v_fmt = c(ECO = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%5.0f", P20 = "%6.1f",
              DJTI = "%6.0f", GDDE = "%6.1f", DSGFT = "%7.0f",
              RUE = "%5.1f", KCAN = "%7.2f", TSEN = "%6f",
              CDAY = "%6f")

  }else if(model_code == "CSCAS"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", PARUE = "%5.1f",
              HTSTD = "%6.0f", DUSRI = "%6.0f", "SRN%S" = "%6.2f",
              BR1FX = "%6.0f", BR2FX = "%6.0f", BR3FX = "%6.0f",
              BR4FX = "%6.0f", BR5FX = "%6.0f", BR6FX = "%6.0f"
    )

  }else if(model_code == "CSYCA"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", PARUE = "%5.1f",
              TBLSZ = "%6.0f", "SRN%S" = "%6.2f", KCAN = "%6.2f",
              PGERM = "%6.0f", PPS1 = "%6.0f", PPS2 = "%6.0f",
              PPS3 = "%6.0f", PHTV = "%6.1f", PHSV = "%6.2f",
              RDGS = "%6.1f", RLWR = "%6.0f", WFSU = "%6.1f",
              RSUSE = "%6.2f", HMPC = "%6.0f")

  }else if(model_code == "MLCER"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%5.0f", ROPT = "%6.0f", DJTI = "%6.0f",
              GDDE = "%6.0f", RUE = "%6.1f", KCAN = "%6.2f"
    )

  }else if(model_code == "MZCER"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%5.0f", P20 = "%6.1f",
              DJTI = "%6.0f", GDDE = "%6.0f", DSGFT = "%7.0f",
              RUE = "%5.1f", KCAN = "%7.2f", TSEN = "%6f",
              CDAY = "%6f")

  }else if(model_code == "MZIXM"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%5.0f", ROPT = "%6.0f", P20 = "%5.0f",
              DJTI = "%7s", GDDE = "%6.0f", DSGFT = "%7.0f",
              RUE = "%5.1f", KCAN = "%7.2f", PSTM = "%6.2f",
              PEAR = "%6.2f", TSEN = "%6f", CDAY = "%6f"
    )

  }else if(model_code == "PTSUB"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-19s", RUE1 = "%4.1f",
              RUE2 = "%6.1f")

  }else if(model_code == "SCCAN"){

    v_fmt = c("ECO#" = "%-7s", "ECO-NAME" = "%-25s",
              DELTTMAX = "%8.2f", SWDF2AMP = "%15.1f",
              EXTCFN = "%15.2f", EXTCFST = "%15.2f", LFNMXEXT = "%15.0f",
              "AREAMX_CF(2)" = "%15.1f", "AREAMX_CF(3)" = "%15.1f",
              WIDCOR = "%15.0f", "WMAX_CF(1)" = "%15.4f",
              "WMAX_CF(2)" = "%15.3f", "WMAX_CF(3)" = "%15.2f",
              POPDECAY = "%15.3f", TTBASEEM = "%15.0f",
              TTBASELFEX = "%15.0f", LG_AMRANGE = "%15.0f",
              LG_GP_REDUC = "%15.2f", LDG_FI_REDUC = "%15.1f",
              "LMAX_CF(1)" = "%15.3f", "LMAX_CF(2)" = "%15.1f",
              "LMAX_CF(3)" = "%15.1f", MAXLFLENGTH = "%15.0f",
              MAXLFWIDTH = "%15.1f", TBASE_GE_EM = "%15.0f",
              TOPT_GE_EM = "%14.0f", TFin_GE_EM = "%16.0f",
              TBASE_LFEM = "%15.0f", TOPT_LFEM = "%15.0f",
              TFin_LFEM = "%15.0f", TBASE_TLREM = "%15.0f",
              TOPT_TLREM = "%15.0f", TFin_TLREM = "%15.0f",
              TBASE_LFSEN = "%15.0f", TOPT_LFSEN = "%15.0f",
              TFin_LFSEN = "%15.0f", TBASE_STKEX = "%15.0f",
              TOPT_STKEX = "%15.0f", TFin_STKEX = "%15.0f",
              TBASE_LFEX = "%15.0f", TOPT_LFEX = "%15.0f",
              TFin_LFEX = "%15.0f", TBASE_REX = "%15.0f",
              TOPT_REX = "%15.0f", TFin_REX = "%15.0f",
              TOPT_PHOT = "%15.0f", TOPT_PHO2 = "%15.0f",
              TFin_PHOT = "%15.0f", TBASE_RESP = "%15.0f",
              TOPT_RESP = "%15.0f", TFin_RESP = "%15.0f"
    )

  }else if(model_code == "SCCSP"){

    v_fmt = c(KCAN_ECO = "%10.1f", SMAX = "%6.0f", CAB = "%5.0f",
              CanLmtFac = "%11.3f", LfShdFac = "%10.2f",
              MINSHD = "%8.2f", StkSenFrac = "%12.5f",
              SENDAY = "%8.2f", XDAY = "%6.0f", YSLA = "%6.0f",
              XLI = "%9.2f", YVTR = "%9.4f", XVSHT = "%6.0f",
              YVSHT = "%6.2f", ZVSDI = "%6.2f", YVSWH = "%6.3f",
              XLFNUM = "%6.0f", YLFSZ = "%6.0f", XStkNum = "%5.0f",
              YLfFac = "%5.1f", XFRSU = "%6.0f", YFRSU = "%6.3f",
              XSENMX = "%6.0f", SENMAX = "%6.3f", XShdMX = "%6.0f",
              ShdMAX = "%6.3f", XSTAGE = "%6.0f", SENPOR = "%6.3f",
              XTMIN = "%6.0f", YLOSS = "%6.1f")

  }else if(model_code == "SCSAM"){

    v_fmt = c("ECO#" = "%-7s", "ECO-NAME" = "%-24s",
              NS_LF_TIL = "%9.0f", N_LF_MAX_ILA = "%15.0f",
              TB0PHO = "%15.0f", TB1PHO = "%15.0f", TB2PHO = "%15.0f",
              TBFPHO = "%15.0f", TBPER = "%15.0f", TBMAX_PER = "%15.0f",
              LTTHRESHOLD = "%15.1f", FDEADLF = "%15.2f",
              RDM = "%15.0f", DPERCOEFF = "%15.2f", RWUEP1 = "%15.1f",
              RWUEP2 = "%15.1f", T_MAX_WS_PHO = "%15.0f",
              T_MID_WS_PHO = "%15.1f", T_MIN_WS_PHO = "%15.1f",
              T_MAX_WS_EXP = "%15.0f", T_MID_WS_EXP = "%15.1f",
              T_MIN_WS_EXP = "%15.0f", FRAC_SUC_BG = "%15.1f",
              FRAC_HEX_BG = "%15.1f", INIT_PD_RAT = "%15.0f",
              IT_STR_TB_INI = "%15.0f", IT_STR_TO1 = "%15.0f",
              IT_STR_TO2 = "%15.0f", IT_STR_TB_END = "%15.0f",
              IT_STR_PF_MAX = "%15.2f", IT_STR_PF_MIN = "%15.0f",
              IT_STR_PF_TB = "%15.0f", IT_STR_PF_TM = "%15.0f",
              IT_STR_PF_TE = "%15.0f", IT_STR_PF_D = "%15.0f",
              IT_STR_T_RED = "%15.2f", IT_STR_W_RED = "%15.2f",
              MAX_PER_IT = "%15.0f", DSWAT_DDWS = "%15.6f",
              DSWAT_DSUC = "%15.5f", HEX_MIN = "%15.3f",
              SUC_ACC_INI = "%15.2f", DSUC_FRAC_TS = "%15.1f",
              TT_CHUMAT_LT = "%15.0f")

  }else if(model_code == "SGCER"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%6.0f", GDDE = "%6.0f",
              RUE = "%6.1f", KCAN = "%6.2f", STPC = "%6.1f",
              RTPC = "%6.2f", TILFC = "%6.0f", PLAM = "%6.0f"
    )

  }else if(model_code == "SUOIL"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%5.0f", P20 = "%6.0f",
              DJTI = "%6.0f", GDDE = "%6.1f", DSGFT = "%7.0f",
              RUE = "%5.1f", KCAN = "%7.0f", TSEN = "%6.0f",
              CDAY = "%6.0f")

  }else if(model_code == "SWCER"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%6.0f", P20 = "%6.1f",
              DJTI = "%6.0f", GDDE = "%6.0f", DSGFT = "%6.0f",
              RUE = "%6.1f", KCAN = "%6.2f", TSEN = "%6f",
              CDAY = "%6f")

  }else if(model_code == "TFAPS"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.1f",
              TOPT = "%6.0f", ROPT = "%6.0f", TTOP = "%6.0f",
              P20 = "%6.1f", VREQ = "%6.0f", GDDE = "%6.1f",
              DSGFT = "%6.0f", RUE1 = "%6.1f", RUE2 = "%6.1f",
              KVAL1 = "%6.1f", KVAL2 = "%6.1f", SLAP2 = "%6.0f",
              TC1P1 = "%6.1f", TC1P2 = "%6.1f", DTNP1 = "%6.3f",
              PLGP1 = "%6.0f", PLGP2 = "%6.1f", P2AF = "%6.1f",
              P3AF = "%6.0f", P4AF = "%6.0f", P5AF = "%6.0f",
              P6AF = "%6.0f", ADLAI = "%6.0f", ADTIL = "%6.0f",
              ADPHO = "%6.0f", STEMN = "%6.0f", MXNUP = "%6.1f",
              MXNCR = "%6.2f", WFNU = "%6.0f", PNUPR = "%6.2f",
              EXNO3 = "%6.2f", MNNO3 = "%6.0f", EXNH4 = "%6.1f",
              MNNH4 = "%6.0f", INGWT = "%6.2f", INGNC = "%6.2f",
              FREAR = "%6.2f", MNNCR = "%6.2f", GPPSS = "%6.0f",
              GPPES = "%6.0f", MXGWT = "%6.0f", MNRTN = "%6.1f",
              NOMOB = "%6.2f", RTDP1 = "%6.0f", RTDP2 = "%6.0f",
              FOZ1 = "%6f", SFOZ1 = "%6f", TSEN = "%6.1f",
              CDAY = "%6.0f")

  }else if(model_code == "WHAPS"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
              TOPT = "%6.0f", ROPT = "%6.0f", TTOP = "%6.0f",
              P20 = "%6.1f", VREQ = "%6.0f", GDDE = "%6.1f",
              DSGFT = "%6.0f", RUE1 = "%6.1f", RUE2 = "%6.1f",
              KVAL1 = "%6.2f", KVAL2 = "%6.2f", SLAP2 = "%6.0f",
              TC1P1 = "%6.1f", TC1P2 = "%6.1f", DTNP1 = "%6.3f",
              PLGP1 = "%6.0f", PLGP2 = "%6.1f", P2AF = "%6.1f",
              P3AF = "%6.0f", P4AF = "%6.0f", P5AF = "%6.0f",
              P6AF = "%6.0f", ADLAI = "%6.1f", ADTIL = "%6.0f",
              ADPHO = "%6.0f", STEMN = "%6.0f", MXNUP = "%6.1f",
              MXNCR = "%6.2f", WFNU = "%6.0f", PNUPR = "%6.2f",
              EXNO3 = "%6.2f", MNNO3 = "%6.0f", EXNH4 = "%6.1f",
              MNNH4 = "%6.0f", INGWT = "%6.1f", INGNC = "%6.2f",
              FREAR = "%6.2f", MNNCR = "%6.2f", GPPSS = "%6.0f",
              GPPES = "%6.0f", MXGWT = "%6.0f", MNRTN = "%6.1f",
              NOMOB = "%6.2f", RTDP1 = "%6.0f", RTDP2 = "%6.0f",
              FOZ1 = "%6.2f", SFOZ1 = "%6.2f", TSEN = "%6.1f",
              CDAY = "%6.0f")

  }else if(model_code == "WHCER"){

    v_fmt = c("ECO#" = "%-6s", P1 = "%6.0f", P2FR1 = "%6.2f",
              P2 = "%6.0f", P3 = "%6.0f", P4FR1 = "%6.2f",
              P4FR2 = "%6.2f", P4 = "%6.0f", VEFF = "%6.1f",
              PARUE = "%6.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
              PHF3 = "%6.1f", LA1S = "%6.0f", LAFV = "%6.2f",
              LAFR = "%6.2f", SLAS = "%6.0f", LSPHS = "%6.1f",
              LSPHE = "%6.1f", "TIL#S" = "%6.1f", TIPHE = "%6.2f",
              TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.0f",
              TDFAC = "%6.1f", RDGS = "%6.0f", HTSTD = "%6.0f",
              AWNS = "%6.0f", KCAN = "%6.2f", "RS%S" = "%6.0f",
              "GN%S" = "%6.1f", "GN%MN" = "%6.1f", TKFH = "%6.0f"
    )

  }else if(model_code == "WHCRP"){

    v_fmt = c("ECO#" = "%-7s", ECONAME = "%-18s", PARUE = "%5.1f",
              PARU2 = "%6.1f", PHL2 = "%6.0f", PHF3 = "%6.1f",
              SLAS = "%6.0f", LSENI = "%6.1f", LSPHS = "%6.1f",
              LSPHE = "%6.1f", "TIL#S" = "%6.1f", TILPE = "%6.1f",
              TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.1f",
              TDFAC = "%6.1f", TDSF = "%6.0f", RDGS = "%6.0f",
              HTSTD = "%6.0f", AWNS = "%6.0f", KCAN = "%6.2f",
              "RS%A" = "%6.0f", "GN%S" = "%6.1f", "GN%MN" = "%6.1f",
              "GM%H" = "%6.0f", TKFH = "%6.0f", SSPHS = "%6.1f",
              SSPHE = "%6.1f")

  }

  return(v_fmt)
}
# # all_v_fmt <-
#   all_eco %>%
#   pull(file_name) %>%
#   basename() %>%
#   substr(1, 5) %>%
#   str_subset("^.{2}((FRM)|(GRO))", negate = TRUE) %>%
#   c("FRM", "GRO", .) %>%
#   `names<-`(., .) %>%
#   lapply(\(code_regex){
#     tmp <- all_eco %>%
#       mutate(code = substr(basename(file_name), 1, 5),
#              v_fmt = lapply(contents, \(.x) attr(.x, "v_fmt"))) %>%
#       filter(str_detect(code, code_regex)) %>%
#       select(code, v_fmt) %>%
#       pull(v_fmt) %>%
#       bind_rows() %>%
#       lapply(unique) %>%
#       lapply(sort) %>%
#       lapply(\(.x) tail(.x, 1)) %>%
#       unlist() %>%
#       deparse(width.cutoff = 40)
#
#     tmp[1] <- paste0("v_fmt = ", tmp[1])
#
#     tmp <- c(
#       paste0("}else if(model_code == \"", code_regex, "\"){"),
#       tmp)
#
#     return(tmp)
#   }) %>%
#   unlist() %>%
#   c("}") %>%
#   clipr::write_clip()

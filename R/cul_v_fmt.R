# # all_v_fmt <-
#   all_cul %>%
#   pull(file_name) %>%
#   basename() %>%
#   substr(1, 5) %>%
#   str_subset("^.{2}((FRM)|(GRO))", negate = TRUE) %>%
#   c("FRM", "GRO", .) %>%
#   `names<-`(., .) %>%
#   lapply(\(code_regex){
#     tmp <- all_cul %>%
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
#       tmp,
#       "}")
#
#     return(tmp)
#   }) %>%
#   unlist() %>%
#   clipr::write_clip()
cul_v_fmt <- function(cul_file){

  model_code <- substr(basename(cul_file), 1, 5)

  if(model_code %in% c("ALFRM", "BMFRM", "BRFRM", "GGFRM")){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.3f",
              "EM-FL" = "%6.0f", "FL-SH" = "%6.0f", "FL-SD" = "%6.0f",
              "SD-PM" = "%6.0f", "FL-LF" = "%6.0f", LFMAX = "%6.2f",
              SLAVR = "%6.0f", SIZLF = "%6.0f", XFRT = "%6.2f",
              WTPSD = "%6.2f", SFDUR = "%6.0f", SDPDV = "%6.2f",
              PODUR = "%6.0f", THRSH = "%6.0f", SDPRO = "%6.3f",
              SDLIP = "%6.3f")

  }else if(model_code %in% c("BHGRO", "BNGRO", "BRGRO",
                             "CBGRO", "CHGRO", "CIGRO",
                             "CNGRO", "COGRO", "CPGRO",
                             "FBGRO", "G0GRO", "GBGRO",
                             "PNGRO", "PPGRO", "PRGRO",
                             "QUGRO", "SBGRO", "SFGRO",
                             "SUGRO", "TMGRO", "VBGRO")){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
              "EM-FL" = "%6.2f", "FL-SH" = "%6.2f", "FL-SD" = "%6.2f",
              "SD-PM" = "%6.2f", "FL-LF" = "%6.2f", LFMAX = "%6.3f",
              SLAVR = "%6.1f", SIZLF = "%6.2f", XFRT = "%6.2f",
              WTPSD = "%6.4f", SFDUR = "%6.2f", SDPDV = "%6.2f",
              PODUR = "%6.1f", THRSH = "%6.1f", SDPRO = "%6.3f",
              SDLIP = "%6.3f", "VAR-NAME" = "%-16s")

  }else if(model_code == "BACER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", P1V = "%6.0f",
              P1D = "%6.0f", P5 = "%6.0f", G1 = "%6.0f",
              G2 = "%6.0f", G3 = "%6.1f", PHINT = "%6.0f"
    )

  }else if(model_code == "BACRP"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P2 = "%6.0f", P3 = "%6.0f", P4 = "%6.0f",
              P5 = "%6.0f", P6 = "%6.0f", P7 = "%6.0f",
              P8 = "%6.0f", VREQ = "%6.0f", VBASE = "%6.0f",
              VEFF = "%6.0f", PPS1 = "%6.0f", PPS2 = "%6.0f",
              PHINT = "%6.0f", LA1S = "%6.1f", LAFV = "%6.2f",
              LAFR = "%6.2f", SHWTS = "%6.1f", "G#WTS" = "%6.0f",
              GWTS = "%6.0f")

  }else if(model_code == "BSCER"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", P1 = "%6.0f", P2 = "%6.0f",
              P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.1f",
              PHINT = "%6.1f")

  }else if(model_code == "CSCAS"){
    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", PPS1 = "%6.0f",
              B01ND = "%6.0f", B12ND = "%6.0f", B23ND = "%6.0f",
              B34ND = "%6.0f", B45ND = "%6.0f", B56ND = "%6.0f",
              "SR#WT" = "%6.2f", SRFR = "%6.2f", HMPC = "%6.0f",
              PHINT = "%6.0f", LA1S = "%6.0f", LAXS = "%6.0f",
              LAXND = "%6.0f", LAXN2 = "%6.0f", LAFS = "%6.0f",
              LAFND = "%6.0f", SLAS = "%6.0f", LLIFA = "%6.0f",
              LPEFR = "%6.2f", STFR = "%6.2f")

  }else if(model_code == "CSYCA"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", B01ND = "%6.1f",
              B12ND = "%6.1f", B23ND = "%6.1f", B34ND = "%6.0f",
              BR1FX = "%6.1f", BR2FX = "%6.1f", BR3FX = "%6.1f",
              BR4FX = "%6.1f", LAXS = "%6.0f", SLAS = "%6.0f",
              LLIFA = "%6.0f", LPEFR = "%6.2f", LNSLP = "%6.1f",
              NODWT = "%6.2f", NODLT = "%6.0f")

  }else if(model_code == "MLCER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P2O = "%6.1f", P2R = "%6.1f", P5 = "%6.0f",
              G1 = "%6.2f", G4 = "%6.2f", PHINT = "%6.0f",
              GT = "%6.1f", G5 = "%6.0f")

  }else if(model_code == "MZCER"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.3f",
              P5 = "%6.1f", G2 = "%6.1f", G3 = "%6.2f",
              PHINT = "%6.2f")

  }else if(model_code == "MZIXM"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.2f",
              P5 = "%6.1f", G2 = "%6.1f", G3 = "%6.2f",
              PHINT = "%6.1f", AX = "%6.0f", ALL = "%6.0f"
    )

  }else if(model_code == "PIALO"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", TC = "%6.0f",
              P1 = "%6.0f", P2 = "%6.0f", P3 = "%6.0f",
              P4 = "%6.0f", P5 = "%6.0f", P6 = "%6.0f",
              P7 = "%6.0f", P8 = "%6.0f", G1 = "%6.0f",
              G2 = "%6.0f", G3 = "%6.0f", PHINT = "%6.0f"
    )

  }else if(model_code == "PTSUB"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", G2 = "%6.0f",
              G3 = "%6.1f", PD = "%6.1f", P2 = "%6.1f",
              TC = "%6.0f")

  }else if(model_code == "RICER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.1f",
              P2R = "%6.2f", P5 = "%6.1f", P2O = "%6.2f",
              G1 = "%6.2f", G2 = "%6.4f", G3 = "%6.2f",
              PHINT = "%6.0f", THOT = "%6.1f", TCLDP = "%6.0f",
              TCLDF = "%6.0f")

  }else if(model_code == "SCCAN"){
    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", MaxPARCE = "%15.2f",
              APFMX = "%15.3f", STKPFMAX = "%15.2f", SUCA = "%15.2f",
              TBFT = "%15.0f", LFMAX = "%15.0f", MXLFAREA = "%15.0f",
              MXLFARNO = "%15.0f", PI1 = "%15.0f", PI2 = "%15.0f",
              PSWITCH = "%15.0f", TTPLNTEM = "%15.0f",
              TTRATNEM = "%15.0f", CHUPIBASE = "%15.2f",
              TT_POPGROWTH = "%15.0f", POPTT16 = "%15.1f",
              TAR0 = "%15.3f", TDELAY = "%15.0f", LER0 = "%15.2f",
              SER0 = "%15.2f", LG_AMBASE = "%15.0f", AQP_UP5 = "%15.2f"
    )

  }else if(model_code == "SCCSP"){
    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", LFMAX = "%6.1f",
              PHTMX = "%6.1f", Stalk = "%6.3f", Sucro = "%6.3f",
              Null1 = "%6.0f", PLF1 = "%6.3f", PLF2 = "%6.3f",
              Gamma = "%6.3f", StkB = "%6.3f", StkM = "%6.3f",
              Null3 = "%6.0f", SIZLF = "%6.0f", LIsun = "%6.3f",
              LIshd = "%6.3f", Null4 = "%6.0f", TB_1 = "%6.1f",
              TO1_1 = "%6.0f", TO2_1 = "%6.0f", TM_1 = "%6.0f",
              PI1 = "%6.2f", PI2 = "%6.2f", DTPI = "%6.1f",
              LSFAC = "%6.1f", Null5 = "%6.0f", LI1 = "%6.3f",
              TELOM = "%6.1f", TB_2 = "%6.0f", TO1_2 = "%6.0f",
              TO2_2 = "%6.0f", TM_2 = "%6.0f", Ph1P = "%6.1f",
              Ph1R = "%6.0f", Ph2 = "%6.2f", Ph3 = "%6.0f",
              Ph4 = "%6.0f", StHrv = "%6.0f", RTNFC = "%6.2f",
              MinGr = "%6.2f", Null7 = "%6.0f", RE30C = "%6.3f",
              RL30C = "%6.3f", R30C2 = "%6.3f")

  }else if(model_code == "SCSAM"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", MAXGL = "%15.0f",
              N_LF_STK_EM = "%15.0f", N_LF_IT_FORM = "%15.0f",
              MAXDGL = "%15.0f", AMAX = "%15.1f", EFF = "%15.3f",
              CHUSTK = "%15.0f", CHUPEAK = "%15.0f", CHUDEC = "%15.0f",
              CHUMAT = "%15.0f", POPMAT = "%15.1f", POPPEAK = "%15.0f",
              TILLOCHRON = "%15.1f", PHYLLOCHRON = "%15.0f",
              SLA = "%15.0f", MLA = "%15.0f", PLASTOCHRON = "%15.0f",
              INIT_LF_AREA = "%15.0f", MAX_INI_LA = "%15.0f",
              MAX_IT_DW = "%15.0f", MID_TT_IT_GRO = "%15.0f",
              END_TT_IT_GRO = "%15.0f", MID_TT_LF_GRO = "%15.0f",
              END_TT_LF_GRO = "%15.0f")

  }else if(model_code == "SGCER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P2 = "%6.0f", P2O = "%6.1f", P2R = "%6.1f",
              PANTH = "%6.1f", P3 = "%6.1f", P4 = "%6.1f",
              P5 = "%6.0f", PHINT = "%6.0f", G1 = "%6.1f",
              G2 = "%6.1f", PBASE = "%6f", PSAT = "%6f"
    )

  }else if(model_code == "SUOIL"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.2f",
              P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.2f",
              O1 = "%6.0f")

  }else if(model_code == "SWCER"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", P1 = "%6.0f", P2 = "%6.1f",
              P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.1f",
              PHINT = "%6.0f")

  }else if(model_code == "TFAPS"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", VSEN = "%6.0f", PPSEN = "%6.1f",
              P1 = "%6.0f", P5 = "%6.0f", PHINT = "%6.0f",
              GRNO = "%6.0f", MXFIL = "%6.1f", STMMX = "%6.0f",
              SLAP1 = "%6.0f")

  }else if(model_code == "TFCER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.1f",
              P2R = "%6.2f", P5 = "%6.1f", P2O = "%6.2f",
              G1 = "%6.0f", G2 = "%6.4f", G3 = "%6.3f",
              PHINT = "%6.0f", THOT = "%6.2f", TCLDP = "%6.0f",
              TCLDF = "%6.0f")

  }else if(model_code == "TNARO"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P3 = "%6.0f", P4 = "%6.0f", P5 = "%6.0f",
              G2 = "%6.0f", G3 = "%6.1f", G4 = "%6.0f",
              PHINT = "%6.0f", PCINT = "%6.0f", PCGRD = "%6.2f"
    )

  }else if(model_code == "TRARO"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P3 = "%6.0f", P4 = "%6.0f", P5 = "%6.0f",
              G2 = "%6.1f", G3 = "%6.2f", G4 = "%6.1f",
              PHINT = "%6.0f", PCINT = "%6.0f", PCGRD = "%7.0f"
    )

  }else if(model_code == "WHAPS"){

    v_fmt = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
              "ECO#" = "%7s", VSEN = "%6.2f", PPSEN = "%6.2f",
              P1 = "%6.0f", P5 = "%6.0f", PHINT = "%6.0f",
              GRNO = "%6.2f", MXFIL = "%6.2f", STMMX = "%6.2f",
              SLAP1 = "%6.0f")

  }else if(model_code == "WHCER"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", P1V = "%6.0f",
              P1D = "%6.0f", P5 = "%6.0f", G1 = "%6.0f",
              G2 = "%6.0f", G3 = "%6.1f", PHINT = "%6.0f"
    )

  }else if(model_code == "WHCRP"){

    v_fmt = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
              "EXP#" = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
              P2 = "%6.0f", P3 = "%6.0f", P4 = "%6.0f",
              P5 = "%6.0f", P6 = "%6.0f", P7 = "%6.0f",
              P8 = "%6.1f", VREQ = "%6.4f", VBASE = "%6.0f",
              VEFF = "%6.2f", PPS1 = "%6.0f", PPS2 = "%6.0f",
              PHINT = "%6.0f", LA1S = "%6.1f", LAFV = "%6.2f",
              LAFR = "%6.2f", SHWTS = "%6.1f", "G#WTS" = "%6.1f",
              GWTS = "%6.0f")

  }else{
    warning(paste0("v_fmt not found for model_code = ", model_code,
                   "\n extracted from cul_file = ", cul_file))
    v_fmt <- NULL
  }
  return(v_fmt)
}

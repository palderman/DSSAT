# "@YEAR DOY   DAS   SRAA  TMAXA  TMINA    REFA    EOAA    EOPA    EOSA    KCAA    KCBA    KEAA    ETAA    EPAA    ESAA    EFAA    EMAA    EOAC    ETAC    EPAC    ESAC    EFAC    EMAC    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D   TRWUD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   22,     "SRAA",# "   SRAA",
       22,   29,    "TMAXA",# "  TMAXA",
       29,   36,    "TMINA",# "  TMINA",
       36,   44,     "REFA",#"    REFA",
       44,   52,     "EOAA",#"    EOAA",
       52,   60,     "EOPA",#"    EOPA",
       60,   68,     "EOSA",#"    EOSA",
       68,   76,     "KCAA",#"    KCAA",
       76,   84,     "KCBA",#"    KCBA",
       84,   92,     "KEAA",#"    KEAA",
       92,  100,     "ETAA",#"    ETAA",
      100,  108,     "EPAA",#"    EPAA",
      108,  116,     "ESAA",#"    ESAA",
      116,  124,     "EFAA",#"    EFAA",
      124,  132,     "EMAA",#"    EMAA",
      132,  140,     "EOAC",#"    EOAC",
      140,  148,     "ETAC",#"    ETAC",
      148,  156,     "EPAC",#"    EPAC",
      156,  164,     "ESAC",#"    ESAC",
      164,  172,     "EFAC",#"    EFAC",
      172,  180,     "EMAC",#"    EMAC",
      180,  188,     "ES1D",#"    ES1D",
      188,  196,     "ES2D",#"    ES2D",
      196,  204,     "ES3D",#"    ES3D",
      204,  212,     "ES4D",#"    ES4D",
      212,  220,     "ES5D",#"    ES5D",
      220,  228,     "ES6D",#"    ES6D",
      228,  236,     "ES7D",#"    ES7D",
      236,  244,     "ES8D",#"    ES8D",
      244,  252,     "ES9D",#"    ES9D",
      252,  260,    "TRWUD" #"   TRWUD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   SRAA  TMAXA  TMINA    REFA    EOAA    EOPA    EOSA    KCAA    KCBA    KEAA    ETAA    EPAA    ESAA    EFAA    EMAA    EOAC    ETAC    EPAC    ESAC    EFAC    EMAC    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D   TRWUD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   SRAA  TMAXA  TMINA    REFA    EOAA    EOPA    EOSA    KCAA    KCBA    KEAA    ETAA    EPAA    ESAA    EFAA    EMAA    EOAC    ETAC    EPAC    ESAC    EFAC    EMAC    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D   TRWUD")

# "@RUN EXCODE      TRNO RN CR EDAPS EDAPM DRAPS DRAPM TSAPS TSAPM ADAPS ADAPM MDAPS MDAPM HWAMS HWAMM HWUMS HWUMM H#AMS H#AMM H#GMS H#GMM LAIXS LAIXM L#SMS L#SMM T#AMS T#AMM CWAMS CWAMM VWAMS VWAMM HIAMS HIAMM HN%MS HN%MM VN%MS VN%MM CNAMS CNAMM HNAMS HNAMM HINMS HINMM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#       ~check,
        0,    4,      "RUN",#       "@RUN",
        4,   15,   "EXCODE",#" EXCODE    ",
       15,   21,     "TRNO",#     "  TRNO",
       21,   24,       "RN",#        " RN",
       24,   27,       "CR",#        " CR",
       27,   33,    "EDAPS",#     " EDAPS",
       33,   39,    "EDAPM",#     " EDAPM",
       39,   45,    "DRAPS",#     " DRAPS",
       45,   51,    "DRAPM",#     " DRAPM",
       51,   57,    "TSAPS",#     " TSAPS",
       57,   63,    "TSAPM",#     " TSAPM",
       63,   69,    "ADAPS",#     " ADAPS",
       69,   75,    "ADAPM",#     " ADAPM",
       75,   81,    "MDAPS",#     " MDAPS",
       81,   87,    "MDAPM",#     " MDAPM",
       87,   93,    "HWAMS",#     " HWAMS",
       93,   99,    "HWAMM",#     " HWAMM",
       99,  105,    "HWUMS",#     " HWUMS",
      105,  111,    "HWUMM",#     " HWUMM",
      111,  117,    "H#AMS",#     " H#AMS",
      117,  123,    "H#AMM",#     " H#AMM",
      123,  129,    "H#GMS",#     " H#GMS",
      129,  135,    "H#GMM",#     " H#GMM",
      135,  141,    "LAIXS",#     " LAIXS",
      141,  147,    "LAIXM",#     " LAIXM",
      147,  153,    "L#SMS",#     " L#SMS",
      153,  159,    "L#SMM",#     " L#SMM",
      159,  165,    "T#AMS",#     " T#AMS",
      165,  171,    "T#AMM",#     " T#AMM",
      171,  177,    "CWAMS",#     " CWAMS",
      177,  183,    "CWAMM",#     " CWAMM",
      183,  189,    "VWAMS",#     " VWAMS",
      189,  195,    "VWAMM",#     " VWAMM",
      195,  201,    "HIAMS",#     " HIAMS",
      201,  207,    "HIAMM",#     " HIAMM",
      207,  213,    "HN%MS",#     " HN%MS",
      213,  219,    "HN%MM",#     " HN%MM",
      219,  225,    "VN%MS",#     " VN%MS",
      225,  231,    "VN%MM",#     " VN%MM",
      231,  237,    "CNAMS",#     " CNAMS",
      237,  243,    "CNAMM",#     " CNAMM",
      243,  249,    "HNAMS",#     " HNAMS",
      249,  255,    "HNAMM",#     " HNAMM",
      255,  261,    "HINMS",#     " HINMS",
      261,  267,    "HINMM" #     " HINMM"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RUN EXCODE      TRNO RN CR EDAPS EDAPM DRAPS DRAPM TSAPS TSAPM ADAPS ADAPM MDAPS MDAPM HWAMS HWAMM HWUMS HWUMM H#AMS H#AMM H#GMS H#GMM LAIXS LAIXM L#SMS L#SMM T#AMS T#AMM CWAMS CWAMM VWAMS VWAMM HIAMS HIAMM HN%MS HN%MM VN%MS VN%MM CNAMS CNAMM HNAMS HNAMM HINMS HINMM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RUN EXCODE      TRNO RN CR EDAPS EDAPM DRAPS DRAPM TSAPS TSAPM ADAPS ADAPM MDAPS MDAPM HWAMS HWAMM HWUMS HWUMM H#AMS H#AMM H#GMS H#GMM LAIXS LAIXM L#SMS L#SMM T#AMS T#AMM CWAMS CWAMM VWAMS VWAMM HIAMS HIAMM HN%MS HN%MM VN%MS VN%MM CNAMS CNAMM HNAMS HNAMM HINMS HINMM")

# "@ LNUM AREAP AREA1 AREAT AREAS  T#PL  T#AL  WFLF  NFLF  AFLF  TFLF DAYSG"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "LNUM",#"@ LNUM",
        6,   12,    "AREAP",#" AREAP",
       12,   18,    "AREA1",#" AREA1",
       18,   24,    "AREAT",#" AREAT",
       24,   30,    "AREAS",#" AREAS",
       30,   36,     "T#PL",#"  T#PL",
       36,   42,     "T#AL",#"  T#AL",
       42,   48,     "WFLF",#"  WFLF",
       48,   54,     "NFLF",#"  NFLF",
       54,   60,     "AFLF",#"  AFLF",
       60,   66,     "TFLF",#"  TFLF",
       66,   72,    "DAYSG" #" DAYSG"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LNUM AREAP AREA1 AREAT AREAS  T#PL  T#AL  WFLF  NFLF  AFLF  TFLF DAYSG",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LNUM AREAP AREA1 AREAT AREAS  T#PL  T#AL  WFLF  NFLF  AFLF  TFLF DAYSG")

# "@YEAR DOY   DAS    MCFD   MDEPD    MWAD    MWTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   23,     "MCFD",#"    MCFD",
       23,   31,    "MDEPD",#"   MDEPD",
       31,   39,     "MWAD",#"    MWAD",
       39,   47,     "MWTD" #"    MWTD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS    MCFD   MDEPD    MWAD    MWTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS    MCFD   MDEPD    MWAD    MWTD")

# "@YEAR DOY   DAS   N2OEC    N2EC    NOEC   CO2TC    NDNC    NITC   N2ODC   N2ONC   N2FLC   NOFLC   N2OED    N2ED    NOED   CO2TD    NDND   NITRD   N2ODD   N2OND   N2FLD   NOFLD   NDN1D   NDN2D   NDN3D   NDN4D   NDN5D   NDN6D   NDN7D   NDN8D   NDN9D   NIT1D   NIT2D   NIT3D   NIT4D   NIT5D   NIT6D   NIT7D   NIT8D   NIT9D   N2O1D   N2O2D   N2O3D   N2O4D   N2O5D   N2O6D   N2O7D   N2O8D   N2O9D   N2F1D   N2F2D   N2F3D   N2F4D   N2F5D   N2F6D   N2F7D   N2F8D   N2F9D   NOF1D   NOF2D   NOF3D   NOF4D   NOF5D   NOF6D   NOF7D   NOF8D   NOF9D   "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   23,    "N2OEC",#"   N2OEC",
       23,   31,     "N2EC",#"    N2EC",
       31,   39,     "NOEC",#"    NOEC",
       39,   47,    "CO2TC",#"   CO2TC",
       47,   55,     "NDNC",#"    NDNC",
       55,   63,     "NITC",#"    NITC",
       63,   71,    "N2ODC",#"   N2ODC",
       71,   79,    "N2ONC",#"   N2ONC",
       79,   87,    "N2FLC",#"   N2FLC",
       87,   95,    "NOFLC",#"   NOFLC",
       95,  103,    "N2OED",#"   N2OED",
      103,  111,     "N2ED",#"    N2ED",
      111,  119,     "NOED",#"    NOED",
      119,  127,    "CO2TD",#"   CO2TD",
      127,  135,     "NDND",#"    NDND",
      135,  143,    "NITRD",#"   NITRD",
      143,  151,    "N2ODD",#"   N2ODD",
      151,  159,    "N2OND",#"   N2OND",
      159,  167,    "N2FLD",#"   N2FLD",
      167,  175,    "NOFLD",#"   NOFLD",
      175,  183,    "NDN1D",#"   NDN1D",
      183,  191,    "NDN2D",#"   NDN2D",
      191,  199,    "NDN3D",#"   NDN3D",
      199,  207,    "NDN4D",#"   NDN4D",
      207,  215,    "NDN5D",#"   NDN5D",
      215,  223,    "NDN6D",#"   NDN6D",
      223,  231,    "NDN7D",#"   NDN7D",
      231,  239,    "NDN8D",#"   NDN8D",
      239,  247,    "NDN9D",#"   NDN9D",
      247,  255,    "NIT1D",#"   NIT1D",
      255,  263,    "NIT2D",#"   NIT2D",
      263,  271,    "NIT3D",#"   NIT3D",
      271,  279,    "NIT4D",#"   NIT4D",
      279,  287,    "NIT5D",#"   NIT5D",
      287,  295,    "NIT6D",#"   NIT6D",
      295,  303,    "NIT7D",#"   NIT7D",
      303,  311,    "NIT8D",#"   NIT8D",
      311,  319,    "NIT9D",#"   NIT9D",
      319,  327,    "N2O1D",#"   N2O1D",
      327,  335,    "N2O2D",#"   N2O2D",
      335,  343,    "N2O3D",#"   N2O3D",
      343,  351,    "N2O4D",#"   N2O4D",
      351,  359,    "N2O5D",#"   N2O5D",
      359,  367,    "N2O6D",#"   N2O6D",
      367,  375,    "N2O7D",#"   N2O7D",
      375,  383,    "N2O8D",#"   N2O8D",
      383,  391,    "N2O9D",#"   N2O9D",
      391,  399,    "N2F1D",#"   N2F1D",
      399,  407,    "N2F2D",#"   N2F2D",
      407,  415,    "N2F3D",#"   N2F3D",
      415,  423,    "N2F4D",#"   N2F4D",
      423,  431,    "N2F5D",#"   N2F5D",
      431,  439,    "N2F6D",#"   N2F6D",
      439,  447,    "N2F7D",#"   N2F7D",
      447,  455,    "N2F8D",#"   N2F8D",
      455,  463,    "N2F9D",#"   N2F9D",
      463,  471,    "NOF1D",#"   NOF1D",
      471,  479,    "NOF2D",#"   NOF2D",
      479,  487,    "NOF3D",#"   NOF3D",
      487,  495,    "NOF4D",#"   NOF4D",
      495,  503,    "NOF5D",#"   NOF5D",
      503,  511,    "NOF6D",#"   NOF6D",
      511,  519,    "NOF7D",#"   NOF7D",
      519,  527,    "NOF8D",#"   NOF8D",
      527,  535,    "NOF9D" #"   NOF9D"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   N2OEC    N2EC    NOEC   CO2TC    NDNC    NITC   N2ODC   N2ONC   N2FLC   NOFLC   N2OED    N2ED    NOED   CO2TD    NDND   NITRD   N2ODD   N2OND   N2FLD   NOFLD   NDN1D   NDN2D   NDN3D   NDN4D   NDN5D   NDN6D   NDN7D   NDN8D   NDN9D   NIT1D   NIT2D   NIT3D   NIT4D   NIT5D   NIT6D   NIT7D   NIT8D   NIT9D   N2O1D   N2O2D   N2O3D   N2O4D   N2O5D   N2O6D   N2O7D   N2O8D   N2O9D   N2F1D   N2F2D   N2F3D   N2F4D   N2F5D   N2F6D   N2F7D   N2F8D   N2F9D   NOF1D   NOF2D   NOF3D   NOF4D   NOF5D   NOF6D   NOF7D   NOF8D   NOF9D   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   N2OEC    N2EC    NOEC   CO2TC    NDNC    NITC   N2ODC   N2ONC   N2FLC   NOFLC   N2OED    N2ED    NOED   CO2TD    NDND   NITRD   N2ODD   N2OND   N2FLD   NOFLD   NDN1D   NDN2D   NDN3D   NDN4D   NDN5D   NDN6D   NDN7D   NDN8D   NDN9D   NIT1D   NIT2D   NIT3D   NIT4D   NIT5D   NIT6D   NIT7D   NIT8D   NIT9D   N2O1D   N2O2D   N2O3D   N2O4D   N2O5D   N2O6D   N2O7D   N2O8D   N2O9D   N2F1D   N2F2D   N2F3D   N2F4D   N2F5D   N2F6D   N2F7D   N2F8D   N2F9D   NOF1D   NOF2D   NOF3D   NOF4D   NOF5D   NOF6D   NOF7D   NOF8D   NOF9D   ")

# "@     VARIABLE                             SIMULATED     MEASURED"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#                                  ~check,
        0,   14, "VARIABLE",#                        "@     VARIABLE",
       14,   52,"SIMULATED",#"                             SIMULATED",
       52,   65, "MEASURED" #                         "     MEASURED"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@     VARIABLE                             SIMULATED     MEASURED",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@     VARIABLE                             SIMULATED     MEASURED")

# "@YEAR DOY   DAS   DAP TMEAN  GSTD  RSTD LAIPD LAISD  LAID  CHTD SDWAD SNWLD SNWSD  H#AD  HWUD SHRTD  PTFD  RDPD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D RL10D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "YEAR",# "@YEAR",
        5,    9,      "DOY",#  " DOY",
        9,   15,      "DAS",#"   DAS",
       15,   21,      "DAP",#"   DAP",
       21,   27,    "TMEAN",#" TMEAN",
       27,   33,     "GSTD",#"  GSTD",
       33,   39,     "RSTD",#"  RSTD",
       39,   45,    "LAIPD",#" LAIPD",
       45,   51,    "LAISD",#" LAISD",
       51,   57,     "LAID",#"  LAID",
       57,   63,     "CHTD",#"  CHTD",
       63,   69,    "SDWAD",#" SDWAD",
       69,   75,    "SNWLD",#" SNWLD",
       75,   81,    "SNWSD",#" SNWSD",
       81,   87,     "H#AD",#"  H#AD",
       87,   93,     "HWUD",#"  HWUD",
       93,   99,    "SHRTD",#" SHRTD",
       99,  105,     "PTFD",#"  PTFD",
      105,  111,     "RDPD",#"  RDPD",
      111,  117,     "RL1D",#"  RL1D",
      117,  123,     "RL2D",#"  RL2D",
      123,  129,     "RL3D",#"  RL3D",
      129,  135,     "RL4D",#"  RL4D",
      135,  141,     "RL5D",#"  RL5D",
      141,  147,     "RL6D",#"  RL6D",
      147,  153,     "RL7D",#"  RL7D",
      153,  159,     "RL8D",#"  RL8D",
      159,  165,     "RL9D",#"  RL9D",
      165,  171,    "RL10D" #" RL10D"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   DAP TMEAN  GSTD  RSTD LAIPD LAISD  LAID  CHTD SDWAD SNWLD SNWSD  H#AD  HWUD SHRTD  PTFD  RDPD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D RL10D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   DAP TMEAN  GSTD  RSTD LAIPD LAISD  LAID  CHTD SDWAD SNWLD SNWSD  H#AD  HWUD SHRTD  PTFD  RDPD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D RL10D")

# "@YEAR DOY   DAS   DAP TMEAN  GSTD    DU VRNFD DYLFD TFGEM  WFGE  TFPD  WFPD  NFPD CO2FD RSFPD  TFGD  WFGD  NFGD  WFTD  NFTD WAVRD WUPRD  SWXD  EOPD  SNXD LN%RD SN%RD RN%RD      "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "YEAR",# "@YEAR",
        5,    9,      "DOY",#  " DOY",
        9,   15,      "DAS",#"   DAS",
       15,   21,      "DAP",#"   DAP",
       21,   27,    "TMEAN",#" TMEAN",
       27,   33,     "GSTD",#"  GSTD",
       33,   39,       "DU",#"    DU",
       39,   45,    "VRNFD",#" VRNFD",
       45,   51,    "DYLFD",#" DYLFD",
       51,   57,    "TFGEM",#" TFGEM",
       57,   63,     "WFGE",#"  WFGE",
       63,   69,     "TFPD",#"  TFPD",
       69,   75,     "WFPD",#"  WFPD",
       75,   81,     "NFPD",#"  NFPD",
       81,   87,    "CO2FD",#" CO2FD",
       87,   93,    "RSFPD",#" RSFPD",
       93,   99,     "TFGD",#"  TFGD",
       99,  105,     "WFGD",#"  WFGD",
      105,  111,     "NFGD",#"  NFGD",
      111,  117,     "WFTD",#"  WFTD",
      117,  123,     "NFTD",#"  NFTD",
      123,  129,    "WAVRD",#" WAVRD",
      129,  135,    "WUPRD",#" WUPRD",
      135,  141,     "SWXD",#"  SWXD",
      141,  147,     "EOPD",#"  EOPD",
      147,  153,     "SNXD",#"  SNXD",
      153,  159,    "LN%RD",#" LN%RD",
      159,  165,    "SN%RD",#" SN%RD",
      165,  171,    "RN%RD" #" RN%RD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   DAP TMEAN  GSTD    DU VRNFD DYLFD TFGEM  WFGE  TFPD  WFPD  NFPD CO2FD RSFPD  TFGD  WFGD  NFGD  WFTD  NFTD WAVRD WUPRD  SWXD  EOPD  SNXD LN%RD SN%RD RN%RD      ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   DAP TMEAN  GSTD    DU VRNFD DYLFD TFGEM  WFGE  TFPD  WFPD  NFPD CO2FD RSFPD  TFGD  WFGD  NFGD  WFTD  NFTD WAVRD WUPRD  SWXD  EOPD  SNXD LN%RD SN%RD RN%RD      ")

# "@YEAR DOY   DAS   DAP TMEAN TKILL  GSTD  L#SD PARID PARUD  AWAD  LAID  SAID  CAID  TWAD SDWAD  RWAD  CWAD  LWAD  SWAD  HWAD  HIAD CHWAD  EWAD RSWAD SNWPD SNWLD SNWSD  RS%D  H#AD  HWUD  T#AD  SLAD  RDPD  PTFD  SWXD WAVRD WUPRD  WFTD  WFPD  WFGD  NFTD  NFPD  NFGD NUPRD  TFPD  TFGD VRNFD DYLFD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "YEAR",# "@YEAR",
        5,    9,      "DOY",#  " DOY",
        9,   15,      "DAS",#"   DAS",
       15,   21,      "DAP",#"   DAP",
       21,   27,    "TMEAN",#" TMEAN",
       27,   33,    "TKILL",#" TKILL",
       33,   39,     "GSTD",#"  GSTD",
       39,   45,     "L#SD",#"  L#SD",
       45,   51,    "PARID",#" PARID",
       51,   57,    "PARUD",#" PARUD",
       57,   63,     "AWAD",#"  AWAD",
       63,   69,     "LAID",#"  LAID",
       69,   75,     "SAID",#"  SAID",
       75,   81,     "CAID",#"  CAID",
       81,   87,     "TWAD",#"  TWAD",
       87,   93,    "SDWAD",#" SDWAD",
       93,   99,     "RWAD",#"  RWAD",
       99,  105,     "CWAD",#"  CWAD",
      105,  111,     "LWAD",#"  LWAD",
      111,  117,     "SWAD",#"  SWAD",
      117,  123,     "HWAD",#"  HWAD",
      123,  129,     "HIAD",#"  HIAD",
      129,  135,    "CHWAD",#" CHWAD",
      135,  141,     "EWAD",#"  EWAD",
      141,  147,    "RSWAD",#" RSWAD",
      147,  153,    "SNWPD",#" SNWPD",
      153,  159,    "SNWLD",#" SNWLD",
      159,  165,    "SNWSD",#" SNWSD",
      165,  171,     "RS%D",#"  RS%D",
      171,  177,     "H#AD",#"  H#AD",
      177,  183,     "HWUD",#"  HWUD",
      183,  189,     "T#AD",#"  T#AD",
      189,  195,     "SLAD",#"  SLAD",
      195,  201,     "RDPD",#"  RDPD",
      201,  207,     "PTFD",#"  PTFD",
      207,  213,     "SWXD",#"  SWXD",
      213,  219,    "WAVRD",#" WAVRD",
      219,  225,    "WUPRD",#" WUPRD",
      225,  231,     "WFTD",#"  WFTD",
      231,  237,     "WFPD",#"  WFPD",
      237,  243,     "WFGD",#"  WFGD",
      243,  249,     "NFTD",#"  NFTD",
      249,  255,     "NFPD",#"  NFPD",
      255,  261,     "NFGD",#"  NFGD",
      261,  267,    "NUPRD",#" NUPRD",
      267,  273,     "TFPD",#"  TFPD",
      273,  279,     "TFGD",#"  TFGD",
      279,  285,    "VRNFD",#" VRNFD",
      285,  291,    "DYLFD" #" DYLFD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   DAP TMEAN TKILL  GSTD  L#SD PARID PARUD  AWAD  LAID  SAID  CAID  TWAD SDWAD  RWAD  CWAD  LWAD  SWAD  HWAD  HIAD CHWAD  EWAD RSWAD SNWPD SNWLD SNWSD  RS%D  H#AD  HWUD  T#AD  SLAD  RDPD  PTFD  SWXD WAVRD WUPRD  WFTD  WFPD  WFGD  NFTD  NFPD  NFGD NUPRD  TFPD  TFGD VRNFD DYLFD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   DAP TMEAN TKILL  GSTD  L#SD PARID PARUD  AWAD  LAID  SAID  CAID  TWAD SDWAD  RWAD  CWAD  LWAD  SWAD  HWAD  HIAD CHWAD  EWAD RSWAD SNWPD SNWLD SNWSD  RS%D  H#AD  HWUD  T#AD  SLAD  RDPD  PTFD  SWXD WAVRD WUPRD  WFTD  WFPD  WFGD  NFTD  NFPD  NFGD NUPRD  TFPD  TFGD VRNFD DYLFD")

# "@YEAR DOY   DAS   DAP TMEAN  GSTD  NUAD  TNAD SDNAD  RNAD  CNAD  LNAD  SNAD  HNAD  HIND RSNAD SNNPD SNN0D SNN1D  RN%D  LN%D  SN%D  HN%D SDN%D  VN%D LN%RD SN%RD RN%RD  VCN%  VMN% NUPRD NDEMD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "YEAR",# "@YEAR",
        5,    9,      "DOY",#  " DOY",
        9,   15,      "DAS",#"   DAS",
       15,   21,      "DAP",#"   DAP",
       21,   27,    "TMEAN",#" TMEAN",
       27,   33,     "GSTD",#"  GSTD",
       33,   39,     "NUAD",#"  NUAD",
       39,   45,     "TNAD",#"  TNAD",
       45,   51,    "SDNAD",#" SDNAD",
       51,   57,     "RNAD",#"  RNAD",
       57,   63,     "CNAD",#"  CNAD",
       63,   69,     "LNAD",#"  LNAD",
       69,   75,     "SNAD",#"  SNAD",
       75,   81,     "HNAD",#"  HNAD",
       81,   87,     "HIND",#"  HIND",
       87,   93,    "RSNAD",#" RSNAD",
       93,   99,    "SNNPD",#" SNNPD",
       99,  105,    "SNN0D",#" SNN0D",
      105,  111,    "SNN1D",#" SNN1D",
      111,  117,     "RN%D",#"  RN%D",
      117,  123,     "LN%D",#"  LN%D",
      123,  129,     "SN%D",#"  SN%D",
      129,  135,     "HN%D",#"  HN%D",
      135,  141,    "SDN%D",#" SDN%D",
      141,  147,     "VN%D",#"  VN%D",
      147,  153,    "LN%RD",#" LN%RD",
      153,  159,    "SN%RD",#" SN%RD",
      159,  165,    "RN%RD",#" RN%RD",
      165,  171,     "VCN%",#"  VCN%",
      171,  177,     "VMN%",#"  VMN%",
      177,  183,    "NUPRD",#" NUPRD",
      183,  189,    "NDEMD" #" NDEMD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   DAP TMEAN  GSTD  NUAD  TNAD SDNAD  RNAD  CNAD  LNAD  SNAD  HNAD  HIND RSNAD SNNPD SNN0D SNN1D  RN%D  LN%D  SN%D  HN%D SDN%D  VN%D LN%RD SN%RD RN%RD  VCN%  VMN% NUPRD NDEMD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   DAP TMEAN  GSTD  NUAD  TNAD SDNAD  RNAD  CNAD  LNAD  SNAD  HNAD  HIND RSNAD SNNPD SNN0D SNN1D  RN%D  LN%D  SN%D  HN%D SDN%D  VN%D LN%RD SN%RD RN%RD  VCN%  VMN% NUPRD NDEMD")

# "@  RUN EXCODE    TRNO RN TNAME.................... REP  RUNI S O C    CR PYEAR  PDOY  TSAP  ADAP  MDAP   FLN FLDAP HYEAR  HDAY SDWAP CWAHC  CWAM PARUE  HWAM  HWAH  BWAH  HWUM  H#AM  H#UM SDNAP  CNAM  HNAM  RNAM  TNAM  NUAM  HN%M  VN%M D1INI D2INI D3INI "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#                       ~check,
        0,    6,      "RUN",#                     "@  RUN",
        6,   15,   "EXCODE",#                  " EXCODE  ",
       15,   21,     "TRNO",#                     "  TRNO",
       21,   24,       "RN",#                        " RN",
       24,   51,    "TNAME",#" TNAME.................... ",
       51,   54,      "REP",#                        "REP",
       54,   60,     "RUNI",#                     "  RUNI",
       60,   62,        "S",#                         " S",
       62,   64,        "O",#                         " O",
       64,   66,        "C",#                         " C",
       66,   72,       "CR",#                     "    CR",
       72,   78,    "PYEAR",#                     " PYEAR",
       78,   84,     "PDOY",#                     "  PDOY",
       84,   90,     "TSAP",#                     "  TSAP",
       90,   96,     "ADAP",#                     "  ADAP",
       96,  102,     "MDAP",#                     "  MDAP",
      102,  108,      "FLN",#                     "   FLN",
      108,  114,    "FLDAP",#                     " FLDAP",
      114,  120,    "HYEAR",#                     " HYEAR",
      120,  126,     "HDAY",#                     "  HDAY",
      126,  132,    "SDWAP",#                     " SDWAP",
      132,  138,    "CWAHC",#                     " CWAHC",
      138,  144,     "CWAM",#                     "  CWAM",
      144,  150,    "PARUE",#                     " PARUE",
      150,  156,     "HWAM",#                     "  HWAM",
      156,  162,     "HWAH",#                     "  HWAH",
      162,  168,     "BWAH",#                     "  BWAH",
      168,  174,     "HWUM",#                     "  HWUM",
      174,  180,     "H#AM",#                     "  H#AM",
      180,  186,     "H#UM",#                     "  H#UM",
      186,  192,    "SDNAP",#                     " SDNAP",
      192,  198,     "CNAM",#                     "  CNAM",
      198,  204,     "HNAM",#                     "  HNAM",
      204,  210,     "RNAM",#                     "  RNAM",
      210,  216,     "TNAM",#                     "  TNAM",
      216,  222,     "NUAM",#                     "  NUAM",
      222,  228,     "HN%M",#                     "  HN%M",
      228,  234,     "VN%M",#                     "  VN%M",
      234,  240,    "D1INI",#                     " D1INI",
      240,  246,    "D2INI",#                     " D2INI",
      246,  252,    "D3INI" #                     " D3INI"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  RUN EXCODE    TRNO RN TNAME.................... REP  RUNI S O C    CR PYEAR  PDOY  TSAP  ADAP  MDAP   FLN FLDAP HYEAR  HDAY SDWAP CWAHC  CWAM PARUE  HWAM  HWAH  BWAH  HWUM  H#AM  H#UM SDNAP  CNAM  HNAM  RNAM  TNAM  NUAM  HN%M  VN%M D1INI D2INI D3INI ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  RUN EXCODE    TRNO RN TNAME.................... REP  RUNI S O C    CR PYEAR  PDOY  TSAP  ADAP  MDAP   FLN FLDAP HYEAR  HDAY SDWAP CWAHC  CWAM PARUE  HWAM  HWAH  BWAH  HWUM  H#AM  H#UM SDNAP  CNAM  HNAM  RNAM  TNAM  NUAM  HN%M  VN%M D1INI D2INI D3INI ")

# "@Run FILEX               TN CR     SN0Di    S1NTDi    S2NTDi    S3NTDi     LNTDi     NIADi      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      TDFC      NUCM     NGasC      RNRO      NMNC      NIMC    InNBal   OrgNBal     SNBAL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#                 ~check,
        0,    4,      "Run",#                 "@Run",
        4,   25,    "FILEX",#" FILEX               ",
       25,   27,       "TN",#                   "TN",
       27,   30,       "CR",#                  " CR",
       30,   40,    "SN0Di",#           "     SN0Di",
       40,   50,   "S1NTDi",#           "    S1NTDi",
       50,   60,   "S2NTDi",#           "    S2NTDi",
       60,   70,   "S3NTDi",#           "    S3NTDi",
       70,   80,    "LNTDi",#           "     LNTDi",
       80,   90,    "NIADi",#           "     NIADi",
       90,  100,     "SN0D",#           "      SN0D",
      100,  110,    "S1NTD",#           "     S1NTD",
      110,  120,    "S2NTD",#           "     S2NTD",
      120,  130,    "S3NTD",#           "     S3NTD",
      130,  140,     "LNTD",#           "      LNTD",
      140,  150,     "NIAD",#           "      NIAD",
      150,  160,     "HRNH",#           "      HRNH",
      160,  170,    "RESNC",#           "     RESNC",
      170,  180,     "NICM",#           "      NICM",
      180,  190,    "SNNTC",#           "     SNNTC",
      190,  200,     "NLCM",#           "      NLCM",
      200,  210,     "TDFC",#           "      TDFC",
      210,  220,     "NUCM",#           "      NUCM",
      220,  230,    "NGasC",#           "     NGasC",
      230,  240,     "RNRO",#           "      RNRO",
      240,  250,     "NMNC",#           "      NMNC",
      250,  260,     "NIMC",#           "      NIMC",
      260,  270,   "InNBal",#           "    InNBal",
      270,  280,  "OrgNBal",#           "   OrgNBal",
      280,  290,    "SNBAL" #           "     SNBAL"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@Run FILEX               TN CR     SN0Di    S1NTDi    S2NTDi    S3NTDi     LNTDi     NIADi      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      TDFC      NUCM     NGasC      RNRO      NMNC      NIMC    InNBal   OrgNBal     SNBAL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@Run FILEX               TN CR     SN0Di    S1NTDi    S2NTDi    S3NTDi     LNTDi     NIADi      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      TDFC      NUCM     NGasC      RNRO      NMNC      NIMC    InNBal   OrgNBal     SNBAL")

# "@YEAR DOY   DAS  NAPC  NI#M    NIAD    NITD    NHTD    NMNC    NITC    NDNC    NIMC    AMLC   NNMNC    NUCM    NLCC    TDNC    NI1D    NI2D    NI3D    NI4D    NI5D    NI6D    NI7D    NI8D    NI9D    NH1D    NH2D    NH3D    NH4D    NH5D    NH6D    NH7D    NH8D    NH9D    NT1D    NT2D    NT3D    NT4D    NT5D    NT6D    NT7D    NT8D    NT9D    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   21,     "NAPC",#  "  NAPC",
       21,   27,     "NI#M",#  "  NI#M",
       27,   35,     "NIAD",#"    NIAD",
       35,   43,     "NITD",#"    NITD",
       43,   51,     "NHTD",#"    NHTD",
       51,   59,     "NMNC",#"    NMNC",
       59,   67,     "NITC",#"    NITC",
       67,   75,     "NDNC",#"    NDNC",
       75,   83,     "NIMC",#"    NIMC",
       83,   91,     "AMLC",#"    AMLC",
       91,   99,    "NNMNC",#"   NNMNC",
       99,  107,     "NUCM",#"    NUCM",
      107,  115,     "NLCC",#"    NLCC",
      115,  123,     "TDNC",#"    TDNC",
      123,  131,     "NI1D",#"    NI1D",
      131,  139,     "NI2D",#"    NI2D",
      139,  147,     "NI3D",#"    NI3D",
      147,  155,     "NI4D",#"    NI4D",
      155,  163,     "NI5D",#"    NI5D",
      163,  171,     "NI6D",#"    NI6D",
      171,  179,     "NI7D",#"    NI7D",
      179,  187,     "NI8D",#"    NI8D",
      187,  195,     "NI9D",#"    NI9D",
      195,  203,     "NH1D",#"    NH1D",
      203,  211,     "NH2D",#"    NH2D",
      211,  219,     "NH3D",#"    NH3D",
      219,  227,     "NH4D",#"    NH4D",
      227,  235,     "NH5D",#"    NH5D",
      235,  243,     "NH6D",#"    NH6D",
      243,  251,     "NH7D",#"    NH7D",
      251,  259,     "NH8D",#"    NH8D",
      259,  267,     "NH9D",#"    NH9D",
      267,  275,     "NT1D",#"    NT1D",
      275,  283,     "NT2D",#"    NT2D",
      283,  291,     "NT3D",#"    NT3D",
      291,  299,     "NT4D",#"    NT4D",
      299,  307,     "NT5D",#"    NT5D",
      307,  315,     "NT6D",#"    NT6D",
      315,  323,     "NT7D",#"    NT7D",
      323,  331,     "NT8D",#"    NT8D",
      331,  339,     "NT9D" #"    NT9D"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS  NAPC  NI#M    NIAD    NITD    NHTD    NMNC    NITC    NDNC    NIMC    AMLC   NNMNC    NUCM    NLCC    TDNC    NI1D    NI2D    NI3D    NI4D    NI5D    NI6D    NI7D    NI8D    NI9D    NH1D    NH2D    NH3D    NH4D    NH5D    NH6D    NH7D    NH8D    NH9D    NT1D    NT2D    NT3D    NT4D    NT5D    NT6D    NT7D    NT8D    NT9D    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS  NAPC  NI#M    NIAD    NITD    NHTD    NMNC    NITC    NDNC    NIMC    AMLC   NNMNC    NUCM    NLCC    TDNC    NI1D    NI2D    NI3D    NI4D    NI5D    NI6D    NI7D    NI8D    NI9D    NH1D    NH2D    NH3D    NH4D    NH5D    NH6D    NH7D    NH8D    NH9D    NT1D    NT2D    NT3D    NT4D    NT5D    NT6D    NT7D    NT8D    NT9D    ")

# "@YEAR DOY   DAS    TS0D    TS1D    TS2D    TS3D    TS4D    TS5D    TS6D    TS7D    TS8D    TS9D    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   23,     "TS0D",#"    TS0D",
       23,   31,     "TS1D",#"    TS1D",
       31,   39,     "TS2D",#"    TS2D",
       39,   47,     "TS3D",#"    TS3D",
       47,   55,     "TS4D",#"    TS4D",
       55,   63,     "TS5D",#"    TS5D",
       63,   71,     "TS6D",#"    TS6D",
       71,   79,     "TS7D",#"    TS7D",
       79,   87,     "TS8D",#"    TS8D",
       87,   95,     "TS9D" #"    TS9D"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS    TS0D    TS1D    TS2D    TS3D    TS4D    TS5D    TS6D    TS7D    TS8D    TS9D    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS    TS0D    TS1D    TS2D    TS3D    TS4D    TS5D    TS6D    TS7D    TS8D    TS9D    ")

# "@YEAR DOY   DAS  SWTD  SWXD   ROFC   DRNC   PREC  IR#C  IRRC  DTWT    MWTD  TDFD  TDFC   ROFD    SW1D    SW2D    SW3D    SW4D    SW5D    SW6D    SW7D    SW8D    SW9D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    5,     "YEAR",#   "@YEAR",
        5,    9,      "DOY",#    " DOY",
        9,   15,      "DAS",#  "   DAS",
       15,   21,     "SWTD",#  "  SWTD",
       21,   27,     "SWXD",#  "  SWXD",
       27,   34,     "ROFC",# "   ROFC",
       34,   41,     "DRNC",# "   DRNC",
       41,   48,     "PREC",# "   PREC",
       48,   54,     "IR#C",#  "  IR#C",
       54,   60,     "IRRC",#  "  IRRC",
       60,   66,     "DTWT",#  "  DTWT",
       66,   74,     "MWTD",#"    MWTD",
       74,   80,     "TDFD",#  "  TDFD",
       80,   86,     "TDFC",#  "  TDFC",
       86,   93,     "ROFD",# "   ROFD",
       93,  101,     "SW1D",#"    SW1D",
      101,  109,     "SW2D",#"    SW2D",
      109,  117,     "SW3D",#"    SW3D",
      117,  125,     "SW4D",#"    SW4D",
      125,  133,     "SW5D",#"    SW5D",
      133,  141,     "SW6D",#"    SW6D",
      141,  149,     "SW7D",#"    SW7D",
      149,  157,     "SW8D",#"    SW8D",
      157,  165,     "SW9D" #"    SW9D"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS  SWTD  SWXD   ROFC   DRNC   PREC  IR#C  IRRC  DTWT    MWTD  TDFD  TDFC   ROFD    SW1D    SW2D    SW3D    SW4D    SW5D    SW6D    SW7D    SW8D    SW9D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS  SWTD  SWXD   ROFC   DRNC   PREC  IR#C  IRRC  DTWT    MWTD  TDFD  TDFC   ROFD    SW1D    SW2D    SW3D    SW4D    SW5D    SW6D    SW7D    SW8D    SW9D")

# "@Run FILEX         TN      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      NUCM     NGasC      RNRO      NMNC      NIMC   SEASBAL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#           ~check,
        0,    4,      "Run",#           "@Run",
        4,   19,    "FILEX",#" FILEX         ",
       19,   21,       "TN",#             "TN",
       21,   31,     "SN0D",#     "      SN0D",
       31,   41,    "S1NTD",#     "     S1NTD",
       41,   51,    "S2NTD",#     "     S2NTD",
       51,   61,    "S3NTD",#     "     S3NTD",
       61,   71,     "LNTD",#     "      LNTD",
       71,   81,     "NIAD",#     "      NIAD",
       81,   91,     "HRNH",#     "      HRNH",
       91,  101,    "RESNC",#     "     RESNC",
      101,  111,     "NICM",#     "      NICM",
      111,  121,    "SNNTC",#     "     SNNTC",
      121,  131,     "NLCM",#     "      NLCM",
      131,  141,     "NUCM",#     "      NUCM",
      141,  151,    "NGasC",#     "     NGasC",
      151,  161,     "RNRO",#     "      RNRO",
      161,  171,     "NMNC",#     "      NMNC",
      171,  181,     "NIMC",#     "      NIMC",
      181,  191,  "SEASBAL" #     "   SEASBAL"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@Run FILEX         TN      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      NUCM     NGasC      RNRO      NMNC      NIMC   SEASBAL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@Run FILEX         TN      SN0D     S1NTD     S2NTD     S3NTD      LNTD      NIAD      HRNH     RESNC      NICM     SNNTC      NLCM      NUCM     NGasC      RNRO      NMNC      NIMC   SEASBAL")

# "@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... SOIL_ID...    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEC  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EC    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#                      ~check,
        0,    9,    "RUNNO",#                 "@   RUNNO",
        9,   16,     "TRNO",#                   "   TRNO",
       16,   19,       "R#",#                       " R#",
       19,   22,       "O#",#                       " O#",
       22,   25,       "P#",#                       " P#",
       25,   28,       "CR",#                       " CR",
       28,   37,    "MODEL",#                 " MODEL...",
       37,   46,   "EXNAME",#                 " EXNAME..",
       46,   72,     "TNAM",#" TNAM.....................",
       72,   81,     "FNAM",#                 " FNAM....",
       81,   90,     "WSTA",#                 " WSTA....",
       90,  101,  "SOIL_ID",#               " SOIL_ID...",
      101,  109,     "SDAT",#                  "    SDAT",
      109,  117,     "PDAT",#                  "    PDAT",
      117,  125,     "EDAT",#                  "    EDAT",
      125,  133,     "ADAT",#                  "    ADAT",
      133,  141,     "MDAT",#                  "    MDAT",
      141,  149,     "HDAT",#                  "    HDAT",
      149,  155,     "DWAP",#                    "  DWAP",
      155,  163,     "CWAM",#                  "    CWAM",
      163,  171,     "HWAM",#                  "    HWAM",
      171,  179,     "HWAH",#                  "    HWAH",
      179,  187,     "BWAH",#                  "    BWAH",
      187,  193,     "PWAM",#                    "  PWAM",
      193,  201,     "HWUM",#                  "    HWUM",
      201,  209,     "H#AM",#                  "    H#AM",
      209,  217,     "H#UM",#                  "    H#UM",
      217,  223,     "HIAM",#                    "  HIAM",
      223,  229,     "LAIX",#                    "  LAIX",
      229,  235,     "IR#M",#                    "  IR#M",
      235,  241,     "IRCM",#                    "  IRCM",
      241,  247,     "PRCM",#                    "  PRCM",
      247,  253,     "ETCM",#                    "  ETCM",
      253,  259,     "EPCM",#                    "  EPCM",
      259,  265,     "ESCM",#                    "  ESCM",
      265,  271,     "ROCM",#                    "  ROCM",
      271,  277,     "DRCM",#                    "  DRCM",
      277,  283,     "SWXM",#                    "  SWXM",
      283,  289,     "NI#M",#                    "  NI#M",
      289,  295,     "NICM",#                    "  NICM",
      295,  301,     "NFXM",#                    "  NFXM",
      301,  307,     "NUCM",#                    "  NUCM",
      307,  313,     "NLCM",#                    "  NLCM",
      313,  319,     "NIAM",#                    "  NIAM",
      319,  325,    "NMINC",#                    " NMINC",
      325,  331,     "CNAM",#                    "  CNAM",
      331,  337,     "GNAM",#                    "  GNAM",
      337,  343,    "N2OEC",#                    " N2OEC",
      343,  349,     "PI#M",#                    "  PI#M",
      349,  355,     "PICM",#                    "  PICM",
      355,  361,     "PUPC",#                    "  PUPC",
      361,  367,     "SPAM",#                    "  SPAM",
      367,  373,     "KI#M",#                    "  KI#M",
      373,  379,     "KICM",#                    "  KICM",
      379,  385,     "KUPC",#                    "  KUPC",
      385,  391,     "SKAM",#                    "  SKAM",
      391,  397,     "RECM",#                    "  RECM",
      397,  404,    "ONTAM",#                   "  ONTAM",
      404,  411,     "ONAM",#                   "   ONAM",
      411,  418,    "OPTAM",#                   "  OPTAM",
      418,  425,     "OPAM",#                   "   OPAM",
      425,  433,    "OCTAM",#                  "   OCTAM",
      433,  441,     "OCAM",#                  "    OCAM",
      441,  449,    "CO2EC",#                  "   CO2EC",
      449,  458,    "DMPPM",#                 "    DMPPM",
      458,  467,    "DMPEM",#                 "    DMPEM",
      467,  476,    "DMPTM",#                 "    DMPTM",
      476,  485,    "DMPIM",#                 "    DMPIM",
      485,  494,     "YPPM",#                 "     YPPM",
      494,  503,     "YPEM",#                 "     YPEM",
      503,  512,     "YPTM",#                 "     YPTM",
      512,  521,     "YPIM",#                 "     YPIM",
      521,  530,    "DPNAM",#                 "    DPNAM",
      530,  539,    "DPNUM",#                 "    DPNUM",
      539,  548,    "YPNAM",#                 "    YPNAM",
      548,  557,    "YPNUM",#                 "    YPNUM",
      557,  563,     "NDCH",#                    "  NDCH",
      563,  569,    "TMAXA",#                    " TMAXA",
      569,  575,    "TMINA",#                    " TMINA",
      575,  581,    "SRADA",#                    " SRADA",
      581,  587,    "DAYLA",#                    " DAYLA",
      587,  594,     "CO2A",#                   "   CO2A",
      594,  601,     "PRCP",#                   "   PRCP",
      601,  608,     "ETCP",#                   "   ETCP",
      608,  615,     "ESCP",#                   "   ESCP",
      615,  622,     "EPCP" #                   "   EPCP"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... SOIL_ID...    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEC  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EC    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... SOIL_ID...    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEC  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EC    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP")

# "@YEAR DOY   DAS   PRED  DAYLD   TWLD   SRAD   PARD   CLDD   TMXD   TMND   TAVD   TDYD   TDWD   TGAD   TGRD   WDSD   CO2D   VPDF   VPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "YEAR",#  "@YEAR",
        5,    9,      "DOY",#   " DOY",
        9,   15,      "DAS",# "   DAS",
       15,   22,     "PRED",#"   PRED",
       22,   29,    "DAYLD",#"  DAYLD",
       29,   36,     "TWLD",#"   TWLD",
       36,   43,     "SRAD",#"   SRAD",
       43,   50,     "PARD",#"   PARD",
       50,   57,     "CLDD",#"   CLDD",
       57,   64,     "TMXD",#"   TMXD",
       64,   71,     "TMND",#"   TMND",
       71,   78,     "TAVD",#"   TAVD",
       78,   85,     "TDYD",#"   TDYD",
       85,   92,     "TDWD",#"   TDWD",
       92,   99,     "TGAD",#"   TGAD",
       99,  106,     "TGRD",#"   TGRD",
      106,  113,     "WDSD",#"   WDSD",
      113,  120,     "CO2D",#"   CO2D",
      120,  127,     "VPDF",#"   VPDF",
      127,  133,      "VPD" # "   VPD"
  )

  col_names <-   c(" +S(?= |$)", " +O(?= |$)", " +C(?= |$)", " +CR(?= |$)", " TNAM(?= |$)",
  "  TRNO", "    SDAT")

  left_just <-   c(" TNAME\\.*", " TNAM\\.+", " EXNAME\\.*", " FNAM\\.*(?= |$)",
  " WSTA\\.*", " SOIL_ID\\.*", " MODEL\\.*", "EXCODE  ", "FILEX       "
  )

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YEAR DOY   DAS   PRED  DAYLD   TWLD   SRAD   PARD   CLDD   TMXD   TMND   TAVD   TDYD   TDWD   TGAD   TGRD   WDSD   CO2D   VPDF   VPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YEAR DOY   DAS   PRED  DAYLD   TWLD   SRAD   PARD   CLDD   TMXD   TMND   TAVD   TDYD   TDWD   TGAD   TGRD   WDSD   CO2D   VPDF   VPD")

# "@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... WYEAR SOIL_ID...             XLAT            LONG      ELEV    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT   HYEAR  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX   FCWAM   FHWAM   HWAHF   FBWAH   FPWAM  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEM  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EM  CH4EM    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP  CRST"

  true_fwf_pos <- tibble::tribble(
    ~begin, ~end, ~col_names,
         0,    9,    "RUNNO",
         9,   16,     "TRNO",
        16,   19,       "R#",
        19,   22,       "O#",
        22,   25,       "P#",
        25,   28,       "CR",
        28,   37,    "MODEL",
        37,   46,   "EXNAME",
        46,   72,     "TNAM",
        72,   81,     "FNAM",
        81,   91,     "WSTA",
        91,   96,    "WYEAR",
        96,  108,  "SOIL_ID",
       108,  124,     "XLAT",
       124,  140,     "LONG",
       140,  150,     "ELEV",
       150,  158,     "SDAT",
       158,  166,     "PDAT",
       166,  174,     "EDAT",
       174,  182,     "ADAT",
       182,  190,     "MDAT",
       190,  198,     "HDAT",
       198,  206,    "HYEAR",
       206,  212,     "DWAP",
       212,  220,     "CWAM",
       220,  228,     "HWAM",
       228,  236,     "HWAH",
       236,  244,     "BWAH",
       244,  250,     "PWAM",
       250,  258,     "HWUM",
       258,  266,     "H#AM",
       266,  274,     "H#UM",
       274,  280,     "HIAM",
       280,  286,     "LAIX",
       286,  294,    "FCWAM",
       294,  302,    "FHWAM",
       302,  310,    "HWAHF",
       310,  318,    "FBWAH",
       318,  326,    "FPWAM",
       326,  332,     "IR#M",
       332,  338,     "IRCM",
       338,  344,     "PRCM",
       344,  350,     "ETCM",
       350,  356,     "EPCM",
       356,  362,     "ESCM",
       362,  368,     "ROCM",
       368,  374,     "DRCM",
       374,  380,     "SWXM",
       380,  386,     "NI#M",
       386,  392,     "NICM",
       392,  398,     "NFXM",
       398,  404,     "NUCM",
       404,  410,     "NLCM",
       410,  416,     "NIAM",
       416,  422,    "NMINC",
       422,  428,     "CNAM",
       428,  434,     "GNAM",
       434,  440,    "N2OEM",
       440,  446,     "PI#M",
       446,  452,     "PICM",
       452,  458,     "PUPC",
       458,  464,     "SPAM",
       464,  470,     "KI#M",
       470,  476,     "KICM",
       476,  482,     "KUPC",
       482,  488,     "SKAM",
       488,  494,     "RECM",
       494,  501,    "ONTAM",
       501,  508,     "ONAM",
       508,  515,    "OPTAM",
       515,  522,     "OPAM",
       522,  530,    "OCTAM",
       530,  538,     "OCAM",
       538,  546,    "CO2EM",
       546,  553,    "CH4EM",
       553,  562,    "DMPPM",
       562,  571,    "DMPEM",
       571,  580,    "DMPTM",
       580,  589,    "DMPIM",
       589,  598,     "YPPM",
       598,  607,     "YPEM",
       607,  616,     "YPTM",
       616,  625,     "YPIM",
       625,  634,    "DPNAM",
       634,  643,    "DPNUM",
       643,  652,    "YPNAM",
       652,  661,    "YPNUM",
       661,  667,     "NDCH",
       667,  673,    "TMAXA",
       673,  679,    "TMINA",
       679,  685,    "SRADA",
       685,  691,    "DAYLA",
       691,  698,     "CO2A",
       698,  705,     "PRCP",
       705,  712,     "ETCP",
       712,  719,     "ESCP",
       719,  726,     "EPCP",
       726,  732,     "CRST"
    )

  col_names <-   c(' +S(?= |$)',' +O(?= |$)',' +C(?= |$)',' +CR(?= |$)',' TNAM(?= |$)',
                   '            XLAT', '            LONG', '  TRNO')

  left_just <- c(' TNAME\\.*',' TNAM\\.+',' EXNAME\\.*',' FNAM\\.*(?= |$)',' WSTA\\.*',
                 ' SOIL_ID\\.*',' MODEL\\.*', 'EXCODE  ')

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... WYEAR SOIL_ID...             XLAT            LONG      ELEV    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT   HYEAR  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX   FCWAM   FHWAM   HWAHF   FBWAH   FPWAM  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEM  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EM  CH4EM    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP  CRST",
                                                  col_names = col_names,
                                                  left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@   RUNNO   TRNO R# O# P# CR MODEL... EXNAME.. TNAM..................... FNAM.... WSTA.... WYEAR SOIL_ID...             XLAT            LONG      ELEV    SDAT    PDAT    EDAT    ADAT    MDAT    HDAT   HYEAR  DWAP    CWAM    HWAM    HWAH    BWAH  PWAM    HWUM    H#AM    H#UM  HIAM  LAIX   FCWAM   FHWAM   HWAHF   FBWAH   FPWAM  IR#M  IRCM  PRCM  ETCM  EPCM  ESCM  ROCM  DRCM  SWXM  NI#M  NICM  NFXM  NUCM  NLCM  NIAM NMINC  CNAM  GNAM N2OEM  PI#M  PICM  PUPC  SPAM  KI#M  KICM  KUPC  SKAM  RECM  ONTAM   ONAM  OPTAM   OPAM   OCTAM    OCAM   CO2EM  CH4EM    DMPPM    DMPEM    DMPTM    DMPIM     YPPM     YPEM     YPTM     YPIM    DPNAM    DPNUM    YPNAM    YPNUM  NDCH TMAXA TMINA SRADA DAYLA   CO2A   PRCP   ETCP   ESCP   EPCP  CRST")

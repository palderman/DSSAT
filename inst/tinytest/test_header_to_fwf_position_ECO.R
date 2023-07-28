# "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "THVAR",#            " THVAR",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNGSH",#            " LNGSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "R1PPO",#            " R1PPO",
      114,  120,    "OPTBI",#            " OPTBI",
      120,  126,    "SLOBI",#            " SLOBI",
      126,  132,    "RDRMT",#            " RDRMT",
      132,  138,    "RDRMG",#            " RDRMG",
      138,  144,    "RDRMM",#            " RDRMM",
      144,  150,    "RCHDP" #            " RCHDP"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP")

# "@ECO#     P1 P2FR1    P2    P3 P4FR1 P4FR2    P4  VEFF PARUE PARU2  PHL2  PHF3  LA1S  LAFV  LAFR  SLAS LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  RDGS HTSTD  AWNS  KCAN  RS%S  GN%S GN%MN  TKFH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "ECO#",#"@ECO# ",
        6,   12,       "P1",#"    P1",
       12,   18,    "P2FR1",#" P2FR1",
       18,   24,       "P2",#"    P2",
       24,   30,       "P3",#"    P3",
       30,   36,    "P4FR1",#" P4FR1",
       36,   42,    "P4FR2",#" P4FR2",
       42,   48,       "P4",#"    P4",
       48,   54,     "VEFF",#"  VEFF",
       54,   60,    "PARUE",#" PARUE",
       60,   66,    "PARU2",#" PARU2",
       66,   72,     "PHL2",#"  PHL2",
       72,   78,     "PHF3",#"  PHF3",
       78,   84,     "LA1S",#"  LA1S",
       84,   90,     "LAFV",#"  LAFV",
       90,   96,     "LAFR",#"  LAFR",
       96,  102,     "SLAS",#"  SLAS",
      102,  108,    "LSPHS",#" LSPHS",
      108,  114,    "LSPHE",#" LSPHE",
      114,  120,    "TIL#S",#" TIL#S",
      120,  126,    "TIPHE",#" TIPHE",
      126,  132,    "TIFAC",#" TIFAC",
      132,  138,    "TDPHS",#" TDPHS",
      138,  144,    "TDPHE",#" TDPHE",
      144,  150,    "TDFAC",#" TDFAC",
      150,  156,     "RDGS",#"  RDGS",
      156,  162,    "HTSTD",#" HTSTD",
      162,  168,     "AWNS",#"  AWNS",
      168,  174,     "KCAN",#"  KCAN",
      174,  180,     "RS%S",#"  RS%S",
      180,  186,     "GN%S",#"  GN%S",
      186,  192,    "GN%MN",#" GN%MN",
      192,  198,     "TKFH" #"  TKFH"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#     P1 P2FR1    P2    P3 P4FR1 P4FR2    P4  VEFF PARUE PARU2  PHL2  PHF3  LA1S  LAFV  LAFR  SLAS LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  RDGS HTSTD  AWNS  KCAN  RS%S  GN%S GN%MN  TKFH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#     P1 P2FR1    P2    P3 P4FR1 P4FR2    P4  VEFF PARUE PARU2  PHL2  PHF3  LA1S  LAFV  LAFR  SLAS LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  RDGS HTSTD  AWNS  KCAN  RS%S  GN%S GN%MN  TKFH")

# "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE GWTAF GWTAT  G#RF RTNUP NUPNF NUPWF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   30,    "PARUE",#             "PARUE",
       30,   36,    "PARU2",#            " PARU2",
       36,   42,     "PHL2",#            "  PHL2",
       42,   48,     "PHF3",#            "  PHF3",
       48,   54,     "SLAS",#            "  SLAS",
       54,   60,    "LSENI",#            " LSENI",
       60,   66,    "LSPHS",#            " LSPHS",
       66,   72,    "LSPHE",#            " LSPHE",
       72,   78,    "TIL#S",#            " TIL#S",
       78,   84,    "TIPHE",#            " TIPHE",
       84,   90,    "TIFAC",#            " TIFAC",
       90,   96,    "TDPHS",#            " TDPHS",
       96,  102,    "TDPHE",#            " TDPHE",
      102,  108,    "TDFAC",#            " TDFAC",
      108,  114,     "TDSF",#            "  TDSF",
      114,  120,     "RDGS",#            "  RDGS",
      120,  126,    "HTSTD",#            " HTSTD",
      126,  132,     "AWNS",#            "  AWNS",
      132,  138,     "KCAN",#            "  KCAN",
      138,  144,     "RS%A",#            "  RS%A",
      144,  150,     "GN%S",#            "  GN%S",
      150,  156,    "GN%MN",#            " GN%MN",
      156,  162,     "GM%H",#            "  GM%H",
      162,  168,     "TKFH",#            "  TKFH",
      168,  174,    "SSPHS",#            " SSPHS",
      174,  180,    "SSPHE",#            " SSPHE",
      180,  186,    "GWTAF",#            " GWTAF",
      186,  192,    "GWTAT",#            " GWTAT",
      192,  198,     "G#RF",#            "  G#RF",
      198,  204,    "RTNUP",#            " RTNUP",
      204,  210,    "NUPNF",#            " NUPNF",
      210,  216,    "NUPWF" #            " NUPWF"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE GWTAF GWTAT  G#RF RTNUP NUPNF NUPWF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE GWTAF GWTAT  G#RF RTNUP NUPNF NUPWF")

# "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "THVAR",#            " THVAR",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNGSH",#            " LNGSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "R1PPO",#            " R1PPO",
      114,  120,    "OPTBI",#            " OPTBI",
      120,  126,    "SLOBI" #            " SLOBI"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI")

# "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "PP-SS",#            " PP-SS",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNHSH",#            " LNHSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "R1PPO",#            " R1PPO",
      114,  120,    "OPTBI",#            " OPTBI",
      120,  126,    "SLOBI" #            " SLOBI"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI")

# "@ECO   ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,      "ECO",#           "@ECO   ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   36,     "TOPT",#            "  TOPT",
       36,   41,     "ROPT",#             " ROPT",
       41,   47,      "P20",#            "   P20",
       47,   53,     "DJTI",#            "  DJTI",
       53,   59,     "GDDE",#            "  GDDE",
       59,   66,    "DSGFT",#           "  DSGFT",
       66,   71,      "RUE",#             "  RUE",
       71,   78,     "KCAN",#           "   KCAN",
       78,   84,     "TSEN",#            "  TSEN",
       84,   90,     "CDAY" #            "  CDAY"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO   ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO   ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY")

# "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI  KCAN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "THVAR",#            " THVAR",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNGSH",#            " LNGSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "R1PPO",#            " R1PPO",
      114,  120,    "OPTBI",#            " OPTBI",
      120,  126,    "SLOBI",#            " SLOBI",
      126,  132,     "KCAN" #            "  KCAN"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI  KCAN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI  KCAN")

# "@ECO#  ECONAME.......... PARUE HTSTD DUSRI SRN%S BR1FX BR2FX BR3FX BR4FX BR5FX BR6FX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   30,    "PARUE",#             "PARUE",
       30,   36,    "HTSTD",#            " HTSTD",
       36,   42,    "DUSRI",#            " DUSRI",
       42,   48,    "SRN%S",#            " SRN%S",
       48,   54,    "BR1FX",#            " BR1FX",
       54,   60,    "BR2FX",#            " BR2FX",
       60,   66,    "BR3FX",#            " BR3FX",
       66,   72,    "BR4FX",#            " BR4FX",
       72,   78,    "BR5FX",#            " BR5FX",
       78,   84,    "BR6FX" #            " BR6FX"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... PARUE HTSTD DUSRI SRN%S BR1FX BR2FX BR3FX BR4FX BR5FX BR6FX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... PARUE HTSTD DUSRI SRN%S BR1FX BR2FX BR3FX BR4FX BR5FX BR6FX")

# "@ECO#  ECONAME.......... PARUE TBLSZ SRN%S  KCAN PGERM  PPS1  PPS2  PPS3  PHTV  PHSV  RDGS  RLWR  WFSU RSUSE  HMPC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   30,    "PARUE",#             "PARUE",
       30,   36,    "TBLSZ",#            " TBLSZ",
       36,   42,    "SRN%S",#            " SRN%S",
       42,   48,     "KCAN",#            "  KCAN",
       48,   54,    "PGERM",#            " PGERM",
       54,   60,     "PPS1",#            "  PPS1",
       60,   66,     "PPS2",#            "  PPS2",
       66,   72,     "PPS3",#            "  PPS3",
       72,   78,     "PHTV",#            "  PHTV",
       78,   84,     "PHSV",#            "  PHSV",
       84,   90,     "RDGS",#            "  RDGS",
       90,   96,     "RLWR",#            "  RLWR",
       96,  102,     "WFSU",#            "  WFSU",
      102,  108,    "RSUSE",#            " RSUSE",
      108,  114,     "HMPC" #            "  HMPC"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... PARUE TBLSZ SRN%S  KCAN PGERM  PPS1  PPS2  PPS3  PHTV  PHSV  RDGS  RLWR  WFSU RSUSE  HMPC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... PARUE TBLSZ SRN%S  KCAN PGERM  PPS1  PPS2  PPS3  PHTV  PHSV  RDGS  RLWR  WFSU RSUSE  HMPC")

# "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT THRSH SDPRO SDLIP R1PPO OPTBI SLOBI"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "THVAR",#            " THVAR",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNGSH",#            " LNGSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "THRSH",#            " THRSH",
      114,  120,    "SDPRO",#            " SDPRO",
      120,  126,    "SDLIP",#            " SDLIP",
      126,  132,    "R1PPO",#            " R1PPO",
      132,  138,    "OPTBI",#            " OPTBI",
      138,  144,    "SLOBI" #            " SLOBI"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT THRSH SDPRO SDLIP R1PPO OPTBI SLOBI",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT THRSH SDPRO SDLIP R1PPO OPTBI SLOBI")

# "@ECO#  ECONAME.........  TBASE TOPT  ROPT  DJTI  GDDE   RUE  KCAN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   35,     "TOPT",#             " TOPT",
       35,   41,     "ROPT",#            "  ROPT",
       41,   47,     "DJTI",#            "  DJTI",
       47,   53,     "GDDE",#            "  GDDE",
       53,   59,      "RUE",#            "   RUE",
       59,   65,     "KCAN" #            "  KCAN"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE TOPT  ROPT  DJTI  GDDE   RUE  KCAN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE TOPT  ROPT  DJTI  GDDE   RUE  KCAN")

# "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   36,     "TOPT",#            "  TOPT",
       36,   41,     "ROPT",#             " ROPT",
       41,   47,      "P20",#            "   P20",
       47,   53,     "DJTI",#            "  DJTI",
       53,   59,     "GDDE",#            "  GDDE",
       59,   66,    "DSGFT",#           "  DSGFT",
       66,   71,      "RUE",#             "  RUE",
       71,   78,     "KCAN",#           "   KCAN",
       78,   84,     "TSEN",#            "  TSEN",
       84,   90,     "CDAY" #            "  CDAY"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY")

# "@ECO#  ECONAME.........  TBASE TOPT  ROPT  P20   DJTI  GDDE  DSGFT  RUE   KCAN  PSTM  PEAR  TSEN  CDAY"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   35,     "TOPT",#             " TOPT",
       35,   41,     "ROPT",#            "  ROPT",
       41,   46,      "P20",#             "  P20",
       46,   53,     "DJTI",#           "   DJTI",
       53,   59,     "GDDE",#            "  GDDE",
       59,   66,    "DSGFT",#           "  DSGFT",
       66,   71,      "RUE",#             "  RUE",
       71,   78,     "KCAN",#           "   KCAN",
       78,   84,     "PSTM",#            "  PSTM",
       84,   90,     "PEAR",#            "  PEAR",
       90,   96,     "TSEN",#            "  TSEN",
       96,  102,     "CDAY" #            "  CDAY"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE TOPT  ROPT  P20   DJTI  GDDE  DSGFT  RUE   KCAN  PSTM  PEAR  TSEN  CDAY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE TOPT  ROPT  P20   DJTI  GDDE  DSGFT  RUE   KCAN  PSTM  PEAR  TSEN  CDAY")

# "@ECO#  ECONAME..........  RUE1  RUE2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#               ~check,
        0,    7,     "ECO#",#            "@ECO#  ",
        7,   26,  "ECONAME",#"ECONAME..........  ",
       26,   30,     "RUE1",#               "RUE1",
       30,   36,     "RUE2" #             "  RUE2"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME..........  RUE1  RUE2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME..........  RUE1  RUE2")

# "@ECO#  ECO-NAME.........        DELTTMAX       SWDF2AMP         EXTCFN        EXTCFST       LFNMXEXT   AREAMX_CF(2)   AREAMX_CF(3)         WIDCOR     WMAX_CF(1)     WMAX_CF(2)     WMAX_CF(3)       POPDECAY       TTBASEEM     TTBASELFEX     LG_AMRANGE    LG_GP_REDUC   LDG_FI_REDUC     LMAX_CF(1)     LMAX_CF(2)     LMAX_CF(3)    MAXLFLENGTH     MAXLFWIDTH    TBASE_GE_EM    TOPT_GE_EM      TFin_GE_EM     TBASE_LFEM      TOPT_LFEM      TFin_LFEM    TBASE_TLREM     TOPT_TLREM     TFin_TLREM    TBASE_LFSEN     TOPT_LFSEN     TFin_LFSEN    TBASE_STKEX     TOPT_STKEX     TFin_STKEX     TBASE_LFEX      TOPT_LFEX      TFin_LFEX      TBASE_REX       TOPT_REX       TFin_REX      TOPT_PHOT      TOPT_PHO2      TFin_PHOT     TBASE_RESP      TOPT_RESP      TFin_RESP "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,    ~col_names,#                     ~check,
        0,    7,        "ECO#",#                  "@ECO#  ",
        7,   32,    "ECO-NAME",#"ECO-NAME.........        ",
       32,   40,    "DELTTMAX",#                 "DELTTMAX",
       40,   55,    "SWDF2AMP",#          "       SWDF2AMP",
       55,   70,      "EXTCFN",#          "         EXTCFN",
       70,   85,     "EXTCFST",#          "        EXTCFST",
       85,  100,    "LFNMXEXT",#          "       LFNMXEXT",
      100,  115,"AREAMX_CF(2)",#          "   AREAMX_CF(2)",
      115,  130,"AREAMX_CF(3)",#          "   AREAMX_CF(3)",
      130,  145,      "WIDCOR",#          "         WIDCOR",
      145,  160,  "WMAX_CF(1)",#          "     WMAX_CF(1)",
      160,  175,  "WMAX_CF(2)",#          "     WMAX_CF(2)",
      175,  190,  "WMAX_CF(3)",#          "     WMAX_CF(3)",
      190,  205,    "POPDECAY",#          "       POPDECAY",
      205,  220,    "TTBASEEM",#          "       TTBASEEM",
      220,  235,  "TTBASELFEX",#          "     TTBASELFEX",
      235,  250,  "LG_AMRANGE",#          "     LG_AMRANGE",
      250,  265, "LG_GP_REDUC",#          "    LG_GP_REDUC",
      265,  280,"LDG_FI_REDUC",#          "   LDG_FI_REDUC",
      280,  295,  "LMAX_CF(1)",#          "     LMAX_CF(1)",
      295,  310,  "LMAX_CF(2)",#          "     LMAX_CF(2)",
      310,  325,  "LMAX_CF(3)",#          "     LMAX_CF(3)",
      325,  340, "MAXLFLENGTH",#          "    MAXLFLENGTH",
      340,  355,  "MAXLFWIDTH",#          "     MAXLFWIDTH",
      355,  370, "TBASE_GE_EM",#          "    TBASE_GE_EM",
      370,  384,  "TOPT_GE_EM",#           "    TOPT_GE_EM",
      384,  400,  "TFin_GE_EM",#         "      TFin_GE_EM",
      400,  415,  "TBASE_LFEM",#          "     TBASE_LFEM",
      415,  430,   "TOPT_LFEM",#          "      TOPT_LFEM",
      430,  445,   "TFin_LFEM",#          "      TFin_LFEM",
      445,  460, "TBASE_TLREM",#          "    TBASE_TLREM",
      460,  475,  "TOPT_TLREM",#          "     TOPT_TLREM",
      475,  490,  "TFin_TLREM",#          "     TFin_TLREM",
      490,  505, "TBASE_LFSEN",#          "    TBASE_LFSEN",
      505,  520,  "TOPT_LFSEN",#          "     TOPT_LFSEN",
      520,  535,  "TFin_LFSEN",#          "     TFin_LFSEN",
      535,  550, "TBASE_STKEX",#          "    TBASE_STKEX",
      550,  565,  "TOPT_STKEX",#          "     TOPT_STKEX",
      565,  580,  "TFin_STKEX",#          "     TFin_STKEX",
      580,  595,  "TBASE_LFEX",#          "     TBASE_LFEX",
      595,  610,   "TOPT_LFEX",#          "      TOPT_LFEX",
      610,  625,   "TFin_LFEX",#          "      TFin_LFEX",
      625,  640,   "TBASE_REX",#          "      TBASE_REX",
      640,  655,    "TOPT_REX",#          "       TOPT_REX",
      655,  670,    "TFin_REX",#          "       TFin_REX",
      670,  685,   "TOPT_PHOT",#          "      TOPT_PHOT",
      685,  700,   "TOPT_PHO2",#          "      TOPT_PHO2",
      700,  715,   "TFin_PHOT",#          "      TFin_PHOT",
      715,  730,  "TBASE_RESP",#          "     TBASE_RESP",
      730,  745,   "TOPT_RESP",#          "      TOPT_RESP",
      745,  760,   "TFin_RESP" #          "      TFin_RESP"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECO-NAME.........        DELTTMAX       SWDF2AMP         EXTCFN        EXTCFST       LFNMXEXT   AREAMX_CF(2)   AREAMX_CF(3)         WIDCOR     WMAX_CF(1)     WMAX_CF(2)     WMAX_CF(3)       POPDECAY       TTBASEEM     TTBASELFEX     LG_AMRANGE    LG_GP_REDUC   LDG_FI_REDUC     LMAX_CF(1)     LMAX_CF(2)     LMAX_CF(3)    MAXLFLENGTH     MAXLFWIDTH    TBASE_GE_EM    TOPT_GE_EM      TFin_GE_EM     TBASE_LFEM      TOPT_LFEM      TFin_LFEM    TBASE_TLREM     TOPT_TLREM     TFin_TLREM    TBASE_LFSEN     TOPT_LFSEN     TFin_LFSEN    TBASE_STKEX     TOPT_STKEX     TFin_STKEX     TBASE_LFEX      TOPT_LFEX      TFin_LFEX      TBASE_REX       TOPT_REX       TFin_REX      TOPT_PHOT      TOPT_PHO2      TFin_PHOT     TBASE_RESP      TOPT_RESP      TFin_RESP ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECO-NAME.........        DELTTMAX       SWDF2AMP         EXTCFN        EXTCFST       LFNMXEXT   AREAMX_CF(2)   AREAMX_CF(3)         WIDCOR     WMAX_CF(1)     WMAX_CF(2)     WMAX_CF(3)       POPDECAY       TTBASEEM     TTBASELFEX     LG_AMRANGE    LG_GP_REDUC   LDG_FI_REDUC     LMAX_CF(1)     LMAX_CF(2)     LMAX_CF(3)    MAXLFLENGTH     MAXLFWIDTH    TBASE_GE_EM    TOPT_GE_EM      TFin_GE_EM     TBASE_LFEM      TOPT_LFEM      TFin_LFEM    TBASE_TLREM     TOPT_TLREM     TFin_TLREM    TBASE_LFSEN     TOPT_LFSEN     TFin_LFSEN    TBASE_STKEX     TOPT_STKEX     TFin_STKEX     TBASE_LFEX      TOPT_LFEX      TFin_LFEX      TBASE_REX       TOPT_REX       TFin_REX      TOPT_PHOT      TOPT_PHO2      TFin_PHOT     TBASE_RESP      TOPT_RESP      TFin_RESP ")

# "@ECO#  ECO-NAME.........       NS_LF_TIL   N_LF_MAX_ILA         TB0PHO         TB1PHO         TB2PHO         TBFPHO          TBPER      TBMAX_PER    LTTHRESHOLD        FDEADLF            RDM      DPERCOEFF         RWUEP1         RWUEP2   T_MAX_WS_PHO   T_MID_WS_PHO   T_MIN_WS_PHO   T_MAX_WS_EXP   T_MID_WS_EXP   T_MIN_WS_EXP    FRAC_SUC_BG    FRAC_HEX_BG    INIT_PD_RAT  IT_STR_TB_INI     IT_STR_TO1     IT_STR_TO2  IT_STR_TB_END  IT_STR_PF_MAX  IT_STR_PF_MIN   IT_STR_PF_TB   IT_STR_PF_TM   IT_STR_PF_TE    IT_STR_PF_D   IT_STR_T_RED   IT_STR_W_RED     MAX_PER_IT     DSWAT_DDWS     DSWAT_DSUC        HEX_MIN    SUC_ACC_INI   DSUC_FRAC_TS   TT_CHUMAT_LT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,     ~col_names,#                    ~check,
        0,    7,         "ECO#",#                 "@ECO#  ",
        7,   31,     "ECO-NAME",#"ECO-NAME.........       ",
       31,   40,    "NS_LF_TIL",#               "NS_LF_TIL",
       40,   55, "N_LF_MAX_ILA",#         "   N_LF_MAX_ILA",
       55,   70,       "TB0PHO",#         "         TB0PHO",
       70,   85,       "TB1PHO",#         "         TB1PHO",
       85,  100,       "TB2PHO",#         "         TB2PHO",
      100,  115,       "TBFPHO",#         "         TBFPHO",
      115,  130,        "TBPER",#         "          TBPER",
      130,  145,    "TBMAX_PER",#         "      TBMAX_PER",
      145,  160,  "LTTHRESHOLD",#         "    LTTHRESHOLD",
      160,  175,      "FDEADLF",#         "        FDEADLF",
      175,  190,          "RDM",#         "            RDM",
      190,  205,    "DPERCOEFF",#         "      DPERCOEFF",
      205,  220,       "RWUEP1",#         "         RWUEP1",
      220,  235,       "RWUEP2",#         "         RWUEP2",
      235,  250, "T_MAX_WS_PHO",#         "   T_MAX_WS_PHO",
      250,  265, "T_MID_WS_PHO",#         "   T_MID_WS_PHO",
      265,  280, "T_MIN_WS_PHO",#         "   T_MIN_WS_PHO",
      280,  295, "T_MAX_WS_EXP",#         "   T_MAX_WS_EXP",
      295,  310, "T_MID_WS_EXP",#         "   T_MID_WS_EXP",
      310,  325, "T_MIN_WS_EXP",#         "   T_MIN_WS_EXP",
      325,  340,  "FRAC_SUC_BG",#         "    FRAC_SUC_BG",
      340,  355,  "FRAC_HEX_BG",#         "    FRAC_HEX_BG",
      355,  370,  "INIT_PD_RAT",#         "    INIT_PD_RAT",
      370,  385,"IT_STR_TB_INI",#         "  IT_STR_TB_INI",
      385,  400,   "IT_STR_TO1",#         "     IT_STR_TO1",
      400,  415,   "IT_STR_TO2",#         "     IT_STR_TO2",
      415,  430,"IT_STR_TB_END",#         "  IT_STR_TB_END",
      430,  445,"IT_STR_PF_MAX",#         "  IT_STR_PF_MAX",
      445,  460,"IT_STR_PF_MIN",#         "  IT_STR_PF_MIN",
      460,  475, "IT_STR_PF_TB",#         "   IT_STR_PF_TB",
      475,  490, "IT_STR_PF_TM",#         "   IT_STR_PF_TM",
      490,  505, "IT_STR_PF_TE",#         "   IT_STR_PF_TE",
      505,  520,  "IT_STR_PF_D",#         "    IT_STR_PF_D",
      520,  535, "IT_STR_T_RED",#         "   IT_STR_T_RED",
      535,  550, "IT_STR_W_RED",#         "   IT_STR_W_RED",
      550,  565,   "MAX_PER_IT",#         "     MAX_PER_IT",
      565,  580,   "DSWAT_DDWS",#         "     DSWAT_DDWS",
      580,  595,   "DSWAT_DSUC",#         "     DSWAT_DSUC",
      595,  610,      "HEX_MIN",#         "        HEX_MIN",
      610,  625,  "SUC_ACC_INI",#         "    SUC_ACC_INI",
      625,  640, "DSUC_FRAC_TS",#         "   DSUC_FRAC_TS",
      640,  655, "TT_CHUMAT_LT" #         "   TT_CHUMAT_LT"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECO-NAME.........       NS_LF_TIL   N_LF_MAX_ILA         TB0PHO         TB1PHO         TB2PHO         TBFPHO          TBPER      TBMAX_PER    LTTHRESHOLD        FDEADLF            RDM      DPERCOEFF         RWUEP1         RWUEP2   T_MAX_WS_PHO   T_MID_WS_PHO   T_MIN_WS_PHO   T_MAX_WS_EXP   T_MID_WS_EXP   T_MIN_WS_EXP    FRAC_SUC_BG    FRAC_HEX_BG    INIT_PD_RAT  IT_STR_TB_INI     IT_STR_TO1     IT_STR_TO2  IT_STR_TB_END  IT_STR_PF_MAX  IT_STR_PF_MIN   IT_STR_PF_TB   IT_STR_PF_TM   IT_STR_PF_TE    IT_STR_PF_D   IT_STR_T_RED   IT_STR_W_RED     MAX_PER_IT     DSWAT_DDWS     DSWAT_DSUC        HEX_MIN    SUC_ACC_INI   DSUC_FRAC_TS   TT_CHUMAT_LT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECO-NAME.........       NS_LF_TIL   N_LF_MAX_ILA         TB0PHO         TB1PHO         TB2PHO         TBFPHO          TBPER      TBMAX_PER    LTTHRESHOLD        FDEADLF            RDM      DPERCOEFF         RWUEP1         RWUEP2   T_MAX_WS_PHO   T_MID_WS_PHO   T_MIN_WS_PHO   T_MAX_WS_EXP   T_MID_WS_EXP   T_MIN_WS_EXP    FRAC_SUC_BG    FRAC_HEX_BG    INIT_PD_RAT  IT_STR_TB_INI     IT_STR_TO1     IT_STR_TO2  IT_STR_TB_END  IT_STR_PF_MAX  IT_STR_PF_MIN   IT_STR_PF_TB   IT_STR_PF_TM   IT_STR_PF_TE    IT_STR_PF_D   IT_STR_T_RED   IT_STR_W_RED     MAX_PER_IT     DSWAT_DDWS     DSWAT_DSUC        HEX_MIN    SUC_ACC_INI   DSUC_FRAC_TS   TT_CHUMAT_LT")

# "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  GDDE   RUE  KCAN  STPC  RTPC TILFC  PLAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   36,     "TOPT",#            "  TOPT",
       36,   42,     "ROPT",#            "  ROPT",
       42,   48,     "GDDE",#            "  GDDE",
       48,   54,      "RUE",#            "   RUE",
       54,   60,     "KCAN",#            "  KCAN",
       60,   66,     "STPC",#            "  STPC",
       66,   72,     "RTPC",#            "  RTPC",
       72,   78,    "TILFC",#            " TILFC",
       78,   84,     "PLAM" #            "  PLAM"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE  TOPT  ROPT  GDDE   RUE  KCAN  STPC  RTPC TILFC  PLAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  GDDE   RUE  KCAN  STPC  RTPC TILFC  PLAM")

# "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI                                                                          "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   27,       "MG",#                "MG",
       27,   30,       "TM",#               " TM",
       30,   36,    "THVAR",#            " THVAR",
       36,   42,    "PL-EM",#            " PL-EM",
       42,   48,    "EM-V1",#            " EM-V1",
       48,   54,    "V1-JU",#            " V1-JU",
       54,   60,    "JU-R0",#            " JU-R0",
       60,   66,     "PM06",#            "  PM06",
       66,   72,     "PM09",#            "  PM09",
       72,   78,    "LNGSH",#            " LNGSH",
       78,   84,    "R7-R8",#            " R7-R8",
       84,   90,    "FL-VS",#            " FL-VS",
       90,   96,    "TRIFL",#            " TRIFL",
       96,  102,    "RWDTH",#            " RWDTH",
      102,  108,    "RHGHT",#            " RHGHT",
      108,  114,    "R1PPO",#            " R1PPO",
      114,  120,    "OPTBI",#            " OPTBI",
      120,  126,    "SLOBI" #            " SLOBI"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI                                                                          ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI                                                                          ")

# "@ECO#  ECONAME.........  TBASE  TOPT  ROPT   P20  DJTI  GDDE DSGFT   RUE  KCAN  TSEN  CDAY"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   36,     "TOPT",#            "  TOPT",
       36,   42,     "ROPT",#            "  ROPT",
       42,   48,      "P20",#            "   P20",
       48,   54,     "DJTI",#            "  DJTI",
       54,   60,     "GDDE",#            "  GDDE",
       60,   66,    "DSGFT",#            " DSGFT",
       66,   72,      "RUE",#            "   RUE",
       72,   78,     "KCAN",#            "  KCAN",
       78,   84,     "TSEN",#            "  TSEN",
       84,   90,     "CDAY" #            "  CDAY"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE  TOPT  ROPT   P20  DJTI  GDDE DSGFT   RUE  KCAN  TSEN  CDAY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE  TOPT  ROPT   P20  DJTI  GDDE DSGFT   RUE  KCAN  TSEN  CDAY")

# "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  TTOP   P20  VREQ  GDDE DSGFT  RUE1  RUE2 KVAL1 KVAL2 SLAP2 TC1P1 TC1P2 DTNP1 PLGP1 PLGP2  P2AF  P3AF  P4AF  P5AF  P6AF ADLAI ADTIL ADPHO STEMN MXNUP MXNCR  WFNU PNUPR EXNO3 MNNO3 EXNH4 MNNH4 INGWT INGNC FREAR MNNCR GPPSS GPPES MXGWT MNRTN NOMOB RTDP1 RTDP2  FOZ1  FOZ2 SFOZ1 SFOZ2  TSEN  CDAY"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.........  ",
       25,   30,    "TBASE",#             "TBASE",
       30,   36,     "TOPT",#            "  TOPT",
       36,   42,     "ROPT",#            "  ROPT",
       42,   48,     "TTOP",#            "  TTOP",
       48,   54,      "P20",#            "   P20",
       54,   60,     "VREQ",#            "  VREQ",
       60,   66,     "GDDE",#            "  GDDE",
       66,   72,    "DSGFT",#            " DSGFT",
       72,   78,     "RUE1",#            "  RUE1",
       78,   84,     "RUE2",#            "  RUE2",
       84,   90,    "KVAL1",#            " KVAL1",
       90,   96,    "KVAL2",#            " KVAL2",
       96,  102,    "SLAP2",#            " SLAP2",
      102,  108,    "TC1P1",#            " TC1P1",
      108,  114,    "TC1P2",#            " TC1P2",
      114,  120,    "DTNP1",#            " DTNP1",
      120,  126,    "PLGP1",#            " PLGP1",
      126,  132,    "PLGP2",#            " PLGP2",
      132,  138,     "P2AF",#            "  P2AF",
      138,  144,     "P3AF",#            "  P3AF",
      144,  150,     "P4AF",#            "  P4AF",
      150,  156,     "P5AF",#            "  P5AF",
      156,  162,     "P6AF",#            "  P6AF",
      162,  168,    "ADLAI",#            " ADLAI",
      168,  174,    "ADTIL",#            " ADTIL",
      174,  180,    "ADPHO",#            " ADPHO",
      180,  186,    "STEMN",#            " STEMN",
      186,  192,    "MXNUP",#            " MXNUP",
      192,  198,    "MXNCR",#            " MXNCR",
      198,  204,     "WFNU",#            "  WFNU",
      204,  210,    "PNUPR",#            " PNUPR",
      210,  216,    "EXNO3",#            " EXNO3",
      216,  222,    "MNNO3",#            " MNNO3",
      222,  228,    "EXNH4",#            " EXNH4",
      228,  234,    "MNNH4",#            " MNNH4",
      234,  240,    "INGWT",#            " INGWT",
      240,  246,    "INGNC",#            " INGNC",
      246,  252,    "FREAR",#            " FREAR",
      252,  258,    "MNNCR",#            " MNNCR",
      258,  264,    "GPPSS",#            " GPPSS",
      264,  270,    "GPPES",#            " GPPES",
      270,  276,    "MXGWT",#            " MXGWT",
      276,  282,    "MNRTN",#            " MNRTN",
      282,  288,    "NOMOB",#            " NOMOB",
      288,  294,    "RTDP1",#            " RTDP1",
      294,  300,    "RTDP2",#            " RTDP2",
      300,  306,     "FOZ1",#            "  FOZ1",
      306,  312,     "FOZ2",#            "  FOZ2",
      312,  318,    "SFOZ1",#            " SFOZ1",
      318,  324,    "SFOZ2",#            " SFOZ2",
      324,  330,     "TSEN",#            "  TSEN",
      330,  336,     "CDAY" #            "  CDAY"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.........  TBASE  TOPT  ROPT  TTOP   P20  VREQ  GDDE DSGFT  RUE1  RUE2 KVAL1 KVAL2 SLAP2 TC1P1 TC1P2 DTNP1 PLGP1 PLGP2  P2AF  P3AF  P4AF  P5AF  P6AF ADLAI ADTIL ADPHO STEMN MXNUP MXNCR  WFNU PNUPR EXNO3 MNNO3 EXNH4 MNNH4 INGWT INGNC FREAR MNNCR GPPSS GPPES MXGWT MNRTN NOMOB RTDP1 RTDP2  FOZ1  FOZ2 SFOZ1 SFOZ2  TSEN  CDAY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  TTOP   P20  VREQ  GDDE DSGFT  RUE1  RUE2 KVAL1 KVAL2 SLAP2 TC1P1 TC1P2 DTNP1 PLGP1 PLGP2  P2AF  P3AF  P4AF  P5AF  P6AF ADLAI ADTIL ADPHO STEMN MXNUP MXNCR  WFNU PNUPR EXNO3 MNNO3 EXNH4 MNNH4 INGWT INGNC FREAR MNNCR GPPSS GPPES MXGWT MNRTN NOMOB RTDP1 RTDP2  FOZ1  FOZ2 SFOZ1 SFOZ2  TSEN  CDAY")

# "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TILPE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "ECO#",#           "@ECO#  ",
        7,   25,  "ECONAME",#"ECONAME.......... ",
       25,   30,    "PARUE",#             "PARUE",
       30,   36,    "PARU2",#            " PARU2",
       36,   42,     "PHL2",#            "  PHL2",
       42,   48,     "PHF3",#            "  PHF3",
       48,   54,     "SLAS",#            "  SLAS",
       54,   60,    "LSENI",#            " LSENI",
       60,   66,    "LSPHS",#            " LSPHS",
       66,   72,    "LSPHE",#            " LSPHE",
       72,   78,    "TIL#S",#            " TIL#S",
       78,   84,    "TILPE",#            " TILPE",
       84,   90,    "TIFAC",#            " TIFAC",
       90,   96,    "TDPHS",#            " TDPHS",
       96,  102,    "TDPHE",#            " TDPHE",
      102,  108,    "TDFAC",#            " TDFAC",
      108,  114,     "TDSF",#            "  TDSF",
      114,  120,     "RDGS",#            "  RDGS",
      120,  126,    "HTSTD",#            " HTSTD",
      126,  132,     "AWNS",#            "  AWNS",
      132,  138,     "KCAN",#            "  KCAN",
      138,  144,     "RS%A",#            "  RS%A",
      144,  150,     "GN%S",#            "  GN%S",
      150,  156,    "GN%MN",#            " GN%MN",
      156,  162,     "GM%H",#            "  GM%H",
      162,  168,     "TKFH",#            "  TKFH",
      168,  174,    "SSPHS",#            " SSPHS",
      174,  180,    "SSPHE" #            " SSPHE"
  )

  col_names <-   c("    P1", "ECO   ")

  left_just <-   c("ECO   ", "ECO#", "ECONAME\\.*", "ECO-NAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TILPE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TILPE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE")


# "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR",#           " PODUR",
      126,  132,    "THRSH",#           " THRSH",
      132,  138,    "SDPRO",#           " SDPRO",
      138,  144,    "SDLIP" #           " SDLIP"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
                                                  col_names = col_names,
                                                  left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP")

# "@VAR#  VAR-NAME........  EXP#   ECO#   P1V   P1D    P5    G1    G2    G3 PHINT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "VAR#",#           "@VAR#  ",
        7,   25, "VAR-NAME",#"VAR-NAME........  ",
       25,   29,     "EXP#",#              "EXP#",
       29,   36,     "ECO#",#           "   ECO#",
       36,   42,      "P1V",#            "   P1V",
       42,   48,      "P1D",#            "   P1D",
       48,   54,       "P5",#            "    P5",
       54,   60,       "G1",#            "    G1",
       60,   66,       "G2",#            "    G2",
       66,   72,       "G3",#            "    G3",
       72,   78,    "PHINT" #            " PHINT"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........  EXP#   ECO#   P1V   P1D    P5    G1    G2    G3 PHINT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........  EXP#   ECO#   P1V   P1D    P5    G1    G2    G3 PHINT")


# "@VAR#  VAR-NAME........  EXP#   ECO#    P1    P2    P3    P4    P5    P6    P7    P8  VREQ VBASE  VEFF  PPS1  PPS2 PHINT  LA1S  LAFV  LAFR SHWTS G#WTS  GWTS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "VAR#",#           "@VAR#  ",
        7,   25, "VAR-NAME",#"VAR-NAME........  ",
       25,   29,     "EXP#",#              "EXP#",
       29,   36,     "ECO#",#           "   ECO#",
       36,   42,       "P1",#            "    P1",
       42,   48,       "P2",#            "    P2",
       48,   54,       "P3",#            "    P3",
       54,   60,       "P4",#            "    P4",
       60,   66,       "P5",#            "    P5",
       66,   72,       "P6",#            "    P6",
       72,   78,       "P7",#            "    P7",
       78,   84,       "P8",#            "    P8",
       84,   90,     "VREQ",#            "  VREQ",
       90,   96,    "VBASE",#            " VBASE",
       96,  102,     "VEFF",#            "  VEFF",
      102,  108,     "PPS1",#            "  PPS1",
      108,  114,     "PPS2",#            "  PPS2",
      114,  120,    "PHINT",#            " PHINT",
      120,  126,     "LA1S",#            "  LA1S",
      126,  132,     "LAFV",#            "  LAFV",
      132,  138,     "LAFR",#            "  LAFR",
      138,  144,    "SHWTS",#            " SHWTS",
      144,  150,    "G#WTS",#            " G#WTS",
      150,  156,     "GWTS" #            "  GWTS"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........  EXP#   ECO#    P1    P2    P3    P4    P5    P6    P7    P8  VREQ VBASE  VEFF  PPS1  PPS2 PHINT  LA1S  LAFV  LAFR SHWTS G#WTS  GWTS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........  EXP#   ECO#    P1    P2    P3    P4    P5    P6    P7    P8  VREQ VBASE  VEFF  PPS1  PPS2 PHINT  LA1S  LAFV  LAFR SHWTS G#WTS  GWTS")

# "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR",#           " PODUR",
      126,  132,    "THRSH",#           " THRSH",
      132,  138,    "SDPRO",#           " SDPRO",
      138,  144,    "SDLIP" #           " SDLIP"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ")

# "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,       "P2",#           "    P2",
       48,   54,       "P5",#           "    P5",
       54,   60,       "G2",#           "    G2",
       60,   66,       "G3",#           "    G3",
       66,   72,    "PHINT" #           " PHINT"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT")

# "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR",#           " PODUR",
      126,  132,    "THRSH",#           " THRSH",
      132,  138,    "SDPRO",#           " SDPRO",
      138,  144,    "SDLIP" #           " SDLIP"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP")

# "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR",#           " PODUR",
      126,  132,    "THRSH",#           " THRSH",
      132,  138,    "SDPRO",#           " SDPRO",
      138,  144,    "SDLIP" #           " SDLIP"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP ")

# "@VAR#  VAR-NAME........  EXP#   ECO#  PPS1 B01ND B12ND B23ND B34ND B45ND B56ND SR#WT  SRFR  HMPC PHINT  LA1S  LAXS LAXND LAXN2  LAFS LAFND  SLAS LLIFA LPEFR  STFR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "VAR#",#           "@VAR#  ",
        7,   25, "VAR-NAME",#"VAR-NAME........  ",
       25,   29,     "EXP#",#              "EXP#",
       29,   36,     "ECO#",#           "   ECO#",
       36,   42,     "PPS1",#            "  PPS1",
       42,   48,    "B01ND",#            " B01ND",
       48,   54,    "B12ND",#            " B12ND",
       54,   60,    "B23ND",#            " B23ND",
       60,   66,    "B34ND",#            " B34ND",
       66,   72,    "B45ND",#            " B45ND",
       72,   78,    "B56ND",#            " B56ND",
       78,   84,    "SR#WT",#            " SR#WT",
       84,   90,     "SRFR",#            "  SRFR",
       90,   96,     "HMPC",#            "  HMPC",
       96,  102,    "PHINT",#            " PHINT",
      102,  108,     "LA1S",#            "  LA1S",
      108,  114,     "LAXS",#            "  LAXS",
      114,  120,    "LAXND",#            " LAXND",
      120,  126,    "LAXN2",#            " LAXN2",
      126,  132,     "LAFS",#            "  LAFS",
      132,  138,    "LAFND",#            " LAFND",
      138,  144,     "SLAS",#            "  SLAS",
      144,  150,    "LLIFA",#            " LLIFA",
      150,  156,    "LPEFR",#            " LPEFR",
      156,  162,     "STFR" #            "  STFR"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........  EXP#   ECO#  PPS1 B01ND B12ND B23ND B34ND B45ND B56ND SR#WT  SRFR  HMPC PHINT  LA1S  LAXS LAXND LAXN2  LAFS LAFND  SLAS LLIFA LPEFR  STFR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........  EXP#   ECO#  PPS1 B01ND B12ND B23ND B34ND B45ND B56ND SR#WT  SRFR  HMPC PHINT  LA1S  LAXS LAXND LAXN2  LAFS LAFND  SLAS LLIFA LPEFR  STFR")

# "@VAR#  VAR-NAME........  EXP#   ECO# B01ND B12ND B23ND B34ND BR1FX BR2FX BR3FX BR4FX  LAXS  SLAS LLIFA LPEFR LNSLP NODWT NODLT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    7,     "VAR#",#           "@VAR#  ",
        7,   25, "VAR-NAME",#"VAR-NAME........  ",
       25,   29,     "EXP#",#              "EXP#",
       29,   36,     "ECO#",#           "   ECO#",
       36,   42,    "B01ND",#            " B01ND",
       42,   48,    "B12ND",#            " B12ND",
       48,   54,    "B23ND",#            " B23ND",
       54,   60,    "B34ND",#            " B34ND",
       60,   66,    "BR1FX",#            " BR1FX",
       66,   72,    "BR2FX",#            " BR2FX",
       72,   78,    "BR3FX",#            " BR3FX",
       78,   84,    "BR4FX",#            " BR4FX",
       84,   90,     "LAXS",#            "  LAXS",
       90,   96,     "SLAS",#            "  SLAS",
       96,  102,    "LLIFA",#            " LLIFA",
      102,  108,    "LPEFR",#            " LPEFR",
      108,  114,    "LNSLP",#            " LNSLP",
      114,  120,    "NODWT",#            " NODWT",
      120,  126,    "NODLT" #            " NODLT"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........  EXP#   ECO# B01ND B12ND B23ND B34ND BR1FX BR2FX BR3FX BR4FX  LAXS  SLAS LLIFA LPEFR LNSLP NODWT NODLT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........  EXP#   ECO# B01ND B12ND B23ND B34ND BR1FX BR2FX BR3FX BR4FX  LAXS  SLAS LLIFA LPEFR LNSLP NODWT NODLT")

# "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR" #           " PODUR"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2O   P2R    P5    G1    G4 PHINT    GT    G5"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,      "P2O",#           "   P2O",
       48,   54,      "P2R",#           "   P2R",
       54,   60,       "P5",#           "    P5",
       60,   66,       "G1",#           "    G1",
       66,   72,       "G4",#           "    G4",
       72,   78,    "PHINT",#           " PHINT",
       78,   84,       "GT",#           "    GT",
       84,   90,       "G5" #           "    G5"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2O   P2R    P5    G1    G4 PHINT    GT    G5",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2O   P2R    P5    G1    G4 PHINT    GT    G5")

# "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT    AX   ALL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,       "P2",#           "    P2",
       48,   54,       "P5",#           "    P5",
       54,   60,       "G2",#           "    G2",
       60,   66,       "G3",#           "    G3",
       66,   72,    "PHINT",#           " PHINT",
       72,   78,       "AX",#           "    AX",
       78,   84,      "ALL" #           "   ALL"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT    AX   ALL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT    AX   ALL")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    TC    P1    P2    P3    P4    P5    P6    P7    P8    G1    G2    G3 PHINT    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "TC",#           "    TC",
       42,   48,       "P1",#           "    P1",
       48,   54,       "P2",#           "    P2",
       54,   60,       "P3",#           "    P3",
       60,   66,       "P4",#           "    P4",
       66,   72,       "P5",#           "    P5",
       72,   78,       "P6",#           "    P6",
       78,   84,       "P7",#           "    P7",
       84,   90,       "P8",#           "    P8",
       90,   96,       "G1",#           "    G1",
       96,  102,       "G2",#           "    G2",
      102,  108,       "G3",#           "    G3",
      108,  114,    "PHINT" #           " PHINT"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    TC    P1    P2    P3    P4    P5    P6    P7    P8    G1    G2    G3 PHINT    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    TC    P1    P2    P3    P4    P5    P6    P7    P8    G1    G2    G3 PHINT    ")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    G2    G3    PD    P2    TC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "G2",#           "    G2",
       42,   48,       "G3",#           "    G3",
       48,   54,       "PD",#           "    PD",
       54,   60,       "P2",#           "    P2",
       60,   66,       "TC" #           "    TC"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    G2    G3    PD    P2    TC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    G2    G3    PD    P2    TC")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2R    P5   P2O    G1    G2    G3 PHINT  THOT TCLDP TCLDF  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,      "P2R",#           "   P2R",
       48,   54,       "P5",#           "    P5",
       54,   60,      "P2O",#           "   P2O",
       60,   66,       "G1",#           "    G1",
       66,   72,       "G2",#           "    G2",
       72,   78,       "G3",#           "    G3",
       78,   84,    "PHINT",#           " PHINT",
       84,   90,     "THOT",#           "  THOT",
       90,   96,    "TCLDP",#           " TCLDP",
       96,  102,    "TCLDF" #           " TCLDF"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2R    P5   P2O    G1    G2    G3 PHINT  THOT TCLDP TCLDF  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2R    P5   P2O    G1    G2    G3 PHINT  THOT TCLDP TCLDF  ")

# "@VAR#  VAR-NAME........ EXPNO   ECO#       MaxPARCE          APFMX       STKPFMAX           SUCA           TBFT          LFMAX       MXLFAREA       MXLFARNO            PI1            PI2        PSWITCH       TTPLNTEM       TTRATNEM      CHUPIBASE   TT_POPGROWTH        POPTT16           TAR0         TDELAY           LER0           SER0      LG_AMBASE        AQP_UP5"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,    ~col_names,#             ~check,
        0,    7,        "VAR#",#          "@VAR#  ",
        7,   24,    "VAR-NAME",#"VAR-NAME........ ",
       24,   29,       "EXPNO",#            "EXPNO",
       29,   36,        "ECO#",#          "   ECO#",
       36,   51,    "MaxPARCE",#  "       MaxPARCE",
       51,   66,       "APFMX",#  "          APFMX",
       66,   81,    "STKPFMAX",#  "       STKPFMAX",
       81,   96,        "SUCA",#  "           SUCA",
       96,  111,        "TBFT",#  "           TBFT",
      111,  126,       "LFMAX",#  "          LFMAX",
      126,  141,    "MXLFAREA",#  "       MXLFAREA",
      141,  156,    "MXLFARNO",#  "       MXLFARNO",
      156,  171,         "PI1",#  "            PI1",
      171,  186,         "PI2",#  "            PI2",
      186,  201,     "PSWITCH",#  "        PSWITCH",
      201,  216,    "TTPLNTEM",#  "       TTPLNTEM",
      216,  231,    "TTRATNEM",#  "       TTRATNEM",
      231,  246,   "CHUPIBASE",#  "      CHUPIBASE",
      246,  261,"TT_POPGROWTH",#  "   TT_POPGROWTH",
      261,  276,     "POPTT16",#  "        POPTT16",
      276,  291,        "TAR0",#  "           TAR0",
      291,  306,      "TDELAY",#  "         TDELAY",
      306,  321,        "LER0",#  "           LER0",
      321,  336,        "SER0",#  "           SER0",
      336,  351,   "LG_AMBASE",#  "      LG_AMBASE",
      351,  366,     "AQP_UP5" #  "        AQP_UP5"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#       MaxPARCE          APFMX       STKPFMAX           SUCA           TBFT          LFMAX       MXLFAREA       MXLFARNO            PI1            PI2        PSWITCH       TTPLNTEM       TTRATNEM      CHUPIBASE   TT_POPGROWTH        POPTT16           TAR0         TDELAY           LER0           SER0      LG_AMBASE        AQP_UP5",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#       MaxPARCE          APFMX       STKPFMAX           SUCA           TBFT          LFMAX       MXLFAREA       MXLFARNO            PI1            PI2        PSWITCH       TTPLNTEM       TTRATNEM      CHUPIBASE   TT_POPGROWTH        POPTT16           TAR0         TDELAY           LER0           SER0      LG_AMBASE        AQP_UP5")

# "@VAR#  VAR-NAME........ EXPNO   ECO# LFMAX PHTMX Stalk Sucro Null1  PLF1  PLF2 Gamma  StkB  StkM Null3 SIZLF LIsun LIshd Null4  TB_1 TO1_1 TO2_1  TM_1   PI1   PI2  DTPI LSFAC Null5   LI1 TELOM  TB_2 TO1_2 TO2_2  TM_2  Ph1P  Ph1R   Ph2   Ph3   Ph4 StHrv RTNFC MinGr Null7 RE30C RL30C R30C2            "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,    "LFMAX",#           " LFMAX",
       42,   48,    "PHTMX",#           " PHTMX",
       48,   54,    "Stalk",#           " Stalk",
       54,   60,    "Sucro",#           " Sucro",
       60,   66,    "Null1",#           " Null1",
       66,   72,     "PLF1",#           "  PLF1",
       72,   78,     "PLF2",#           "  PLF2",
       78,   84,    "Gamma",#           " Gamma",
       84,   90,     "StkB",#           "  StkB",
       90,   96,     "StkM",#           "  StkM",
       96,  102,    "Null3",#           " Null3",
      102,  108,    "SIZLF",#           " SIZLF",
      108,  114,    "LIsun",#           " LIsun",
      114,  120,    "LIshd",#           " LIshd",
      120,  126,    "Null4",#           " Null4",
      126,  132,     "TB_1",#           "  TB_1",
      132,  138,    "TO1_1",#           " TO1_1",
      138,  144,    "TO2_1",#           " TO2_1",
      144,  150,     "TM_1",#           "  TM_1",
      150,  156,      "PI1",#           "   PI1",
      156,  162,      "PI2",#           "   PI2",
      162,  168,     "DTPI",#           "  DTPI",
      168,  174,    "LSFAC",#           " LSFAC",
      174,  180,    "Null5",#           " Null5",
      180,  186,      "LI1",#           "   LI1",
      186,  192,    "TELOM",#           " TELOM",
      192,  198,     "TB_2",#           "  TB_2",
      198,  204,    "TO1_2",#           " TO1_2",
      204,  210,    "TO2_2",#           " TO2_2",
      210,  216,     "TM_2",#           "  TM_2",
      216,  222,     "Ph1P",#           "  Ph1P",
      222,  228,     "Ph1R",#           "  Ph1R",
      228,  234,      "Ph2",#           "   Ph2",
      234,  240,      "Ph3",#           "   Ph3",
      240,  246,      "Ph4",#           "   Ph4",
      246,  252,    "StHrv",#           " StHrv",
      252,  258,    "RTNFC",#           " RTNFC",
      258,  264,    "MinGr",#           " MinGr",
      264,  270,    "Null7",#           " Null7",
      270,  276,    "RE30C",#           " RE30C",
      276,  282,    "RL30C",#           " RL30C",
      282,  288,    "R30C2" #           " R30C2"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO# LFMAX PHTMX Stalk Sucro Null1  PLF1  PLF2 Gamma  StkB  StkM Null3 SIZLF LIsun LIshd Null4  TB_1 TO1_1 TO2_1  TM_1   PI1   PI2  DTPI LSFAC Null5   LI1 TELOM  TB_2 TO1_2 TO2_2  TM_2  Ph1P  Ph1R   Ph2   Ph3   Ph4 StHrv RTNFC MinGr Null7 RE30C RL30C R30C2            ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO# LFMAX PHTMX Stalk Sucro Null1  PLF1  PLF2 Gamma  StkB  StkM Null3 SIZLF LIsun LIshd Null4  TB_1 TO1_1 TO2_1  TM_1   PI1   PI2  DTPI LSFAC Null5   LI1 TELOM  TB_2 TO1_2 TO2_2  TM_2  Ph1P  Ph1R   Ph2   Ph3   Ph4 StHrv RTNFC MinGr Null7 RE30C RL30C R30C2            ")

# "@VAR#  VAR-NAME........ EXPNO   ECO#          MAXGL    N_LF_STK_EM   N_LF_IT_FORM         MAXDGL           AMAX            EFF         CHUSTK        CHUPEAK         CHUDEC         CHUMAT         POPMAT        POPPEAK     TILLOCHRON    PHYLLOCHRON            SLA            MLA    PLASTOCHRON   INIT_LF_AREA     MAX_INI_LA      MAX_IT_DW  MID_TT_IT_GRO  END_TT_IT_GRO  MID_TT_LF_GRO  END_TT_LF_GRO"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,     ~col_names,#             ~check,
        0,    7,         "VAR#",#          "@VAR#  ",
        7,   24,     "VAR-NAME",#"VAR-NAME........ ",
       24,   29,        "EXPNO",#            "EXPNO",
       29,   36,         "ECO#",#          "   ECO#",
       36,   51,        "MAXGL",#  "          MAXGL",
       51,   66,  "N_LF_STK_EM",#  "    N_LF_STK_EM",
       66,   81, "N_LF_IT_FORM",#  "   N_LF_IT_FORM",
       81,   96,       "MAXDGL",#  "         MAXDGL",
       96,  111,         "AMAX",#  "           AMAX",
      111,  126,          "EFF",#  "            EFF",
      126,  141,       "CHUSTK",#  "         CHUSTK",
      141,  156,      "CHUPEAK",#  "        CHUPEAK",
      156,  171,       "CHUDEC",#  "         CHUDEC",
      171,  186,       "CHUMAT",#  "         CHUMAT",
      186,  201,       "POPMAT",#  "         POPMAT",
      201,  216,      "POPPEAK",#  "        POPPEAK",
      216,  231,   "TILLOCHRON",#  "     TILLOCHRON",
      231,  246,  "PHYLLOCHRON",#  "    PHYLLOCHRON",
      246,  261,          "SLA",#  "            SLA",
      261,  276,          "MLA",#  "            MLA",
      276,  291,  "PLASTOCHRON",#  "    PLASTOCHRON",
      291,  306, "INIT_LF_AREA",#  "   INIT_LF_AREA",
      306,  321,   "MAX_INI_LA",#  "     MAX_INI_LA",
      321,  336,    "MAX_IT_DW",#  "      MAX_IT_DW",
      336,  351,"MID_TT_IT_GRO",#  "  MID_TT_IT_GRO",
      351,  366,"END_TT_IT_GRO",#  "  END_TT_IT_GRO",
      366,  381,"MID_TT_LF_GRO",#  "  MID_TT_LF_GRO",
      381,  396,"END_TT_LF_GRO" #  "  END_TT_LF_GRO"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#          MAXGL    N_LF_STK_EM   N_LF_IT_FORM         MAXDGL           AMAX            EFF         CHUSTK        CHUPEAK         CHUDEC         CHUMAT         POPMAT        POPPEAK     TILLOCHRON    PHYLLOCHRON            SLA            MLA    PLASTOCHRON   INIT_LF_AREA     MAX_INI_LA      MAX_IT_DW  MID_TT_IT_GRO  END_TT_IT_GRO  MID_TT_LF_GRO  END_TT_LF_GRO",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#          MAXGL    N_LF_STK_EM   N_LF_IT_FORM         MAXDGL           AMAX            EFF         CHUSTK        CHUPEAK         CHUDEC         CHUMAT         POPMAT        POPPEAK     TILLOCHRON    PHYLLOCHRON            SLA            MLA    PLASTOCHRON   INIT_LF_AREA     MAX_INI_LA      MAX_IT_DW  MID_TT_IT_GRO  END_TT_IT_GRO  MID_TT_LF_GRO  END_TT_LF_GRO")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P2   P2O   P2R PANTH    P3    P4    P5 PHINT    G1    G2 PBASE  PSAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,       "P2",#           "    P2",
       48,   54,      "P2O",#           "   P2O",
       54,   60,      "P2R",#           "   P2R",
       60,   66,    "PANTH",#           " PANTH",
       66,   72,       "P3",#           "    P3",
       72,   78,       "P4",#           "    P4",
       78,   84,       "P5",#           "    P5",
       84,   90,    "PHINT",#           " PHINT",
       90,   96,       "G1",#           "    G1",
       96,  102,       "G2",#           "    G2",
      102,  108,    "PBASE",#           " PBASE",
      108,  114,     "PSAT" #           "  PSAT"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P2   P2O   P2R PANTH    P3    P4    P5 PHINT    G1    G2 PBASE  PSAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P2   P2O   P2R PANTH    P3    P4    P5 PHINT    G1    G2 PBASE  PSAT")

# "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP                                                        "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "CSDL",#           "  CSDL",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,    "EM-FL",#           " EM-FL",
       54,   60,    "FL-SH",#           " FL-SH",
       60,   66,    "FL-SD",#           " FL-SD",
       66,   72,    "SD-PM",#           " SD-PM",
       72,   78,    "FL-LF",#           " FL-LF",
       78,   84,    "LFMAX",#           " LFMAX",
       84,   90,    "SLAVR",#           " SLAVR",
       90,   96,    "SIZLF",#           " SIZLF",
       96,  102,     "XFRT",#           "  XFRT",
      102,  108,    "WTPSD",#           " WTPSD",
      108,  114,    "SFDUR",#           " SFDUR",
      114,  120,    "SDPDV",#           " SDPDV",
      120,  126,    "PODUR",#           " PODUR",
      126,  132,    "THRSH",#           " THRSH",
      132,  138,    "SDPRO",#           " SDPRO",
      138,  144,    "SDLIP" #           " SDLIP"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP                                                        ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP                                                        ")

# "@VAR#  VRNAME.......... EXPNO   ECO#  VSEN PPSEN    P1    P5 PHINT  GRNO MXFIL STMMX SLAP1"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24,   "VRNAME",#"VRNAME.......... ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,     "VSEN",#           "  VSEN",
       42,   48,    "PPSEN",#           " PPSEN",
       48,   54,       "P1",#           "    P1",
       54,   60,       "P5",#           "    P5",
       60,   66,    "PHINT",#           " PHINT",
       66,   72,     "GRNO",#           "  GRNO",
       72,   78,    "MXFIL",#           " MXFIL",
       78,   84,    "STMMX",#           " STMMX",
       84,   90,    "SLAP1" #           " SLAP1"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VRNAME.......... EXPNO   ECO#  VSEN PPSEN    P1    P5 PHINT  GRNO MXFIL STMMX SLAP1",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VRNAME.......... EXPNO   ECO#  VSEN PPSEN    P1    P5 PHINT  GRNO MXFIL STMMX SLAP1")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT PCGRD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,       "P3",#           "    P3",
       48,   54,       "P4",#           "    P4",
       54,   60,       "P5",#           "    P5",
       60,   66,       "G2",#           "    G2",
       66,   72,       "G3",#           "    G3",
       72,   78,       "G4",#           "    G4",
       78,   84,    "PHINT",#           " PHINT",
       84,   90,    "PCINT",#           " PCINT",
       90,   96,    "PCGRD" #           " PCGRD"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT PCGRD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT PCGRD")

# "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT  PCGRD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    7,     "VAR#",#          "@VAR#  ",
        7,   24, "VAR-NAME",#"VAR-NAME........ ",
       24,   29,    "EXPNO",#            "EXPNO",
       29,   36,     "ECO#",#          "   ECO#",
       36,   42,       "P1",#           "    P1",
       42,   48,       "P3",#           "    P3",
       48,   54,       "P4",#           "    P4",
       54,   60,       "P5",#           "    P5",
       60,   66,       "G2",#           "    G2",
       66,   72,       "G3",#           "    G3",
       72,   78,       "G4",#           "    G4",
       78,   84,    "PHINT",#           " PHINT",
       84,   90,    "PCINT",#           " PCINT",
       90,   97,    "PCGRD" #          "  PCGRD"
  )

  col_names <-   c("Stalk", "Sucro", "Null1", "TB(1)", "TO1(1)", "TO2(1)", "TB(2)",
  "TO1(2)", "TO2(2)", " *TM(1)", " *TM(2)", "StHrv", "RTNFAC",
  "Null7", "RES30C", "RLF30C")

  left_just <-   c("VAR#", "VARNAME\\.*", "VAR-NAME\\.*", "VRNAME\\.*")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT  PCGRD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT  PCGRD")


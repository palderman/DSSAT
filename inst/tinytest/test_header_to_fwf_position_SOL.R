# "@SITE        COUNTRY          LAT     LONG SCS FAMILY"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#             ~check,
        0,      13,      "SITE",#    "@SITE        ",
       13,      30,   "COUNTRY",#"COUNTRY          ",
       30,      33,       "LAT",#              "LAT",
       33,      42,      "LONG",#        "     LONG",
       42,NA_real_,"SCS FAMILY" #      " SCS FAMILY"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS FAMILY",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS FAMILY")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC" #"  SCEC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                  "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                                                                                                                         ~check,
        0,      13,      "SITE",#                                                                                                                                                "@SITE        ",
       13,      30,   "COUNTRY",#                                                                                                                                            "COUNTRY          ",
       30,      33,       "LAT",#                                                                                                                                                          "LAT",
       33,      42,      "LONG",#                                                                                                                                                    "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                                                                                                                  "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                  ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                           "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                           ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                           ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                 "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                 ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                 ")

# "@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,     "SLCA",#"  SLCA",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC" #"  SLEC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC ")

# "@  SLB SLMH   SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,      "SLB",# "@  SLB",
        6,   11,     "SLMH",#  " SLMH",
       11,   18,     "SLLL",#"   SLLL",
       18,   24,     "SDUL",# "  SDUL",
       24,   30,     "SSAT",# "  SSAT",
       30,   36,     "SRGF",# "  SRGF",
       36,   42,     "SSKS",# "  SSKS",
       42,   48,     "SBDM",# "  SBDM",
       48,   54,     "SLOC",# "  SLOC",
       54,   60,     "SLCL",# "  SLCL",
       60,   66,     "SLSI",# "  SLSI",
       66,   72,     "SLCF",# "  SLCF",
       72,   78,     "SLNI",# "  SLNI",
       78,   84,     "SLHW",# "  SLHW",
       84,   90,     "SLHB",# "  SLHB",
       90,   96,     "SCEC" # "  SCEC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB SLMH   SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB SLMH   SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC")

# "@SITE        COUNTRY          LAT     LONG SCS FAMILY                                                                                                      "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                                                                             ~check,
        0,      13,      "SITE",#                                                                                                    "@SITE        ",
       13,      30,   "COUNTRY",#                                                                                                "COUNTRY          ",
       30,      33,       "LAT",#                                                                                                              "LAT",
       33,      42,      "LONG",#                                                                                                        "     LONG",
       42,NA_real_,"SCS FAMILY" #" SCS FAMILY                                                                                                      "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS FAMILY                                                                                                      ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS FAMILY                                                                                                      ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                               "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                               ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                               ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                     "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                     ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                     ")

# "@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC                                                           "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,     "SLCA",#"  SLCA",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC" #"  SLEC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC                                                           ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO  SLCA  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC                                                           ")

# "@SITE        COUNTRY          LAT     LONG SCS Family"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#             ~check,
        0,      13,      "SITE",#    "@SITE        ",
       13,      30,   "COUNTRY",#"COUNTRY          ",
       30,      33,       "LAT",#              "LAT",
       33,      42,      "LONG",#        "     LONG",
       42,NA_real_,"SCS Family" #      " SCS Family"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family")

# "@  SLB ALFVG   MVG   NVG WCRES"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,    "ALFVG",#" ALFVG",
       12,   18,      "MVG",#"   MVG",
       18,   24,      "NVG",#"   NVG",
       24,   30,    "WCRES" #" WCRES"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB ALFVG   MVG   NVG WCRES",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB ALFVG   MVG   NVG WCRES")

# "@SITE        COUNTRY          LAT     LONG SCS FAMILY                           "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                  ~check,
        0,      13,      "SITE",#                         "@SITE        ",
       13,      30,   "COUNTRY",#                     "COUNTRY          ",
       30,      33,       "LAT",#                                   "LAT",
       33,      42,      "LONG",#                             "     LONG",
       42,NA_real_,"SCS FAMILY" #" SCS FAMILY                           "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS FAMILY                           ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS FAMILY                           ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                    ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC" #"  SCEC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC    ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                 "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                        ~check,
        0,      13,      "SITE",#                                               "@SITE        ",
       13,      30,   "COUNTRY",#                                           "COUNTRY          ",
       30,      33,       "LAT",#                                                         "LAT",
       33,      42,      "LONG",#                                                   "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                 "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                 ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                 ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                          "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                          ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                          ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                   "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                                                                                                                          ~check,
        0,      13,      "SITE",#                                                                                                                                                 "@SITE        ",
       13,      30,   "COUNTRY",#                                                                                                                                             "COUNTRY          ",
       30,      33,       "LAT",#                                                                                                                                                           "LAT",
       33,      42,      "LONG",#                                                                                                                                                     "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                                                                                                                   "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                                                                                                                   ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                            "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                            ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                                                                                                            ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                                                                                                  ")

# "@SITE        COUNTRY          LAT     LONG SCS FAMILY "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#             ~check,
        0,      13,      "SITE",#    "@SITE        ",
       13,      30,   "COUNTRY",#"COUNTRY          ",
       30,      33,       "LAT",#              "LAT",
       33,      42,      "LONG",#        "     LONG",
       42,NA_real_,"SCS FAMILY" #     " SCS FAMILY "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS FAMILY ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS FAMILY ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SGRP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE",#"  SMKE",
       60,   66,     "SGRP" #"  SGRP"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SGRP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SGRP")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC   SLCA "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,      "SLB",# "@  SLB",
        6,   12,     "SLPX",# "  SLPX",
       12,   18,     "SLPT",# "  SLPT",
       18,   24,     "SLPO",# "  SLPO",
       24,   30,    "CACO3",# " CACO3",
       30,   36,     "SLAL",# "  SLAL",
       36,   42,     "SLFE",# "  SLFE",
       42,   48,     "SLMN",# "  SLMN",
       48,   54,     "SLBS",# "  SLBS",
       54,   60,     "SLPA",# "  SLPA",
       60,   66,     "SLPB",# "  SLPB",
       66,   72,     "SLKE",# "  SLKE",
       72,   78,     "SLMG",# "  SLMG",
       78,   84,     "SLNA",# "  SLNA",
       84,   90,     "SLSU",# "  SLSU",
       90,   96,     "SLEC",# "  SLEC",
       96,  103,     "SLCA" #"   SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC   SLCA ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC   SLCA ")

# "@SITE        COUNTRY          LAT     LONG SCS FAMILY    "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#             ~check,
        0,      13,      "SITE",#    "@SITE        ",
       13,      30,   "COUNTRY",#"COUNTRY          ",
       30,      33,       "LAT",#              "LAT",
       33,      42,      "LONG",#        "     LONG",
       42,NA_real_,"SCS FAMILY" #  " SCS FAMILY    "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS FAMILY    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS FAMILY    ")

# "@ SCOM  SALB  SLUI  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SRGP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLUI",#"  SLUI",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE",#"  SMKE",
       60,   66,     "SRGP" #"  SRGP"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLUI  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SRGP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLUI  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE  SRGP")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                     "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                            ~check,
        0,      13,      "SITE",#                                                   "@SITE        ",
       13,      30,   "COUNTRY",#                                               "COUNTRY          ",
       30,      33,       "LAT",#                                                             "LAT",
       33,      42,      "LONG",#                                                       "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                     "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                     ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                     ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                              "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                              ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                              ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC    ")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA    ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                        "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                               ~check,
        0,      13,      "SITE",#                                                      "@SITE        ",
       13,      30,   "COUNTRY",#                                                  "COUNTRY          ",
       30,      33,       "LAT",#                                                                "LAT",
       33,      42,      "LONG",#                                                          "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                        "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                        ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                        ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                 "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                 ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                 ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC       "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC       ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC       ")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA       "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA       ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA       ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                                 "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                                        ~check,
        0,      13,      "SITE",#                                                               "@SITE        ",
       13,      30,   "COUNTRY",#                                                           "COUNTRY          ",
       30,      33,       "LAT",#                                                                         "LAT",
       33,      42,      "LONG",#                                                                   "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                                 "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                                 ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                                 ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                          "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                          ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                                          ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC                ")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA                "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA                ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA                ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                   "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                          ~check,
        0,      13,      "SITE",#                                                 "@SITE        ",
       13,      30,   "COUNTRY",#                                             "COUNTRY          ",
       30,      33,       "LAT",#                                                           "LAT",
       33,      42,      "LONG",#                                                     "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                   "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                   ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                            "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                            ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                            ")

# "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLMH",#"  SLMH",
       12,   18,     "SLLL",#"  SLLL",
       18,   24,     "SDUL",#"  SDUL",
       24,   30,     "SSAT",#"  SSAT",
       30,   36,     "SRGF",#"  SRGF",
       36,   42,     "SSKS",#"  SSKS",
       42,   48,     "SBDM",#"  SBDM",
       48,   54,     "SLOC",#"  SLOC",
       54,   60,     "SLCL",#"  SLCL",
       60,   66,     "SLSI",#"  SLSI",
       66,   72,     "SLCF",#"  SLCF",
       72,   78,     "SLNI",#"  SLNI",
       78,   84,     "SLHW",#"  SLHW",
       84,   90,     "SLHB",#"  SLHB",
       90,   96,     "SCEC",#"  SCEC",
       96,  102,     "SADC" #"  SADC"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC  ")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA  ")

# "@SITE        COUNTRY          LAT     LONG SCS Family                                                  "

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#                                                         ~check,
        0,      13,      "SITE",#                                                "@SITE        ",
       13,      30,   "COUNTRY",#                                            "COUNTRY          ",
       30,      33,       "LAT",#                                                          "LAT",
       33,      42,      "LONG",#                                                    "     LONG",
       42,NA_real_,"SCS Family" #" SCS Family                                                  "
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE        COUNTRY          LAT     LONG SCS Family                                                  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE        COUNTRY          LAT     LONG SCS Family                                                  ")

# "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                           "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SCOM",#"@ SCOM",
        6,   12,     "SALB",#"  SALB",
       12,   18,     "SLU1",#"  SLU1",
       18,   24,     "SLDR",#"  SLDR",
       24,   30,     "SLRO",#"  SLRO",
       30,   36,     "SLNF",#"  SLNF",
       36,   42,     "SLPF",#"  SLPF",
       42,   48,     "SMHB",#"  SMHB",
       48,   54,     "SMPX",#"  SMPX",
       54,   60,     "SMKE" #"  SMKE"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                           ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE                                           ")

# "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,      "SLB",#"@  SLB",
        6,   12,     "SLPX",#"  SLPX",
       12,   18,     "SLPT",#"  SLPT",
       18,   24,     "SLPO",#"  SLPO",
       24,   30,    "CACO3",#" CACO3",
       30,   36,     "SLAL",#"  SLAL",
       36,   42,     "SLFE",#"  SLFE",
       42,   48,     "SLMN",#"  SLMN",
       48,   54,     "SLBS",#"  SLBS",
       54,   60,     "SLPA",#"  SLPA",
       60,   66,     "SLPB",#"  SLPB",
       66,   72,     "SLKE",#"  SLKE",
       72,   78,     "SLMG",#"  SLMG",
       78,   84,     "SLNA",#"  SLNA",
       84,   90,     "SLSU",#"  SLSU",
       90,   96,     "SLEC",#"  SLEC",
       96,  102,     "SLCA" #"  SLCA"
  )

  col_names <-   NULL

  left_just <-   c("SITE", "COUNTRY", " SCS FAMILY", " SCS Family")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  SLB  SLPX  SLPT  SLPO CACO3  SLAL  SLFE  SLMN  SLBS  SLPA  SLPB  SLKE  SLMG  SLNA  SLSU  SLEC  SLCA ")


# "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP",#   "   AMP",
       42,   48,    "REFHT",#   " REFHT",
       48,   54,    "WNDHT" #   " WNDHT"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND",#"  WIND",
       41,   47,      "PAR",#"   PAR",
       47,   53,     "EVAP",#"  EVAP",
       53,   59,     "RHUM" #"  RHUM"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM")

# "@DATE  SRAD  TMAX  TMIN  RAIN "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN ")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND",#"  WIND",
       41,   47,      "PAR" #"   PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR")

# "@DATE SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   10,     "SRAD",# " SRAD",
       10,   16,     "TMAX",#"  TMAX",
       16,   22,     "TMIN",#"  TMIN",
       22,   28,     "RAIN",#"  RAIN",
       28,   34,     "DEWP",#"  DEWP",
       34,   40,     "WIND",#"  WIND",
       40,   46,      "PAR" #"   PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR")

# "@DATE  SRAD  TMAX  TMIN  RAIN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN")

# "@  INSI      LAT     LONG    ELEV     TAV     AMP   REFHT   WNDHT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    7,     "INSI",#  "@  INSI",
        7,   16,      "LAT",#"      LAT",
       16,   25,     "LONG",#"     LONG",
       25,   33,     "ELEV",# "    ELEV",
       33,   41,      "TAV",# "     TAV",
       41,   49,      "AMP",# "     AMP",
       49,   57,    "REFHT",# "   REFHT",
       57,   65,    "WNDHT" # "   WNDHT"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  INSI      LAT     LONG    ELEV     TAV     AMP   REFHT   WNDHT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  INSI      LAT     LONG    ELEV     TAV     AMP   REFHT   WNDHT")

# "@  DATE    SRAD    TMAX    TMIN    RAIN    DEWP    WIND     AVP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    7,     "DATE",# "@  DATE",
        7,   15,     "SRAD",#"    SRAD",
       15,   23,     "TMAX",#"    TMAX",
       23,   31,     "TMIN",#"    TMIN",
       31,   39,     "RAIN",#"    RAIN",
       39,   47,     "DEWP",#"    DEWP",
       47,   55,     "WIND",#"    WIND",
       55,   63,      "AVP" #"     AVP"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  DATE    SRAD    TMAX    TMIN    RAIN    DEWP    WIND     AVP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  DATE    SRAD    TMAX    TMIN    RAIN    DEWP    WIND     AVP")

# "@ INSI      LAT     LONG    ELEV   TAV   AMP REFHT WNDHT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   32,     "ELEV",# "    ELEV",
       32,   38,      "TAV",#   "   TAV",
       38,   44,      "AMP",#   "   AMP",
       44,   50,    "REFHT",#   " REFHT",
       50,   56,    "WNDHT" #   " WNDHT"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG    ELEV   TAV   AMP REFHT WNDHT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG    ELEV   TAV   AMP REFHT WNDHT")

# "@DATE  SRAD  TMAX  TMIN  RAIN  RHUM   WIND  TDEW"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "DATE",#  "@DATE",
        5,   11,     "SRAD",# "  SRAD",
       11,   17,     "TMAX",# "  TMAX",
       17,   23,     "TMIN",# "  TMIN",
       23,   29,     "RAIN",# "  RAIN",
       29,   35,     "RHUM",# "  RHUM",
       35,   42,     "WIND",#"   WIND",
       42,   48,     "TDEW" # "  TDEW"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  RHUM   WIND  TDEW",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  RHUM   WIND  TDEW")

# "@DATE SRAD  TMAX  TMIN  RAIN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   10,     "SRAD",# " SRAD",
       10,   16,     "TMAX",#"  TMAX",
       16,   22,     "TMIN",#"  TMIN",
       22,   28,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE SRAD  TMAX  TMIN  RAIN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE SRAD  TMAX  TMIN  RAIN")

# "@DATE   TMAX  TMIN  RAIN   SUNH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "DATE",#  "@DATE",
        5,   12,     "TMAX",#"   TMAX",
       12,   18,     "TMIN",# "  TMIN",
       18,   24,     "RAIN",# "  RAIN",
       24,   31,     "SUNH" #"   SUNH"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE   TMAX  TMIN  RAIN   SUNH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE   TMAX  TMIN  RAIN   SUNH")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND" #"  WIND"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND")

# "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CCO2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP",#   "   AMP",
       42,   48,    "REFHT",#   " REFHT",
       48,   54,    "WNDHT",#   " WNDHT",
       54,   60,     "CCO2" #   "  CCO2"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CCO2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CCO2")

# "@YRDAY SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "YRDAY",#"@YRDAY",
        6,   11,     "SRAD",# " SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND",#"  WIND",
       41,   47,      "PAR" #"   PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@YRDAY SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@YRDAY SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR")

# "@Latitude Longitud  Elev Zone    TAV  TAMP REFHT WNDHT SITE"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#     ~check,
        0,       9, "Latitude",#"@Latitude",
        9,      18, "Longitud",#" Longitud",
       18,      24,     "Elev",#   "  Elev",
       24,      29,     "Zone",#    " Zone",
       29,      36,      "TAV",#  "    TAV",
       36,      42,     "TAMP",#   "  TAMP",
       42,      48,    "REFHT",#   " REFHT",
       48,      54,    "WNDHT",#   " WNDHT",
       54,NA_real_,     "SITE" #    " SITE"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@Latitude Longitud  Elev Zone    TAV  TAMP REFHT WNDHT SITE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@Latitude Longitud  Elev Zone    TAV  TAMP REFHT WNDHT SITE")

# "@WYR  WFIRST   WLAST"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    4,      "WYR",#    "@WYR",
        4,   12,   "WFIRST",#"  WFIRST",
       12,   20,    "WLAST" #"   WLAST"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@WYR  WFIRST   WLAST",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@WYR  WFIRST   WLAST")

# "@PEOPLE"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,NA_real_,   "PEOPLE" #"@PEOPLE"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PEOPLE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PEOPLE")

# "@ADDRESS"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,NA_real_,  "ADDRESS" #"@ADDRESS"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ADDRESS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ADDRESS")

# "@METHODS"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,NA_real_,  "METHODS" #"@METHODS"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@METHODS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@METHODS")

# "@INSTRUMENTS"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,   ~col_names,#        ~check,
        0,NA_real_,"INSTRUMENTS" #"@INSTRUMENTS"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@INSTRUMENTS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@INSTRUMENTS")

# "@PROBLEMS"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#     ~check,
        0,NA_real_, "PROBLEMS" #"@PROBLEMS"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PROBLEMS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PROBLEMS")

# "@PUBLICATIONS"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,    ~col_names,#         ~check,
        0,NA_real_,"PUBLICATIONS" #"@PUBLICATIONS"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PUBLICATIONS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PUBLICATIONS")

# "@DISTRIBUTION"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,    ~col_names,#         ~check,
        0,NA_real_,"DISTRIBUTION" #"@DISTRIBUTION"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DISTRIBUTION",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DISTRIBUTION")

# "@NOTES"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,NA_real_,    "NOTES" #"@NOTES"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NOTES",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NOTES")

# "@  DATE  RAIN  TMAX  TMIN  SRAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "DATE",#"@  DATE",
        7,   13,     "RAIN",# "  RAIN",
       13,   19,     "TMAX",# "  TMAX",
       19,   25,     "TMIN",# "  TMIN",
       25,   31,     "SRAD" # "  SRAD"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  DATE  RAIN  TMAX  TMIN  SRAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  DATE  RAIN  TMAX  TMIN  SRAD")

# "@  DATE  SRAD  TMAX  TMIN  RAIN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "DATE",#"@  DATE",
        7,   13,     "SRAD",# "  SRAD",
       13,   19,     "TMAX",# "  TMAX",
       19,   25,     "TMIN",# "  TMIN",
       25,   31,     "RAIN" # "  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  DATE  SRAD  TMAX  TMIN  RAIN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  DATE  SRAD  TMAX  TMIN  RAIN")

# "@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "WIND",#"  WIND",
       35,   41,     "RHUM" #"  RHUM"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM")

# "@ INSI      LAT     LONG  ELEV   TAV   AMP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP" #   "   AMP"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP")

# "@DATE  SRAD  RAIN  TMAX  TMIN  WIND  RHUM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "RAIN",#"  RAIN",
       17,   23,     "TMAX",#"  TMAX",
       23,   29,     "TMIN",#"  TMIN",
       29,   35,     "WIND",#"  WIND",
       35,   41,     "RHUM" #"  RHUM"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  RAIN  TMAX  TMIN  WIND  RHUM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  RAIN  TMAX  TMIN  WIND  RHUM")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  VAPR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND",#"  WIND",
       41,   47,      "PAR",#"   PAR",
       47,   53,     "EVAP",#"  EVAP",
       53,   59,     "VAPR" #"  VAPR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  VAPR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  VAPR")

# "@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM  VAPR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "WIND",#"  WIND",
       35,   41,     "RHUM",#"  RHUM",
       41,   47,     "VAPR" #"  VAPR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM  VAPR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  WIND  RHUM  VAPR")

# "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CO2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP",#   "   AMP",
       42,   48,    "REFHT",#   " REFHT",
       48,   54,    "WNDHT",#   " WNDHT",
       54,   59,      "CO2" #    "  CO2"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CO2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT  CO2")

# "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP",#   "   AMP",
       42,   48,    "REFHT",#   " REFHT",
       48,   54,    "WNDHT" #   " WNDHT"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT ")

# "@DATE  SRAD  TMAX  TMIN  RAIN  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  ")

# "@ INSI     LAT      LONG  ELEV   TAV  AMP REFHT  WNDHT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#      ~check,
        0,    6,     "INSI",#    "@ INSI",
        6,   14,      "LAT",#  "     LAT",
       14,   24,     "LONG",#"      LONG",
       24,   30,     "ELEV",#    "  ELEV",
       30,   36,      "TAV",#    "   TAV",
       36,   41,      "AMP",#     "  AMP",
       41,   47,    "REFHT",#    " REFHT",
       47,   54,    "WNDHT" #   "  WNDHT"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI     LAT      LONG  ELEV   TAV  AMP REFHT  WNDHT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI     LAT      LONG  ELEV   TAV  AMP REFHT  WNDHT")

# "@ INSI      LAT     LONG  ELEV   TAV  TAMP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,     "TAMP" #   "  TAMP"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV  TAMP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV  TAMP")

# "@DATE  SRAD  TMAX  TMIN  RAIN  RHUM  WIND"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "RHUM",#"  RHUM",
       35,   41,     "WIND" #"  WIND"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  RHUM  WIND",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  RHUM  WIND")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP   WIND  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "DATE",#  "@DATE",
        5,   11,     "SRAD",# "  SRAD",
       11,   17,     "TMAX",# "  TMAX",
       17,   23,     "TMIN",# "  TMIN",
       23,   29,     "RAIN",# "  RAIN",
       29,   35,     "DEWP",# "  DEWP",
       35,   42,     "WIND" #"   WIND"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP   WIND  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP   WIND  ")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND" #"  WIND"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  ")

# "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT   CO2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    6,     "INSI",#   "@ INSI",
        6,   15,      "LAT",#"      LAT",
       15,   24,     "LONG",#"     LONG",
       24,   30,     "ELEV",#   "  ELEV",
       30,   36,      "TAV",#   "   TAV",
       36,   42,      "AMP",#   "   AMP",
       42,   48,    "REFHT",#   " REFHT",
       48,   54,    "WNDHT",#   " WNDHT",
       54,   60,      "CO2" #   "   CO2"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT   CO2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT   CO2")

# "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN",#"  RAIN",
       29,   35,     "DEWP",#"  DEWP",
       35,   41,     "WIND",#"  WIND",
       41,   46,      "PAR" # "  PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  PAR")

# "@DATE  SRAD  TMAX  TMIN  RAIN            "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN            ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN            ")

# "@DATE    SRAD    RAIN     TMAX     TMIN    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#     ~check,
        0,    5,     "DATE",#    "@DATE",
        5,   13,     "SRAD",# "    SRAD",
       13,   21,     "RAIN",# "    RAIN",
       21,   30,     "TMAX",#"     TMAX",
       30,   39,     "TMIN" #"     TMIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE    SRAD    RAIN     TMAX     TMIN    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE    SRAD    RAIN     TMAX     TMIN    ")

# "@DATE  SRAD  TMAX  TMIN  RAIN               PAR "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    5,     "DATE",#             "@DATE",
        5,   11,     "SRAD",#            "  SRAD",
       11,   17,     "TMAX",#            "  TMAX",
       17,   23,     "TMIN",#            "  TMIN",
       23,   29,     "RAIN",#            "  RAIN",
       29,   47,      "PAR" #"               PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN               PAR ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN               PAR ")

# "@DATE  SRAD  TMAX  TMIN  RAIN               PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    5,     "DATE",#             "@DATE",
        5,   11,     "SRAD",#            "  SRAD",
       11,   17,     "TMAX",#            "  TMAX",
       17,   23,     "TMIN",#            "  TMIN",
       23,   29,     "RAIN",#            "  RAIN",
       29,   47,      "PAR" #"               PAR"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN               PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN               PAR")

# "@DATE  SRAD  TMAX  TMIN  RAIN             "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "DATE",# "@DATE",
        5,   11,     "SRAD",#"  SRAD",
       11,   17,     "TMAX",#"  TMAX",
       17,   23,     "TMIN",#"  TMIN",
       23,   29,     "RAIN" #"  RAIN"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@DATE  SRAD  TMAX  TMIN  RAIN             ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@DATE  SRAD  TMAX  TMIN  RAIN             ")

# "@  DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  RHUM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "DATE",#"@  DATE",
        7,   13,     "SRAD",# "  SRAD",
       13,   19,     "TMAX",# "  TMAX",
       19,   25,     "TMIN",# "  TMIN",
       25,   31,     "RAIN",# "  RAIN",
       31,   37,     "DEWP",# "  DEWP",
       37,   43,     "WIND",# "  WIND",
       43,   49,     "RHUM" # "  RHUM"
  )

  col_names <-   NULL

  left_just <-   c(" SITE", "PEOPLE", "ADDRESS", "METHODS", "INSTRUMENTS", "PROBLEMS",
  "PUBLICATIONS", "DISTRIBUTION", "NOTES")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  RHUM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND  RHUM")


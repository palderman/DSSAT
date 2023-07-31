# "@TRNO   DATE  HERB  VN%D  LAID  CWAD CPROT  CHTD  LWAD  SWAD  FHL%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "HERB",#"  HERB",
       18,   24,     "VN%D",#"  VN%D",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,    "CPROT",#" CPROT",
       42,   48,     "CHTD",#"  CHTD",
       48,   54,     "LWAD",#"  LWAD",
       54,   60,     "SWAD",#"  SWAD",
       60,   66,     "FHL%" #"  FHL%"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  HERB  VN%D  LAID  CWAD CPROT  CHTD  LWAD  SWAD  FHL%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  HERB  VN%D  LAID  CWAD CPROT  CHTD  LWAD  SWAD  FHL%")

# "@TRNO   DATE  HARV  HRVS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "HARV",#"  HARV",
       18,   24,     "HRVS" #"  HRVS"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  HARV  HRVS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  HARV  HRVS")

# "@TRNO   DATE  HRVL  HRVS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "HRVL",#"  HRVL",
       18,   24,     "HRVS" #"  HRVS"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  HRVL  HRVS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  HRVL  HRVS")

# "@TRNO   DATE   MOW  VN%D  CNAD  CWAD   PRP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "MOW",#"   MOW",
       18,   24,     "VN%D",#"  VN%D",
       24,   30,     "CNAD",#"  CNAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,      "PRP" #"   PRP"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   MOW  VN%D  CNAD  CWAD   PRP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   MOW  VN%D  CNAD  CWAD   PRP")

# "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  LN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "L#PA",#"  L#PA",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "RWAD",#"  RWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "CHTD",#"  CHTD",
       78,   84,     "LN%D" #"  LN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  LN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  LN%D")

# "@TRNO   DATE  CWAD  LAIX  LI%D  VN%D  LMLN  LWAD  SWAD  SLAD  LAID  HERB CPROT   NDF IVOMD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAIX",#"  LAIX",
       24,   30,     "LI%D",#"  LI%D",
       30,   36,     "VN%D",#"  VN%D",
       36,   42,     "LMLN",#"  LMLN",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "SWAD",#"  SWAD",
       54,   60,     "SLAD",#"  SLAD",
       60,   66,     "LAID",#"  LAID",
       66,   72,     "HERB",#"  HERB",
       72,   78,    "CPROT",#" CPROT",
       78,   84,      "NDF",#"   NDF",
       84,   90,    "IVOMD" #" IVOMD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAIX  LI%D  VN%D  LMLN  LWAD  SWAD  SLAD  LAID  HERB CPROT   NDF IVOMD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAIX  LI%D  VN%D  LMLN  LWAD  SWAD  SLAD  LAID  HERB CPROT   NDF IVOMD")

# "@TRNO   DATE   MOW  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "MOW",#"   MOW",
       18,   24,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   MOW  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   MOW  CWAD")

# "@TRNO   DATE  CWAD   MOW"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,      "MOW" #"   MOW"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD   MOW",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD   MOW")

# "@TRNO   DATE  LAID  LWAD  SWAD  RWAD  CWAD  LAWD  L#SD  SLAD  PWAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "LWAD",#"  LWAD",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "RWAD",#"  RWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "LAWD",#"  LAWD",
       48,   54,     "L#SD",#"  L#SD",
       54,   60,     "SLAD",#"  SLAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  LWAD  SWAD  RWAD  CWAD  LAWD  L#SD  SLAD  PWAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  LWAD  SWAD  RWAD  CWAD  LAWD  L#SD  SLAD  PWAD  HIPD")

# "@TRNO   DATE  LAID  CWAD  PWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD" #"  PWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD")

# "@TRNO   DATE  LWAD  SWAD  GWAD  CWAD  LAID  CHTD  VN%D  LN%D  SN%D  GN%D  CNAD  LNAD  SNAD  VNAD  GNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "LAID",#"  LAID",
       42,   48,     "CHTD",#"  CHTD",
       48,   54,     "VN%D",#"  VN%D",
       54,   60,     "LN%D",#"  LN%D",
       60,   66,     "SN%D",#"  SN%D",
       66,   72,     "GN%D",#"  GN%D",
       72,   78,     "CNAD",#"  CNAD",
       78,   84,     "LNAD",#"  LNAD",
       84,   90,     "SNAD",#"  SNAD",
       90,   96,     "VNAD",#"  VNAD",
       96,  102,     "GNAD" #"  GNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  GWAD  CWAD  LAID  CHTD  VN%D  LN%D  SN%D  GN%D  CNAD  LNAD  SNAD  VNAD  GNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  GWAD  CWAD  LAID  CHTD  VN%D  LN%D  SN%D  GN%D  CNAD  LNAD  SNAD  VNAD  GNAD")

# "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  GWAD  LAID  CHTD  VWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LAID",#"  LAID",
       48,   54,     "CHTD",#"  CHTD",
       54,   60,     "VWAD" #"  VWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  GWAD  LAID  CHTD  VWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  GWAD  LAID  CHTD  VWAD")

# "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  LAID")

# "@TRNO   DATE  GSTD  CHTD  CWAD  LWAD  SWAD  PWAD  WLVG  LWPD  LAID  SLAD  LAPD  G#AD  G#PD  GWGD  P#AD  GW%M  HIAD  GWAD  GL%D  GN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "GSTD",#"  GSTD",
       18,   24,     "CHTD",#"  CHTD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "WLVG",#"  WLVG",
       54,   60,     "LWPD",#"  LWPD",
       60,   66,     "LAID",#"  LAID",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "LAPD",#"  LAPD",
       78,   84,     "G#AD",#"  G#AD",
       84,   90,     "G#PD",#"  G#PD",
       90,   96,     "GWGD",#"  GWGD",
       96,  102,     "P#AD",#"  P#AD",
      102,  108,     "GW%M",#"  GW%M",
      108,  114,     "HIAD",#"  HIAD",
      114,  120,     "GWAD",#"  GWAD",
      120,  126,     "GL%D",#"  GL%D",
      126,  132,     "GN%D" #"  GN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  GSTD  CHTD  CWAD  LWAD  SWAD  PWAD  WLVG  LWPD  LAID  SLAD  LAPD  G#AD  G#PD  GWGD  P#AD  GW%M  HIAD  GWAD  GL%D  GN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  GSTD  CHTD  CWAD  LWAD  SWAD  PWAD  WLVG  LWPD  LAID  SLAD  LAPD  G#AD  G#PD  GWGD  P#AD  GW%M  HIAD  GWAD  GL%D  GN%D")

# "@TRNO   DATE   DAP  TDWA  TWAD  SWAD  DWAD  LWAD  HWAD  LAID  LALN  CDWA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "DAP",#"   DAP",
       18,   24,     "TDWA",#"  TDWA",
       24,   30,     "TWAD",#"  TWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "DWAD",#"  DWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "HWAD",#"  HWAD",
       54,   60,     "LAID",#"  LAID",
       60,   66,     "LALN",#"  LALN",
       66,   72,     "CDWA" #"  CDWA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   DAP  TDWA  TWAD  SWAD  DWAD  LWAD  HWAD  LAID  LALN  CDWA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   DAP  TDWA  TWAD  SWAD  DWAD  LWAD  HWAD  LAID  LALN  CDWA")

# "@TRNO   DATE  DAP1  S#AD  L#SD  L#IR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "DAP1",#"  DAP1",
       18,   24,     "S#AD",#"  S#AD",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "L#IR" #"  L#IR"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  DAP1  S#AD  L#SD  L#IR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  DAP1  S#AD  L#SD  L#IR")

# "@TRNO   DATE  GSTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "GSTD" #"  GSTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  GSTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  GSTD")

# "@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  S#AD  L#SD  L#IR  LALD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "DAP",#"   DAP",
       18,   24,     "TWAD",#"  TWAD",
       24,   30,     "HWAD",#"  HWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "LAID",#"  LAID",
       42,   48,     "S#AD",#"  S#AD",
       48,   54,     "L#SD",#"  L#SD",
       54,   60,     "L#IR",#"  L#IR",
       60,   66,     "LALD" #"  LALD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  S#AD  L#SD  L#IR  LALD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  S#AD  L#SD  L#IR  LALD")

# "@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  LALD  S#AD  L#SD  L#IR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "DAP",#"   DAP",
       18,   24,     "TWAD",#"  TWAD",
       24,   30,     "HWAD",#"  HWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "LAID",#"  LAID",
       42,   48,     "LALD",#"  LALD",
       48,   54,     "S#AD",#"  S#AD",
       54,   60,     "L#SD",#"  L#SD",
       60,   66,     "L#IR" #"  L#IR"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  LALD  S#AD  L#SD  L#IR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   DAP  TWAD  HWAD  CWAD  LAID  LALD  S#AD  L#SD  L#IR")

# "@TRNO   DATE   DAP  SWAD  LWAD  HWAD  RWAD  CWAD  TWAD  CGRD  LAID  H#AD  RLAD  RLWD  LAWD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,      "DAP",#"   DAP",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "HWAD",#"  HWAD",
       36,   42,     "RWAD",#"  RWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "TWAD",#"  TWAD",
       54,   60,     "CGRD",#"  CGRD",
       60,   66,     "LAID",#"  LAID",
       66,   72,     "H#AD",#"  H#AD",
       72,   78,     "RLAD",#"  RLAD",
       78,   84,     "RLWD",#"  RLWD",
       84,   90,     "LAWD" #"  LAWD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE   DAP  SWAD  LWAD  HWAD  RWAD  CWAD  TWAD  CGRD  LAID  H#AD  RLAD  RLWD  LAWD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE   DAP  SWAD  LWAD  HWAD  RWAD  CWAD  TWAD  CGRD  LAID  H#AD  RLAD  RLWD  LAWD")

# "@TRNO   DATE  DAP1  S#PD  LALD  L#IR  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "DAP1",#"  DAP1",
       18,   24,     "S#PD",#"  S#PD",
       24,   30,     "LALD",#"  LALD",
       30,   36,     "L#IR",#"  L#IR",
       36,   42,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  DAP1  S#PD  LALD  L#IR  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  DAP1  S#PD  LALD  L#IR  L#SD")

# "@TRNO   DATE  SWTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SWTD" #"  SWTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SWTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SWTD")

# "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SLAD",#"  SLAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "SWAD",#"  SWAD",
       54,   60,     "VWAD",#"  VWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "GWAD",#"  GWAD",
       72,   78,     "PWAD",#"  PWAD",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD",#"  HIPD",
       90,   96,     "LN%D",#"  LN%D",
       96,  102,     "SN%D",#"  SN%D",
      102,  108,     "GN%D",#"  GN%D",
      108,  114,     "PN%D",#"  PN%D",
      114,  120,     "GWGD",#"  GWGD",
      120,  126,     "SH%D" #"  SH%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D")

# "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  PN%D  G#PD  GWGD Spike  LALD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SLAD",#"  SLAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "SWAD",#"  SWAD",
       54,   60,     "VWAD",#"  VWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "GWAD",#"  GWAD",
       72,   78,     "PWAD",#"  PWAD",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD",#"  HIPD",
       90,   96,     "SH%D",#"  SH%D",
       96,  102,     "LN%D",#"  LN%D",
      102,  108,     "SN%D",#"  SN%D",
      108,  114,     "GN%D",#"  GN%D",
      114,  120,     "PN%D",#"  PN%D",
      120,  126,     "G#PD",#"  G#PD",
      126,  132,     "GWGD",#"  GWGD",
      132,  138,    "Spike",#" Spike",
      138,  144,     "LALD" #"  LALD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  PN%D  G#PD  GWGD Spike  LALD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  PN%D  G#PD  GWGD Spike  LALD")

# "@TRNO   DATE  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SLAD",#"  SLAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "VWAD",#"  VWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "HIAD",#"  HIAD",
       66,   72,     "HIPD",#"  HIPD",
       72,   78,     "SH%D" #"  SH%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SLAD  LWAD  SWAD  VWAD  CWAD  GWAD  PWAD  HIAD  HIPD  SH%D ")

# "@TRNO   DATE  CHTD  CWID  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "HIPD",#"  HIPD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD  SWXD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D",#"  SW8D",
       60,   66,     "SW9D",#"  SW9D",
       66,   72,     "SW0D",#"  SW0D",
       72,   78,     "SWTD",#"  SWTD",
       78,   84,     "SWXD" #"  SWXD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD  SWXD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD  SWXD")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD SWXD  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D",#"  SW8D",
       60,   66,     "SW9D",#"  SW9D",
       66,   72,     "SW0D",#"  SW0D",
       72,   78,     "SWTD",#"  SWTD",
       78,   83,     "SWXD" # " SWXD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD SWXD  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D  SWTD SWXD  ")

# "@TRNO  DATE   L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "L#SD",#"   L#SD",
       18,   24,     "LAID",# "  LAID",
       24,   30,     "P#AD",# "  P#AD",
       30,   36,     "SWAD",# "  SWAD",
       36,   42,     "GWAD",# "  GWAD",
       42,   48,     "LWAD",# "  LWAD",
       48,   54,     "CWAD",# "  CWAD",
       54,   60,     "PWAD",# "  PWAD",
       60,   66,     "SHAD",# "  SHAD",
       66,   72,     "G#AD",# "  G#AD",
       72,   78,     "HIPD",# "  HIPD",
       78,   84,     "SH%D",# "  SH%D",
       84,   90,     "SLAD",# "  SLAD",
       90,   96,     "GWGD" # "  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D SWTD  SWXD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D",#"  SW8D",
       60,   66,     "SW9D",#"  SW9D",
       66,   72,     "SW0D",#"  SW0D",
       72,   77,     "SWTD",# " SWTD",
       77,   83,     "SWXD" #"  SWXD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D SWTD  SWXD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW0D SWTD  SWXD")

# "@TRNO   DATE    R#  CHTD  LAID  P#AD  LWAD  SWAD  RWAD  PWAD  SLAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,       "R#",#"    R#",
       18,   24,     "CHTD",#"  CHTD",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "P#AD",#"  P#AD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "RWAD",#"  RWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SLAD",#"  SLAD",
       66,   72,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE    R#  CHTD  LAID  P#AD  LWAD  SWAD  RWAD  PWAD  SLAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE    R#  CHTD  LAID  P#AD  LWAD  SWAD  RWAD  PWAD  SLAD  CWAD")

# "@TRNO   DATE  LWAD  SWAD  CWAD  PWAD  GWAD  CHTD  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "PWAD",#"  PWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "CHTD",#"  CHTD",
       48,   54,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  CWAD  PWAD  GWAD  CHTD  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  CWAD  PWAD  GWAD  CHTD  LAID")

# "@TRNO   DATE  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID")

# "@TRNO   DATE  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW10"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW2D",#"  SW2D",
       18,   24,     "SW3D",#"  SW3D",
       24,   30,     "SW4D",#"  SW4D",
       30,   36,     "SW5D",#"  SW5D",
       36,   42,     "SW6D",#"  SW6D",
       42,   48,     "SW7D",#"  SW7D",
       48,   54,     "SW8D",#"  SW8D",
       54,   60,     "SW9D",#"  SW9D",
       60,   66,     "SW10" #"  SW10"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW10",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D  SW10")

# "@TRNO   DATE  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "RL4D",#"  RL4D",
       18,   24,     "RL5D",#"  RL5D",
       24,   30,     "RL6D",#"  RL6D",
       30,   36,     "RL7D",#"  RL7D",
       36,   42,     "RL8D",#"  RL8D",
       42,   48,     "RL9D",#"  RL9D",
       48,   54,     "RL10" #"  RL10"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10")

# "@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  SHAD  L#SD  CHTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "PWAD",#"  PWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "HIPD",#"  HIPD",
       54,   60,     "HIAD",#"  HIAD",
       60,   66,     "P#AD",#"  P#AD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "GWGD",#"  GWGD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "SHAD",#"  SHAD",
       96,  102,     "L#SD",#"  L#SD",
      102,  108,     "CHTD" #"  CHTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  SHAD  L#SD  CHTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  SHAD  L#SD  CHTD")

# "@TRNO   DATE  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD")

# "@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "PWAD",#"  PWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "HIPD",#"  HIPD",
       54,   60,     "HIAD",#"  HIAD",
       60,   66,     "P#AD",#"  P#AD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "GWGD",#"  GWGD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  LWAD  PWAD  GWAD  CWAD  HIPD  HIAD  P#AD  G#AD  GWGD  SH%D  SLAD  L#SD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "SH%D",#"  SH%D",
       72,   78,     "SLAD" #"  SLAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "RWAD",#"  RWAD",
       72,   78,     "G#AD",#"  G#AD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD  CHTD  CWID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD",#"  GWGD",
       96,  102,     "CHTD",#"  CHTD",
      102,  108,     "CWID" #"  CWID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD  CHTD  CWID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  SH%D  SLAD  GWGD  CHTD  CWID")

# "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  HIPD")

# "@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D                    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "RL1D",#"  RL1D",
       18,   24,     "RL2D",#"  RL2D",
       24,   30,     "RL3D",#"  RL3D",
       30,   36,     "RL4D",#"  RL4D",
       36,   42,     "RL5D",#"  RL5D",
       42,   48,     "RL6D",#"  RL6D",
       48,   54,     "RL7D",#"  RL7D",
       54,   60,     "RL8D" #"  RL8D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D                    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D                    ")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC              "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D",#"  SW8D",
       60,   66,     "ETAC" #"  ETAC"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC              ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC              ")

# "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  NWAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "NWAD",#"  NWAD",
       54,   60,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  NWAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  NWAD  HIPD")

# "@TRNO   DATE  CHTD  CWID  L#SD  SN%D  LN%D  GN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "SN%D",#"  SN%D",
       36,   42,     "LN%D",#"  LN%D",
       42,   48,     "GN%D" #"  GN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  SN%D  LN%D  GN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  SN%D  LN%D  GN%D")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D",#"  SW8D",
       60,   66,     "ETAC" #"  ETAC"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  ETAC")

# "@TRNO   DATE  NH1D  NH2D  NH3D  NH4D  NH5D  NI1D  NI2D  NI3D  NI4D NI5DD        "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "NH1D",#"  NH1D",
       18,   24,     "NH2D",#"  NH2D",
       24,   30,     "NH3D",#"  NH3D",
       30,   36,     "NH4D",#"  NH4D",
       36,   42,     "NH5D",#"  NH5D",
       42,   48,     "NI1D",#"  NI1D",
       48,   54,     "NI2D",#"  NI2D",
       54,   60,     "NI3D",#"  NI3D",
       60,   66,     "NI4D",#"  NI4D",
       66,   72,    "NI5DD" #" NI5DD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  NH1D  NH2D  NH3D  NH4D  NH5D  NI1D  NI2D  NI3D  NI4D NI5DD        ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  NH1D  NH2D  NH3D  NH4D  NH5D  NI1D  NI2D  NI3D  NI4D NI5DD        ")

# "@TRNO   DATE  TS1D  TS2D  TS3D  SW1D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "TS1D",#"  TS1D",
       18,   24,     "TS2D",#"  TS2D",
       24,   30,     "TS3D",#"  TS3D",
       30,   36,     "SW1D" #"  SW1D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  TS1D  TS2D  TS3D  SW1D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  TS1D  TS2D  TS3D  SW1D")

# "@TRNO   DATE  TS1D  TS2D  TS3D  TS5D  TS7D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "TS1D",#"  TS1D",
       18,   24,     "TS2D",#"  TS2D",
       24,   30,     "TS3D",#"  TS3D",
       30,   36,     "TS5D",#"  TS5D",
       36,   42,     "TS7D" #"  TS7D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  TS1D  TS2D  TS3D  TS5D  TS7D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  TS1D  TS2D  TS3D  TS5D  TS7D")

# "@TRNO   DATE SCS20D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   12,     "DATE",# "  DATE",
       12,   19,   "SCS20D" #" SCS20D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE SCS20D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE SCS20D")

# "@TRNO   DATE  CHTD  CWID  L#SD  SH%D  GWGD  CWAD  LWAD  SWAD  PWAD  GWAD  SLAD  LAID  P#AD  G#AD  HIAD  HIPD  NUPC  NIAD  NLCC "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "SH%D",#"  SH%D",
       36,   42,     "GWGD",#"  GWGD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "LWAD",#"  LWAD",
       54,   60,     "SWAD",#"  SWAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "GWAD",#"  GWAD",
       72,   78,     "SLAD",#"  SLAD",
       78,   84,     "LAID",#"  LAID",
       84,   90,     "P#AD",#"  P#AD",
       90,   96,     "G#AD",#"  G#AD",
       96,  102,     "HIAD",#"  HIAD",
      102,  108,     "HIPD",#"  HIPD",
      108,  114,     "NUPC",#"  NUPC",
      114,  120,     "NIAD",#"  NIAD",
      120,  126,     "NLCC" #"  NLCC"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  SH%D  GWGD  CWAD  LWAD  SWAD  PWAD  GWAD  SLAD  LAID  P#AD  G#AD  HIAD  HIPD  NUPC  NIAD  NLCC ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  SH%D  GWGD  CWAD  LWAD  SWAD  PWAD  GWAD  SLAD  LAID  P#AD  G#AD  HIAD  HIPD  NUPC  NIAD  NLCC ")

# "@TRNO   DATE  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD")

# "@TRNO   DATE  SW2D  SW4D  SW6D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW2D",#"  SW2D",
       18,   24,     "SW4D",#"  SW4D",
       24,   30,     "SW6D" #"  SW6D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW2D  SW4D  SW6D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW2D  SW4D  SW6D")

# "@TRNO   DATE  CWAD  CNAD  GWAD  GN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "CNAD",#"  CNAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "GN%D" #"  GN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  CNAD  GWAD  GN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  CNAD  GWAD  GN%D")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D",#"  SW7D",
       54,   60,     "SW8D" #"  SW8D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D")

# "@TRNO   DATE  NI1D  NI2D  NI3D  NI4D  NI5D  NI6D  NIAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "NI1D",#"  NI1D",
       18,   24,     "NI2D",#"  NI2D",
       24,   30,     "NI3D",#"  NI3D",
       30,   36,     "NI4D",#"  NI4D",
       36,   42,     "NI5D",#"  NI5D",
       42,   48,     "NI6D",#"  NI6D",
       48,   54,     "NIAD" #"  NIAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  NI1D  NI2D  NI3D  NI4D  NI5D  NI6D  NIAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  NI1D  NI2D  NI3D  NI4D  NI5D  NI6D  NIAD")

# "@TRNO   DATE  GWAD  GWGD  G#AD  LAID  CWAD  GN%D  CNAD  SNAD  GNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "GWAD",#"  GWAD",
       18,   24,     "GWGD",#"  GWGD",
       24,   30,     "G#AD",#"  G#AD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "GN%D",#"  GN%D",
       48,   54,     "CNAD",#"  CNAD",
       54,   60,     "SNAD",#"  SNAD",
       60,   66,     "GNAD" #"  GNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  GWAD  GWGD  G#AD  LAID  CWAD  GN%D  CNAD  SNAD  GNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  GWAD  GWGD  G#AD  LAID  CWAD  GN%D  CNAD  SNAD  GNAD")

# "@TRNO   DATE  L#SD  CHTD  LWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "CHTD",#"  CHTD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  CHTD  LWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  CHTD  LWAD  CWAD")

# "@TRNO   DATE  CWAD  VN%D  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "VN%D",#"  VN%D",
       24,   30,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  VN%D  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  VN%D  GWAD")

# "@TRNO   DATE  CWAD  LAID  SWAD  GWAD  LWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "LWAD" #"  LWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  SWAD  GWAD  LWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  SWAD  GWAD  LWAD")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D" #"  SW5D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D")

# "@TRNO   DATE  CNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CNAD" #"  CNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CNAD")

# "@TRNO   DATE  LAID  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIAD  G#AD  GWGD  CNAD  GNAD  LNAD  SNAD  GN%D  LN%D  SN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "HIAD",#"  HIAD",
       60,   66,     "G#AD",#"  G#AD",
       66,   72,     "GWGD",#"  GWGD",
       72,   78,     "CNAD",#"  CNAD",
       78,   84,     "GNAD",#"  GNAD",
       84,   90,     "LNAD",#"  LNAD",
       90,   96,     "SNAD",#"  SNAD",
       96,  102,     "GN%D",#"  GN%D",
      102,  108,     "LN%D",#"  LN%D",
      108,  114,     "SN%D" #"  SN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIAD  G#AD  GWGD  CNAD  GNAD  LNAD  SNAD  GN%D  LN%D  SN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIAD  G#AD  GWGD  CNAD  GNAD  LNAD  SNAD  GN%D  LN%D  SN%D")

# "@TRNO   DATE  PSMD  PLAD  PRTD  PSDD  PASM  PWPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "PSMD",#"  PSMD",
       18,   24,     "PLAD",#"  PLAD",
       24,   30,     "PRTD",#"  PRTD",
       30,   36,     "PSDD",#"  PSDD",
       36,   42,     "PASM",#"  PASM",
       42,   48,     "PWPD" #"  PWPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  PSMD  PLAD  PRTD  PSDD  PASM  PWPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  PSMD  PLAD  PRTD  PSDD  PASM  PWPD")

# "@TRNO   DATE  PLAD  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "PLAD" #"  PLAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  PLAD  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  PLAD  ")

# "@TRNO   DATE  CWAD  LAID  GWAD  LWAD  SWAD  VN%D  SLAD  FRLF  FRST  HIAD  CNAD  NUPC  LN%D  SN%D  GN%D  LP%D  SP%D  GP%D  LK%D  SK%D  GK%D  LNAD  SNAD  GNAD  LPAD  SPAD  GPAD  LKAD  SKAD  GKAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "VN%D",#"  VN%D",
       48,   54,     "SLAD",#"  SLAD",
       54,   60,     "FRLF",#"  FRLF",
       60,   66,     "FRST",#"  FRST",
       66,   72,     "HIAD",#"  HIAD",
       72,   78,     "CNAD",#"  CNAD",
       78,   84,     "NUPC",#"  NUPC",
       84,   90,     "LN%D",#"  LN%D",
       90,   96,     "SN%D",#"  SN%D",
       96,  102,     "GN%D",#"  GN%D",
      102,  108,     "LP%D",#"  LP%D",
      108,  114,     "SP%D",#"  SP%D",
      114,  120,     "GP%D",#"  GP%D",
      120,  126,     "LK%D",#"  LK%D",
      126,  132,     "SK%D",#"  SK%D",
      132,  138,     "GK%D",#"  GK%D",
      138,  144,     "LNAD",#"  LNAD",
      144,  150,     "SNAD",#"  SNAD",
      150,  156,     "GNAD",#"  GNAD",
      156,  162,     "LPAD",#"  LPAD",
      162,  168,     "SPAD",#"  SPAD",
      168,  174,     "GPAD",#"  GPAD",
      174,  180,     "LKAD",#"  LKAD",
      180,  186,     "SKAD",#"  SKAD",
      186,  192,     "GKAD" #"  GKAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  GWAD  LWAD  SWAD  VN%D  SLAD  FRLF  FRST  HIAD  CNAD  NUPC  LN%D  SN%D  GN%D  LP%D  SP%D  GP%D  LK%D  SK%D  GK%D  LNAD  SNAD  GNAD  LPAD  SPAD  GPAD  LKAD  SKAD  GKAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  GWAD  LWAD  SWAD  VN%D  SLAD  FRLF  FRST  HIAD  CNAD  NUPC  LN%D  SN%D  GN%D  LP%D  SP%D  GP%D  LK%D  SK%D  GK%D  LNAD  SNAD  GNAD  LPAD  SPAD  GPAD  LKAD  SKAD  GKAD")

# "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  GWAD  XCLA  XDLA  PCLA  PDLA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "HIPD",#"  HIPD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,     "XCLA",#"  XCLA",
       54,   60,     "XDLA",#"  XDLA",
       60,   66,     "PCLA",#"  PCLA",
       66,   72,     "PDLA" #"  PDLA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  GWAD  XCLA  XDLA  PCLA  PDLA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  GWAD  XCLA  XDLA  PCLA  PDLA")

# "@TRNO   DATE  CWID  CHTD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWID",#"  CWID",
       18,   24,     "CHTD",#"  CHTD",
       24,   30,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWID  CHTD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWID  CHTD  L#SD")

# "@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "RL1D",#"  RL1D",
       18,   24,     "RL2D",#"  RL2D",
       24,   30,     "RL3D",#"  RL3D",
       30,   36,     "RL4D",#"  RL4D",
       36,   42,     "RL5D" #"  RL5D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  RL1D  RL2D  RL3D  RL4D  RL5D")

# "@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TW90   SWXD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   12,     "DATE",# "  DATE",
       12,   18,     "W105",# "  W105",
       18,   24,     "W210",# "  W210",
       24,   30,     "W315",# "  W315",
       30,   36,     "W415",# "  W415",
       36,   42,     "W515",# "  W515",
       42,   48,     "W630",# "  W630",
       48,   54,     "W723",# "  W723",
       54,   59,     "TW90",#  " TW90",
       59,   66,     "SWXD" #"   SWXD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TW90   SWXD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TW90   SWXD")

# "@TRNO   DATE  xCLA  xDLA  PCLA  PDLA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "xCLA",#"  xCLA",
       18,   24,     "xDLA",#"  xDLA",
       24,   30,     "PCLA",#"  PCLA",
       30,   36,     "PDLA" #"  PDLA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  xCLA  xDLA  PCLA  PDLA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  xCLA  xDLA  PCLA  PDLA")

# "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  FRLF  FRST  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "HIPD",#"  HIPD",
       42,   48,     "FRLF",#"  FRLF",
       48,   54,     "FRST",#"  FRST",
       54,   60,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  FRLF  FRST  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  FRLF  FRST  GWAD")

# "@TRNO  DATE   CWID  CHTD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "CWID",#"   CWID",
       18,   24,     "CHTD",# "  CHTD",
       24,   30,     "L#SD" # "  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   CWID  CHTD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   CWID  CHTD  L#SD")

# "@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TWAT90 SWXD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   12,     "DATE",# "  DATE",
       12,   18,     "W105",# "  W105",
       18,   24,     "W210",# "  W210",
       24,   30,     "W315",# "  W315",
       30,   36,     "W415",# "  W415",
       36,   42,     "W515",# "  W515",
       42,   48,     "W630",# "  W630",
       48,   54,     "W723",# "  W723",
       54,   61,   "TWAT90",#" TWAT90",
       61,   66,     "SWXD" #  " SWXD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TWAT90 SWXD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  W105  W210  W315  W415  W515  W630  W723 TWAT90 SWXD")

# "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD SHPPD SHPAD  PCLA  PDLA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "HIPD",#"  HIPD",
       42,   48,     "LFTM",#"  LFTM",
       48,   54,     "STTM",#"  STTM",
       54,   60,     "GWAD",#"  GWAD",
       60,   66,    "SHPPD",#" SHPPD",
       66,   72,    "SHPAD",#" SHPAD",
       72,   78,     "PCLA",#"  PCLA",
       78,   84,     "PDLA" #"  PDLA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD SHPPD SHPAD  PCLA  PDLA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD SHPPD SHPAD  PCLA  PDLA")

# "@TRNO   DATE  L#SD  CHTD  CWID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "CHTD",#"  CHTD",
       24,   30,     "CWID" #"  CWID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  CHTD  CWID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  CHTD  CWID")

# "@TRNO   DATE LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD  SHPPD SHPAD PCLA  PDLA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   12,     "DATE",# "  DATE",
       12,   17,     "LWAD",#  " LWAD",
       17,   23,     "SWAD",# "  SWAD",
       23,   29,     "PWAD",# "  PWAD",
       29,   35,     "CWAD",# "  CWAD",
       35,   41,     "HIPD",# "  HIPD",
       41,   47,     "LFTM",# "  LFTM",
       47,   53,     "STTM",# "  STTM",
       53,   59,     "GWAD",# "  GWAD",
       59,   66,    "SHPPD",#"  SHPPD",
       66,   72,    "SHPAD",# " SHPAD",
       72,   77,     "PCLA",#  " PCLA",
       77,   83,     "PDLA" # "  PDLA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD  SHPPD SHPAD PCLA  PDLA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE LWAD  SWAD  PWAD  CWAD  HIPD  LFTM  STTM  GWAD  SHPPD SHPAD PCLA  PDLA")

# "@TRNO   DATE  CHTD  CWID  L#SD                             "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD                             ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD                             ")

# "@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PCLA  PSTM  LN%D  CL%D  SN%D  CS%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "P#AD",#"  P#AD",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "PWAD",#"  PWAD",
       54,   60,     "SHAD",#"  SHAD",
       60,   66,     "FRLF",#"  FRLF",
       66,   72,     "FRST",#"  FRST",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "HIPD",#"  HIPD",
       84,   90,     "SH%D",#"  SH%D",
       90,   96,     "SLAD",#"  SLAD",
       96,  102,     "GWGD",#"  GWGD",
      102,  108,     "PCLA",#"  PCLA",
      108,  114,     "PSTM",#"  PSTM",
      114,  120,     "LN%D",#"  LN%D",
      120,  126,     "CL%D",#"  CL%D",
      126,  132,     "SN%D",#"  SN%D",
      132,  138,     "CS%D" #"  CS%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PCLA  PSTM  LN%D  CL%D  SN%D  CS%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PCLA  PSTM  LN%D  CL%D  SN%D  CS%D")

# "@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  HIPD  SH%D  SLAD  GWGD  LN%D  CL%D  SN%D  CS%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "PCLA",#"  PCLA",
       24,   30,     "PDLA",#"  PDLA",
       30,   36,     "P#AD",#"  P#AD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,     "LWAD",#"  LWAD",
       54,   60,     "CWAD",#"  CWAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "SHAD",#"  SHAD",
       72,   78,     "HIPD",#"  HIPD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD",#"  GWGD",
       96,  102,     "LN%D",#"  LN%D",
      102,  108,     "CL%D",#"  CL%D",
      108,  114,     "SN%D",#"  SN%D",
      114,  120,     "CS%D" #"  CS%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  HIPD  SH%D  SLAD  GWGD  LN%D  CL%D  SN%D  CS%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  HIPD  SH%D  SLAD  GWGD  LN%D  CL%D  SN%D  CS%D")

# "@TRNO   DATE  RWAD  PWAD  G#AD  GWAD  P#AD  CWAD  GWGD  SHAD  SH%D  HIAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "RWAD",#"  RWAD",
       18,   24,     "PWAD",#"  PWAD",
       24,   30,     "G#AD",#"  G#AD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "P#AD",#"  P#AD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "GWGD",#"  GWGD",
       54,   60,     "SHAD",#"  SHAD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "HIAD",#"  HIAD",
       72,   78,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  RWAD  PWAD  G#AD  GWAD  P#AD  CWAD  GWGD  SHAD  SH%D  HIAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  RWAD  PWAD  G#AD  GWAD  P#AD  CWAD  GWGD  SHAD  SH%D  HIAD  HIPD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PHAN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "FRLF",#"  FRLF",
       72,   78,     "FRST",#"  FRST",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD",#"  HIPD",
       90,   96,     "SH%D",#"  SH%D",
       96,  102,     "SLAD",#"  SLAD",
      102,  108,     "GWGD",#"  GWGD",
      108,  114,     "PHAN" #"  PHAN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PHAN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PHAN")

# "@TRNO   DATE  LAID  CWAD  PWAD  GWAD  GWGD  H#AD  HIAD  HIPD  SH%D  CNAD  LNAD  GNAD  GN%D  LN%D  SN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "GWGD",#"  GWGD",
       42,   48,     "H#AD",#"  H#AD",
       48,   54,     "HIAD",#"  HIAD",
       54,   60,     "HIPD",#"  HIPD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "CNAD",#"  CNAD",
       72,   78,     "LNAD",#"  LNAD",
       78,   84,     "GNAD",#"  GNAD",
       84,   90,     "GN%D",#"  GN%D",
       90,   96,     "LN%D",#"  LN%D",
       96,  102,     "SN%D" #"  SN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD  GWAD  GWGD  H#AD  HIAD  HIPD  SH%D  CNAD  LNAD  GNAD  GN%D  LN%D  SN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD  GWAD  GWGD  H#AD  HIAD  HIPD  SH%D  CNAD  LNAD  GNAD  GN%D  LN%D  SN%D")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  RL1D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "FRLF",#"  FRLF",
       78,   84,     "FRST",#"  FRST",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "HIPD",#"  HIPD",
       96,  102,     "SH%D",#"  SH%D",
      102,  108,     "SLAD",#"  SLAD",
      108,  114,     "GWGD",#"  GWGD",
      114,  120,     "RL1D",#"  RL1D",
      120,  126,     "RL3D",#"  RL3D",
      126,  132,     "RL4D",#"  RL4D",
      132,  138,     "RL5D",#"  RL5D",
      138,  144,     "RL6D",#"  RL6D",
      144,  150,     "RL7D",#"  RL7D",
      150,  156,     "RL8D" #"  RL8D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  RL1D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  RL1D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D")

# "@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  LN%D  PHAN  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "PCLA",#"  PCLA",
       24,   30,     "PDLA",#"  PDLA",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "P#AD",#"  P#AD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "LWAD",#"  LWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "PWAD",#"  PWAD",
       72,   78,     "SHAD",#"  SHAD",
       78,   84,     "G#AD",#"  G#AD",
       84,   90,     "FRLF",#"  FRLF",
       90,   96,     "FRST",#"  FRST",
       96,  102,     "HIAD",#"  HIAD",
      102,  108,     "HIPD",#"  HIPD",
      108,  114,     "SH%D",#"  SH%D",
      114,  120,     "SLAD",#"  SLAD",
      120,  126,     "GWGD",#"  GWGD",
      126,  132,     "LN%D",#"  LN%D",
      132,  138,     "PHAN",#"  PHAN",
      138,  144,     "LMLN" #"  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  LN%D  PHAN  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  LN%D  PHAN  LMLN")

# "@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  ATPW  DTPW  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "PCLA",#"  PCLA",
       24,   30,     "PDLA",#"  PDLA",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "P#AD",#"  P#AD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "LWAD",#"  LWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "PWAD",#"  PWAD",
       72,   78,     "ATPW",#"  ATPW",
       78,   84,     "DTPW",#"  DTPW",
       84,   90,     "SHAD",#"  SHAD",
       90,   96,     "G#AD",#"  G#AD",
       96,  102,     "HIPD",#"  HIPD",
      102,  108,     "SH%D",#"  SH%D",
      108,  114,     "SLAD",#"  SLAD",
      114,  120,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  ATPW  DTPW  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  PCLA  PDLA  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  ATPW  DTPW  SHAD  G#AD  HIPD  SH%D  SLAD  GWGD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PDLA  PCLA  VNAD  PHAN  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "FRLF",#"  FRLF",
       78,   84,     "FRST",#"  FRST",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "HIPD",#"  HIPD",
       96,  102,     "SH%D",#"  SH%D",
      102,  108,     "SLAD",#"  SLAD",
      108,  114,     "GWGD",#"  GWGD",
      114,  120,     "PDLA",#"  PDLA",
      120,  126,     "PCLA",#"  PCLA",
      126,  132,     "VNAD",#"  VNAD",
      132,  138,     "PHAN",#"  PHAN",
      138,  144,     "LMLN" #"  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PDLA  PCLA  VNAD  PHAN  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  PDLA  PCLA  VNAD  PHAN  LMLN")

# "@TRNO  DATE   L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%D  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "L#SD",#"   L#SD",
       18,   24,     "LAID",# "  LAID",
       24,   30,     "SWAD",# "  SWAD",
       30,   36,     "LWAD",# "  LWAD",
       36,   42,     "CWAD",# "  CWAD",
       42,   48,     "PWAD",# "  PWAD",
       48,   54,     "SLAD",# "  SLAD",
       54,   60,     "CHTD",# "  CHTD",
       60,   66,     "CWID",# "  CWID",
       66,   72,     "PHAN",# "  PHAN",
       72,   78,     "LI%D",# "  LI%D",
       78,   84,     "LMLN" # "  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%D  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%D  LMLN")

# "@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  G#AD  GWAD  P#AD  SHAD  SLAD  LAID  FRLF  FRST  HIAD  HIPD  SH%D  GWGD  VNAD  XSPD  RL1D  RL2D  RL3D  RL4D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "G#AD",#"  G#AD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "P#AD",#"  P#AD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "LAID",#"  LAID",
       78,   84,     "FRLF",#"  FRLF",
       84,   90,     "FRST",#"  FRST",
       90,   96,     "HIAD",#"  HIAD",
       96,  102,     "HIPD",#"  HIPD",
      102,  108,     "SH%D",#"  SH%D",
      108,  114,     "GWGD",#"  GWGD",
      114,  120,     "VNAD",#"  VNAD",
      120,  126,     "XSPD",#"  XSPD",
      126,  132,     "RL1D",#"  RL1D",
      132,  138,     "RL2D",#"  RL2D",
      138,  144,     "RL3D",#"  RL3D",
      144,  150,     "RL4D" #"  RL4D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  G#AD  GWAD  P#AD  SHAD  SLAD  LAID  FRLF  FRST  HIAD  HIPD  SH%D  GWGD  VNAD  XSPD  RL1D  RL2D  RL3D  RL4D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  G#AD  GWAD  P#AD  SHAD  SLAD  LAID  FRLF  FRST  HIAD  HIPD  SH%D  GWGD  VNAD  XSPD  RL1D  RL2D  RL3D  RL4D")

# "@TRNO  DATE   CHTD  CWID  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "CHTD",#"   CHTD",
       18,   24,     "CWID",# "  CWID",
       24,   30,     "L#SD" # "  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   CHTD  CWID  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   CHTD  CWID  L#SD")

# "@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  L#SD  CHTD  CWID  LI%D  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "PCLA",#"  PCLA",
       24,   30,     "PDLA",#"  PDLA",
       30,   36,     "P#AD",#"  P#AD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,     "LWAD",#"  LWAD",
       54,   60,     "CWAD",#"  CWAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "FRLF",#"  FRLF",
       78,   84,     "FRST",#"  FRST",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "HIPD",#"  HIPD",
       96,  102,     "SH%D",#"  SH%D",
      102,  108,     "SLAD",#"  SLAD",
      108,  114,     "GWGD",#"  GWGD",
      114,  120,     "SHAD",#"  SHAD",
      120,  126,     "L#SD",#"  L#SD",
      126,  132,     "CHTD",#"  CHTD",
      132,  138,     "CWID",#"  CWID",
      138,  144,     "LI%D",#"  LI%D",
      144,  150,     "LMLN" #"  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  L#SD  CHTD  CWID  LI%D  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  PCLA  PDLA  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  L#SD  CHTD  CWID  LI%D  LMLN")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "FRLF",#"  FRLF",
       72,   78,     "FRST",#"  FRST",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD",#"  HIPD",
       90,   96,     "SH%D",#"  SH%D",
       96,  102,     "SLAD" #"  SLAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD")

# "@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  CHTD  CWID  LI%D  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "P#AD",#"  P#AD",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "PWAD",#"  PWAD",
       54,   60,     "G#AD",#"  G#AD",
       60,   66,     "FRLF",#"  FRLF",
       66,   72,     "FRST",#"  FRST",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "HIPD",#"  HIPD",
       84,   90,     "SH%D",#"  SH%D",
       90,   96,     "SLAD",#"  SLAD",
       96,  102,     "GWGD",#"  GWGD",
      102,  108,     "SHAD",#"  SHAD",
      108,  114,     "CHTD",#"  CHTD",
      114,  120,     "CWID",#"  CWID",
      120,  126,     "LI%D",#"  LI%D",
      126,  132,     "LMLN" #"  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  CHTD  CWID  LI%D  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  G#AD  FRLF  FRST  HIAD  HIPD  SH%D  SLAD  GWGD  SHAD  CHTD  CWID  LI%D  LMLN")

# "@TRNO   DATE  LAID  CWAD  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  GWAD")

# "@TRNO   DATE  CWAD  GWAD  P#AD  G#AD  HIAD  G#PD  GWGD  SW6D  SW7D  SW8D  SW9D  GSTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD",#"  GWAD",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "G#AD",#"  G#AD",
       36,   42,     "HIAD",#"  HIAD",
       42,   48,     "G#PD",#"  G#PD",
       48,   54,     "GWGD",#"  GWGD",
       54,   60,     "SW6D",#"  SW6D",
       60,   66,     "SW7D",#"  SW7D",
       66,   72,     "SW8D",#"  SW8D",
       72,   78,     "SW9D",#"  SW9D",
       78,   84,     "GSTD" #"  GSTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  GWAD  P#AD  G#AD  HIAD  G#PD  GWGD  SW6D  SW7D  SW8D  SW9D  GSTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  GWAD  P#AD  G#AD  HIAD  G#PD  GWGD  SW6D  SW7D  SW8D  SW9D  GSTD")

# "@TRNO   DATE  L#SD  LWAD  LAID  SLAD  SWAD  CWAD  PWAD  SHAD  GWAD  SH%D  P#AD  G#AD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  LNAD  SNAD  GNAD  GN%D  G#PD  LFFD  STFD  RTFD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LWAD",#"  LWAD",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "SLAD",#"  SLAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "PWAD",#"  PWAD",
       54,   60,     "SHAD",#"  SHAD",
       60,   66,     "GWAD",#"  GWAD",
       66,   72,     "SH%D",#"  SH%D",
       72,   78,     "P#AD",#"  P#AD",
       78,   84,     "G#AD",#"  G#AD",
       84,   90,     "GWGD",#"  GWGD",
       90,   96,     "HIAD",#"  HIAD",
       96,  102,     "HIPD",#"  HIPD",
      102,  108,     "LN%D",#"  LN%D",
      108,  114,     "SN%D",#"  SN%D",
      114,  120,     "SHND",#"  SHND",
      120,  126,     "LNAD",#"  LNAD",
      126,  132,     "SNAD",#"  SNAD",
      132,  138,     "GNAD",#"  GNAD",
      138,  144,     "GN%D",#"  GN%D",
      144,  150,     "G#PD",#"  G#PD",
      150,  156,     "LFFD",#"  LFFD",
      156,  162,     "STFD",#"  STFD",
      162,  168,     "RTFD" #"  RTFD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LWAD  LAID  SLAD  SWAD  CWAD  PWAD  SHAD  GWAD  SH%D  P#AD  G#AD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  LNAD  SNAD  GNAD  GN%D  G#PD  LFFD  STFD  RTFD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LWAD  LAID  SLAD  SWAD  CWAD  PWAD  SHAD  GWAD  SH%D  P#AD  G#AD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  LNAD  SNAD  GNAD  GN%D  G#PD  LFFD  STFD  RTFD")

# "@TRNO  DATE   LAID  LWAD  SWAD  CWAD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "LAID",#"   LAID",
       18,   24,     "LWAD",# "  LWAD",
       24,   30,     "SWAD",# "  SWAD",
       30,   36,     "CWAD",# "  CWAD",
       36,   42,     "L#SD" # "  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   LAID  LWAD  SWAD  CWAD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   LAID  LWAD  SWAD  CWAD  L#SD")

# "@TRNO   DATE  L#SD  LAID  LWAD  SWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  LWAD  SWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  LWAD  SWAD  CWAD")

# "@TRNO   DATE  UYAD  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "UYAD",#"  UYAD",
       18,   24,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  UYAD  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  UYAD  LAID")

# "@TRNO   DATE  SWAD  UWAD  CWAD  LWAD  UYAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SWAD",#"  SWAD",
       18,   24,     "UWAD",#"  UWAD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "UYAD" #"  UYAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SWAD  UWAD  CWAD  LWAD  UYAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SWAD  UWAD  CWAD  LWAD  UYAD")

# "@TRNO   DATE  VNAD  SNAD  CN%D  UNAD  RN%D  UWAD  RWAD  RNAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "VNAD",#"  VNAD",
       18,   24,     "SNAD",#"  SNAD",
       24,   30,     "CN%D",#"  CN%D",
       30,   36,     "UNAD",#"  UNAD",
       36,   42,     "RN%D",#"  RN%D",
       42,   48,     "UWAD",#"  UWAD",
       48,   54,     "RWAD",#"  RWAD",
       54,   60,     "RNAD",#"  RNAD",
       60,   66,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  VNAD  SNAD  CN%D  UNAD  RN%D  UWAD  RWAD  RNAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  VNAD  SNAD  CN%D  UNAD  RN%D  UWAD  RWAD  RNAD  CWAD")

# "@TRNO   DATE  TWAD  UYAD  UWAD  SWAD  LWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "TWAD",#"  TWAD",
       18,   24,     "UYAD",#"  UYAD",
       24,   30,     "UWAD",#"  UWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  TWAD  UYAD  UWAD  SWAD  LWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  TWAD  UYAD  UWAD  SWAD  LWAD  CWAD")

# "@TRNO   DATE  TWAD  UYAD  LAID  UWAD  SWAD  LWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "TWAD",#"  TWAD",
       18,   24,     "UYAD",#"  UYAD",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "UWAD",#"  UWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  TWAD  UYAD  LAID  UWAD  SWAD  LWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  TWAD  UYAD  LAID  UWAD  SWAD  LWAD  CWAD")

# "@TRNO   DATE  SNAD  UNAD  LAID  UWAD  CWAD  LWAD  LNAD  SWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SNAD",#"  SNAD",
       18,   24,     "UNAD",#"  UNAD",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "UWAD",#"  UWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "LNAD",#"  LNAD",
       54,   60,     "SWAD" #"  SWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SNAD  UNAD  LAID  UWAD  CWAD  LWAD  LNAD  SWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SNAD  UNAD  LAID  UWAD  CWAD  LWAD  LNAD  SWAD")

# "@TRNO   DATE  LAID  UYAD  UWAD  LWAD  SWAD  CWAD  TWAD  SLAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "UYAD",#"  UYAD",
       24,   30,     "UWAD",#"  UWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "CWAD",#"  CWAD",
       48,   54,     "TWAD",#"  TWAD",
       54,   60,     "SLAD" #"  SLAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  UYAD  UWAD  LWAD  SWAD  CWAD  TWAD  SLAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  UYAD  UWAD  LWAD  SWAD  CWAD  TWAD  SLAD")

# "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  PWAD  GWAD  CWAD  GWGD  LDAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  SHND"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SLAD",#"  SLAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "SWAD",#"  SWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "GWAD",#"  GWAD",
       66,   72,     "CWAD",#"  CWAD",
       72,   78,     "GWGD",#"  GWGD",
       78,   84,     "LDAD",#"  LDAD",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "HIPD",#"  HIPD",
       96,  102,     "SH%D",#"  SH%D",
      102,  108,     "LN%D",#"  LN%D",
      108,  114,     "SN%D",#"  SN%D",
      114,  120,     "GN%D",#"  GN%D",
      120,  126,     "SHND" #"  SHND"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  PWAD  GWAD  CWAD  GWGD  LDAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  SHND",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  PWAD  GWAD  CWAD  GWGD  LDAD  HIAD  HIPD  SH%D  LN%D  SN%D  GN%D  SHND")

# "@TRNO   DATE  T#AD  LAID  RWAD  SWAD  GWAD  LWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "T#AD",#"  T#AD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  T#AD  LAID  RWAD  SWAD  GWAD  LWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  T#AD  LAID  RWAD  SWAD  GWAD  LWAD  CWAD")

# "@TRNO   DATE  T#AD  CWAD  SWAD  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "T#AD",#"  T#AD",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  T#AD  CWAD  SWAD  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  T#AD  CWAD  SWAD  GWAD")

# "@TRNO   DATE  CWAD  LAID  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  GWAD")

# "@TRNO   DATE  LWAD  SWAD  CWAD  LAID  G#AD  P#AD  GWAD  GWGD  HIAD  CHTD  SLAD  PWAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "G#AD",#"  G#AD",
       42,   48,     "P#AD",#"  P#AD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "GWGD",#"  GWGD",
       60,   66,     "HIAD",#"  HIAD",
       66,   72,     "CHTD",#"  CHTD",
       72,   78,     "SLAD",#"  SLAD",
       78,   84,     "PWAD",#"  PWAD",
       84,   90,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  SWAD  CWAD  LAID  G#AD  P#AD  GWAD  GWGD  HIAD  CHTD  SLAD  PWAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  SWAD  CWAD  LAID  G#AD  P#AD  GWAD  GWGD  HIAD  CHTD  SLAD  PWAD  HIPD")

# "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VNAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SLAD",#"  SLAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "SWAD",#"  SWAD",
       54,   60,     "VNAD",#"  VNAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "HIPD",#"  HIPD",
       72,   78,     "GWAD",#"  GWAD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "CWAD",#"  CWAD",
       90,   96,     "CNAD",#"  CNAD",
       96,  102,     "LI%N",#"  LI%N",
      102,  108,     "G#AD",#"  G#AD",
      108,  114,     "LDAD",#"  LDAD",
      114,  120,    "SNW0C",#" SNW0C",
      120,  126,     "HIAD",#"  HIAD",
      126,  132,     "P#AD",#"  P#AD",
      132,  138,     "GWGD",#"  GWGD",
      138,  144,     "VN%D",#"  VN%D",
      144,  150,     "GN%D",#"  GN%D",
      150,  156,     "SHND",#"  SHND",
      156,  162,    "XFN%D",#" XFN%D",
      162,  168,    "PTAL1",#" PTAL1",
      168,  174,    "PTAL2",#" PTAL2",
      174,  180,    "FPTL1",#" FPTL1",
      180,  186,    "FPTL2" #" FPTL2"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VNAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  SWAD  VNAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2")

# "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  VNAD  SWAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "CWID",#"  CWID",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SLAD",#"  SLAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "VNAD",#"  VNAD",
       54,   60,     "SWAD",#"  SWAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "HIPD",#"  HIPD",
       72,   78,     "GWAD",#"  GWAD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "CWAD",#"  CWAD",
       90,   96,     "CNAD",#"  CNAD",
       96,  102,     "LI%N",#"  LI%N",
      102,  108,     "G#AD",#"  G#AD",
      108,  114,     "LDAD",#"  LDAD",
      114,  120,    "SNW0C",#" SNW0C",
      120,  126,     "HIAD",#"  HIAD",
      126,  132,     "P#AD",#"  P#AD",
      132,  138,     "GWGD",#"  GWGD",
      138,  144,     "VN%D",#"  VN%D",
      144,  150,     "GN%D",#"  GN%D",
      150,  156,     "SHND",#"  SHND",
      156,  162,    "XFN%D",#" XFN%D",
      162,  168,    "PTAL1",#" PTAL1",
      168,  174,    "PTAL2",#" PTAL2",
      174,  180,    "FPTL1",#" FPTL1",
      180,  186,    "FPTL2" #" FPTL2"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  VNAD  SWAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  CWID  L#SD  LAID  SLAD  LWAD  VNAD  SWAD  PWAD  HIPD  GWAD  SH%D  CWAD  CNAD  LI%N  G#AD  LDAD SNW0C  HIAD  P#AD  GWGD  VN%D  GN%D  SHND XFN%D PTAL1 PTAL2 FPTL1 FPTL2")

# "@TRNO   DATE  CWAD  GWAD  G#AD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD",#"  GWAD",
       24,   30,     "G#AD" #"  G#AD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  GWAD  G#AD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  GWAD  G#AD")

# "@TRNO   DATE  CWAD  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  GWAD")

# "@TRNO   DATE  CNAD  GN%D  SNAD  GNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CNAD",#"  CNAD",
       18,   24,     "GN%D",#"  GN%D",
       24,   30,     "SNAD",#"  SNAD",
       30,   36,     "GNAD" #"  GNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CNAD  GN%D  SNAD  GNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CNAD  GN%D  SNAD  GNAD")

# "@TRNO    DOY   DAP  LAID  VWAD  L#SD  CHTD SHPPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,      "DOY",#"   DOY",
       12,   18,      "DAP",#"   DAP",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "VWAD",#"  VWAD",
       30,   36,     "L#SD",#"  L#SD",
       36,   42,     "CHTD",#"  CHTD",
       42,   48,    "SHPPD" #" SHPPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO    DOY   DAP  LAID  VWAD  L#SD  CHTD SHPPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO    DOY   DAP  LAID  VWAD  L#SD  CHTD SHPPD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  CHTD  CWID  LI%N  HIAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "SH%D",#"  SH%D",
       72,   78,     "SLAD",#"  SLAD",
       78,   84,     "CHTD",#"  CHTD",
       84,   90,     "CWID",#"  CWID",
       90,   96,     "LI%N",#"  LI%N",
       96,  102,     "HIAD",#"  HIAD",
      102,  108,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  CHTD  CWID  LI%N  HIAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  CHTD  CWID  LI%N  HIAD  HIPD")

# "@TRNO   DATE  CHTD  L#SD  LAID  SWAD  LWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CHTD",#"  CHTD",
       18,   24,     "L#SD",#"  L#SD",
       24,   30,     "LAID",#"  LAID",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CHTD  L#SD  LAID  SWAD  LWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CHTD  L#SD  LAID  SWAD  LWAD  CWAD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "RWAD",#"  RWAD",
       72,   78,     "G#AD",#"  G#AD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "SLAD",#"  SLAD",
       90,   96,     "GWGD",#"  GWGD",
       96,  102,     "HIAD",#"  HIAD",
      102,  108,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  HIAD  HIPD  GWGD  GN%D  GL%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "SH%D",#"  SH%D",
       78,   84,     "SLAD",#"  SLAD",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "HIPD",#"  HIPD",
       96,  102,     "GWGD",#"  GWGD",
      102,  108,     "GN%D",#"  GN%D",
      108,  114,     "GL%D" #"  GL%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  HIAD  HIPD  GWGD  GN%D  GL%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  HIAD  HIPD  GWGD  GN%D  GL%D")

# "@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIPD  HIAD  SH%D  GWGD  G#AD  SHAD  LAID  SWID  SW2D  SW3D  SW4D  SW5D  SW6D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "HIPD",#"  HIPD",
       60,   66,     "HIAD",#"  HIAD",
       66,   72,     "SH%D",#"  SH%D",
       72,   78,     "GWGD",#"  GWGD",
       78,   84,     "G#AD",#"  G#AD",
       84,   90,     "SHAD",#"  SHAD",
       90,   96,     "LAID",#"  LAID",
       96,  102,     "SWID",#"  SWID",
      102,  108,     "SW2D",#"  SW2D",
      108,  114,     "SW3D",#"  SW3D",
      114,  120,     "SW4D",#"  SW4D",
      120,  126,     "SW5D",#"  SW5D",
      126,  132,     "SW6D" #"  SW6D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIPD  HIAD  SH%D  GWGD  G#AD  SHAD  LAID  SWID  SW2D  SW3D  SW4D  SW5D  SW6D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  CWAD  LWAD  SWAD  PWAD  GWAD  P#AD  HIPD  HIAD  SH%D  GWGD  G#AD  SHAD  LAID  SWID  SW2D  SW3D  SW4D  SW5D  SW6D")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  HIPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "SH%D",#"  SH%D",
       72,   78,     "SLAD",#"  SLAD",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD" #"  HIPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  HIPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  HIPD")

# "@TRNO   DATE  SWXD  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SWXD",#"  SWXD",
       18,   24,     "SW1D",#"  SW1D",
       24,   30,     "SW2D",#"  SW2D",
       30,   36,     "SW3D",#"  SW3D",
       36,   42,     "SW4D",#"  SW4D",
       42,   48,     "SW5D",#"  SW5D",
       48,   54,     "SW6D",#"  SW6D",
       54,   60,     "SW7D",#"  SW7D",
       60,   66,     "SW8D",#"  SW8D",
       66,   72,     "SW9D" #"  SW9D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SWXD  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SWXD  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D  SW8D  SW9D")

# "@TRNO   DATE  RWAD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10  RL11  RL12  RL13  RDPD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "RWAD",#"  RWAD",
       18,   24,     "RL1D",#"  RL1D",
       24,   30,     "RL2D",#"  RL2D",
       30,   36,     "RL3D",#"  RL3D",
       36,   42,     "RL4D",#"  RL4D",
       42,   48,     "RL5D",#"  RL5D",
       48,   54,     "RL6D",#"  RL6D",
       54,   60,     "RL7D",#"  RL7D",
       60,   66,     "RL8D",#"  RL8D",
       66,   72,     "RL9D",#"  RL9D",
       72,   78,     "RL10",#"  RL10",
       78,   84,     "RL11",#"  RL11",
       84,   90,     "RL12",#"  RL12",
       90,   96,     "RL13",#"  RL13",
       96,  102,     "RDPD" #"  RDPD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  RWAD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10  RL11  RL12  RL13  RDPD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  RWAD  RL1D  RL2D  RL3D  RL4D  RL5D  RL6D  RL7D  RL8D  RL9D  RL10  RL11  RL12  RL13  RDPD")

# "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "HIAD",#"  HIAD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "SHAD",#"  SHAD",
       72,   78,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#SD")

# "@TRNO   DATE  LMLN  WSGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LMLN",#"  LMLN",
       18,   24,     "WSGD" #"  WSGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LMLN  WSGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LMLN  WSGD")

# "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#AD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "GWAD",#"  GWAD",
       54,   60,     "HIAD",#"  HIAD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "SHAD",#"  SHAD",
       72,   78,     "L#AD" #"  L#AD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#AD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  PWAD  SWAD  LWAD  SLAD  GWAD  HIAD  SH%D  SHAD  L#AD")

# "@TRNO   DATE  W105  W210  W315  W415  W515  W615  W715"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "W105",#"  W105",
       18,   24,     "W210",#"  W210",
       24,   30,     "W315",#"  W315",
       30,   36,     "W415",#"  W415",
       36,   42,     "W515",#"  W515",
       42,   48,     "W615",#"  W615",
       48,   54,     "W715" #"  W715"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  W105  W210  W315  W415  W515  W615  W715",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  W105  W210  W315  W415  W515  W615  W715")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  SH%D  SLAD  GWGD  CHTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "HIPD",#"  HIPD",
       84,   90,     "SH%D",#"  SH%D",
       90,   96,     "SLAD",#"  SLAD",
       96,  102,     "GWGD",#"  GWGD",
      102,  108,     "CHTD" #"  CHTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  SH%D  SLAD  GWGD  CHTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  SH%D  SLAD  GWGD  CHTD")

# "@TRNO   DATE  CWAD  LAID  RWAD  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  RWAD  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  RWAD  GWAD")

# "@TRNO   DATE  CWAD  LAID  RWAD  GWAD  FNAD  SNAD  STRN  LNAD  PNAD  GNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "GWAD",#"  GWAD",
       36,   42,     "FNAD",#"  FNAD",
       42,   48,     "SNAD",#"  SNAD",
       48,   54,     "STRN",#"  STRN",
       54,   60,     "LNAD",#"  LNAD",
       60,   66,     "PNAD",#"  PNAD",
       66,   72,     "GNAD" #"  GNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  RWAD  GWAD  FNAD  SNAD  STRN  LNAD  PNAD  GNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  RWAD  GWAD  FNAD  SNAD  STRN  LNAD  PNAD  GNAD")

# "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  SH%D  SLAD  LN%D  CL%D  SN%D  CS%D  HIAD  HIPD  FRST  FRLF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "SHAD",#"  SHAD",
       54,   60,     "RWAD",#"  RWAD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "LN%D",#"  LN%D",
       78,   84,     "CL%D",#"  CL%D",
       84,   90,     "SN%D",#"  SN%D",
       90,   96,     "CS%D",#"  CS%D",
       96,  102,     "HIAD",#"  HIAD",
      102,  108,     "HIPD",#"  HIPD",
      108,  114,     "FRST",#"  FRST",
      114,  120,     "FRLF" #"  FRLF"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  SH%D  SLAD  LN%D  CL%D  SN%D  CS%D  HIAD  HIPD  FRST  FRLF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  RWAD  SH%D  SLAD  LN%D  CL%D  SN%D  CS%D  HIAD  HIPD  FRST  FRLF")

# "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  CEW6"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "SHAD",#"  SHAD",
       54,   60,     "SH%D",#"  SH%D",
       60,   66,     "SLAD",#"  SLAD",
       66,   72,     "HIAD",#"  HIAD",
       72,   78,     "CEW6" #"  CEW6"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  CEW6",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  HIAD  CEW6")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  LN%D  SN%D  SHND  GN%D  CHTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "SH%D",#"  SH%D",
       78,   84,     "SLAD",#"  SLAD",
       84,   90,     "GWGD",#"  GWGD",
       90,   96,     "HIAD",#"  HIAD",
       96,  102,     "LN%D",#"  LN%D",
      102,  108,     "SN%D",#"  SN%D",
      108,  114,     "SHND",#"  SHND",
      114,  120,     "GN%D",#"  GN%D",
      120,  126,     "CHTD" #"  CHTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  LN%D  SN%D  SHND  GN%D  CHTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  LN%D  SN%D  SHND  GN%D  CHTD")

# "@TRNO   DATE  CWAD  LWAD  SLAD  LAID  SWAD  PWAD  SH%D  GWAD  SHAD  P#AD  G#AD  HIAD  HIPD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LWAD",#"  LWAD",
       24,   30,     "SLAD",#"  SLAD",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "SH%D",#"  SH%D",
       54,   60,     "GWAD",#"  GWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "P#AD",#"  P#AD",
       72,   78,     "G#AD",#"  G#AD",
       78,   84,     "HIAD",#"  HIAD",
       84,   90,     "HIPD",#"  HIPD",
       90,   96,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LWAD  SLAD  LAID  SWAD  PWAD  SH%D  GWAD  SHAD  P#AD  G#AD  HIAD  HIPD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LWAD  SLAD  LAID  SWAD  PWAD  SH%D  GWAD  SHAD  P#AD  G#AD  HIAD  HIPD  GWGD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  GWGD  SH%D  SLAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "HIPD",#"  HIPD",
       84,   90,     "GWGD",#"  GWGD",
       90,   96,     "SH%D",#"  SH%D",
       96,  102,     "SLAD" #"  SLAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  GWGD  SH%D  SLAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  HIAD  HIPD  GWGD  SH%D  SLAD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  GN%D  NWAD  NFXD  CHTD  CWID  LI%N"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "SHAD",#"  SHAD",
       66,   72,     "G#AD",#"  G#AD",
       72,   78,     "SH%D",#"  SH%D",
       78,   84,     "SLAD",#"  SLAD",
       84,   90,     "GWGD",#"  GWGD",
       90,   96,     "HIAD",#"  HIAD",
       96,  102,     "HIPD",#"  HIPD",
      102,  108,     "LN%D",#"  LN%D",
      108,  114,     "SN%D",#"  SN%D",
      114,  120,     "SHND",#"  SHND",
      120,  126,     "GN%D",#"  GN%D",
      126,  132,     "NWAD",#"  NWAD",
      132,  138,     "NFXD",#"  NFXD",
      138,  144,     "CHTD",#"  CHTD",
      144,  150,     "CWID",#"  CWID",
      150,  156,     "LI%N" #"  LI%N"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  GN%D  NWAD  NFXD  CHTD  CWID  LI%N",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  G#AD  SH%D  SLAD  GWGD  HIAD  HIPD  LN%D  SN%D  SHND  GN%D  NWAD  NFXD  CHTD  CWID  LI%N")

# "@TRNO   DATE  SNAD  GNAD  LNAD  SNHD  VNAD  CNAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SNAD",#"  SNAD",
       18,   24,     "GNAD",#"  GNAD",
       24,   30,     "LNAD",#"  LNAD",
       30,   36,     "SNHD",#"  SNHD",
       36,   42,     "VNAD",#"  VNAD",
       42,   48,     "CNAD" #"  CNAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SNAD  GNAD  LNAD  SNHD  VNAD  CNAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SNAD  GNAD  LNAD  SNHD  VNAD  CNAD")

# "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  G#AD  SH%D  SLAD  HIAD  GWGD  RL3D  RL4D  RL5D  RL6D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "P#AD",#"  P#AD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "GWAD",#"  GWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "CWAD",#"  CWAD",
       54,   60,     "G#AD",#"  G#AD",
       60,   66,     "SH%D",#"  SH%D",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "HIAD",#"  HIAD",
       78,   84,     "GWGD",#"  GWGD",
       84,   90,     "RL3D",#"  RL3D",
       90,   96,     "RL4D",#"  RL4D",
       96,  102,     "RL5D",#"  RL5D",
      102,  108,     "RL6D" #"  RL6D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  G#AD  SH%D  SLAD  HIAD  GWGD  RL3D  RL4D  RL5D  RL6D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  P#AD  SWAD  GWAD  LWAD  CWAD  G#AD  SH%D  SLAD  HIAD  GWGD  RL3D  RL4D  RL5D  RL6D")

# "@TRNO   DATE  L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%N  LMLN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "SLAD",#"  SLAD",
       54,   60,     "CHTD",#"  CHTD",
       60,   66,     "CWID",#"  CWID",
       66,   72,     "PHAN",#"  PHAN",
       72,   78,     "LI%N",#"  LI%N",
       78,   84,     "LMLN" #"  LMLN"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%N  LMLN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CHTD  CWID  PHAN  LI%N  LMLN")

# "@TRNO   DATE  L#SD  SLAD  CWAD  LWAD  SWAD  LAID  P#AD  PWAD  G#AD  GWAD  SHAD  SH%D  HIAD  GWGD  CHTD  CWID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "SLAD",#"  SLAD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "LAID",#"  LAID",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "G#AD",#"  G#AD",
       66,   72,     "GWAD",#"  GWAD",
       72,   78,     "SHAD",#"  SHAD",
       78,   84,     "SH%D",#"  SH%D",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "GWGD",#"  GWGD",
       96,  102,     "CHTD",#"  CHTD",
      102,  108,     "CWID" #"  CWID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  SLAD  CWAD  LWAD  SWAD  LAID  P#AD  PWAD  G#AD  GWAD  SHAD  SH%D  HIAD  GWGD  CHTD  CWID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  SLAD  CWAD  LWAD  SWAD  LAID  P#AD  PWAD  G#AD  GWAD  SHAD  SH%D  HIAD  GWGD  CHTD  CWID")

# "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "SW1D",#"  SW1D",
       18,   24,     "SW2D",#"  SW2D",
       24,   30,     "SW3D",#"  SW3D",
       30,   36,     "SW4D",#"  SW4D",
       36,   42,     "SW5D",#"  SW5D",
       42,   48,     "SW6D",#"  SW6D",
       48,   54,     "SW7D" #"  SW7D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  SW1D  SW2D  SW3D  SW4D  SW5D  SW6D  SW7D")

# "@TRNO   DATE  L#SD  SLAD  SH%D  LAID  LWAD  SWAD  SHAD  GWAD  PWAD  CWAD  P#AD  G#AD  HIAD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "SLAD",#"  SLAD",
       24,   30,     "SH%D",#"  SH%D",
       30,   36,     "LAID",#"  LAID",
       36,   42,     "LWAD",#"  LWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "SHAD",#"  SHAD",
       54,   60,     "GWAD",#"  GWAD",
       60,   66,     "PWAD",#"  PWAD",
       66,   72,     "CWAD",#"  CWAD",
       72,   78,     "P#AD",#"  P#AD",
       78,   84,     "G#AD",#"  G#AD",
       84,   90,     "HIAD",#"  HIAD",
       90,   96,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  SLAD  SH%D  LAID  LWAD  SWAD  SHAD  GWAD  PWAD  CWAD  P#AD  G#AD  HIAD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  SLAD  SH%D  LAID  LWAD  SWAD  SHAD  GWAD  PWAD  CWAD  P#AD  G#AD  HIAD  GWGD")

# "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  PCLA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "PWAD",#"  PWAD",
       48,   54,     "SHAD",#"  SHAD",
       54,   60,     "SH%D",#"  SH%D",
       60,   66,     "SLAD",#"  SLAD",
       66,   72,     "PCLA" #"  PCLA"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  PCLA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  PWAD  SHAD  SH%D  SLAD  PCLA")

# "@TRNO   DATE  LWAD  LAID  RWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LWAD",#"  LWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD" #"  RWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LWAD  LAID  RWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LWAD  LAID  RWAD")

# "@TRNO   DATE LWAD LAID   RWAD   "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   12,     "DATE",# "  DATE",
       12,   17,     "LWAD",#  " LWAD",
       17,   22,     "LAID",#  " LAID",
       22,   29,     "RWAD" #"   RWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE LWAD LAID   RWAD   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE LWAD LAID   RWAD   ")

# "@TRNO   DATE  CWAD  LAID  RWAD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  RWAD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  RWAD  L#SD")

# "@TRNO   DATE  CWAD  RWAD  L#SD  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "RWAD",#"  RWAD",
       24,   30,     "L#SD",#"  L#SD",
       30,   36,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  RWAD  L#SD  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  RWAD  L#SD  LAID")

# "@TRNO   DATE  PCLA  LAID  RWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "PCLA",#"  PCLA",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  PCLA  LAID  RWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  PCLA  LAID  RWAD  CWAD")

# "@TRNO  DATE  SMDMD SMFMD  T#AD LAIGD  SHTD SUCMD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,    "SMDMD",#"  SMDMD",
       18,   24,    "SMFMD",# " SMFMD",
       24,   30,     "T#AD",# "  T#AD",
       30,   36,    "LAIGD",# " LAIGD",
       36,   42,     "SHTD",# "  SHTD",
       42,   48,    "SUCMD" # " SUCMD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE  SMDMD SMFMD  T#AD LAIGD  SHTD SUCMD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE  SMDMD SMFMD  T#AD LAIGD  SHTD SUCMD")

# "@TRNO   DATE LGDMD LAITD SUCMD SMDMD  L#SD  T#AD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,    "LGDMD",#" LGDMD",
       18,   24,    "LAITD",#" LAITD",
       24,   30,    "SUCMD",#" SUCMD",
       30,   36,    "SMDMD",#" SMDMD",
       36,   42,     "L#SD",#"  L#SD",
       42,   48,     "T#AD" #"  T#AD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE LGDMD LAITD SUCMD SMDMD  L#SD  T#AD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE LGDMD LAITD SUCMD SMDMD  L#SD  T#AD")

# "@TRNO   DATE SMDMD SMFMD SUCMD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,    "SMDMD",#" SMDMD",
       18,   24,    "SMFMD",#" SMFMD",
       24,   30,    "SUCMD" #" SUCMD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE SMDMD SMFMD SUCMD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE SMDMD SMFMD SUCMD")

# "@TRNO   DATE CULTI  T#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,    "CULTI",#" CULTI",
       18,   24,     "T#SD" #"  T#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE CULTI  T#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE CULTI  T#SD")

# "@TRNO   DATE  T#AD  S#AD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "T#AD",#"  T#AD",
       18,   24,     "S#AD" #"  S#AD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  T#AD  S#AD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  T#AD  S#AD")

# "@TRNO   DATE BADMD SMFMD SUCMD LAIGD  T#AD SMDMD L#S1D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,    "BADMD",#" BADMD",
       18,   24,    "SMFMD",#" SMFMD",
       24,   30,    "SUCMD",#" SUCMD",
       30,   36,    "LAIGD",#" LAIGD",
       36,   42,     "T#AD",#"  T#AD",
       42,   48,    "SMDMD",#" SMDMD",
       48,   54,    "L#S1D" #" L#S1D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE BADMD SMFMD SUCMD LAIGD  T#AD SMDMD L#S1D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE BADMD SMFMD SUCMD LAIGD  T#AD SMDMD L#S1D")

# "@TRNO   DATE  LAID  XO%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "XO%D" #"  XO%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  XO%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  XO%D")

# "@TRNO   DATE  LAID  CWAD  GWAD  HIAD  GL%D  L#SD  G#AD  GWGD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "HIAD",#"  HIAD",
       36,   42,     "GL%D",#"  GL%D",
       42,   48,     "L#SD",#"  L#SD",
       48,   54,     "G#AD",#"  G#AD",
       54,   60,     "GWGD" #"  GWGD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  GWAD  HIAD  GL%D  L#SD  G#AD  GWGD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  GWAD  HIAD  GL%D  L#SD  G#AD  GWGD")

# "@TRNO  DATE   CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "CWAD" #"   CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   CWAD")

# "@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  RWAD  LN%D  CNAD PDMCD AFPWD ADPWD FPWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "RWAD",#"  RWAD",
       54,   60,     "LN%D",#"  LN%D",
       60,   66,     "CNAD",#"  CNAD",
       66,   72,    "PDMCD",#" PDMCD",
       72,   78,    "AFPWD",#" AFPWD",
       78,   84,    "ADPWD",#" ADPWD",
       84,   90,    "FPWAD" #" FPWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  RWAD  LN%D  CNAD PDMCD AFPWD ADPWD FPWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  RWAD  LN%D  CNAD PDMCD AFPWD ADPWD FPWAD")

# "@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  LN%D  CNAD  RWAD PDMCD AFPWD ADPWD FPWAD  RL1D  RL2D  RL3D  RL4D  RL5D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "PWAD",#"  PWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "SWAD",#"  SWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "LN%D",#"  LN%D",
       54,   60,     "CNAD",#"  CNAD",
       60,   66,     "RWAD",#"  RWAD",
       66,   72,    "PDMCD",#" PDMCD",
       72,   78,    "AFPWD",#" AFPWD",
       78,   84,    "ADPWD",#" ADPWD",
       84,   90,    "FPWAD",#" FPWAD",
       90,   96,     "RL1D",#"  RL1D",
       96,  102,     "RL2D",#"  RL2D",
      102,  108,     "RL3D",#"  RL3D",
      108,  114,     "RL4D",#"  RL4D",
      114,  120,     "RL5D" #"  RL5D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  LN%D  CNAD  RWAD PDMCD AFPWD ADPWD FPWAD  RL1D  RL2D  RL3D  RL4D  RL5D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  PWAD  LWAD  SWAD  SLAD  LN%D  CNAD  RWAD PDMCD AFPWD ADPWD FPWAD  RL1D  RL2D  RL3D  RL4D  RL5D")

# "@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,    "PDMCD",#" PDMCD",
       48,   54,    "AFPWD",#" AFPWD",
       54,   60,    "ADPWD",#" ADPWD",
       60,   66,    "FPWAD",#" FPWAD",
       66,   72,    "MFWAD",#" MFWAD",
       72,   78,    "NFWAD" #" NFWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD")

# "@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD  GWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "SWAD",#"  SWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "GWAD",#"  GWAD",
       48,   54,    "PDMCD",#" PDMCD",
       54,   60,    "AFPWD",#" AFPWD",
       60,   66,    "ADPWD",#" ADPWD",
       66,   72,    "FPWAD",#" FPWAD",
       72,   78,    "MFWAD",#" MFWAD",
       78,   84,    "NFWAD" #" NFWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD  GWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  LAID  SWAD  LWAD  PWAD  GWAD PDMCD AFPWD ADPWD FPWAD MFWAD NFWAD")

# "@TRNO  DATE   L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "TRNO",# "@TRNO ",
        6,   11,     "DATE",#  " DATE",
       11,   18,     "L#SD",#"   L#SD",
       18,   24,     "LAID",# "  LAID",
       24,   30,     "RWAD",# "  RWAD",
       30,   36,     "SWAD",# "  SWAD",
       36,   42,     "UWAD",# "  UWAD",
       42,   48,     "LWAD",# "  LWAD",
       48,   54,     "TWAD",# "  TWAD",
       54,   60,     "RDPD",# "  RDPD",
       60,   66,     "PRSD" # "  PRSD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  DATE   L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  DATE   L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD")

# "@TRNO   DATE  T#AD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  SLAD  L#SD  RLWD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "T#AD",#"  T#AD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "UWAD",#"  UWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "TWAD",#"  TWAD",
       54,   60,     "SLAD",#"  SLAD",
       60,   66,     "L#SD",#"  L#SD",
       66,   72,     "RLWD" #"  RLWD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  T#AD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  SLAD  L#SD  RLWD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  T#AD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  SLAD  L#SD  RLWD")

# "@TRNO   DATE  L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "RWAD",#"  RWAD",
       30,   36,     "SWAD",#"  SWAD",
       36,   42,     "UWAD",#"  UWAD",
       42,   48,     "LWAD",#"  LWAD",
       48,   54,     "TWAD",#"  TWAD",
       54,   60,     "RDPD",#"  RDPD",
       60,   66,     "PRSD" #"  PRSD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  RWAD  SWAD  UWAD  LWAD  TWAD  RDPD  PRSD")

# "@TRNO   MDAT  CWAD  GWAD  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "MDAT",#"  MDAT",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD",#"  GWAD",
       24,   30,     "HIAM" #"  HIAM"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   MDAT  CWAD  GWAD  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   MDAT  CWAD  GWAD  HIAM")

# "@TRNO   DATE  CWAD  GWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD" #"  GWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  GWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  GWAD")

# "@TRNO   DATE  CWAD  GWAD  HIAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "GWAD",#"  GWAD",
       24,   30,     "HIAD" #"  HIAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  GWAD  HIAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  GWAD  HIAD")

# "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  M#AD  SLAD  CHTD  CWID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "L#PA",#"  L#PA",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "RWAD",#"  RWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "M#AD",#"  M#AD",
       72,   78,     "SLAD",#"  SLAD",
       78,   84,     "CHTD",#"  CHTD",
       84,   90,     "CWID" #"  CWID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  M#AD  SLAD  CHTD  CWID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  M#AD  SLAD  CHTD  CWID")

# "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "L#PA",#"  L#PA",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "RWAD",#"  RWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "CHTD",#"  CHTD",
       78,   84,     "CWID" #"  CWID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWID")

# "@TRNO   DATE  LAID  CWAD  SLAD  PWAD FPWAD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "CWAD",#"  CWAD",
       24,   30,     "SLAD",#"  SLAD",
       30,   36,     "PWAD",#"  PWAD",
       36,   42,    "FPWAD",#" FPWAD",
       42,   48,     "DIC1",#"  DIC1",
       48,   54,     "FWC1",#"  FWC1",
       54,   60,     "DWC1",#"  DWC1",
       60,   66,     "DFC1",#"  DFC1",
       66,   72,     "DIC2",#"  DIC2",
       72,   78,     "FWC2",#"  FWC2",
       78,   84,     "DWC2",#"  DWC2",
       84,   90,     "DFC2",#"  DFC2",
       90,   96,     "DIC3",#"  DIC3",
       96,  102,     "FWC3",#"  FWC3",
      102,  108,     "DWC3",#"  DWC3",
      108,  114,     "DFC3",#"  DFC3",
      114,  120,     "LN%D",#"  LN%D",
      120,  126,     "SHND",#"  SHND",
      126,  132,     "SN%D" #"  SN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  CWAD  SLAD  PWAD FPWAD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  CWAD  SLAD  PWAD FPWAD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D")

# "@TRNO   DATE  LAID  SLAD  CWAD  PWAD FPWAD  HIPD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SLAD",#"  SLAD",
       24,   30,     "CWAD",#"  CWAD",
       30,   36,     "PWAD",#"  PWAD",
       36,   42,    "FPWAD",#" FPWAD",
       42,   48,     "HIPD",#"  HIPD",
       48,   54,     "DIC1",#"  DIC1",
       54,   60,     "FWC1",#"  FWC1",
       60,   66,     "DWC1",#"  DWC1",
       66,   72,     "DFC1",#"  DFC1",
       72,   78,     "DIC2",#"  DIC2",
       78,   84,     "FWC2",#"  FWC2",
       84,   90,     "DWC2",#"  DWC2",
       90,   96,     "DFC2",#"  DFC2",
       96,  102,     "DIC3",#"  DIC3",
      102,  108,     "FWC3",#"  FWC3",
      108,  114,     "DWC3",#"  DWC3",
      114,  120,     "DFC3",#"  DFC3",
      120,  126,     "LN%D",#"  LN%D",
      126,  132,     "SHND",#"  SHND",
      132,  138,     "SN%D" #"  SN%D"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SLAD  CWAD  PWAD FPWAD  HIPD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SLAD  CWAD  PWAD FPWAD  HIPD  DIC1  FWC1  DWC1  DFC1  DIC2  FWC2  DWC2  DFC2  DIC3  FWC3  DWC3  DFC3  LN%D  SHND  SN%D")

# "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "L#SD",#"  L#SD",
       18,   24,     "LAID",#"  LAID",
       24,   30,     "L#PA",#"  L#PA",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "RWAD",#"  RWAD",
       42,   48,     "SWAD",#"  SWAD",
       48,   54,     "P#AD",#"  P#AD",
       54,   60,     "PWAD",#"  PWAD",
       60,   66,     "CWAD",#"  CWAD",
       66,   72,     "SLAD",#"  SLAD",
       72,   78,     "CHTD",#"  CHTD",
       78,   84,     "CWTD" #"  CWTD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  L#SD  LAID  L#PA  LWAD  RWAD  SWAD  P#AD  PWAD  CWAD  SLAD  CHTD  CWTD")

# "@TRNO   DATE  LAID  PWAD  CWAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "PWAD",#"  PWAD",
       24,   30,     "CWAD" #"  CWAD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  PWAD  CWAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  PWAD  CWAD")

# "@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  LDAD  CWID  CHTD  L#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "LDAD",#"  LDAD",
       54,   60,     "CWID",#"  CWID",
       60,   66,     "CHTD",#"  CHTD",
       66,   72,     "L#SD" #"  L#SD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  LDAD  CWID  CHTD  L#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  LDAD  CWID  CHTD  L#SD")

# "@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CDAD  CWID  CHTD  L#SD  LOSS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "LWAD",#"  LWAD",
       30,   36,     "CWAD",#"  CWAD",
       36,   42,     "PWAD",#"  PWAD",
       42,   48,     "SLAD",#"  SLAD",
       48,   54,     "CDAD",#"  CDAD",
       54,   60,     "CWID",#"  CWID",
       60,   66,     "CHTD",#"  CHTD",
       66,   72,     "L#SD",#"  L#SD",
       72,   78,     "LOSS" #"  LOSS"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CDAD  CWID  CHTD  L#SD  LOSS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  LWAD  CWAD  PWAD  SLAD  CDAD  CWID  CHTD  L#SD  LOSS")

# "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  T#AD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "LAID",#"  LAID",
       18,   24,     "SWAD",#"  SWAD",
       24,   30,     "GWAD",#"  GWAD",
       30,   36,     "LWAD",#"  LWAD",
       36,   42,     "CWAD",#"  CWAD",
       42,   48,     "T#AD" #"  T#AD"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  T#AD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  LAID  SWAD  GWAD  LWAD  CWAD  T#AD")

# "@TRNO   DATE  CWAD  T#AD  LAID"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TRNO",#"@TRNO ",
        6,   12,     "DATE",#"  DATE",
       12,   18,     "CWAD",#"  CWAD",
       18,   24,     "T#AD",#"  T#AD",
       24,   30,     "LAID" #"  LAID"
  )

  col_names <-   " TRNO "

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  CWAD  T#AD  LAID",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  CWAD  T#AD  LAID")


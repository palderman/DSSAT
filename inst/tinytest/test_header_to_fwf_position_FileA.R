# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "BWAH",# "  BWAH",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT")

# "@TRNO   DATE  PWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "DATE",#"   DATE",
       12,   18,     "PWAM" # "  PWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   DATE  PWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   DATE  PWAM")

# "@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  DWAP  GL%M  CWAM  GN%M  H#UM  HWUM  MDAT  H#AM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "CHTA",# "  CHTA",
       18,   24,     "HDAT",# "  HDAT",
       24,   30,     "HIAM",# "  HIAM",
       30,   36,     "HWAH",# "  HWAH",
       36,   42,     "LAIX",# "  LAIX",
       42,   48,     "PD1T",# "  PD1T",
       48,   54,     "PDFT",# "  PDFT",
       54,   60,     "R8AT",# "  R8AT",
       60,   66,     "CWAA",# "  CWAA",
       66,   72,     "DWAP",# "  DWAP",
       72,   78,     "GL%M",# "  GL%M",
       78,   84,     "CWAM",# "  CWAM",
       84,   90,     "GN%M",# "  GN%M",
       90,   96,     "H#UM",# "  H#UM",
       96,  102,     "HWUM",# "  HWUM",
      102,  108,     "MDAT",# "  MDAT",
      108,  114,     "H#AM" # "  H#AM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  DWAP  GL%M  CWAM  GN%M  H#UM  HWUM  MDAT  H#AM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  DWAP  GL%M  CWAM  GN%M  H#UM  HWUM  MDAT  H#AM")

# "@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  CWAM  DWAP  GL%M  GN%M  H#UM  HWUM  MDAT  H#AM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "CHTA",# "  CHTA",
       18,   24,     "HDAT",# "  HDAT",
       24,   30,     "HIAM",# "  HIAM",
       30,   36,     "HWAH",# "  HWAH",
       36,   42,     "LAIX",# "  LAIX",
       42,   48,     "PD1T",# "  PD1T",
       48,   54,     "PDFT",# "  PDFT",
       54,   60,     "R8AT",# "  R8AT",
       60,   66,     "CWAA",# "  CWAA",
       66,   72,     "CWAM",# "  CWAM",
       72,   78,     "DWAP",# "  DWAP",
       78,   84,     "GL%M",# "  GL%M",
       84,   90,     "GN%M",# "  GN%M",
       90,   96,     "H#UM",# "  H#UM",
       96,  102,     "HWUM",# "  HWUM",
      102,  108,     "MDAT",# "  MDAT",
      108,  114,     "H#AM" # "  H#AM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  CWAM  DWAP  GL%M  GN%M  H#UM  HWUM  MDAT  H#AM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  CHTA  HDAT  HIAM  HWAH  LAIX  PD1T  PDFT  R8AT  CWAA  CWAM  DWAP  GL%M  GN%M  H#UM  HWUM  MDAT  H#AM")

# "@TRNO  B1DAT B2DAT B3DAT B4DAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,    "B1DAT",#"  B1DAT",
       12,   18,    "B2DAT",# " B2DAT",
       18,   24,    "B3DAT",# " B3DAT",
       24,   30,    "B4DAT" # " B4DAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  B1DAT B2DAT B3DAT B4DAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  B1DAT B2DAT B3DAT B4DAT")

# "@TRNO   LAIX  LAIH  HWAH  TWAH  CWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "LAIX",#"   LAIX",
       12,   18,     "LAIH",# "  LAIH",
       18,   24,     "HWAH",# "  HWAH",
       24,   30,     "TWAH",# "  TWAH",
       30,   36,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   LAIX  LAIH  HWAH  TWAH  CWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   LAIX  LAIH  HWAH  TWAH  CWAM")

# "@TRNO  PDATE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,    "PDATE" #"  PDATE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  PDATE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  PDATE")

# "@TRNO   SWAH  LWAH  HWAH  CWAH  VWAH  CGRH  LAIX  H#AM  H#GM  LAWM  BR1D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "SWAH",#"   SWAH",
       12,   18,     "LWAH",# "  LWAH",
       18,   24,     "HWAH",# "  HWAH",
       24,   30,     "CWAH",# "  CWAH",
       30,   36,     "VWAH",# "  VWAH",
       36,   42,     "CGRH",# "  CGRH",
       42,   48,     "LAIX",# "  LAIX",
       48,   54,     "H#AM",# "  H#AM",
       54,   60,     "H#GM",# "  H#GM",
       60,   66,     "LAWM",# "  LAWM",
       66,   72,     "BR1D" # "  BR1D"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   SWAH  LWAH  HWAH  CWAH  VWAH  CGRH  LAIX  H#AM  H#GM  LAWM  BR1D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   SWAH  LWAH  HWAH  CWAH  VWAH  CGRH  LAIX  H#AM  H#GM  LAWM  BR1D")

# "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  SWAM  CWAM  HWAD  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "PDFT",# "  PDFT",
       18,   24,     "PD1T",# "  PD1T",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,    "B1DAT",# " B1DAT",
       36,   42,     "EDAT",# "  EDAT",
       42,   48,     "MDAT",# "  MDAT",
       48,   54,     "SWAM",# "  SWAM",
       54,   60,     "CWAM",# "  CWAM",
       60,   66,     "HWAD",# "  HWAD",
       66,   72,     "PWAM",# "  PWAM",
       72,   78,     "HIAM",# "  HIAM",
       78,   84,     "PIAM",# "  PIAM",
       84,   90,     "LN%D",# "  LN%D",
       90,   96,     "SN%D",# "  SN%D",
       96,  102,     "GN%D",# "  GN%D",
      102,  108,     "PN%D",# "  PN%D",
      108,  114,     "GWGD",# "  GWGD",
      114,  120,     "SH%D" # "  SH%D"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  SWAM  CWAM  HWAD  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  SWAM  CWAM  HWAD  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D  PN%D  GWGD  SH%D")

# "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D   PRO  PN%D  GWGD  THAM DAYLA   WDH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "PDFT",# "  PDFT",
       18,   24,     "PD1T",# "  PD1T",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,    "B1DAT",# " B1DAT",
       36,   42,     "EDAT",# "  EDAT",
       42,   48,     "MDAT",# "  MDAT",
       48,   54,     "L#SD",# "  L#SD",
       54,   60,     "LWAM",# "  LWAM",
       60,   66,     "SWAM",# "  SWAM",
       66,   72,     "CWAM",# "  CWAM",
       72,   78,     "HWAM",# "  HWAM",
       78,   84,     "PWAM",# "  PWAM",
       84,   90,     "HIAM",# "  HIAM",
       90,   96,     "PIAM",# "  PIAM",
       96,  102,     "LN%D",# "  LN%D",
      102,  108,     "SN%D",# "  SN%D",
      108,  114,     "GN%D",# "  GN%D",
      114,  120,      "PRO",# "   PRO",
      120,  126,     "PN%D",# "  PN%D",
      126,  132,     "GWGD",# "  GWGD",
      132,  138,     "THAM",# "  THAM",
      138,  144,    "DAYLA",# " DAYLA",
      144,  150,      "WDH" # "   WDH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D   PRO  PN%D  GWGD  THAM DAYLA   WDH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  LN%D  SN%D  GN%D   PRO  PN%D  GWGD  THAM DAYLA   WDH")

# "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  GWGD  THAM  GN%D   PRO"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "PDFT",# "  PDFT",
       18,   24,     "PD1T",# "  PD1T",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,    "B1DAT",# " B1DAT",
       36,   42,     "EDAT",# "  EDAT",
       42,   48,     "MDAT",# "  MDAT",
       48,   54,     "L#SD",# "  L#SD",
       54,   60,     "LWAM",# "  LWAM",
       60,   66,     "SWAM",# "  SWAM",
       66,   72,     "CWAM",# "  CWAM",
       72,   78,     "HWAM",# "  HWAM",
       78,   84,     "PWAM",# "  PWAM",
       84,   90,     "HIAM",# "  HIAM",
       90,   96,     "PIAM",# "  PIAM",
       96,  102,     "GWGD",# "  GWGD",
      102,  108,     "THAM",# "  THAM",
      108,  114,     "GN%D",# "  GN%D",
      114,  120,      "PRO" # "   PRO"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  GWGD  THAM  GN%D   PRO",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  PDFT  PD1T  ADAT B1DAT  EDAT  MDAT  L#SD  LWAM  SWAM  CWAM  HWAM  PWAM  HIAM  PIAM  GWGD  THAM  GN%D   PRO")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "PWAM",# "  PWAM",
       54,   60,     "PM%M",# "  PM%M",
       60,   66,     "ADAT",# "  ADAT",
       66,   72,     "R2AT",# "  R2AT",
       72,   78,     "PD1T",# "  PD1T",
       78,   84,     "R4AT",# "  R4AT",
       84,   90,     "PDFT",# "  PDFT",
       90,   96,     "R6AT",# "  R6AT",
       96,  102,     "MDAT",# "  MDAT",
      102,  108,     "R8AT" # "  R8AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  HIAM  L#SM  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "PWAM",# "  PWAM",
       54,   60,     "PM%M",# "  PM%M",
       60,   66,     "HIAM",# "  HIAM",
       66,   72,     "L#SM",# "  L#SM",
       72,   78,     "ADAT",# "  ADAT",
       78,   84,     "R2AT",# "  R2AT",
       84,   90,     "PD1T",# "  PD1T",
       90,   96,     "R4AT",# "  R4AT",
       96,  102,     "PDFT",# "  PDFT",
      102,  108,     "R6AT",# "  R6AT",
      108,  114,     "MDAT",# "  MDAT",
      114,  120,     "R8AT" # "  R8AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  HIAM  L#SM  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  PM%M  HIAM  L#SM  ADAT  R2AT  PD1T  R4AT  PDFT  R6AT  MDAT  R8AT")

# "@TRNO LIWAM  HWAM  P#AM  LAIX  CWAM  BWAM  PWAM  EDAT SQDAT  ADAT  HDAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "TRNO",# "@TRNO",
        5,   11,    "LIWAM",#" LIWAM",
       11,   17,     "HWAM",#"  HWAM",
       17,   23,     "P#AM",#"  P#AM",
       23,   29,     "LAIX",#"  LAIX",
       29,   35,     "CWAM",#"  CWAM",
       35,   41,     "BWAM",#"  BWAM",
       41,   47,     "PWAM",#"  PWAM",
       47,   53,     "EDAT",#"  EDAT",
       53,   59,    "SQDAT",#" SQDAT",
       59,   65,     "ADAT",#"  ADAT",
       65,   71,     "HDAT",#"  HDAT",
       71,   77,     "MDAT" #"  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO LIWAM  HWAM  P#AM  LAIX  CWAM  BWAM  PWAM  EDAT SQDAT  ADAT  HDAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO LIWAM  HWAM  P#AM  LAIX  CWAM  BWAM  PWAM  EDAT SQDAT  ADAT  HDAT  MDAT")

# "@TRNO   HDAT  HWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "HWAM" # "  HWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  HWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  HWAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  HIAM  THAM  ADAT  PD1T  PDFT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "PWAM",# "  PWAM",
       54,   60,     "HIAM",# "  HIAM",
       60,   66,     "THAM",# "  THAM",
       66,   72,     "ADAT",# "  ADAT",
       72,   78,     "PD1T",# "  PD1T",
       78,   84,     "PDFT",# "  PDFT",
       84,   90,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  HIAM  THAM  ADAT  PD1T  PDFT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  PWAM  HIAM  THAM  ADAT  PD1T  PDFT  MDAT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PWAM  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PWAM",# "  PWAM",
       66,   72,     "HIAM",# "  HIAM",
       72,   78,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PWAM  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PWAM  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PWAM  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PWAM",# "  PWAM",
       72,   78,     "HIAM",# "  HIAM",
       78,   84,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PWAM  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PWAM  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM CANHT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "CWAA",# "  CWAA",
       96,  102,     "CNAA",# "  CNAA",
      102,  108,     "L#SM",# "  L#SM",
      108,  114,     "R5AT",# "  R5AT",
      114,  120,     "GN%M",# "  GN%M",
      120,  126,     "GNAM",# "  GNAM",
      126,  132,     "CN%M",# "  CN%M",
      132,  138,     "CNAM",# "  CNAM",
      138,  144,    "CANHT" # " CANHT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM CANHT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM CANHT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "CWAA",# "  CWAA",
       96,  102,     "CNAA",# "  CNAA",
      102,  108,     "L#SM",# "  L#SM",
      108,  114,     "R5AT",# "  R5AT",
      114,  120,     "GN%M",# "  GN%M",
      120,  126,     "GNAM",# "  GNAM",
      126,  132,     "CN%M",# "  CN%M",
      132,  138,     "CNAM" # "  CNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT  GN%M  GNAM  CN%M  CNAM")

# "@TRNO   HDAP  ADAT  MDAT  CHTA  THAM  CWAM  PWAM  HWAM  HIPM  HIAM  LAIX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAP",#"   HDAP",
       12,   18,     "ADAT",# "  ADAT",
       18,   24,     "MDAT",# "  MDAT",
       24,   30,     "CHTA",# "  CHTA",
       30,   36,     "THAM",# "  THAM",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "PWAM",# "  PWAM",
       48,   54,     "HWAM",# "  HWAM",
       54,   60,     "HIPM",# "  HIPM",
       60,   66,     "HIAM",# "  HIAM",
       66,   72,     "LAIX" # "  LAIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAP  ADAT  MDAT  CHTA  THAM  CWAM  PWAM  HWAM  HIPM  HIAM  LAIX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAP  ADAT  MDAT  CHTA  THAM  CWAM  PWAM  HWAM  HIPM  HIAM  LAIX")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  L#SM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  L#SD  SNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "L#SM",# "  L#SM",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "GN%M",# "  GN%M",
       66,   72,     "CNAM",# "  CNAM",
       72,   78,     "L#SD",# "  L#SD",
       78,   84,     "SNAM" # "  SNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  L#SM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  L#SD  SNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  L#SM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  L#SD  SNAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "GN%M",# "  GN%M",
       66,   72,     "CNAM",# "  CNAM",
       72,   78,     "SNAM",# "  SNAM",
       78,   84,     "GNAM" # "  GNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM")

# "@TRNO   CHTA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "CHTA" #"   CHTA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   CHTA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   CHTA")

# "@TRNO   HWAH  CWAM  ADAT   -99   -99   -99   -99   -99   -99"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAH",#"   HWAH",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "ADAT" # "  ADAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAH  CWAM  ADAT   -99   -99   -99   -99   -99   -99",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAH  CWAM  ADAT   -99   -99   -99   -99   -99   -99")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAA  CNAA  CWAM  BWAH  HIAM  L#SM  GNAM  CNAM  SNAM  GN%M"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAA",# "  CWAA",
       42,   48,     "CNAA",# "  CNAA",
       48,   54,     "CWAM",# "  CWAM",
       54,   60,     "BWAH",# "  BWAH",
       60,   66,     "HIAM",# "  HIAM",
       66,   72,     "L#SM",# "  L#SM",
       72,   78,     "GNAM",# "  GNAM",
       78,   84,     "CNAM",# "  CNAM",
       84,   90,     "SNAM",# "  SNAM",
       90,   96,     "GN%M" # "  GN%M"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAA  CNAA  CWAM  BWAH  HIAM  L#SM  GNAM  CNAM  SNAM  GN%M",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAA  CNAA  CWAM  BWAH  HIAM  L#SM  GNAM  CNAM  SNAM  GN%M")

# "@TRNO   TNAM  HWAM  HWUM  H#UM  LAIX  CWAM  HIAM  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "TNAM",#"   TNAM",
       12,   18,     "HWAM",# "  HWAM",
       18,   24,     "HWUM",# "  HWUM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "HIAM",# "  HIAM",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   TNAM  HWAM  HWUM  H#UM  LAIX  CWAM  HIAM  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   TNAM  HWAM  HWUM  H#UM  LAIX  CWAM  HIAM  ADAT  MDAT")

# "@TRNO   PWAM  SWAM  HWAM  THAM  ADAT  R2AT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "PWAM",#"   PWAM",
       12,   18,     "SWAM",# "  SWAM",
       18,   24,     "HWAM",# "  HWAM",
       24,   30,     "THAM",# "  THAM",
       30,   36,     "ADAT",# "  ADAT",
       36,   42,     "R2AT",# "  R2AT",
       42,   48,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   PWAM  SWAM  HWAM  THAM  ADAT  R2AT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   PWAM  SWAM  HWAM  THAM  ADAT  R2AT  MDAT")

# "@TRNO   PWAM  HWAM CWAM  SHAD  THAM   ADAT  R2AT MMDAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "PWAM",#"   PWAM",
       12,   18,     "HWAM",# "  HWAM",
       18,   23,     "CWAM",#  " CWAM",
       23,   29,     "SHAD",# "  SHAD",
       29,   35,     "THAM",# "  THAM",
       35,   42,     "ADAT",#"   ADAT",
       42,   48,     "R2AT",# "  R2AT",
       48,   54,    "MMDAT",# " MMDAT",
       54,   60,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   PWAM  HWAM CWAM  SHAD  THAM   ADAT  R2AT MMDAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   PWAM  HWAM CWAM  SHAD  THAM   ADAT  R2AT MMDAT  MDAT")

# "@TRNO  PWAM   CWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   11,     "PWAM",# "  PWAM",
       11,   18,     "CWAM",#"   CWAM",
       18,   24,     "HWAM",# "  HWAM",
       24,   30,     "SHAD",# "  SHAD",
       30,   36,     "THAM",# "  THAM",
       36,   42,     "ADAT",# "  ADAT",
       42,   48,     "R2AT",# "  R2AT",
       48,   54,     "R3AT",# "  R3AT",
       54,   60,     "R4AT",# "  R4AT",
       60,   66,     "R5AT",# "  R5AT",
       66,   72,     "R6AT",# "  R6AT",
       72,   78,     "R7AT",# "  R7AT",
       78,   84,     "R8AT" # "  R8AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  PWAM   CWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  PWAM   CWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT")

# "@TRNO  CWAM  PWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    5,     "TRNO",# "@TRNO",
        5,   11,     "CWAM",#"  CWAM",
       11,   17,     "PWAM",#"  PWAM",
       17,   23,     "HWAM",#"  HWAM",
       23,   29,     "SHAD",#"  SHAD",
       29,   35,     "THAM",#"  THAM",
       35,   41,     "ADAT",#"  ADAT",
       41,   47,     "R2AT",#"  R2AT",
       47,   53,     "R3AT",#"  R3AT",
       53,   59,     "R4AT",#"  R4AT",
       59,   65,     "R5AT",#"  R5AT",
       65,   71,     "R6AT",#"  R6AT",
       71,   77,     "R7AT",#"  R7AT",
       77,   83,     "R8AT" #"  R8AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  CWAM  PWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  CWAM  PWAM  HWAM  SHAD  THAM  ADAT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "PM%M",# "  PM%M",
       84,   90,     "HIAM",# "  HIAM",
       90,   96,     "THAM",# "  THAM",
       96,  102,     "R1AT",# "  R1AT",
      102,  108,     "R2AT",# "  R2AT",
      108,  114,     "R3AT",# "  R3AT",
      114,  120,     "R4AT",# "  R4AT",
      120,  126,     "R5AT",# "  R5AT",
      126,  132,     "R6AT",# "  R6AT",
      132,  138,     "R7AT",# "  R7AT",
      138,  144,     "R8AT",# "  R8AT",
      144,  150,     "R9AT" # "  R9AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT")

# "@TRNO   PWAM  H#AM  H#UM  HWAM  CWAM  BWAH  HWUM  THAM  HIAM  ADAT  PD1T  PDFT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "PWAM",#"   PWAM",
       12,   18,     "H#AM",# "  H#AM",
       18,   24,     "H#UM",# "  H#UM",
       24,   30,     "HWAM",# "  HWAM",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "BWAH",# "  BWAH",
       42,   48,     "HWUM",# "  HWUM",
       48,   54,     "THAM",# "  THAM",
       54,   60,     "HIAM",# "  HIAM",
       60,   66,     "ADAT",# "  ADAT",
       66,   72,     "PD1T",# "  PD1T",
       72,   78,     "PDFT" # "  PDFT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   PWAM  H#AM  H#UM  HWAM  CWAM  BWAH  HWUM  THAM  HIAM  ADAT  PD1T  PDFT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   PWAM  H#AM  H#UM  HWAM  CWAM  BWAH  HWUM  THAM  HIAM  ADAT  PD1T  PDFT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "PM%M" # "  PM%M"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M")

# "@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  PWAM  HIAM  HIPM  THAM  CNAM  GNAM  GN%M"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "LAIX",# "  LAIX",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "PWAM",# "  PWAM",
       42,   48,     "HIAM",# "  HIAM",
       48,   54,     "HIPM",# "  HIPM",
       54,   60,     "THAM",# "  THAM",
       60,   66,     "CNAM",# "  CNAM",
       66,   72,     "GNAM",# "  GNAM",
       72,   78,     "GN%M" # "  GN%M"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  PWAM  HIAM  HIPM  THAM  CNAM  GNAM  GN%M",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  PWAM  HIAM  HIPM  THAM  CNAM  GNAM  GN%M")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "PM%M",# "  PM%M",
       84,   90,     "HIAM",# "  HIAM",
       90,   96,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "PM%M",# "  PM%M",
       84,   90,     "R1AT",# "  R1AT",
       90,   96,     "R2AT",# "  R2AT",
       96,  102,     "R3AT",# "  R3AT",
      102,  108,     "R4AT",# "  R4AT",
      108,  114,     "R5AT",# "  R5AT",
      114,  120,     "R6AT",# "  R6AT",
      120,  126,     "R7AT",# "  R7AT",
      126,  132,     "R8AT",# "  R8AT",
      132,  138,     "R9AT" # "  R9AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  PM%M  R1AT  R2AT  R3AT  R4AT  R5AT  R6AT  R7AT  R8AT  R9AT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  PWAM  ADAT  PD1T  PDFT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "PWAM",# "  PWAM",
       36,   42,     "ADAT",# "  ADAT",
       42,   48,     "PD1T",# "  PD1T",
       48,   54,     "PDFT",# "  PDFT",
       54,   60,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  PWAM  ADAT  PD1T  PDFT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  PWAM  ADAT  PD1T  PDFT  MDAT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  HIAM  THAM  ADAT  MDAT  PD1T  PDFT  PWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "HIAM",# "  HIAM",
       54,   60,     "THAM",# "  THAM",
       60,   66,     "ADAT",# "  ADAT",
       66,   72,     "MDAT",# "  MDAT",
       72,   78,     "PD1T",# "  PD1T",
       78,   84,     "PDFT",# "  PDFT",
       84,   90,     "PWAM" # "  PWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  HIAM  THAM  ADAT  MDAT  PD1T  PDFT  PWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  HIAM  THAM  ADAT  MDAT  PD1T  PDFT  PWAM")

# "@TRNO   EDAP  ADAP  PD1P  PDFP  MDAP  R8AP  HWAM  HWUM  H#UM  CWAM  HIAM  H#AM  P#AM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAP",#"   EDAP",
       12,   18,     "ADAP",# "  ADAP",
       18,   24,     "PD1P",# "  PD1P",
       24,   30,     "PDFP",# "  PDFP",
       30,   36,     "MDAP",# "  MDAP",
       36,   42,     "R8AP",# "  R8AP",
       42,   48,     "HWAM",# "  HWAM",
       48,   54,     "HWUM",# "  HWUM",
       54,   60,     "H#UM",# "  H#UM",
       60,   66,     "CWAM",# "  CWAM",
       66,   72,     "HIAM",# "  HIAM",
       72,   78,     "H#AM",# "  H#AM",
       78,   84,     "P#AM" # "  P#AM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAP  ADAP  PD1P  PDFP  MDAP  R8AP  HWAM  HWUM  H#UM  CWAM  HIAM  H#AM  P#AM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAP  ADAP  PD1P  PDFP  MDAP  R8AP  HWAM  HWUM  H#UM  CWAM  HIAM  H#AM  P#AM")

# "@TRNO   ADAP  PD1P  PDFP  MDAP  HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  EDAP  PWAM  HIAM  THAM  L#SM  R8AP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAP",#"   ADAP",
       12,   18,     "PD1P",# "  PD1P",
       18,   24,     "PDFP",# "  PDFP",
       24,   30,     "MDAP",# "  MDAP",
       30,   36,     "HWAM",# "  HWAM",
       36,   42,     "HWUM",# "  HWUM",
       42,   48,     "H#AM",# "  H#AM",
       48,   54,     "H#UM",# "  H#UM",
       54,   60,     "LAIX",# "  LAIX",
       60,   66,     "CWAM",# "  CWAM",
       66,   72,     "BWAH",# "  BWAH",
       72,   78,     "EDAP",# "  EDAP",
       78,   84,     "PWAM",# "  PWAM",
       84,   90,     "HIAM",# "  HIAM",
       90,   96,     "THAM",# "  THAM",
       96,  102,     "L#SM",# "  L#SM",
      102,  108,     "R8AP" # "  R8AP"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAP  PD1P  PDFP  MDAP  HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  EDAP  PWAM  HIAM  THAM  L#SM  R8AP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAP  PD1P  PDFP  MDAP  HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  EDAP  PWAM  HIAM  THAM  L#SM  R8AP")

# "@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT  LWAH  CWAM  SWAH  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "FWAH",#"   FWAH",
       12,   18,     "EWUM",# "  EWUM",
       18,   24,     "E#AM",# "  E#AM",
       24,   30,     "E#UM",# "  E#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,    "BADMF",# " BADMF",
       42,   48,    "BADMH",# " BADMH",
       48,   54,    "VWATM",# " VWATM",
       54,   60,     "FDAT",# "  FDAT",
       60,   66,     "HDAT",# "  HDAT",
       66,   72,     "MDAT",# "  MDAT",
       72,   78,     "LWAH",# "  LWAH",
       78,   84,     "CWAM",# "  CWAM",
       84,   90,     "SWAH",# "  SWAH",
       90,   96,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT  LWAH  CWAM  SWAH  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT  LWAH  CWAM  SWAH  L#SM")

# "@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "FWAH",#"   FWAH",
       12,   18,     "EWUM",# "  EWUM",
       18,   24,     "E#AM",# "  E#AM",
       24,   30,     "E#UM",# "  E#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,    "BADMF",# " BADMF",
       42,   48,    "BADMH",# " BADMH",
       48,   54,    "VWATM",# " VWATM",
       54,   60,     "FDAT",# "  FDAT",
       60,   66,     "HDAT",# "  HDAT",
       66,   72,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   FWAH  EWUM  E#AM  E#UM  LAIX BADMF BADMH VWATM  FDAT  HDAT  MDAT")

# "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  TWAH  BWAH  TDAT  HDAT  UN%H  TNAH  CNAM  UNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "TWAH",# "  TWAH",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "TDAT",# "  TDAT",
       54,   60,     "HDAT",# "  HDAT",
       60,   66,     "UN%H",# "  UN%H",
       66,   72,     "TNAH",# "  TNAH",
       72,   78,     "CNAM",# "  CNAM",
       78,   84,     "UNAM" # "  UNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  TWAH  BWAH  TDAT  HDAT  UN%H  TNAH  CNAM  UNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  TWAH  BWAH  TDAT  HDAT  UN%H  TNAH  CNAM  UNAM")

# "@TRNO   UWAH  UYAH HDATE PLDAE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,    "HDATE",# " HDATE",
       24,   30,    "PLDAE" # " PLDAE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH HDATE PLDAE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH HDATE PLDAE")

# "@TRNO   UNAM  UN%H  RNAH  TDAT  UWAH HDATE PLDAE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UNAM",#"   UNAM",
       12,   18,     "UN%H",# "  UN%H",
       18,   24,     "RNAH",# "  RNAH",
       24,   30,     "TDAT",# "  TDAT",
       30,   36,     "UWAH",# "  UWAH",
       36,   42,    "HDATE",# " HDATE",
       42,   48,    "PLDAE" # " PLDAE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UNAM  UN%H  RNAH  TDAT  UWAH HDATE PLDAE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UNAM  UN%H  RNAH  TDAT  UWAH HDATE PLDAE")

# "@TRNO   UWAH  H#UM  TDAT  HDAT  UYAH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "H#UM",# "  H#UM",
       18,   24,     "TDAT",# "  TDAT",
       24,   30,     "HDAT",# "  HDAT",
       30,   36,     "UYAH" # "  UYAH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  H#UM  TDAT  HDAT  UYAH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  H#UM  TDAT  HDAT  UYAH")

# "@TRNO   UWAH HDATE  LAIX PLDAE"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,    "HDATE",# " HDATE",
       18,   24,     "LAIX",# "  LAIX",
       24,   30,    "PLDAE" # " PLDAE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH HDATE  LAIX PLDAE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH HDATE  LAIX PLDAE")

# "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAH  SNAM  UNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "TDAT",# "  TDAT",
       48,   54,     "EDAT",# "  EDAT",
       54,   60,     "HDAT",# "  HDAT",
       60,   66,     "UN%H",# "  UN%H",
       66,   72,     "TNAH",# "  TNAH",
       72,   78,     "SNAM",# "  SNAM",
       78,   84,     "UNAM" # "  UNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAH  SNAM  UNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAH  SNAM  UNAM")

# "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  HDAT  EDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "TDAT",# "  TDAT",
       48,   54,     "HDAT",# "  HDAT",
       54,   60,     "EDAT" # "  EDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  HDAT  EDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  HDAT  EDAT")

# "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAM  SNAM  UNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "TDAT",# "  TDAT",
       48,   54,     "EDAT",# "  EDAT",
       54,   60,     "HDAT",# "  HDAT",
       60,   66,     "UN%H",# "  UN%H",
       66,   72,     "TNAM",# "  TNAM",
       72,   78,     "SNAM",# "  SNAM",
       78,   84,     "UNAM" # "  UNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAM  SNAM  UNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH  H#AM  H#UM  LAIX  CWAM  TDAT  EDAT  HDAT  UN%H  TNAM  SNAM  UNAM")

# "@TRNO   UWAH  UYAH  LAIX  CWAM  TDAT  EDAT  HDAT   -99   -99"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UWAH",#"   UWAH",
       12,   18,     "UYAH",# "  UYAH",
       18,   24,     "LAIX",# "  LAIX",
       24,   30,     "CWAM",# "  CWAM",
       30,   36,     "TDAT",# "  TDAT",
       36,   42,     "EDAT",# "  EDAT",
       42,   48,     "HDAT" # "  HDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UWAH  UYAH  LAIX  CWAM  TDAT  EDAT  HDAT   -99   -99",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UWAH  UYAH  LAIX  CWAM  TDAT  EDAT  HDAT   -99   -99")

# "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT  CHTA  CWAM  HIAM  HWAM  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "PD1T",# "  PD1T",
       18,   24,     "ADAT",# "  ADAT",
       24,   30,     "PDFT",# "  PDFT",
       30,   36,     "R8AT",# "  R8AT",
       36,   42,     "CHTA",# "  CHTA",
       42,   48,     "CWAM",# "  CWAM",
       48,   54,     "HIAM",# "  HIAM",
       54,   60,     "HWAM",# "  HWAM",
       60,   66,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT  CHTA  CWAM  HIAM  HWAM  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT  CHTA  CWAM  HIAM  HWAM  L#SM")

# "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "PD1T",# "  PD1T",
       18,   24,     "ADAT",# "  ADAT",
       24,   30,     "PDFT",# "  PDFT",
       30,   36,     "R8AT" # "  R8AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT ")

# "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT HWAM  CWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "PD1T",# "  PD1T",
       18,   24,     "ADAT",# "  ADAT",
       24,   30,     "PDFT",# "  PDFT",
       30,   36,     "R8AT",# "  R8AT",
       36,   41,     "HWAM",#  " HWAM",
       41,   47,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT HWAM  CWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  PD1T  ADAT  PDFT  R8AT HWAM  CWAM")

# "@TRNO   HWAM  CWAM  LAIX  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "LAIX",# "  LAIX",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  CWAM  LAIX  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  CWAM  LAIX  ADAT  MDAT")

# "@TRNO   HWAM  LAIX  CWAM  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "LAIX",# "  LAIX",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  LAIX  CWAM  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  LAIX  CWAM  ADAT  MDAT")

# "@TRNO   ADAT  PDFT  MDAT  CWAM  HWAM  HIAM  HIPM  EDAT  CHTA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "PDFT",# "  PDFT",
       18,   24,     "MDAT",# "  MDAT",
       24,   30,     "CWAM",# "  CWAM",
       30,   36,     "HWAM",# "  HWAM",
       36,   42,     "HIAM",# "  HIAM",
       42,   48,     "HIPM",# "  HIPM",
       48,   54,     "EDAT",# "  EDAT",
       54,   60,     "CHTA" # "  CHTA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  PDFT  MDAT  CWAM  HWAM  HIAM  HIPM  EDAT  CHTA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  PDFT  MDAT  CWAM  HWAM  HIAM  HIPM  EDAT  CHTA")

# "@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  P#AM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "PD1T",# "  PD1T",
       18,   24,     "PDFT",# "  PDFT",
       24,   30,     "MDAT",# "  MDAT",
       30,   36,     "PWAM",# "  PWAM",
       36,   42,     "HWAM",# "  HWAM",
       42,   48,     "CWAM",# "  CWAM",
       48,   54,     "HIAM",# "  HIAM",
       54,   60,     "P#AM",# "  P#AM",
       60,   66,     "HWUM",# "  HWUM",
       66,   72,     "VN%M",# "  VN%M",
       72,   78,     "GN%M",# "  GN%M",
       78,   84,     "THAM",# "  THAM",
       84,   90,     "CNAM",# "  CNAM",
       90,   96,     "HIPM",# "  HIPM",
       96,  102,     "GNAM" # "  GNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  P#AM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  P#AM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM")

# "@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "PD1T",# "  PD1T",
       18,   24,     "PDFT",# "  PDFT",
       24,   30,     "MDAT",# "  MDAT",
       30,   36,     "PWAM",# "  PWAM",
       36,   42,     "HWAM",# "  HWAM",
       42,   48,     "CWAM",# "  CWAM",
       48,   54,     "HIAM",# "  HIAM",
       54,   60,     "HWUM",# "  HWUM",
       60,   66,     "VN%M",# "  VN%M",
       66,   72,     "GN%M",# "  GN%M",
       72,   78,     "THAM",# "  THAM",
       78,   84,     "CNAM",# "  CNAM",
       84,   90,     "HIPM",# "  HIPM",
       90,   96,     "GNAM" # "  GNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  PD1T  PDFT  MDAT  PWAM  HWAM  CWAM  HIAM  HWUM  VN%M  GN%M  THAM  CNAM  HIPM  GNAM")

# "@TRNO   HWUM  MDAT  HWAM  ADAT  CWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWUM",#"   HWUM",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "HWAM",# "  HWAM",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWUM  MDAT  HWAM  ADAT  CWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWUM  MDAT  HWAM  ADAT  CWAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  L#SM")

# "@TRNO   LAIX  CHTA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "LAIX",#"   LAIX",
       12,   18,     "CHTA" # "  CHTA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   LAIX  CHTA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   LAIX  CHTA")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  GN%M  GL%M  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "GN%M",# "  GN%M",
       96,  102,     "GL%M",# "  GL%M",
      102,  108,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  GN%M  GL%M  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  GN%M  GL%M  L#SM")

# "@TRNO   HDAT  MDAT  PDFT  PD1T  HWAM  CWAM  ADAT  PWAM  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "PDFT",# "  PDFT",
       24,   30,     "PD1T",# "  PD1T",
       30,   36,     "HWAM",# "  HWAM",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "PWAM",# "  PWAM",
       54,   60,     "HIAM",# "  HIAM",
       60,   66,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  MDAT  PDFT  PD1T  HWAM  CWAM  ADAT  PWAM  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  MDAT  PDFT  PD1T  HWAM  CWAM  ADAT  PWAM  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "CWAA",# "  CWAA",
       96,  102,     "CNAA",# "  CNAA",
      102,  108,     "L#SM",# "  L#SM",
      108,  114,     "R5AT" # "  R5AT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM  R5AT")

# "@TRNO   HWAM  ADAT  MDAT  PD1T  PDFT  GN%M  GNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "ADAT",# "  ADAT",
       18,   24,     "MDAT",# "  MDAT",
       24,   30,     "PD1T",# "  PD1T",
       30,   36,     "PDFT",# "  PDFT",
       36,   42,     "GN%M",# "  GN%M",
       42,   48,     "GNAM" # "  GNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  ADAT  MDAT  PD1T  PDFT  GN%M  GNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  ADAT  MDAT  PD1T  PDFT  GN%M  GNAM")

# "@TRNO   HWAM  CWAM  ADAT  MDAT  LAIX  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "ADAT",# "  ADAT",
       24,   30,     "MDAT",# "  MDAT",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  CWAM  ADAT  MDAT  LAIX  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  CWAM  ADAT  MDAT  LAIX  HIAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM",# "  PWAM",
       78,   84,     "HIAM",# "  HIAM",
       84,   90,     "THAM",# "  THAM",
       90,   96,     "CWAA",# "  CWAA",
       96,  102,     "CNAA",# "  CNAA",
      102,  108,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM  HIAM  THAM  CWAA  CNAA  L#SM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "PD1T",# "  PD1T",
       66,   72,     "PDFT",# "  PDFT",
       72,   78,     "PWAM" # "  PWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  PD1T  PDFT  PWAM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  HIAM  THAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "HIAM",# "  HIAM",
       66,   72,     "THAM" # "  THAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  HIAM  THAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  BWAH  ADAT  MDAT  HIAM  THAM")

# "@TRNO   HWAM  HWUM  H#AM  PWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "PWAM" # "  PWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  PWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  PWAM")

# "@TRNO   HWAH  BWAH  LAID  SWAD  CHTD  L#SD  HIAM  CWAD  LI%D  LT#D  CWAM  SDAH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAH",#"   HWAH",
       12,   18,     "BWAH",# "  BWAH",
       18,   24,     "LAID",# "  LAID",
       24,   30,     "SWAD",# "  SWAD",
       30,   36,     "CHTD",# "  CHTD",
       36,   42,     "L#SD",# "  L#SD",
       42,   48,     "HIAM",# "  HIAM",
       48,   54,     "CWAD",# "  CWAD",
       54,   60,     "LI%D",# "  LI%D",
       60,   66,     "LT#D",# "  LT#D",
       66,   72,     "CWAM",# "  CWAM",
       72,   78,     "SDAH" # "  SDAH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAH  BWAH  LAID  SWAD  CHTD  L#SD  HIAM  CWAD  LI%D  LT#D  CWAM  SDAH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAH  BWAH  LAID  SWAD  CHTD  L#SD  HIAM  CWAD  LI%D  LT#D  CWAM  SDAH")

# "@TRNO  CULTI  T#SD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,    "CULTI",#"  CULTI",
       12,   18,     "T#SD" # "  T#SD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  CULTI  T#SD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  CULTI  T#SD")

# "@TRNO  SMFMH  SUCH  STKH SSTKH BADMH  TRSH  LAIX LAIXD  LAIH LAASH LWASH  L#SM NAPSH SPDAT EDAT0 EDAT1 EDAT2  T#MX T#MXD TDECD  S#AH  SHTH  CHTA  HIAM  SDAH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,    "SMFMH",#"  SMFMH",
       12,   18,     "SUCH",# "  SUCH",
       18,   24,     "STKH",# "  STKH",
       24,   30,    "SSTKH",# " SSTKH",
       30,   36,    "BADMH",# " BADMH",
       36,   42,     "TRSH",# "  TRSH",
       42,   48,     "LAIX",# "  LAIX",
       48,   54,    "LAIXD",# " LAIXD",
       54,   60,     "LAIH",# "  LAIH",
       60,   66,    "LAASH",# " LAASH",
       66,   72,    "LWASH",# " LWASH",
       72,   78,     "L#SM",# "  L#SM",
       78,   84,    "NAPSH",# " NAPSH",
       84,   90,    "SPDAT",# " SPDAT",
       90,   96,    "EDAT0",# " EDAT0",
       96,  102,    "EDAT1",# " EDAT1",
      102,  108,    "EDAT2",# " EDAT2",
      108,  114,     "T#MX",# "  T#MX",
      114,  120,    "T#MXD",# " T#MXD",
      120,  126,    "TDECD",# " TDECD",
      126,  132,     "S#AH",# "  S#AH",
      132,  138,     "SHTH",# "  SHTH",
      138,  144,     "CHTA",# "  CHTA",
      144,  150,     "HIAM",# "  HIAM",
      150,  156,     "SDAH" # "  SDAH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO  SMFMH  SUCH  STKH SSTKH BADMH  TRSH  LAIX LAIXD  LAIH LAASH LWASH  L#SM NAPSH SPDAT EDAT0 EDAT1 EDAT2  T#MX T#MXD TDECD  S#AH  SHTH  CHTA  HIAM  SDAH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO  SMFMH  SUCH  STKH SSTKH BADMH  TRSH  LAIX LAIXD  LAIH LAASH LWASH  L#SM NAPSH SPDAT EDAT0 EDAT1 EDAT2  T#MX T#MXD TDECD  S#AH  SHTH  CHTA  HIAM  SDAH")

# "@TRNO   EDAT  CWAM  HIAM  HSAM  ADAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "HIAM",# "  HIAM",
       24,   30,     "HSAM",# "  HSAM",
       30,   36,     "ADAT" # "  ADAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  CWAM  HIAM  HSAM  ADAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  CWAM  HIAM  HSAM  ADAT")

# "@TRNO   ADAT  GL%M  HSAM  EDAT  LAIX  CWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "GL%M",# "  GL%M",
       18,   24,     "HSAM",# "  HSAM",
       24,   30,     "EDAT",# "  EDAT",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  GL%M  HSAM  EDAT  LAIX  CWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  GL%M  HSAM  EDAT  LAIX  CWAM")

# "@TRNO   ADAT  HWAM  TWAH  LAIX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "HWAM",# "  HWAM",
       18,   24,     "TWAH",# "  TWAH",
       24,   30,     "LAIX" # "  LAIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  HWAM  TWAH  LAIX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  HWAM  TWAH  LAIX")

# "@TRNO   ADAT  MDAT  HWUM  HWAM  CWAM  HIAM  GL%M  LAIX  H#AM  H#UM  L#SM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "HWUM",# "  HWUM",
       24,   30,     "HWAM",# "  HWAM",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "HIAM",# "  HIAM",
       42,   48,     "GL%M",# "  GL%M",
       48,   54,     "LAIX",# "  LAIX",
       54,   60,     "H#AM",# "  H#AM",
       60,   66,     "H#UM",# "  H#UM",
       66,   72,     "L#SM" # "  L#SM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  MDAT  HWUM  HWAM  CWAM  HIAM  GL%M  LAIX  H#AM  H#UM  L#SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  MDAT  HWUM  HWAM  CWAM  HIAM  GL%M  LAIX  H#AM  H#UM  L#SM")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT  GL%M  PDFT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT",# "  MDAT",
       54,   60,     "GL%M",# "  GL%M",
       60,   66,     "PDFT" # "  PDFT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT  GL%M  PDFT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  LAIX  CWAM  ADAT  MDAT  GL%M  PDFT")

# "@TRNO   HSAM  CWAM "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HSAM",#"   HSAM",
       12,   18,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HSAM  CWAM ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HSAM  CWAM ")

# "@TRNO   HWAM  LAIX  CWAM  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "LAIX",# "  LAIX",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  LAIX  CWAM  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  LAIX  CWAM  MDAT")

# "@TRNO   HWAM  LAIX  CWAA  ADAT  CWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "LAIX",# "  LAIX",
       18,   24,     "CWAA",# "  CWAA",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,     "CWAM" # "  CWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  LAIX  CWAA  ADAT  CWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  LAIX  CWAA  ADAT  CWAM")

# "@TRNO   UYAH  HWUM  H#AM  LAIX  TWAH  BWAH  ADAT  MDAT  UN%H  TNAH  CNAM  UNAM  UWAH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "UYAH",#"   UYAH",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "LAIX",# "  LAIX",
       30,   36,     "TWAH",# "  TWAH",
       36,   42,     "BWAH",# "  BWAH",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT",# "  MDAT",
       54,   60,     "UN%H",# "  UN%H",
       60,   66,     "TNAH",# "  TNAH",
       66,   72,     "CNAM",# "  CNAM",
       72,   78,     "UNAM",# "  UNAM",
       78,   84,     "UWAH" # "  UWAH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   UYAH  HWUM  H#AM  LAIX  TWAH  BWAH  ADAT  MDAT  UN%H  TNAH  CNAM  UNAM  UWAH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   UYAH  HWUM  H#AM  LAIX  TWAH  BWAH  ADAT  MDAT  UN%H  TNAH  CNAM  UNAM  UWAH")

# "@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  BWAH  ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "LAIX",# "  LAIX",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "BWAH",# "  BWAH",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  BWAH  ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  LAIX  CWAM  BWAH  ADAT  MDAT")

# "@TRNO   ADAT  CWAM  HWAM  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "HWAM",# "  HWAM",
       24,   30,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  CWAM  HWAM  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  CWAM  HWAM  HIAM")

# "@TRNO   ADAT  CWAM  HWAM  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "HWAM",# "  HWAM",
       24,   30,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  CWAM  HWAM  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  CWAM  HWAM  HIAM")

# "@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "HWAM",# "  HWAM",
       30,   36,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM")

# "@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "HWAM",# "  HWAM",
       30,   36,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  MDAT  CWAM  HWAM  HIAM")

# "@TRNO   EDAT  ADAT  MDAT  CWAM  HWAM  HIAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "EDAT",#"   EDAT",
       12,   18,     "ADAT",# "  ADAT",
       18,   24,     "MDAT",# "  MDAT",
       24,   30,     "CWAM",# "  CWAM",
       30,   36,     "HWAM",# "  HWAM",
       36,   42,     "HIAM" # "  HIAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   EDAT  ADAT  MDAT  CWAM  HWAM  HIAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   EDAT  ADAT  MDAT  CWAM  HWAM  HIAM")

# "@TRNO   ADAT  MDAT  HWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "MDAT",# "  MDAT",
       18,   24,     "HWAM" # "  HWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  MDAT  HWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  MDAT  HWAM")

# "@TRNO   PDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "PDAT",#"   PDAT",
       12,   18,     "HDAT",# "  HDAT",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "LWAM",# "  LWAM",
       30,   36,     "SWAM",# "  SWAM",
       36,   42,     "PWAM",# "  PWAM",
       42,   48,     "CNAM",# "  CNAM",
       48,   54,     "LAIX" # "  LAIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   PDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   PDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX")

# "@TRNO   PWAM  CWAM  LAIX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "PWAM",#"   PWAM",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "LAIX" # "  LAIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   PWAM  CWAM  LAIX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   PWAM  CWAM  LAIX")

# "@TRNO   HDAT  CWAM  FWAH  LAIX  PWAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "CWAM",# "  CWAM",
       18,   24,     "FWAH",# "  FWAH",
       24,   30,     "LAIX",# "  LAIX",
       30,   36,     "PWAM" # "  PWAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  CWAM  FWAH  LAIX  PWAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  CWAM  FWAH  LAIX  PWAM")

# "@TRNO   HDAT  LAIX  CWAM  PWAM  FWAH"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HDAT",#"   HDAT",
       12,   18,     "LAIX",# "  LAIX",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "PWAM",# "  PWAM",
       30,   36,     "FWAH" # "  FWAH"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HDAT  LAIX  CWAM  PWAM  FWAH",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HDAT  LAIX  CWAM  PWAM  FWAH")

# "@TRNO   XDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "XDAT",#"   XDAT",
       12,   18,     "HDAT",# "  HDAT",
       18,   24,     "CWAM",# "  CWAM",
       24,   30,     "LWAM",# "  LWAM",
       30,   36,     "SWAM",# "  SWAM",
       36,   42,     "PWAM",# "  PWAM",
       42,   48,     "CNAM",# "  CNAM",
       48,   54,     "LAIX" # "  LAIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   XDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   XDAT  HDAT  CWAM  LWAM  SWAM  PWAM  CNAM  LAIX")

# "@TRNO   ADAT  MDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "ADAT",#"   ADAT",
       12,   18,     "MDAT" # "  MDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   ADAT  MDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   ADAT  MDAT")

# "@TRNO   HWUM  THAM  H#UM  ADAT  MDAT  PD1T  R8AT  HDAT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWUM",#"   HWUM",
       12,   18,     "THAM",# "  THAM",
       18,   24,     "H#UM",# "  H#UM",
       24,   30,     "ADAT",# "  ADAT",
       30,   36,     "MDAT",# "  MDAT",
       36,   42,     "PD1T",# "  PD1T",
       42,   48,     "R8AT",# "  R8AT",
       48,   54,     "HDAT" # "  HDAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWUM  THAM  H#UM  ADAT  MDAT  PD1T  R8AT  HDAT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWUM  THAM  H#UM  ADAT  MDAT  PD1T  R8AT  HDAT")

# "@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "H#UM",# "  H#UM",
       30,   36,     "CWAM",# "  CWAM",
       36,   42,     "BWAH",# "  BWAH",
       42,   48,     "ADAT",# "  ADAT",
       48,   54,     "MDAT",# "  MDAT",
       54,   60,     "GN%M",# "  GN%M",
       60,   66,     "CNAM",# "  CNAM",
       66,   72,     "SNAM",# "  SNAM",
       72,   78,     "GNAM" # "  GNAM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  H#UM  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM")

# "@TRNO   HWAM  HWUM  H#AM  LAI?  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM  T#AM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    5,     "TRNO",#  "@TRNO",
        5,   12,     "HWAM",#"   HWAM",
       12,   18,     "HWUM",# "  HWUM",
       18,   24,     "H#AM",# "  H#AM",
       24,   30,     "LAI?",# "  LAI?",
       30,   36,     "LAIX",# "  LAIX",
       36,   42,     "CWAM",# "  CWAM",
       42,   48,     "BWAH",# "  BWAH",
       48,   54,     "ADAT",# "  ADAT",
       54,   60,     "MDAT",# "  MDAT",
       60,   66,     "GN%M",# "  GN%M",
       66,   72,     "CNAM",# "  CNAM",
       72,   78,     "SNAM",# "  SNAM",
       78,   84,     "GNAM",# "  GNAM",
       84,   90,     "T#AM" # "  T#AM"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRNO   HWAM  HWUM  H#AM  LAI?  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM  T#AM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRNO   HWAM  HWUM  H#AM  LAI?  LAIX  CWAM  BWAH  ADAT  MDAT  GN%M  CNAM  SNAM  GNAM  T#AM")


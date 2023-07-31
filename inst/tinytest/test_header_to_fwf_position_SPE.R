# "@PGERM PEMRG    P0    P6  ! Germination,emrgence/cm,juvenile,post-maturity"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PGERM",#"@PGERM",
        6,   12,    "PEMRG",#" PEMRG",
       12,   18,       "P0",#"    P0",
       18,   24,       "P6" #"    P6"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PGERM PEMRG    P0    P6  ! Germination,emrgence/cm,juvenile,post-maturity",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PGERM PEMRG    P0    P6  ! Germination,emrgence/cm,juvenile,post-maturity")

# "@PPFPE PPTHR PPEND  ! Photoperiod factor pre-emerge,threshold,end sensitivity"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PPFPE",#"@PPFPE",
        6,   12,    "PPTHR",#" PPTHR",
       12,   18,    "PPEND" #" PPEND"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PPFPE PPTHR PPEND  ! Photoperiod factor pre-emerge,threshold,end sensitivity",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PPFPE PPTHR PPEND  ! Photoperiod factor pre-emerge,threshold,end sensitivity")

# "@RLIG%  RLWR  RSEN RRESP RLDGR !Lignin%,length/wt,senescence,resp."

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RLIG%",#"@RLIG%",
        6,   12,     "RLWR",#"  RLWR",
       12,   18,     "RSEN",#"  RSEN",
       18,   24,    "RRESP",#" RRESP",
       24,   30,    "RLDGR" #" RLDGR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RLIG%  RLWR  RSEN RRESP RLDGR !Lignin%,length/wt,senescence,resp.",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RLIG%  RLWR  RSEN RRESP RLDGR !Lignin%,length/wt,senescence,resp.")

# "@LLIG%  LAXS LSHFR LSHAW  PHL1  PHF1 SLAMN SLACF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIG%",#"@LLIG%",
        6,   12,     "LAXS",#"  LAXS",
       12,   18,    "LSHFR",#" LSHFR",
       18,   24,    "LSHAW",#" LSHAW",
       24,   30,     "PHL1",#"  PHL1",
       30,   36,     "PHF1",#"  PHF1",
       36,   42,    "SLAMN",#" SLAMN",
       42,   48,    "SLACF" #" SLACF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIG%  LAXS LSHFR LSHAW  PHL1  PHF1 SLAMN SLACF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIG%  LAXS LSHFR LSHAW  PHL1  PHF1 SLAMN SLACF")

# "@LLIFE LWLOS LRPHS                  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIFE",#"@LLIFE",
        6,   12,    "LWLOS",#" LWLOS",
       12,   18,    "LRPHS" #" LRPHS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIFE LWLOS LRPHS                  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIFE LWLOS LRPHS                  ")

# "@ LASF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "LASF" #"@ LASF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LASF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LASF")

# "@ CHT%  CLA%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CHT%",#"@ CHT%",
        6,   12,     "CLA%" #"  CLA%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CHT%  CLA%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CHT%  CLA%")

# "@ TPAR TSRAD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TPAR",#"@ TPAR",
        6,   12,    "TSRAD" #" TSRAD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TPAR TSRAD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TPAR TSRAD")

# "@TGR02   "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "TGR02" #"@TGR02"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TGR02   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TGR02   ")

# "@ RS%X ! Max concentration"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "RS%X" #"@ RS%X"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RS%X ! Max concentration",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RS%X ! Max concentration")

# "@SLIG%  SAWS SGPHE SSPHS SSEN%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLIG%",#"@SLIG%",
        6,   12,     "SAWS",#"  SAWS",
       12,   18,    "SGPHE",#" SGPHE",
       18,   24,    "SSPHS",#" SSPHS",
       24,   30,    "SSEN%" #" SSEN%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLIG%  SAWS SGPHE SSPHS SSEN%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLIG%  SAWS SGPHE SSPHS SSEN%")

# "@ CHFR CHSTG"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CHFR",#"@ CHFR",
        6,   12,    "CHSTG" #" CHSTG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CHFR CHSTG",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CHFR CHSTG")

# "@GLIG%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "GLIG%" #"@GLIG%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@GLIG%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@GLIG%")

# "@ SDWT SDAFR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDWT",#"@ SDWT",
        6,   12,    "SDAFR" #" SDAFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDWT SDAFR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDWT SDAFR")

# "@CO2RF  CO2F"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "CO2RF",#"@CO2RF",
        6,   12,     "CO2F" #"  CO2F"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@CO2RF  CO2F",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@CO2RF  CO2F")

# "@PTFMX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PTFMX" #"@PTFMX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PTFMX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PTFMX")

# "@ PTFS  PTFA  STFR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "PTFS",#"@ PTFS",
        6,   12,     "PTFA",#"  PTFA",
       12,   18,     "STFR" #"  STFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PTFS  PTFA  STFR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PTFS  PTFA  STFR")

# "@ TKUH  HDUR  TKLF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TKUH",#"@ TKUH",
        6,   12,     "HDUR",#"  HDUR",
       12,   18,     "TKLF" #"  TKLF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TKUH  HDUR  TKLF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TKUH  HDUR  TKLF")

# "@TRGEM TRDV1 TRDV2 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "TRGEM",#"@TRGEM",
        6,   12,    "TRDV1",#" TRDV1",
       12,   18,    "TRDV2",#" TRDV2",
       18,   24,    "TRLFG",#" TRLFG",
       24,   30,    "TRPHS",#" TRPHS",
       30,   36,    "TRVRN",#" TRVRN",
       36,   42,    "TRHAR",#" TRHAR",
       42,   48,    "TRGFW",#" TRGFW",
       48,   54,    "TRGFN" #" TRGFN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TRGEM TRDV1 TRDV2 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TRGEM TRDV1 TRDV2 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN    ")

# "@EORATIO"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    8,  "EORATIO" #"@EORATIO"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@EORATIO",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@EORATIO")

# "@RWUPM RWUMX"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RWUPM",#"@RWUPM",
        6,   12,    "RWUMX" #" RWUMX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RWUPM RWUMX",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RWUPM RWUMX")

# "@ WFPU WFPGF  WFGU  WFTU  WFTL  WFSU"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "WFPU",#"@ WFPU",
        6,   12,    "WFPGF",#" WFPGF",
       12,   18,     "WFGU",#"  WFGU",
       18,   24,     "WFTU",#"  WFTU",
       24,   30,     "WFTL",#"  WFTL",
       30,   36,     "WFSU" #"  WFSU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ WFPU WFPGF  WFGU  WFTU  WFTL  WFSU",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ WFPU WFPGF  WFGU  WFTU  WFTL  WFSU")

# "@WFGEU WFRGU"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "WFGEU",#"@WFGEU",
        6,   12,    "WFRGU" #" WFRGU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@WFGEU WFRGU",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@WFGEU WFRGU")

# "@LLOSW ! Fr/d"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLOSW" #"@LLOSW"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLOSW ! Fr/d",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLOSW ! Fr/d")

# "@NH4MN NO3MN RTNO3 RTNH4"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NH4MN",#"@NH4MN",
        6,   12,    "NO3MN",#" NO3MN",
       12,   18,    "RTNO3",#" RTNO3",
       18,   24,    "RTNH4" #" RTNH4"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NH4MN NO3MN RTNO3 RTNH4",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NH4MN NO3MN RTNO3 RTNH4")

# "@ NTUPF  ! Fraction of deficit that can be filled per day"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,    "NTUPF" #"@ NTUPF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NTUPF  ! Fraction of deficit that can be filled per day",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NTUPF  ! Fraction of deficit that can be filled per day")

# "@GN%MX  SDN% "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "GN%MX",#"@GN%MX",
        6,   12,     "SDN%" #"  SDN%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@GN%MX  SDN% ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@GN%MX  SDN% ")

# "@ LN%S  SN%S  RN%S LN%MN SN%MN RN%MN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "LN%S",#"@ LN%S",
        6,   12,     "SN%S",#"  SN%S",
       12,   18,     "RN%S",#"  RN%S",
       18,   24,    "LN%MN",#" LN%MN",
       24,   30,    "SN%MN",#" SN%MN",
       30,   36,    "RN%MN" #" RN%MN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LN%S  SN%S  RN%S LN%MN SN%MN RN%MN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LN%S  SN%S  RN%S LN%MN SN%MN RN%MN")

# "@NLAB%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NLAB%" #"@NLAB%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NLAB%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NLAB%")

# "@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,tillering,senecence"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NFPU",#"@ NFPU",
        6,   12,     "NFPL",#"  NFPL",
       12,   18,     "NFGU",#"  NFGU",
       18,   24,     "NFGL",#"  NFGL",
       24,   30,     "NFTU",#"  NFTU",
       30,   36,     "NFTL",#"  NFTL",
       36,   42,     "NFSU",#"  NFSU",
       42,   48,     "NFSF" #"  NFSF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,tillering,senecence",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,tillering,senecence")

# "@ NCRG"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NCRG" #"@ NCRG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NCRG",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NCRG")

# "@LLOSN ! Fr/d"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLOSN" #"@LLOSN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLOSN ! Fr/d",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLOSN ! Fr/d")

# "@ PSNO PSTYP PSABV PSNAME"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "PSNO",# "@ PSNO",
        6,   12,    "PSTYP",# " PSTYP",
       12,   18,    "PSABV",# " PSABV",
       18,   25,   "PSNAME" #" PSNAME"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PSNO PSTYP PSABV PSNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PSNO PSTYP PSABV PSNAME")

# "@ SSNO SSTYP  SSTG SSABV SSNAME"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,     "SSNO",# "@ SSNO",
        6,   12,    "SSTYP",# " SSTYP",
       12,   18,     "SSTG",# "  SSTG",
       18,   24,    "SSABV",# " SSABV",
       24,   31,   "SSNAME" #" SSNAME"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SSNO SSTYP  SSTG SSABV SSNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SSNO SSTYP  SSTG SSABV SSNAME")

# "@PGERM PEMRG    P0    P9 "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PGERM",#"@PGERM",
        6,   12,    "PEMRG",#" PEMRG",
       12,   18,       "P0",#"    P0",
       18,   24,       "P9" #"    P9"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PGERM PEMRG    P0    P9 ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PGERM PEMRG    P0    P9 ")

# "@PPFPE PPTHR PPSEN PPEXP VPEND VEEND VLOSS VLOST VLOSF ! Photoperiod,vern"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PPFPE",#"@PPFPE",
        6,   12,    "PPTHR",#" PPTHR",
       12,   18,    "PPSEN",#" PPSEN",
       18,   24,    "PPEXP",#" PPEXP",
       24,   30,    "VPEND",#" VPEND",
       30,   36,    "VEEND",#" VEEND",
       36,   42,    "VLOSS",#" VLOSS",
       42,   48,    "VLOST",#" VLOST",
       48,   54,    "VLOSF" #" VLOSF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PPFPE PPTHR PPSEN PPEXP VPEND VEEND VLOSS VLOST VLOSF ! Photoperiod,vern",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PPFPE PPTHR PPSEN PPEXP VPEND VEEND VLOSS VLOST VLOSF ! Photoperiod,vern")

# "@RLIG%  RLWR  RSEN RRESP RDGAF ! Lignin%,length/wt;sen,resp;depth gr adj fac"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RLIG%",#"@RLIG%",
        6,   12,     "RLWR",#"  RLWR",
       12,   18,     "RSEN",#"  RSEN",
       18,   24,    "RRESP",#" RRESP",
       24,   30,    "RDGAF" #" RDGAF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RLIG%  RLWR  RSEN RRESP RDGAF ! Lignin%,length/wt;sen,resp;depth gr adj fac",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RLIG%  RLWR  RSEN RRESP RDGAF ! Lignin%,length/wt;sen,resp;depth gr adj fac")

# "@RTUFR ! Fraction useable to re-establish tops after winter-kill, etc.."

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RTUFR" #"@RTUFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RTUFR ! Fraction useable to re-establish tops after winter-kill, etc..",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RTUFR ! Fraction useable to re-establish tops after winter-kill, etc..")

# "@LLIG%  LAXS SLACF SLAFF LSHFR LSHAV LSHAR  PHL1  PHF1"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIG%",#"@LLIG%",
        6,   12,     "LAXS",#"  LAXS",
       12,   18,    "SLACF",#" SLACF",
       18,   24,    "SLAFF",#" SLAFF",
       24,   30,    "LSHFR",#" LSHFR",
       30,   36,    "LSHAV",#" LSHAV",
       36,   42,    "LSHAR",#" LSHAR",
       42,   48,     "PHL1",#"  PHL1",
       48,   54,     "PHF1" #"  PHF1"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIG%  LAXS SLACF SLAFF LSHFR LSHAV LSHAR  PHL1  PHF1",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIG%  LAXS SLACF SLAFF LSHFR LSHAV LSHAR  PHL1  PHF1")

# "@LLIFA LLIFG LLIFS LWLOS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIFA",#"@LLIFA",
        6,   12,    "LLIFG",#" LLIFG",
       12,   18,    "LLIFS",#" LLIFS",
       18,   24,    "LWLOS" #" LWLOS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIFA LLIFG LLIFS LWLOS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIFA LLIFG LLIFS LWLOS")

# "@LAIXX ! LAI maximum    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LAIXX" #"@LAIXX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LAIXX ! LAI maximum    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LAIXX ! LAI maximum    ")

# "@ CHT%  CLA% ! Height%, cumulative leaf area %"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CHT%",#"@ CHT%",
        6,   12,     "CLA%" #"  CLA%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CHT%  CLA% ! Height%, cumulative leaf area %",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CHT%  CLA% ! Height%, cumulative leaf area %")

# "@ TPAR TSRAD ! Leaf transmission PAR,solar                                     "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TPAR",#"@ TPAR",
        6,   12,    "TSRAD" #" TSRAD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TPAR TSRAD ! Leaf transmission PAR,solar                                     ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TPAR TSRAD ! Leaf transmission PAR,solar                                     ")

# "@TGR02 TGR20 TILIP TIL#X ! Size,phase,maximum"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "TGR02",#"@TGR02",
        6,   12,    "TGR20",#" TGR20",
       12,   18,    "TILIP",#" TILIP",
       18,   24,    "TIL#X" #" TIL#X"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@TGR02 TGR20 TILIP TIL#X ! Size,phase,maximum",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@TGR02 TGR20 TILIP TIL#X ! Size,phase,maximum")

# "@ RS%X RS%LX RSUSE ! Max concentrations,fraction utilizeable/day"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "RS%X",#"@ RS%X",
        6,   12,    "RS%LX",#" RS%LX",
       12,   18,    "RSUSE" #" RSUSE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RS%X RS%LX RSUSE ! Max concentrations,fraction utilizeable/day",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RS%X RS%LX RSUSE ! Max concentrations,fraction utilizeable/day")

# "@SLIG%  SAWS ! Lignin,area/weight"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLIG%",#"@SLIG%",
        6,   12,     "SAWS" #"  SAWS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLIG%  SAWS ! Lignin,area/weight",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLIG%  SAWS ! Lignin,area/weight")

# "@ CHFR ! Fraction of stem growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CHFR" #"@ CHFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CHFR ! Fraction of stem growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CHFR ! Fraction of stem growth")

# "@GLIG% GWLAG GWLIN ! Lignin;wt.endlag,endlinear"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "GLIG%",#"@GLIG%",
        6,   12,    "GWLAG",#" GWLAG",
       12,   18,    "GWLIN" #" GWLIN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@GLIG% GWLAG GWLIN ! Lignin;wt.endlag,endlinear",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@GLIG% GWLAG GWLIN ! Lignin;wt.endlag,endlinear")

# "@ SDWT SDDUR SDRS% ! Weight,duration,reserves (% whole seed)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDWT",#"@ SDWT",
        6,   12,    "SDDUR",#" SDDUR",
       12,   18,    "SDRS%" #" SDRS%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDWT SDDUR SDRS% ! Weight,duration,reserves (% whole seed)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDWT SDDUR SDRS% ! Weight,duration,reserves (% whole seed)")

# "@PARFC CO2CC CO2EX ! CO2 response (only for comparison)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PARFC",#"@PARFC",
        6,   12,    "CO2CC",#" CO2CC",
       12,   18,    "CO2EX" #" CO2EX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PARFC CO2CC CO2EX ! CO2 response (only for comparison)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PARFC CO2CC CO2EX ! CO2 response (only for comparison)")

# "@RSFPU RSFPL ! Reserves effect thresholds (as set->no reserves effect)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RSFPU",#"@RSFPU",
        6,   12,    "RSFPL" #" RSFPL"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RSFPU RSFPL ! Reserves effect thresholds (as set->no reserves effect)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RSFPU RSFPL ! Reserves effect thresholds (as set->no reserves effect)")

# "@PTFMN PTFMX  PTFXS  PTFA ! Partition to tops (max,min,max.adjustment)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    6,    "PTFMN",# "@PTFMN",
        6,   12,    "PTFMX",# " PTFMX",
       12,   19,    "PTFXS",#"  PTFXS",
       19,   25,     "PTFA" # "  PTFA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PTFMN PTFMX  PTFXS  PTFA ! Partition to tops (max,min,max.adjustment)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PTFMN PTFMX  PTFXS  PTFA ! Partition to tops (max,min,max.adjustment)")

# "@ TKUH TKDTI TKDLF TKSPN  HDUR HLOST HLOSF ! Kill temps,span,time->harden,loss"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TKUH",#"@ TKUH",
        6,   12,    "TKDTI",#" TKDTI",
       12,   18,    "TKDLF",#" TKDLF",
       18,   24,    "TKSPN",#" TKSPN",
       24,   30,     "HDUR",#"  HDUR",
       30,   36,    "HLOST",#" HLOST",
       36,   42,    "HLOSF" #" HLOSF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TKUH TKDTI TKDLF TKSPN  HDUR HLOST HLOSF ! Kill temps,span,time->harden,loss",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TKUH TKDTI TKDLF TKSPN  HDUR HLOST HLOSF ! Kill temps,span,time->harden,loss")

# "@ TKGF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TKGF" #"@ TKGF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TKGF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TKGF")

# "@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR TRGFW xRGFW TRGFN xRGFN  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RRATE",#"@RRATE",
        6,   12,    "TRGEM",#" TRGEM",
       12,   18,    "TRDV1",#" TRDV1",
       18,   24,    "TRDV4",#" TRDV4",
       24,   30,    "TRDV8",#" TRDV8",
       30,   36,     "TRLA",#"  TRLA",
       36,   42,    "TRLFG",#" TRLFG",
       42,   48,    "TRPHS",#" TRPHS",
       48,   54,    "TRVRN",#" TRVRN",
       54,   60,    "TRHAR",#" TRHAR",
       60,   66,    "TRGFW",#" TRGFW",
       66,   72,    "xRGFW",#" xRGFW",
       72,   78,    "TRGFN",#" TRGFN",
       78,   84,    "xRGFN" #" xRGFN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR TRGFW xRGFW TRGFN xRGFN  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR TRGFW xRGFW TRGFN xRGFN  ")

# "@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR XRGFW TRGFN  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RRATE",#"@RRATE",
        6,   12,    "TRGEM",#" TRGEM",
       12,   18,    "TRDV1",#" TRDV1",
       18,   24,    "TRDV4",#" TRDV4",
       24,   30,    "TRDV8",#" TRDV8",
       30,   36,     "TRLA",#"  TRLA",
       36,   42,    "TRLFG",#" TRLFG",
       42,   48,    "TRPHS",#" TRPHS",
       48,   54,    "TRVRN",#" TRVRN",
       54,   60,    "TRHAR",#" TRHAR",
       60,   66,    "XRGFW",#" XRGFW",
       66,   72,    "TRGFN" #" TRGFN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR XRGFW TRGFN  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RRATE TRGEM TRDV1 TRDV4 TRDV8  TRLA TRLFG TRPHS TRVRN TRHAR XRGFW TRGFN  ")

# "@ RATM RCROP EORATIO ! Atmospheric,canopy resistances;FAO formula factor"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    6,     "RATM",#  "@ RATM",
        6,   12,    "RCROP",#  " RCROP",
       12,   20,  "EORATIO" #" EORATIO"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RATM RCROP EORATIO ! Atmospheric,canopy resistances;FAO formula factor",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RATM RCROP EORATIO ! Atmospheric,canopy resistances;FAO formula factor")

# "@RWUPM RWUMX ! Min.pore size for max.uptake,Max uptake rate"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RWUPM",#"@RWUPM",
        6,   12,    "RWUMX" #" RWUMX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RWUPM RWUMX ! Min.pore size for max.uptake,Max uptake rate",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RWUPM RWUMX ! Min.pore size for max.uptake,Max uptake rate")

# "@ WFPU  WFPL  WFGU  WFGL  WFTU  WFTL  WFSU  WFSF  WFEU !Gr,phs,till,sen,evap"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "WFPU",#"@ WFPU",
        6,   12,     "WFPL",#"  WFPL",
       12,   18,     "WFGU",#"  WFGU",
       18,   24,     "WFGL",#"  WFGL",
       24,   30,     "WFTU",#"  WFTU",
       30,   36,     "WFTL",#"  WFTL",
       36,   42,     "WFSU",#"  WFSU",
       42,   48,     "WFSF",#"  WFSF",
       48,   54,     "WFEU" #"  WFEU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ WFPU  WFPL  WFGU  WFGL  WFTU  WFTL  WFSU  WFSF  WFEU !Gr,phs,till,sen,evap",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ WFPU  WFPL  WFGU  WFGL  WFTU  WFTL  WFSU  WFSF  WFEU !Gr,phs,till,sen,evap")

# "@LLOSA"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLOSA" #"@LLOSA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLOSA",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLOSA")

# "@WFGEU WFRGU  ! Germination/emergence,root growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "WFGEU",#"@WFGEU",
        6,   12,    "WFRGU" #" WFRGU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@WFGEU WFRGU  ! Germination/emergence,root growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@WFGEU WFRGU  ! Germination/emergence,root growth")

# "@NH4MN NO3MN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NH4MN",#"@NH4MN",
        6,   12,    "NO3MN" #" NO3MN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NH4MN NO3MN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NH4MN NO3MN")

# "@NTUPF  ! Fraction of deficit that can be filled per day"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NTUPF" #"@NTUPF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NTUPF  ! Fraction of deficit that can be filled per day",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NTUPF  ! Fraction of deficit that can be filled per day")

# "@GN%MX  SDN% ! Grain,seed             "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "GN%MX",#"@GN%MX",
        6,   12,     "SDN%" #"  SDN%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@GN%MX  SDN% ! Grain,seed             ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@GN%MX  SDN% ! Grain,seed             ")

# "@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN ! Standard,minima N% for lves,stems,rts  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "LN%S",#"@ LN%S",
        6,   12,    "LN%MN",#" LN%MN",
       12,   18,     "SN%S",#"  SN%S",
       18,   24,    "SN%MN",#" SN%MN",
       24,   30,     "RN%S",#"  RN%S",
       30,   36,    "RN%MN" #" RN%MN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN ! Standard,minima N% for lves,stems,rts  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN ! Standard,minima N% for lves,stems,rts  ")

# "@NLAB% ! %N that labile "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NLAB%" #"@NLAB%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NLAB% ! %N that labile ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NLAB% ! %N that labile ")

# "@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,gr,tillering,senesnce"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NFPU",#"@ NFPU",
        6,   12,     "NFPL",#"  NFPL",
       12,   18,     "NFGU",#"  NFGU",
       18,   24,     "NFGL",#"  NFGL",
       24,   30,     "NFTU",#"  NFTU",
       30,   36,     "NFTL",#"  NFTL",
       36,   42,     "NFSU",#"  NFSU",
       42,   48,     "NFSF" #"  NFSF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,gr,tillering,senesnce",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NFPU  NFPL  NFGU  NFGL  NFTU  NFTL  NFSU  NFSF ! Phs,gr,tillering,senesnce")

# "@ NCRG  ! Root growth "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NCRG" #"@ NCRG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NCRG  ! Root growth ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NCRG  ! Root growth ")

# "@ DI_NAME    DI_ABV"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#      ~check,
        0,    9,  "DI_NAME",# "@ DI_NAME",
        9,   19,   "DI_ABV" #"    DI_ABV"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ DI_NAME    DI_ABV",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ DI_NAME    DI_ABV")

# "@ DAPX DLDUR DSDUR DDEWN DINMX DITYP TBASE TOPT1 TOPT2  TTOP TKILL DINCO DIFFR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "DAPX",#"@ DAPX",
        6,   12,    "DLDUR",#" DLDUR",
       12,   18,    "DSDUR",#" DSDUR",
       18,   24,    "DDEWN",#" DDEWN",
       24,   30,    "DINMX",#" DINMX",
       30,   36,    "DITYP",#" DITYP",
       36,   42,    "TBASE",#" TBASE",
       42,   48,    "TOPT1",#" TOPT1",
       48,   54,    "TOPT2",#" TOPT2",
       54,   60,     "TTOP",#"  TTOP",
       60,   66,    "TKILL",#" TKILL",
       66,   72,    "DINCO",#" DINCO",
       72,   78,    "DIFFR" #" DIFFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ DAPX DLDUR DSDUR DDEWN DINMX DITYP TBASE TOPT1 TOPT2  TTOP TKILL DINCO DIFFR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ DAPX DLDUR DSDUR DDEWN DINMX DITYP TBASE TOPT1 TOPT2  TTOP TKILL DINCO DIFFR")

# "@HPROD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "HPROD" #"@HPROD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@HPROD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@HPROD")

# "@PGERM PEMRG  ! Germination,gr thru soil(/cm)                             "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PGERM",#"@PGERM",
        6,   12,    "PEMRG" #" PEMRG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PGERM PEMRG  ! Germination,gr thru soil(/cm)                             ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PGERM PEMRG  ! Germination,gr thru soil(/cm)                             ")

# "@PPFPE PPTHR PPSEN ! Photoperiod threshold,sensitivity type  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PPFPE",#"@PPFPE",
        6,   12,    "PPTHR",#" PPTHR",
       12,   18,    "PPSEN" #" PPSEN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PPFPE PPTHR PPSEN ! Photoperiod threshold,sensitivity type  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PPFPE PPTHR PPSEN ! Photoperiod threshold,sensitivity type  ")

# "@RLIG%  RLWR  RSEN RRESP RDGS RDGAF  ! Lignin%,length/wt;sen,resp;dpth growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RLIG%",#"@RLIG%",
        6,   12,     "RLWR",#"  RLWR",
       12,   18,     "RSEN",#"  RSEN",
       18,   24,    "RRESP",#" RRESP",
       24,   29,     "RDGS",# " RDGS",
       29,   35,    "RDGAF" #" RDGAF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RLIG%  RLWR  RSEN RRESP RDGS RDGAF  ! Lignin%,length/wt;sen,resp;dpth growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RLIG%  RLWR  RSEN RRESP RDGS RDGAF  ! Lignin%,length/wt;sen,resp;dpth growth")

# "@PHNTF  ! Phint change with growth stage factor"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PHNTF" #"@PHNTF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PHNTF  ! Phint change with growth stage factor",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PHNTF  ! Phint change with growth stage factor")

# "@LLIG% LPEAW ! Lignin%"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIG%",#"@LLIG%",
        6,   12,    "LPEAW" #" LPEAW"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIG% LPEAW ! Lignin%",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIG% LPEAW ! Lignin%")

# "@LLIFG LLIFS LLIFX  ! Growing,senescence durations;max.acceleration in shade "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIFG",#"@LLIFG",
        6,   12,    "LLIFS",#" LLIFS",
       12,   18,    "LLIFX" #" LLIFX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIFG LLIFS LLIFX  ! Growing,senescence durations;max.acceleration in shade ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIFG LLIFS LLIFX  ! Growing,senescence durations;max.acceleration in shade ")

# "@LLOSA LWLOS  ! Loss when accelerated,normal senescence   "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLOSA",#"@LLOSA",
        6,   12,    "LWLOS" #" LWLOS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLOSA LWLOS  ! Loss when accelerated,normal senescence   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLOSA LWLOS  ! Loss when accelerated,normal senescence   ")

# "@SLACF SLAFF SLAMN  ! Specific leaf area change,flexibility,minimum  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLACF",#"@SLACF",
        6,   12,    "SLAFF",#" SLAFF",
       12,   18,    "SLAMN" #" SLAMN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLACF SLAFF SLAMN  ! Specific leaf area change,flexibility,minimum  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLACF SLAFF SLAMN  ! Specific leaf area change,flexibility,minimum  ")

# "@SLATS SLATR SLAWR  ! Specific leaf area temperature and h2o effect parameters"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLATS",#"@SLATS",
        6,   12,    "SLATR",#" SLATR",
       12,   18,    "SLAWR" #" SLAWR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLATS SLATR SLAWR  ! Specific leaf area temperature and h2o effect parameters",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLATS SLATR SLAWR  ! Specific leaf area temperature and h2o effect parameters")

# "@ CHT%  CLA%   ! Canopy height%, leaf area %"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CHT%",#"@ CHT%",
        6,   12,     "CLA%" #"  CLA%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CHT%  CLA%   ! Canopy height%, leaf area %",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CHT%  CLA%   ! Canopy height%, leaf area %")

# "@ TPAR TSRAD  ! Individual leaf transmission PAR, solar radiation  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "TPAR",#"@ TPAR",
        6,   12,    "TSRAD" #" TSRAD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TPAR TSRAD  ! Individual leaf transmission PAR, solar radiation  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TPAR TSRAD  ! Individual leaf transmission PAR, solar radiation  ")

# "@ KCAN  ! Canopy extinction coefficient PAR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "KCAN" #"@ KCAN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ KCAN  ! Canopy extinction coefficient PAR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ KCAN  ! Canopy extinction coefficient PAR")

# "@PARIX  ! PAR interception beyond which accelerated ageing    "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PARIX" #"@PARIX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PARIX  ! PAR interception beyond which accelerated ageing    ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PARIX  ! PAR interception beyond which accelerated ageing    ")

# "@SGRO2  ! Relative size of 2nd shoot"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SGRO2" #"@SGRO2"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SGRO2  ! Relative size of 2nd shoot",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SGRO2  ! Relative size of 2nd shoot")

# "@RSFRS RS%O RS%LX RSUSE  ! Standard concs (overall,leaves), fr utilizeable/day"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RSFRS",#"@RSFRS",
        6,   11,     "RS%O",# " RS%O",
       11,   17,    "RS%LX",#" RS%LX",
       17,   23,    "RSUSE" #" RSUSE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RSFRS RS%O RS%LX RSUSE  ! Standard concs (overall,leaves), fr utilizeable/day",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RSFRS RS%O RS%LX RSUSE  ! Standard concs (overall,leaves), fr utilizeable/day")

# "@SLIG%  SAWS  SERX  ! Lignin%, area/weight, elongation rate"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLIG%",#"@SLIG%",
        6,   12,     "SAWS",#"  SAWS",
       12,   18,     "SERX" #"  SERX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLIG%  SAWS  SERX  ! Lignin%, area/weight, elongation rate",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLIG%  SAWS  SERX  ! Lignin%, area/weight, elongation rate")

# "@ CRFR ! Fraction of stem growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "CRFR" #"@ CRFR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ CRFR ! Fraction of stem growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ CRFR ! Fraction of stem growth")

# "@ SDWT SDDUR SDRS% ! Weight, duration, reserves (% whole seed)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDWT",#"@ SDWT",
        6,   12,    "SDDUR",#" SDDUR",
       12,   18,    "SDRS%" #" SDRS%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDWT SDDUR SDRS% ! Weight, duration, reserves (% whole seed)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDWT SDDUR SDRS% ! Weight, duration, reserves (% whole seed)")

# "@ PHTV  PHSV  ! VPD sensitivity aspects"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "PHTV",#"@ PHTV",
        6,   12,     "PHSV" #"  PHSV"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PHTV  PHSV  ! VPD sensitivity aspects",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PHTV  PHSV  ! VPD sensitivity aspects")

# "@CO2RF  CO2F  ! CO2 response"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "CO2RF",#"@CO2RF",
        6,   12,     "CO2F" #"  CO2F"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@CO2RF  CO2F  ! CO2 response",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@CO2RF  CO2F  ! CO2 response")

# "@PTFMN PTFMX  PTFA  ! Partition to tops (max,min,adjustment)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PTFMN",#"@PTFMN",
        6,   12,    "PTFMX",#" PTFMX",
       12,   18,     "PTFA" #"  PTFA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PTFMN PTFMX  PTFA  ! Partition to tops (max,min,adjustment)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PTFMN PTFMX  PTFA  ! Partition to tops (max,min,adjustment)")

# "@RRATE TRGEM TRDV1 TRLFG TRPHS  ! Germination/emergence,development,leaf growth,phsis"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RRATE",#"@RRATE",
        6,   12,    "TRGEM",#" TRGEM",
       12,   18,    "TRDV1",#" TRDV1",
       18,   24,    "TRLFG",#" TRLFG",
       24,   30,    "TRPHS" #" TRPHS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RRATE TRGEM TRDV1 TRLFG TRPHS  ! Germination/emergence,development,leaf growth,phsis",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RRATE TRGEM TRDV1 TRLFG TRPHS  ! Germination/emergence,development,leaf growth,phsis")

# "@EORATIO  ! FAO formula factor"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    8,  "EORATIO" #"@EORATIO"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@EORATIO  ! FAO formula factor",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@EORATIO  ! FAO formula factor")

# "@RWUPM RWUMX ! Min pore size,max.uptake rate"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RWUPM",#"@RWUPM",
        6,   12,    "RWUMX" #" RWUMX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RWUPM RWUMX ! Min pore size,max.uptake rate",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RWUPM RWUMX ! Min pore size,max.uptake rate")

# "@ WFGU  WFGL  WFPU  WFPL  WFSU  WFEU  ! Growth,phs,senescence,evap"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "WFGU",#"@ WFGU",
        6,   12,     "WFGL",#"  WFGL",
       12,   18,     "WFPU",#"  WFPU",
       18,   24,     "WFPL",#"  WFPL",
       24,   30,     "WFSU",#"  WFSU",
       30,   36,     "WFEU" #"  WFEU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ WFGU  WFGL  WFPU  WFPL  WFSU  WFEU  ! Growth,phs,senescence,evap",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ WFGU  WFGL  WFPU  WFPL  WFSU  WFEU  ! Growth,phs,senescence,evap")

# "@WFGEU WFRGU  ! Germination/emergence, root growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "WFGEU",#"@WFGEU",
        6,   12,    "WFRGU" #" WFRGU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@WFGEU WFRGU  ! Germination/emergence, root growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@WFGEU WFRGU  ! Germination/emergence, root growth")

# "@RTNO3 RTNH4 NH4MN NO3MN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RTNO3",#"@RTNO3",
        6,   12,    "RTNH4",#" RTNH4",
       12,   18,    "NH4MN",#" NH4MN",
       18,   24,    "NO3MN" #" NO3MN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RTNO3 RTNH4 NH4MN NO3MN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RTNO3 RTNH4 NH4MN NO3MN")

# "@ SDN% ! Seed"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDN%" #"@ SDN%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDN% ! Seed",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDN% ! Seed")

# "@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN  ! Standard,minima N% leaves,stems,roots"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "LN%S",#"@ LN%S",
        6,   12,    "LN%MN",#" LN%MN",
       12,   18,     "SN%S",#"  SN%S",
       18,   24,    "SN%MN",#" SN%MN",
       24,   30,     "RN%S",#"  RN%S",
       30,   36,    "RN%MN" #" RN%MN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN  ! Standard,minima N% leaves,stems,roots",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LN%S LN%MN  SN%S SN%MN  RN%S RN%MN  ! Standard,minima N% leaves,stems,roots")

# "@NLAB% ! Labile nitrogen"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NLAB%" #"@NLAB%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NLAB% ! Labile nitrogen",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NLAB% ! Labile nitrogen")

# "@ NFPU  NFPL  NFGU  NFGL  NFSU ! Photosynthesis,growth,senescence"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NFPU",#"@ NFPU",
        6,   12,     "NFPL",#"  NFPL",
       12,   18,     "NFGU",#"  NFGU",
       18,   24,     "NFGL",#"  NFGL",
       24,   30,     "NFSU" #"  NFSU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NFPU  NFPL  NFGU  NFGL  NFSU ! Photosynthesis,growth,senescence",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NFPU  NFPL  NFGU  NFGL  NFSU ! Photosynthesis,growth,senescence")

# "@ NLLG"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NLLG" #"@ NLLG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NLLG",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NLLG")

# "@ NCRG   ! Root growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NCRG" #"@ NCRG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NCRG   ! Root growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NCRG   ! Root growth")

# "@PARFC CO2CC CO2EX  ! CO2 response function parameters "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PARFC",#"@PARFC",
        6,   12,    "CO2CC",#" CO2CC",
       12,   18,    "CO2EX" #" CO2EX"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PARFC CO2CC CO2EX  ! CO2 response function parameters ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PARFC CO2CC CO2EX  ! CO2 response function parameters ")

# "@ RATM RCROP  ! Atmospheric,canopy resistances "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "RATM",#"@ RATM",
        6,   12,    "RCROP" #" RCROP"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RATM RCROP  ! Atmospheric,canopy resistances ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RATM RCROP  ! Atmospheric,canopy resistances ")

# "@RWULF ! Length factor"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RWULF" #"@RWULF"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RWULF ! Length factor",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RWULF ! Length factor")

# "@PEMRG  ! gr by cum. soil temperature                              "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "PEMRG" #"@PEMRG"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PEMRG  ! gr by cum. soil temperature                              ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PEMRG  ! gr by cum. soil temperature                              ")

# "@RLIG%  RSEN RRESP   ! Lignin%,sen,resp"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RLIG%",#"@RLIG%",
        6,   12,     "RSEN",#"  RSEN",
       12,   18,    "RRESP" #" RRESP"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RLIG%  RSEN RRESP   ! Lignin%,sen,resp",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RLIG%  RSEN RRESP   ! Lignin%,sen,resp")

# "@LLIG% LPEAW ! Lignin%, petiole area/wt"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIG%",#"@LLIG%",
        6,   12,    "LPEAW" #" LPEAW"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIG% LPEAW ! Lignin%, petiole area/wt",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIG% LPEAW ! Lignin%, petiole area/wt")

# "@LLIFG LLIFS  ! Growing,senescence durations"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LLIFG",#"@LLIFG",
        6,   12,    "LLIFS" #" LLIFS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LLIFG LLIFS  ! Growing,senescence durations",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LLIFG LLIFS  ! Growing,senescence durations")

# "@LWLOS  ! Loss when normal senescence   "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "LWLOS" #"@LWLOS"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@LWLOS  ! Loss when normal senescence   ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@LWLOS  ! Loss when normal senescence   ")

# "@SLATS SLATR   ! Specific leaf area temperature effect parameters"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLATS",#"@SLATS",
        6,   12,    "SLATR" #" SLATR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLATS SLATR   ! Specific leaf area temperature effect parameters",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLATS SLATR   ! Specific leaf area temperature effect parameters")

# "@SLIG%  SESR ! Lignin%, elongation rate (shoot)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "SLIG%",#"@SLIG%",
        6,   12,     "SESR" #"  SESR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SLIG%  SESR ! Lignin%, elongation rate (shoot)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SLIG%  SESR ! Lignin%, elongation rate (shoot)")

# "@ SDSZ SDDUR SDRS% ! Reserves by unit of length (stake), duration, reserves (% whole stake)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDSZ",#"@ SDSZ",
        6,   12,    "SDDUR",#" SDDUR",
       12,   18,    "SDRS%" #" SDRS%"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDSZ SDDUR SDRS% ! Reserves by unit of length (stake), duration, reserves (% whole stake)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDSZ SDDUR SDRS% ! Reserves by unit of length (stake), duration, reserves (% whole stake)")

# "@ PDTV  PDSV  ! VPD sensitivity aspects (daily effect)"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "PDTV",#"@ PDTV",
        6,   12,     "PDSV" #"  PDSV"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PDTV  PDSV  ! VPD sensitivity aspects (daily effect)",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PDTV  PDSV  ! VPD sensitivity aspects (daily effect)")

# "@PTFA  ! Partition to feeder roots"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,# ~check,
        0,    5,     "PTFA" #"@PTFA"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@PTFA  ! Partition to feeder roots",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PTFA  ! Partition to feeder roots")

# "@RRATE TRGEM TRDV1 TRLFG TRLFL TRPHS TRBRG TRDMC  ! Germination/emergence,development,leaf growth,leaf life,phsis, branching, dry matter"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RRATE",#"@RRATE",
        6,   12,    "TRGEM",#" TRGEM",
       12,   18,    "TRDV1",#" TRDV1",
       18,   24,    "TRLFG",#" TRLFG",
       24,   30,    "TRLFL",#" TRLFL",
       30,   36,    "TRPHS",#" TRPHS",
       36,   42,    "TRBRG",#" TRBRG",
       42,   48,    "TRDMC" #" TRDMC"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RRATE TRGEM TRDV1 TRLFG TRLFL TRPHS TRBRG TRDMC  ! Germination/emergence,development,leaf growth,leaf life,phsis, branching, dry matter",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RRATE TRGEM TRDV1 TRLFG TRLFL TRPHS TRBRG TRDMC  ! Germination/emergence,development,leaf growth,leaf life,phsis, branching, dry matter")

# "@ DMIC  DMAG  DMRD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "DMIC",#"@ DMIC",
        6,   12,     "DMAG",#"  DMAG",
       12,   18,     "DMRD" #"  DMRD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ DMIC  DMAG  DMRD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ DMIC  DMAG  DMRD")

# "@ WFGU  WFGL  WFPU  WFPL  ! Growth,phs"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "WFGU",#"@ WFGU",
        6,   12,     "WFGL",#"  WFGL",
       12,   18,     "WFPU",#"  WFPU",
       18,   24,     "WFPL" #"  WFPL"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ WFGU  WFGL  WFPU  WFPL  ! Growth,phs",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ WFGU  WFGL  WFPU  WFPL  ! Growth,phs")

# "@WFGEM WFRGU  ! Germination/emergence, root growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "WFGEM",#"@WFGEM",
        6,   12,    "WFRGU" #" WFRGU"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@WFGEM WFRGU  ! Germination/emergence, root growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@WFGEM WFRGU  ! Germination/emergence, root growth")

# "@ SDN% LN%SC ! Planting stick, N% fallen leaves"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "SDN%",#"@ SDN%",
        6,   12,    "LN%SC" #" LN%SC"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ SDN% LN%SC ! Planting stick, N% fallen leaves",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ SDN% LN%SC ! Planting stick, N% fallen leaves")

# "@ NFPU  NFPL  NFGU  NFGL ! Photosynthesis,growth"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "NFPU",#"@ NFPU",
        6,   12,     "NFPL",#"  NFPL",
       12,   18,     "NFGU",#"  NFGU",
       18,   24,     "NFGL" #"  NFGL"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ NFPU  NFPL  NFGU  NFGL ! Photosynthesis,growth",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ NFPU  NFPL  NFGU  NFGL ! Photosynthesis,growth")

# "@  CONV   FDMC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "CONV",#"@  CONV",
        7,   14,     "FDMC" #"   FDMC"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  CONV   FDMC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  CONV   FDMC")

# "@ TBASV  TOPTV  TTOPV"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,    "TBASV",#"@ TBASV",
        7,   14,    "TOPTV",#"  TOPTV",
       14,   21,    "TTOPV" #"  TTOPV"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TBASV  TOPTV  TTOPV",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TBASV  TOPTV  TTOPV")

# "@ TBASR  TOPTR  TTOPR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,    "TBASR",#"@ TBASR",
        7,   14,    "TOPTR",#"  TOPTR",
       14,   21,    "TTOPR" #"  TTOPR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ TBASR  TOPTR  TTOPR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ TBASR  TOPTR  TTOPR")

# "@ LIFAC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,    "LIFAC" #"@ LIFAC"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ LIFAC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ LIFAC")

# "@  RWEP   PORM   RWMX   RLWR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "RWEP",#"@  RWEP",
        7,   14,     "PORM",#"   PORM",
       14,   21,     "RWMX",#"   RWMX",
       21,   28,     "RLWR" #"   RLWR"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  RWEP   PORM   RWMX   RLWR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  RWEP   PORM   RWMX   RLWR")

# "@  CMFC"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "CMFC" #"@  CMFC"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  CMFC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  CMFC")

# "@  CO2X   CO2Y"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#   ~check,
        0,    7,     "CO2X",#"@  CO2X",
        7,   14,     "CO2Y" #"   CO2Y"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  CO2X   CO2Y",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  CO2X   CO2Y")

# "@C X(EN) Y(CH)  YSTD"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "C",#    "@C",
        2,    8,    "X(EN)",#" X(EN)",
        8,   14,    "Y(CH)",#" Y(CH)",
       14,   20,     "YSTD" #"  YSTD"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@C X(EN) Y(CH)  YSTD",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C X(EN) Y(CH)  YSTD")

# "@ RS%X RSUSE ! Max concentration,fraction utilizeable/day"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "RS%X",#"@ RS%X",
        6,   12,    "RSUSE" #" RSUSE"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RS%X RSUSE ! Max concentration,fraction utilizeable/day",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RS%X RSUSE ! Max concentration,fraction utilizeable/day")

# "@RRATE TRGEM TRDV1 TRDV2 TRDV7 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN  "

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "RRATE",#"@RRATE",
        6,   12,    "TRGEM",#" TRGEM",
       12,   18,    "TRDV1",#" TRDV1",
       18,   24,    "TRDV2",#" TRDV2",
       24,   30,    "TRDV7",#" TRDV7",
       30,   36,    "TRLFG",#" TRLFG",
       36,   42,    "TRPHS",#" TRPHS",
       42,   48,    "TRVRN",#" TRVRN",
       48,   54,    "TRHAR",#" TRHAR",
       54,   60,    "TRGFW",#" TRGFW",
       60,   66,    "TRGFN" #" TRGFN"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@RRATE TRGEM TRDV1 TRDV2 TRDV7 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@RRATE TRGEM TRDV1 TRDV2 TRDV7 TRLFG TRPHS TRVRN TRHAR TRGFW TRGFN  ")

# "@ RATM RCROP EORAT ! Atmospheric,canopy res.;FAO-PenM formula factor"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,     "RATM",#"@ RATM",
        6,   12,    "RCROP",#" RCROP",
       12,   18,    "EORAT" #" EORAT"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ RATM RCROP EORAT ! Atmospheric,canopy res.;FAO-PenM formula factor",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ RATM RCROP EORAT ! Atmospheric,canopy res.;FAO-PenM formula factor")

# "@NH4MN NO3MN RTNUP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    6,    "NH4MN",#"@NH4MN",
        6,   12,    "NO3MN",#" NO3MN",
       12,   18,    "RTNUP" #" RTNUP"
  )

  col_names <-   NULL

  left_just <-   NULL

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NH4MN NO3MN RTNUP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NH4MN NO3MN RTNUP")


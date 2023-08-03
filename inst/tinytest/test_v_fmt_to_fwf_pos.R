# "@PEOPLE"

  true_fwf_pos <- data.frame(begin = 0,
                             end = NA_real_,
                             col_names = "PEOPLE"
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@PEOPLE",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@PEOPLE")


# "@ADDRESS"

  true_fwf_pos <- data.frame(begin = 0,
                             end = NA_real_,
                             col_names = "ADDRESS")

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ADDRESS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ADDRESS")


# "@SITE"

  true_fwf_pos <- data.frame(begin = 0,
                             end = NA_real_,
                             col_names = "SITE")

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@SITE",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE")


# "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM........."

  true_fwf_pos <- data.frame(begin = c(0, 7, 13, 19, 25, 31, 37, 43, 49, 55),
                             end   = c(7, 13, 19, 25, 31, 37, 43, 49, 55, 70),
                             col_names = c("PAREA", "PRNO", "PLEN", "PLDR",
                                           "PLSP", "PLAY", "HAREA", "HRNO",
                                           "HLEN", "HARM"))

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........")


# "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM"

  true_fwf_pos <- data.frame(begin = c(0, 2, 4, 6, 8, 34, 37, 40, 43, 46, 49,
                                       52, 55, 58, 61, 64, 67, 70),
                             end = c(2, 4, 6, 8, 34, 37, 40, 43, 46, 49, 52,
                                     55, 58, 61, 64, 67, 70, 73),
                             col_names = c("N", "R", "O", "C", "TNAME", "CU",
                                           "FL", "SA", "IC", "MP", "MI", "MF",
                                           "MR", "MC", "MT", "ME", "MH", "SM"))

  v_fmt <- DSSAT:::filex_v_fmt("TREATMENTS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM")


# "@C CR INGENO CNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 5, 12),
                             end = c(2, 5, 12, NA),
                             col_names = c("C", "CR", "INGENO", "CNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("CULTIVARS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C CR INGENO CNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C CR INGENO CNAME")


# "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 11, 20, 26, 32, 38, 44, 50, 56,
                                       63, 67, 80),
                             end = c(2, 11, 20, 26, 32, 38, 44, 50, 56, 63,
                                     67, 80, NA),
                             col_names = c("L", "ID_FIELD", "WSTA", "FLSA",
                                           "FLOB", "FLDT", "FLDD", "FLDS",
                                           "FLST", "SLTX", "SLDP", "ID_SOIL",
                                           "FLNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME")


# "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR"

  true_fwf_pos <- data.frame(begin = c(0, 2, 18, 34, 44, 62, 68, 74, 80, 86),
                             end = c(2, 18, 34, 44, 62, 68, 74, 80, 86, 92),
                             col_names = c("L", "XCRD", "YCRD", "ELEV", "AREA",
                                           "SLEN", "FLWR", "SLAS", "FLHST",
                                           "FHDUR"))

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR")


# "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44, 50,
                                       56, 62, 68, 74, 80, 86),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68, 74, 80, 86, NA),
                             col_names = c("P", "PDATE", "EDATE", "PPOP",
                                           "PPOE", "PLME", "PLDS", "PLRS",
                                           "PLRD", "PLDP", "PLWT", "PAGE",
                                           "PENV", "PLPH", "SPRL", "PLNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("PLANTING DETAILS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME")


# "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, NA),
                             col_names = c("I", "EFIR", "IDEP", "ITHR",
                                           "IEPT", "IOFF", "IAME", "IAMT",
                                           "IRNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("IRRIGATION")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME")


# "@I IDATE  IROP IRVAL"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14),
                             end = c(2, 8, 14, 20),
                             col_names = c("I", "IDATE", "IROP", "IRVAL"))

  v_fmt <- DSSAT:::filex_v_fmt("IRRIGATION")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@I IDATE  IROP IRVAL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@I IDATE  IROP IRVAL")


# "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44, 50, 56,
                                       62),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     NA),
                             col_names = c("F", "FDATE", "FMCD", "FACD",
                                           "FDEP", "FAMN", "FAMP", "FAMK",
                                           "FAMC", "FAMO", "FOCD", "FERNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("FERTILIZERS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME")


# "@T TDATE TIMPL  TDEP TNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20),
                             end = c(2, 8, 14, 20, NA),
                             col_names = c("T", "TDATE", "TIMPL", "TDEP",
                                           "TNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("TILLAGE")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@T TDATE TIMPL  TDEP TNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@T TDATE TIMPL  TDEP TNAME")


# "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38),
                             end = c(2, 8, 14, 20, 26, 32, 38, NA),
                             col_names = c("H", "HDATE", "HSTG", "HCOM",
                                           "HSIZE", "HPC", "HBPC", "HNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("HARVEST")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME")


# "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 70),
                             end = c(2, 14, 20, 26, 32, 38, 44, 70, 79),
                             col_names = c("N", "GENERAL", "NYERS", "NREPS",
                                           "START", "SDATE", "RSEED", "SNAME",
                                           "SMODEL"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL")


# "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56,
                                       62),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68),
                             col_names = c("N", "OPTIONS", "WATER", "NITRO",
                                           "SYMBI", "PHOSP", "POTAS", "DISES",
                                           "CHEM", "TILL", "CO2"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2")


# "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56,
                                       62, 68, 74),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62, 68,
                                     74, 80),
                             col_names = c("N", "METHODS", "WTHER", "INCON",
                                           "LIGHT", "EVAPO", "INFIL", "PHOTO",
                                           "HYDRO", "NSWIT", "MESOM", "MESEV",
                                           "MESOL"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL")


# "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38),
                             end = c(2, 14, 20, 26, 32, 38, 44),
                             col_names = c("N", "MANAGEMENT", "PLANT", "IRRIG",
                                           "FERTI", "RESID", "HARVS"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS")


# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56,
                                       62, 68, 74, 80, 86, 92),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68, 74, 80, 86, 92, 98),
                             col_names = c("N", "OUTPUTS", "FNAME", "OVVEW",
                                           "SUMRY", "FROPT", "GROUT", "CAOUT",
                                           "WAOUT", "NIOUT", "MIOUT", "DIOUT",
                                           "VBOSE", "CHOUT", "OPOUT", "FMOPT"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT")


# "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56),
                             col_names = c("N", "PLANTING", "PFRST", "PLAST",
                                           "PH2OL", "PH2OU", "PH2OD", "PSTMX",
                                           "PSTMN"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN")


# "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56),
                             col_names = c("N", "IRRIGATION", "IMDEP", "ITHRL",
                                           "ITHRU", "IROFF", "IMETH", "IRAMT",
                                           "IREFF"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF")


# "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38),
                             end = c(2, 14, 20, 26, 32, 38, 44),
                             col_names = c("N", "NITROGEN", "NMDEP", "NMTHR",
                                           "NAMNT", "NCODE", "NAOFF"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF")


# "@N RESIDUES    RIPCN RTIME RIDEP"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26),
                             end = c(2, 14, 20, 26, 32),
                             col_names = c("N", "RESIDUES", "RIPCN", "RTIME",
                                           "RIDEP"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N RESIDUES    RIPCN RTIME RIDEP",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N RESIDUES    RIPCN RTIME RIDEP")


# "@N HARVEST     HFRST HLAST HPCNP HPCNR"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32),
                             end = c(2, 14, 20, 26, 32, 38),
                             col_names = c("N", "HARVEST", "HFRST", "HLAST",
                                           "HPCNP", "HPCNR"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N HARVEST     HFRST HLAST HPCNP HPCNR",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N HARVEST     HFRST HLAST HPCNP HPCNR")


# "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44, 50,
                                       56, 62, 68, 74),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68, 74, NA),
                             col_names = c("C", "PCR", "ICDAT", "ICRT",
                                           "ICND", "ICRN", "ICRE", "ICWD",
                                           "ICRES", "ICREN", "ICREP", "ICRIP",
                                           "ICRID", "ICNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("INITIAL CONDITIONS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME")


# "@C  ICBL  SH2O  SNH4  SNO3"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20),
                             end = c(2, 8, 14, 20, 26),
                             col_names = c("C", "ICBL", "SH2O", "SNH4", "SNO3"))

  v_fmt <- DSSAT:::filex_v_fmt("INITIAL CONDITIONS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C  ICBL  SH2O  SNH4  SNO3",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C  ICBL  SH2O  SNH4  SNO3")


# "@NOTES"

  true_fwf_pos <- data.frame(begin = 0,
                             end = NA_real_,
                             col_names = "NOTES")

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@NOTES",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NOTES")


# "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  "

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 15, 21, 27, 33, 39, 45, 51, 57),
                             end = c(2, 8, 15, 21, 27, 33, 39, 45, 51, 57, NA),
                             col_names = c("E", "ODATE", "EDAY", "ERAD",
                                           "EMAX", "EMIN", "ERAIN", "ECO2",
                                           "EDEW", "EWIND", "ENVNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("ENVIRONMENT")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ")


# "@A SADAT  SMHB  SMPX  SMKE  SANAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26),
                             end = c(2, 8, 14, 20, 26, NA),
                             col_names = c("A", "SADAT", "SMHB", "SMPX",
                                           "SMKE", "SANAME"))

  v_fmt <- DSSAT:::filex_v_fmt("SOIL ANALYSIS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@A SADAT  SMHB  SMPX  SMKE  SANAME")


# "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44, 50),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, 50, 56),
                             col_names = c("A", "SABL", "SADM", "SAOC",
                                           "SANI", "SAPHW", "SAPHB", "SAPX",
                                           "SAKE", "SASC"))

  v_fmt <- DSSAT:::filex_v_fmt("SOIL ANALYSIS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC")


# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56,
                                       62, 68, 74, 80, 86),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68, 74, 80, 86, 92),
                             col_names = c("N", "OUTPUTS", "FNAME", "OVVEW",
                                           "SUMRY", "FROPT", "GROUT", "CAOUT",
                                           "WAOUT", "NIOUT", "MIOUT", "DIOUT",
                                           "VBOSE", "CHOUT", "OPOUT"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT")


# "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS"

  true_fwf_pos <- data.frame(begin = c(0, 2, 18, 34, 44, 62, 68, 74),
                             end = c(2, 18, 34, 44, 62, 68, 74, 80),
                             col_names = c("L", "XCRD", "YCRD", "ELEV", "AREA",
                                           "SLEN", "FLWR", "SLAS"))

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS")


# "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62),
                             col_names = c("N", "OPTIONS", "WATER", "NITRO",
                                           "SYMBI", "PHOSP", "POTAS", "DISES",
                                           "CHEM", "TILL"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL")


# "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 50, 56, 62),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62, 68),
                             col_names = c("N", "METHODS", "WTHER", "INCON",
                                           "LIGHT", "EVAPO", "INFIL", "PHOTO",
                                           "HYDRO", "NSWIT", "MESOM"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM")


# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38,44, 50, 56,
                                       62, 68, 74, 80, 86),
                             end = c(2, 14, 20, 26, 32, 38, 44, 50, 56, 62,
                                     68, 74, 80, 86, 92),
                             col_names = c("N", "OUTPUTS", "FNAME", "OVVEW",
                                           "SUMRY", "FROPT", "GROUT", "CAOUT",
                                           "WAOUT", "NIOUT", "MIOUT", "DIOUT",
                                           "LONG", "CHOUT", "OPOUT"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT")


# "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM........."

  true_fwf_pos <- data.frame(begin = c(0, 7, 13, 19, 25, 31, 37, 43, 49, 55),
                             end = c(7, 13, 19, 25, 31, 37, 43, 49, 55, 70),
                             col_names = c("PAREA", "PRNO", "PLEN", "PLDR",
                                           "PLSP", "PLAY", "HAREA", "HRNO",
                                           "HLEN", "HARM"))

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........")


# "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 26, 32, 38, 44, 70),
                             end = c(2, 14, 20, 26, 32, 38, 44, 70, 79),
                             col_names = c("N", "GENERAL", "NYERS", "NREPS",
                                           "START", "SDATE", "RSEED", "SNAME",
                                           "MODEL"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL")


# "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38, 44, 50, 56),
                             end = c(2, 8, 14, 20, 26, 32, 38, 44, 50, 56, NA),
                             col_names = c("R", "RDATE", "RCOD", "RAMT", "RESN",
                                           "RESP", "RESK", "RINP", "RDEP",
                                           "RMET", "RENAME"))

  v_fmt <- DSSAT:::filex_v_fmt("RESIDUES")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME")


# "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 8, 14, 20, 26, 32, 38),
                             end = c(2, 8, 14, 20, 26, 32, 38, NA),
                             col_names = c("C", "CDATE", "CHCOD", "CHAMT",
                                           "CHME", "CHDEP", "CHT", "CHNAME"))

  v_fmt <- DSSAT:::filex_v_fmt("CHEMICALS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME")


# "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME"

  true_fwf_pos <- data.frame(begin = c(0, 2, 14, 20, 28, 36, 44, 52, 68),
                             end = c(2, 14, 20, 28, 36, 44, 52, 68, NA),
                             col_names = c("N", "SIMDATES", "ENDAT", "SDUR",
                                           "FODAT", "FSTRYR", "FENDYR",
                                           "FWFILE", "FONAME"))

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME")



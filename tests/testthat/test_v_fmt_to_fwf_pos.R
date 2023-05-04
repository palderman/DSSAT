test_that("@PEOPLE",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,NA_real_,   "PEOPLE" #"@PEOPLE"
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@PEOPLE",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@ADDRESS",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,NA_real_,  "ADDRESS" #"@ADDRESS"
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ADDRESS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@SITE",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,# ~check,
        0,NA_real_,     "SITE" #"@SITE"
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@SITE",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#           ~check,
        0,       7,    "PAREA",#        "@ PAREA",
        7,      13,     "PRNO",#         "  PRNO",
       13,      19,     "PLEN",#         "  PLEN",
       19,      25,     "PLDR",#         "  PLDR",
       25,      31,     "PLSP",#         "  PLSP",
       31,      37,     "PLAY",#         "  PLAY",
       37,      43,    "HAREA",#         " HAREA",
       43,      49,     "HRNO",#         "  HRNO",
       49,      55,     "HLEN",#         "  HLEN",
       55,      70,     "HARM" #"  HARM........."
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#                      ~check,
        0,    2,        "N",#                        "@N",
        2,    4,        "R",#                        " R",
        4,    6,        "O",#                        " O",
        6,    8,        "C",#                        " C",
        8,   34,    "TNAME",#" TNAME....................",
       34,   37,       "CU",#                       " CU",
       37,   40,       "FL",#                       " FL",
       40,   43,       "SA",#                       " SA",
       43,   46,       "IC",#                       " IC",
       46,   49,       "MP",#                       " MP",
       49,   52,       "MI",#                       " MI",
       52,   55,       "MF",#                       " MF",
       55,   58,       "MR",#                       " MR",
       58,   61,       "MC",#                       " MC",
       61,   64,       "MT",#                       " MT",
       64,   67,       "ME",#                       " ME",
       67,   70,       "MH",#                       " MH",
       70,   73,       "SM" #                       " SM"
  )

  v_fmt <- DSSAT:::filex_v_fmt("TREATMENTS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@C CR INGENO CNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,       2,        "C",#     "@C",
        2,       5,       "CR",#    " CR",
        5,      12,   "INGENO",#" INGENO",
       12,NA_real_,    "CNAME" # " CNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("CULTIVARS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C CR INGENO CNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#         ~check,
        0,       2,        "L",#           "@L",
        2,      11, "ID_FIELD",#    " ID_FIELD",
       11,      20,     "WSTA",#    " WSTA....",
       20,      26,     "FLSA",#       "  FLSA",
       26,      32,     "FLOB",#       "  FLOB",
       32,      38,     "FLDT",#       "  FLDT",
       38,      44,     "FLDD",#       "  FLDD",
       44,      50,     "FLDS",#       "  FLDS",
       50,      56,     "FLST",#       "  FLST",
       56,      63,     "SLTX",#      " SLTX  ",
       63,      67,     "SLDP",#         "SLDP",
       67,      80,  "ID_SOIL",#"  ID_SOIL    ",
       80,NA_real_,   "FLNAME" #       "FLNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    2,        "L",#                "@L",
        2,   18,     "XCRD",#  " ...........XCRD",
       18,   34,     "YCRD",#  " ...........YCRD",
       34,   44,     "ELEV",#        " .....ELEV",
       44,   62,     "AREA",#" .............AREA",
       62,   68,     "SLEN",#            " .SLEN",
       68,   74,     "FLWR",#            " .FLWR",
       74,   80,     "SLAS",#            " .SLAS",
       80,   86,    "FLHST",#            " FLHST",
       86,   92,    "FHDUR" #            " FHDUR"
  )

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#                          ~check,
        0,       2,        "P",#                            "@P",
        2,       8,    "PDATE",#                        " PDATE",
        8,      14,    "EDATE",#                        " EDATE",
       14,      20,     "PPOP",#                        "  PPOP",
       20,      26,     "PPOE",#                        "  PPOE",
       26,      32,     "PLME",#                        "  PLME",
       32,      38,     "PLDS",#                        "  PLDS",
       38,      44,     "PLRS",#                        "  PLRS",
       44,      50,     "PLRD",#                        "  PLRD",
       50,      56,     "PLDP",#                        "  PLDP",
       56,      62,     "PLWT",#                        "  PLWT",
       62,      68,     "PAGE",#                        "  PAGE",
       68,      74,     "PENV",#                        "  PENV",
       74,      80,     "PLPH",#                        "  PLPH",
       80,      86,     "SPRL",#                        "  SPRL",
       86,NA_real_,   "PLNAME" #"                        PLNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("PLANTING DETAILS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,       2,        "I",#     "@I",
        2,       8,     "EFIR",# "  EFIR",
        8,      14,     "IDEP",# "  IDEP",
       14,      20,     "ITHR",# "  ITHR",
       20,      26,     "IEPT",# "  IEPT",
       26,      32,     "IOFF",# "  IOFF",
       32,      38,     "IAME",# "  IAME",
       38,      44,     "IAMT",# "  IAMT",
       44,NA_real_,   "IRNAME" #" IRNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("IRRIGATION")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@I IDATE  IROP IRVAL",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "I",#    "@I",
        2,    8,    "IDATE",#" IDATE",
        8,   14,     "IROP",#"  IROP",
       14,   20,    "IRVAL" #" IRVAL"
  )

  v_fmt <- DSSAT:::filex_v_fmt("IRRIGATION")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@I IDATE  IROP IRVAL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,       2,        "F",#      "@F",
        2,       8,    "FDATE",#  " FDATE",
        8,      14,     "FMCD",#  "  FMCD",
       14,      20,     "FACD",#  "  FACD",
       20,      26,     "FDEP",#  "  FDEP",
       26,      32,     "FAMN",#  "  FAMN",
       32,      38,     "FAMP",#  "  FAMP",
       38,      44,     "FAMK",#  "  FAMK",
       44,      50,     "FAMC",#  "  FAMC",
       50,      56,     "FAMO",#  "  FAMO",
       56,      62,     "FOCD",#  "  FOCD",
       62,NA_real_,  "FERNAME" #" FERNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("FERTILIZERS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@T TDATE TIMPL  TDEP TNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,       2,        "T",#    "@T",
        2,       8,    "TDATE",#" TDATE",
        8,      14,    "TIMPL",#" TIMPL",
       14,      20,     "TDEP",#"  TDEP",
       20,NA_real_,    "TNAME" #" TNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("TILLAGE")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@T TDATE TIMPL  TDEP TNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,       2,        "H",#    "@H",
        2,       8,    "HDATE",#" HDATE",
        8,      14,     "HSTG",#"  HSTG",
       14,      20,     "HCOM",#"  HCOM",
       20,      26,    "HSIZE",#" HSIZE",
       26,      32,      "HPC",#"   HPC",
       32,      38,     "HBPC",#"  HBPC",
       38,NA_real_,    "HNAME" #" HNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("HARVEST")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#                       ~check,
        0,       2,        "N",#                         "@N",
        2,      14,  "GENERAL",#              " GENERAL     ",
       14,      20,    "NYERS",#                      "NYERS",
       20,      26,    "NREPS",#                     " NREPS",
       26,      32,    "START",#                     " START",
       32,      38,    "SDATE",#                     " SDATE",
       38,      44,    "RSEED",#                     " RSEED",
       44,      70,    "SNAME",# " SNAME....................",
       70,      79,   "SMODEL" #                    " SMODEL"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "OPTIONS",#" OPTIONS     ",
       14,   20,    "WATER",#        "WATER",
       20,   26,    "NITRO",#       " NITRO",
       26,   32,    "SYMBI",#       " SYMBI",
       32,   38,    "PHOSP",#       " PHOSP",
       38,   44,    "POTAS",#       " POTAS",
       44,   50,    "DISES",#       " DISES",
       50,   56,     "CHEM",#       "  CHEM",
       56,   62,     "TILL",#       "  TILL",
       62,   68,      "CO2" #       "   CO2"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "METHODS",#" METHODS     ",
       14,   20,    "WTHER",#        "WTHER",
       20,   26,    "INCON",#       " INCON",
       26,   32,    "LIGHT",#       " LIGHT",
       32,   38,    "EVAPO",#       " EVAPO",
       38,   44,    "INFIL",#       " INFIL",
       44,   50,    "PHOTO",#       " PHOTO",
       50,   56,    "HYDRO",#       " HYDRO",
       56,   62,    "NSWIT",#       " NSWIT",
       62,   68,    "MESOM",#       " MESOM",
       68,   74,    "MESEV",#       " MESEV",
       74,   80,    "MESOL" #       " MESOL"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,  ~col_names,#         ~check,
        0,    2,         "N",#           "@N",
        2,   14,"MANAGEMENT",#" MANAGEMENT  ",
       14,   20,     "PLANT",#        "PLANT",
       20,   26,     "IRRIG",#       " IRRIG",
       26,   32,     "FERTI",#       " FERTI",
       32,   38,     "RESID",#       " RESID",
       38,   44,     "HARVS" #       " HARVS"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "OUTPUTS",#" OUTPUTS     ",
       14,   20,    "FNAME",#        "FNAME",
       20,   26,    "OVVEW",#       " OVVEW",
       26,   32,    "SUMRY",#       " SUMRY",
       32,   38,    "FROPT",#       " FROPT",
       38,   44,    "GROUT",#       " GROUT",
       44,   50,    "CAOUT",#       " CAOUT",
       50,   56,    "WAOUT",#       " WAOUT",
       56,   62,    "NIOUT",#       " NIOUT",
       62,   68,    "MIOUT",#       " MIOUT",
       68,   74,    "DIOUT",#       " DIOUT",
       74,   80,    "VBOSE",#       " VBOSE",
       80,   86,    "CHOUT",#       " CHOUT",
       86,   92,    "OPOUT",#       " OPOUT",
       92,   98,    "FMOPT" #       " FMOPT"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14, "PLANTING",#" PLANTING    ",
       14,   20,    "PFRST",#        "PFRST",
       20,   26,    "PLAST",#       " PLAST",
       26,   32,    "PH2OL",#       " PH2OL",
       32,   38,    "PH2OU",#       " PH2OU",
       38,   44,    "PH2OD",#       " PH2OD",
       44,   50,    "PSTMX",#       " PSTMX",
       50,   56,    "PSTMN" #       " PSTMN"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,  ~col_names,#         ~check,
        0,    2,         "N",#           "@N",
        2,   14,"IRRIGATION",#" IRRIGATION  ",
       14,   20,     "IMDEP",#        "IMDEP",
       20,   26,     "ITHRL",#       " ITHRL",
       26,   32,     "ITHRU",#       " ITHRU",
       32,   38,     "IROFF",#       " IROFF",
       38,   44,     "IMETH",#       " IMETH",
       44,   50,     "IRAMT",#       " IRAMT",
       50,   56,     "IREFF" #       " IREFF"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14, "NITROGEN",#" NITROGEN    ",
       14,   20,    "NMDEP",#        "NMDEP",
       20,   26,    "NMTHR",#       " NMTHR",
       26,   32,    "NAMNT",#       " NAMNT",
       32,   38,    "NCODE",#       " NCODE",
       38,   44,    "NAOFF" #       " NAOFF"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N RESIDUES    RIPCN RTIME RIDEP",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14, "RESIDUES",#" RESIDUES    ",
       14,   20,    "RIPCN",#        "RIPCN",
       20,   26,    "RTIME",#       " RTIME",
       26,   32,    "RIDEP" #       " RIDEP"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N RESIDUES    RIPCN RTIME RIDEP",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N HARVEST     HFRST HLAST HPCNP HPCNR",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "HARVEST",#" HARVEST     ",
       14,   20,    "HFRST",#        "HFRST",
       20,   26,    "HLAST",#       " HLAST",
       26,   32,    "HPCNP",#       " HPCNP",
       32,   38,    "HPCNR" #       " HPCNR"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N HARVEST     HFRST HLAST HPCNP HPCNR",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,       2,        "C",#     "@C",
        2,       8,      "PCR",# "   PCR",
        8,      14,    "ICDAT",# " ICDAT",
       14,      20,     "ICRT",# "  ICRT",
       20,      26,     "ICND",# "  ICND",
       26,      32,     "ICRN",# "  ICRN",
       32,      38,     "ICRE",# "  ICRE",
       38,      44,     "ICWD",# "  ICWD",
       44,      50,    "ICRES",# " ICRES",
       50,      56,    "ICREN",# " ICREN",
       56,      62,    "ICREP",# " ICREP",
       62,      68,    "ICRIP",# " ICRIP",
       68,      74,    "ICRID",# " ICRID",
       74,NA_real_,   "ICNAME" #" ICNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("INITIAL CONDITIONS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@C  ICBL  SH2O  SNH4  SNO3",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "C",#    "@C",
        2,    8,     "ICBL",#"  ICBL",
        8,   14,     "SH2O",#"  SH2O",
       14,   20,     "SNH4",#"  SNH4",
       20,   26,     "SNO3" #"  SNO3"
  )

  v_fmt <- DSSAT:::filex_v_fmt("INITIAL CONDITIONS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C  ICBL  SH2O  SNH4  SNO3",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@NOTES",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,NA_real_,    "NOTES" #"@NOTES"
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@NOTES",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#     ~check,
        0,       2,        "E",#       "@E",
        2,       8,    "ODATE",#   " ODATE",
        8,      15,     "EDAY",#  " EDAY  ",
       15,      21,     "ERAD",#   "ERAD  ",
       21,      27,     "EMAX",#   "EMAX  ",
       27,      33,     "EMIN",#   "EMIN  ",
       33,      39,    "ERAIN",#   "ERAIN ",
       39,      45,     "ECO2",#   "ECO2  ",
       45,      51,     "EDEW",#   "EDEW  ",
       51,      57,    "EWIND",#   "EWIND ",
       57,NA_real_,  "ENVNAME" #"ENVNAME  "
  )

  v_fmt <- DSSAT:::filex_v_fmt("ENVIRONMENT")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@A SADAT  SMHB  SMPX  SMKE  SANAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    2,        "A",#      "@A",
        2,    8,    "SADAT",#  " SADAT",
        8,   14,     "SMHB",#  "  SMHB",
       14,   20,     "SMPX",#  "  SMPX",
       20,   26,     "SMKE",#  "  SMKE",
       26,   NA,   "SANAME" #"  SANAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SOIL ANALYSIS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "A",#    "@A",
        2,    8,     "SABL",#"  SABL",
        8,   14,     "SADM",#"  SADM",
       14,   20,     "SAOC",#"  SAOC",
       20,   26,     "SANI",#"  SANI",
       26,   32,    "SAPHW",#" SAPHW",
       32,   38,    "SAPHB",#" SAPHB",
       38,   44,     "SAPX",#"  SAPX",
       44,   50,     "SAKE",#"  SAKE",
       50,   56,     "SASC" #"  SASC"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SOIL ANALYSIS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "OUTPUTS",#" OUTPUTS     ",
       14,   20,    "FNAME",#        "FNAME",
       20,   26,    "OVVEW",#       " OVVEW",
       26,   32,    "SUMRY",#       " SUMRY",
       32,   38,    "FROPT",#       " FROPT",
       38,   44,    "GROUT",#       " GROUT",
       44,   50,    "CAOUT",#       " CAOUT",
       50,   56,    "WAOUT",#       " WAOUT",
       56,   62,    "NIOUT",#       " NIOUT",
       62,   68,    "MIOUT",#       " MIOUT",
       68,   74,    "DIOUT",#       " DIOUT",
       74,   80,    "VBOSE",#       " VBOSE",
       80,   86,    "CHOUT",#       " CHOUT",
       86,   92,    "OPOUT" #       " OPOUT"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#              ~check,
        0,    2,        "L",#                "@L",
        2,   18,     "XCRD",#  " ...........XCRD",
       18,   34,     "YCRD",#  " ...........YCRD",
       34,   44,     "ELEV",#        " .....ELEV",
       44,   62,     "AREA",#" .............AREA",
       62,   68,     "SLEN",#            " .SLEN",
       68,   74,     "FLWR",#            " .FLWR",
       74,   80,     "SLAS" #            " .SLAS"
  )

  v_fmt <- DSSAT:::filex_v_fmt("FIELDS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "OPTIONS",#" OPTIONS     ",
       14,   20,    "WATER",#        "WATER",
       20,   26,    "NITRO",#       " NITRO",
       26,   32,    "SYMBI",#       " SYMBI",
       32,   38,    "PHOSP",#       " PHOSP",
       38,   44,    "POTAS",#       " POTAS",
       44,   50,    "DISES",#       " DISES",
       50,   56,     "CHEM",#       "  CHEM",
       56,   62,     "TILL" #       "  TILL"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "METHODS",#" METHODS     ",
       14,   20,    "WTHER",#        "WTHER",
       20,   26,    "INCON",#       " INCON",
       26,   32,    "LIGHT",#       " LIGHT",
       32,   38,    "EVAPO",#       " EVAPO",
       38,   44,    "INFIL",#       " INFIL",
       44,   50,    "PHOTO",#       " PHOTO",
       50,   56,    "HYDRO",#       " HYDRO",
       56,   62,    "NSWIT",#       " NSWIT",
       62,   68,    "MESOM" #       " MESOM"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   14,  "OUTPUTS",#" OUTPUTS     ",
       14,   20,    "FNAME",#        "FNAME",
       20,   26,    "OVVEW",#       " OVVEW",
       26,   32,    "SUMRY",#       " SUMRY",
       32,   38,    "FROPT",#       " FROPT",
       38,   44,    "GROUT",#       " GROUT",
       44,   50,    "CAOUT",#       " CAOUT",
       50,   56,    "WAOUT",#       " WAOUT",
       56,   62,    "NIOUT",#       " NIOUT",
       62,   68,    "MIOUT",#       " MIOUT",
       68,   74,    "DIOUT",#       " DIOUT",
       74,   80,     "LONG",#       "  LONG",
       80,   86,    "CHOUT",#       " CHOUT",
       86,   92,    "OPOUT" #       " OPOUT"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#          ~check,
        0,    7,    "PAREA",#       "@ PAREA",
        7,   13,     "PRNO",#        "  PRNO",
       13,   19,     "PLEN",#        "  PLEN",
       19,   25,     "PLDR",#        "  PLDR",
       25,   31,     "PLSP",#        "  PLSP",
       31,   37,     "PLAY",#        "  PLAY",
       37,   43,    "HAREA",#        " HAREA",
       43,   49,     "HRNO",#        "  HRNO",
       49,   55,     "HLEN",#        "  HLEN",
       55,   70,     "HARM" #" HARM........."
  )

  v_fmt <- DSSAT:::filex_v_fmt("GENERAL")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#                      ~check,
        0,       2,        "N",#                        "@N",
        2,      14,  "GENERAL",#             " GENERAL     ",
       14,      20,    "NYERS",#                     "NYERS",
       20,      26,    "NREPS",#                    " NREPS",
       26,      32,    "START",#                    " START",
       32,      38,    "SDATE",#                    " SDATE",
       38,      44,    "RSEED",#                    " RSEED",
       44,      70,    "SNAME",#" SNAME....................",
       70,      79,    "MODEL" #                    " MODEL"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,       2,        "R",#     "@R",
        2,       8,    "RDATE",# " RDATE",
        8,      14,     "RCOD",# "  RCOD",
       14,      20,     "RAMT",# "  RAMT",
       20,      26,     "RESN",# "  RESN",
       26,      32,     "RESP",# "  RESP",
       32,      38,     "RESK",# "  RESK",
       38,      44,     "RINP",# "  RINP",
       44,      50,     "RDEP",# "  RDEP",
       50,      56,     "RMET",# "  RMET",
       56,NA_real_,   "RENAME" #" RENAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("RESIDUES")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,       2,        "C",#      "@C",
        2,       8,    "CDATE",#  " CDATE",
        8,      14,    "CHCOD",#  " CHCOD",
       14,      20,    "CHAMT",#  " CHAMT",
       20,      26,     "CHME",#  "  CHME",
       26,      32,    "CHDEP",#  " CHDEP",
       32,      38,      "CHT",#"   CHT..",
       38,NA_real_,   "CHNAME" #  "CHNAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("CHEMICALS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})

test_that("@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME",{

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    2,        "N",#               "@N",
        2,   14, "SIMDATES",#        " SIMDATES",
       14,   20,    "ENDAT",#        "    ENDAT",
       20,   28,     "SDUR",#         "    SDUR",
       28,   36,    "FODAT",#         "   FODAT",
       36,   44,   "FSTRYR",#         "  FSTRYR",
       44,   52,   "FENDYR",#         "  FENDYR",
       52,   68,   "FWFILE",#          " FWFILE",
       68,   NA,   "FONAME" #"           FONAME"
  )

  v_fmt <- DSSAT:::filex_v_fmt("SIMULATION CONTROLS")

  check_fwf_pos <- DSSAT:::v_fmt_to_fwf_pos(header = "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME",
                                            v_fmt = v_fmt)

  expect_identical(check_fwf_pos, true_fwf_pos)

})


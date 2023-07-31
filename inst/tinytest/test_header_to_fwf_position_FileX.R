# "@PEOPLE"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,NA_real_,   "PEOPLE" #"@PEOPLE"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ADDRESS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ADDRESS")

# "@SITE"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,# ~check,
        0,NA_real_,     "SITE" #"@SITE"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@SITE",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@SITE")

# "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM........."

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
       55,NA_real_,     "HARM" #"  HARM........."
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........")

# "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM")

# "@C CR INGENO CNAME"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#   ~check,
        0,       2,        "C",#     "@C",
        2,       5,       "CR",#    " CR",
        5,      12,   "INGENO",#" INGENO",
       12,NA_real_,    "CNAME" # " CNAME"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@C CR INGENO CNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C CR INGENO CNAME")

# "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME")

# "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR")

# "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME")

# "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME")

# "@I IDATE  IROP IRVAL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "I",#    "@I",
        2,    8,    "IDATE",#" IDATE",
        8,   14,     "IROP",#"  IROP",
       14,   20,    "IRVAL" #" IRVAL"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@I IDATE  IROP IRVAL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@I IDATE  IROP IRVAL")

# "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME")

# "@T TDATE TIMPL  TDEP TNAME"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,       2,        "T",#    "@T",
        2,       8,    "TDATE",#" TDATE",
        8,      14,    "TIMPL",#" TIMPL",
       14,      20,     "TDEP",#"  TDEP",
       20,NA_real_,    "TNAME" #" TNAME"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@T TDATE TIMPL  TDEP TNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@T TDATE TIMPL  TDEP TNAME")

# "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME")

# "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#                       ~check,
        0,       2,        "N",#                         "@N",
        2,      15,  "GENERAL",#              " GENERAL     ",
       15,      20,    "NYERS",#                      "NYERS",
       20,      26,    "NREPS",#                     " NREPS",
       26,      32,    "START",#                     " START",
       32,      38,    "SDATE",#                     " SDATE",
       38,      44,    "RSEED",#                     " RSEED",
       44,      71,    "SNAME",#" SNAME.................... ",
       71,NA_real_,   "SMODEL" #                     "SMODEL"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL")

# "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "OPTIONS",#" OPTIONS     ",
       15,   20,    "WATER",#        "WATER",
       20,   26,    "NITRO",#       " NITRO",
       26,   32,    "SYMBI",#       " SYMBI",
       32,   38,    "PHOSP",#       " PHOSP",
       38,   44,    "POTAS",#       " POTAS",
       44,   50,    "DISES",#       " DISES",
       50,   56,     "CHEM",#       "  CHEM",
       56,   62,     "TILL",#       "  TILL",
       62,   68,      "CO2" #       "   CO2"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2")

# "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "METHODS",#" METHODS     ",
       15,   20,    "WTHER",#        "WTHER",
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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL")

# "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,  ~col_names,#         ~check,
        0,    2,         "N",#           "@N",
        2,   15,"MANAGEMENT",#" MANAGEMENT  ",
       15,   20,     "PLANT",#        "PLANT",
       20,   26,     "IRRIG",#       " IRRIG",
       26,   32,     "FERTI",#       " FERTI",
       32,   38,     "RESID",#       " RESID",
       38,   44,     "HARVS" #       " HARVS"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS")

# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "OUTPUTS",#" OUTPUTS     ",
       15,   20,    "FNAME",#        "FNAME",
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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT")

# "@  AUTOMATIC MANAGEMENT"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end,  ~col_names,#        ~check,
        0,      12, "AUTOMATIC",#"@  AUTOMATIC",
       12,NA_real_,"MANAGEMENT" # " MANAGEMENT"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@  AUTOMATIC MANAGEMENT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@  AUTOMATIC MANAGEMENT")

# "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15, "PLANTING",#" PLANTING    ",
       15,   20,    "PFRST",#        "PFRST",
       20,   26,    "PLAST",#       " PLAST",
       26,   32,    "PH2OL",#       " PH2OL",
       32,   38,    "PH2OU",#       " PH2OU",
       38,   44,    "PH2OD",#       " PH2OD",
       44,   50,    "PSTMX",#       " PSTMX",
       50,   56,    "PSTMN" #       " PSTMN"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN")

# "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end,  ~col_names,#         ~check,
        0,    2,         "N",#           "@N",
        2,   15,"IRRIGATION",#" IRRIGATION  ",
       15,   20,     "IMDEP",#        "IMDEP",
       20,   26,     "ITHRL",#       " ITHRL",
       26,   32,     "ITHRU",#       " ITHRU",
       32,   38,     "IROFF",#       " IROFF",
       38,   44,     "IMETH",#       " IMETH",
       44,   50,     "IRAMT",#       " IRAMT",
       50,   56,     "IREFF" #       " IREFF"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF")

# "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15, "NITROGEN",#" NITROGEN    ",
       15,   20,    "NMDEP",#        "NMDEP",
       20,   26,    "NMTHR",#       " NMTHR",
       26,   32,    "NAMNT",#       " NAMNT",
       32,   38,    "NCODE",#       " NCODE",
       38,   44,    "NAOFF" #       " NAOFF"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF")

# "@N RESIDUES    RIPCN RTIME RIDEP"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15, "RESIDUES",#" RESIDUES    ",
       15,   20,    "RIPCN",#        "RIPCN",
       20,   26,    "RTIME",#       " RTIME",
       26,   32,    "RIDEP" #       " RIDEP"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N RESIDUES    RIPCN RTIME RIDEP",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N RESIDUES    RIPCN RTIME RIDEP")

# "@N HARVEST     HFRST HLAST HPCNP HPCNR"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "HARVEST",#" HARVEST     ",
       15,   20,    "HFRST",#        "HFRST",
       20,   26,    "HLAST",#       " HLAST",
       26,   32,    "HPCNP",#       " HPCNP",
       32,   38,    "HPCNR" #       " HPCNR"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N HARVEST     HFRST HLAST HPCNP HPCNR",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N HARVEST     HFRST HLAST HPCNP HPCNR")

# "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME")

# "@C  ICBL  SH2O  SNH4  SNO3"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#  ~check,
        0,    2,        "C",#    "@C",
        2,    8,     "ICBL",#"  ICBL",
        8,   14,     "SH2O",#"  SH2O",
       14,   20,     "SNH4",#"  SNH4",
       20,   26,     "SNO3" #"  SNO3"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@C  ICBL  SH2O  SNH4  SNO3",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C  ICBL  SH2O  SNH4  SNO3")

# "@NOTES"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#  ~check,
        0,NA_real_,    "NOTES" #"@NOTES"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@NOTES",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@NOTES")

# "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  "

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  ")

# "@A SADAT  SMHB  SMPX  SMKE  SANAME"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#    ~check,
        0,    2,        "A",#      "@A",
        2,    8,    "SADAT",#  " SADAT",
        8,   14,     "SMHB",#  "  SMHB",
       14,   20,     "SMPX",#  "  SMPX",
       20,   26,     "SMKE",#  "  SMKE",
       26,   34,   "SANAME" #"  SANAME"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@A SADAT  SMHB  SMPX  SMKE  SANAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@A SADAT  SMHB  SMPX  SMKE  SANAME")

# "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC")

# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "OUTPUTS",#" OUTPUTS     ",
       15,   20,    "FNAME",#        "FNAME",
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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT")

# "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS")

# "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "OPTIONS",#" OPTIONS     ",
       15,   20,    "WATER",#        "WATER",
       20,   26,    "NITRO",#       " NITRO",
       26,   32,    "SYMBI",#       " SYMBI",
       32,   38,    "PHOSP",#       " PHOSP",
       38,   44,    "POTAS",#       " POTAS",
       44,   50,    "DISES",#       " DISES",
       50,   56,     "CHEM",#       "  CHEM",
       56,   62,     "TILL" #       "  TILL"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL")

# "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "METHODS",#" METHODS     ",
       15,   20,    "WTHER",#        "WTHER",
       20,   26,    "INCON",#       " INCON",
       26,   32,    "LIGHT",#       " LIGHT",
       32,   38,    "EVAPO",#       " EVAPO",
       38,   44,    "INFIL",#       " INFIL",
       44,   50,    "PHOTO",#       " PHOTO",
       50,   56,    "HYDRO",#       " HYDRO",
       56,   62,    "NSWIT",#       " NSWIT",
       62,   68,    "MESOM" #       " MESOM"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM")

# "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#         ~check,
        0,    2,        "N",#           "@N",
        2,   15,  "OUTPUTS",#" OUTPUTS     ",
       15,   20,    "FNAME",#        "FNAME",
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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT")

# "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM........."

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
       55,   69,     "HARM" #" HARM........."
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM.........")

# "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#                      ~check,
        0,       2,        "N",#                        "@N",
        2,      15,  "GENERAL",#             " GENERAL     ",
       15,      20,    "NYERS",#                     "NYERS",
       20,      26,    "NREPS",#                    " NREPS",
       26,      32,    "START",#                    " START",
       32,      38,    "SDATE",#                    " SDATE",
       38,      44,    "RSEED",#                    " RSEED",
       44,      70,    "SNAME",#" SNAME....................",
       70,NA_real_,    "MODEL" #                    " MODEL"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL")

# "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME"

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

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME")

# "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME"

  true_fwf_pos <- tibble::tribble(
   ~begin,    ~end, ~col_names,#    ~check,
        0,       2,        "C",#      "@C",
        2,       8,    "CDATE",#  " CDATE",
        8,      14,    "CHCOD",#  " CHCOD",
       14,      20,    "CHAMT",#  " CHAMT",
       20,      26,     "CHME",#  "  CHME",
       26,      32,    "CHDEP",#  " CHDEP",
       32,      40,      "CHT",#"   CHT..",
       40,NA_real_,   "CHNAME" #  "CHNAME"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME")

# "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME"

  true_fwf_pos <- tibble::tribble(
   ~begin, ~end, ~col_names,#             ~check,
        0,    2,        "N",#               "@N",
        2,   11, "SIMDATES",#        " SIMDATES",
       11,   20,    "ENDAT",#        "    ENDAT",
       20,   28,     "SDUR",#         "    SDUR",
       28,   36,    "FODAT",#         "   FODAT",
       36,   44,   "FSTRYR",#         "  FSTRYR",
       44,   52,   "FENDYR",#         "  FENDYR",
       52,   59,   "FWFILE",#          " FWFILE",
       59,   76,   "FONAME" #"           FONAME"
  )

  col_names <-   c(" +N(?= |$)", " +R(?= |$)", " +O(?= |$)", " +C(?= |$)", " +L(?= |$)",
  " +P(?= |$)", " +F(?= |$)", " +T(?= |$)", " +H(?= |$)", " +I(?= |$)",
  " +A(?= |$)", " +E(?= |$)", " CU(?= |$)", " FL(?= |$)", " SA(?= |$)",
  " IC(?= |$)", " MP(?= |$)", " MI(?= |$)", " MF(?= |$)", " MR(?= |$)",
  " MC(?= |$)", " MT(?= |$)", " ME(?= |$)", " MH(?= |$)", " SM(?= |$)",
  "  FLSA")

  left_just <-   c("SITE", "PEOPLE", "ADDRESS", "INSTRUMENTS", "PROBLEMS", "PUBLICATIONS",
  "DISTRIBUTION", "NOTES", "  HARM\\.*", " TNAME\\.*", "FLNAME",
  "  ID_SOIL", " CNAME", " WSTA\\.*", " SLTX", " ID_FIELD", " ICNAME",
  " IRNAME", " FERNAME", " GENERAL", " SNAME\\.*", "SMODEL", " MODEL",
  " OPTIONS", " METHODS", " MANAGEMENT", " OUTPUTS", " PLANTING",
  " IRRIGATION", " NITROGEN", " RESIDUES", " HARVEST", " EDAY",
  "ERAD", "EMAX", "EMIN", "ERAIN", "ECO2", "EDEW", "EWIND", "ENVNAME",
  " HNAME", " CHT\\.*", " RENAME", " +PLNAME", "CHNAME")

  check_fwf_pos <- DSSAT:::header_to_fwf_position("@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME",
                                          col_names = col_names,
                                          left_justified = left_just)

  expect_identical(check_fwf_pos, true_fwf_pos,
                   info = "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME")


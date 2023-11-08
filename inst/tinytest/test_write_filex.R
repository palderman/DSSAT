# "GENERAL"

  filex_input <- list(GENERAL = structure(list(
      PEOPLE = "First Contributor; Second Contributor",
      ADDRESS = "Agricultural Research Institute",
      SITE = "Somewhere, Someplace",
      PAREA = 2L, PRNO = 2L, PLEN = 2L, PLDR = 2L, PLSP = 2L, PLAY = "RCBD",
      HAREA = 1L, HRNO = 1L, HLEN = 0.5, HARM = "Clipping",
      NOTES = list(c("Additional notes", "go on these", "lines"))
    ),
    class = "data.frame",
    row.names = c(NA, -1L),
    tier_info = list(
      "PEOPLE",
      "ADDRESS",
      "SITE",
      c("PAREA", "PRNO", "PLEN", "PLDR", "PLSP", "PLAY", "HAREA", "HRNO",
        "HLEN", "HARM"),
      "NOTES")))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*GENERAL",
                "@PEOPLE",
                "First Contributor; Second Contributor",
                "@ADDRESS",
                "Agricultural Research Institute",
                "@SITE",
                "Somewhere, Someplace",
                "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",
                "      2     2     2     2     2  RCBD     1     1   0.5  Clipping     ",
                "@NOTES",
                "Additional notes",
                "go on these",
                "lines",
                "")

  expect_equal(actual, expected,
               info = "GENERAL")


# "TREATMENTS single"

  filex_input <- list("TREATMENTS" = structure(list(
    N = 1L, R = 0L, O = 0L, C = 0L, TNAME = "Control - 350 ppm",
    CU = 1L, FL = 1L, SA = 0L, IC = 1L, MP = 1L, MI = 1L, MF = 1L,
    MR = 0L, MC = 1L, MT = 0L, ME = 1L, MH = 0L, SM = 1L),
    class = c("DSSAT_tbl", "data.frame"), row.names = c(NA, -1L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*TREATMENTS                        -------------FACTOR LEVELS------------",
                "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
                " 1 0 0 0 Control - 350 ppm          1  1  0  1  1  1  1  0  1  0  1  0  1",
                ""
  )

  expect_equal(actual, expected,
               info = "TREATMENTS single")


# "TREATMENTS two"

  filex_input <- list("TREATMENTS" = structure(list(
    N = 1:2,
    R = c(0L, 0L),
    O = c(0L, 0L),
    C = c(0L, 0L),
    TNAME = c("Control - 350 ppm", "CO2 Enrichment - 550 ppm"),
    CU = c(1L, 1L),
    FL = c(1L, 1L),
    SA = c(0L, 0L),
    IC = c(1L, 1L),
    MP = c(1L, 1L),
    MI = c(1L, 1L),
    MF = c(1L, 1L),
    MR = c(0L, 0L),
    MC = c(1L, 1L),
    MT = c(0L, 0L),
    ME = 1:2,
    MH = c(0L, 0L),
    SM = c(1L, 1L)), class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -2L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*TREATMENTS                        -------------FACTOR LEVELS------------",
                "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
                " 1 0 0 0 Control - 350 ppm          1  1  0  1  1  1  1  0  1  0  1  0  1",
                " 2 0 0 0 CO2 Enrichment - 550 ppm   1  1  0  1  1  1  1  0  1  0  2  0  1",
                ""
  )

  expect_equal(actual, expected,
               info = "TREATMENTS two")


# "CULTIVARS single"

  filex_input <- list(CULTIVARS = structure(list(
    C = 1L,
    CR = "CO",
    INGENO = "IB0001",
    CNAME = "Deltapine 77"), class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*CULTIVARS",
                "@C CR INGENO CNAME",
                " 1 CO IB0001 Deltapine 77",
                "")

  expect_equal(actual, expected,
               info = "CULTIVARS single")



# "CULTIVARS multiple"

  filex_input <- list(CULTIVARS = structure(list(
    C = 1:4,
    CR = c("PN", "PN", "PN", "PN"),
    INGENO = c("IB0002", "IB0031", "IB0015", "IB0032"),
    CNAME = c("FLORUNNER, STD", "F81206,LS-RES RU",
              "SOUTHERN RUNNER", "MA72x94-12,LS-RE")),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -4L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*CULTIVARS",
                "@C CR INGENO CNAME",
                " 1 PN IB0002 FLORUNNER, STD",
                " 2 PN IB0031 F81206,LS-RES RU",
                " 3 PN IB0015 SOUTHERN RUNNER",
                " 4 PN IB0032 MA72x94-12,LS-RE",
                "")

  expect_equal(actual, expected,
               info = "CULTIVARS multiple")


# "FIELDS single"

  filex_input <- list(FIELDS = structure(list(
    L = 1L, ID_FIELD = "UFQU0001", WSTA = "UFQU9501",
    FLSA = NA_character_, FLOB = 0L, FLDT = "DR000", FLDD = 0L,
    FLDS = 0L, FLST = 0L, SLTX = "SL", SLDP = 180L, ID_SOIL = "IBTM910017",
    FLNAME = NA_character_, XCRD = NA_real_, YCRD = NA_real_,
    ELEV = NA_real_, AREA = NA_real_, SLEN = NA_real_, FLWR = NA_real_,
    SLAS = NA_real_, FLHST = NA_character_, FHDUR = NA_real_),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(
      c("L", "ID_FIELD", "WSTA", "FLSA", "FLOB", "FLDT", "FLDD",
        "FLDS", "FLST", "SLTX", "SLDP", "ID_SOIL", "FLNAME"),
      c("L", "XCRD", "YCRD", "ELEV", "AREA", "SLEN", "FLWR", "SLAS",
        "FLHST", "FHDUR"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*FIELDS",
                "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
                " 1 UFQU0001 UFQU9501   -99     0 DR000     0     0     0 SL     180  IBTM910017 -99",
                "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
                " 1             -99             -99       -99               -99   -99   -99   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "FIELDS single")


# "FIELDS multiple"

  filex_input <- list(FIELDS = structure(list(
    L = 1:4,
    ID_FIELD = c("UFQU0001", "UFQU0002", "UFQU0003", "UFQU0004"),
    WSTA = c("UFQU9501", "UFQU9501", "UFQU9501", "UFQU9501"),
    FLSA = c(NA_character_, NA_character_, NA_character_, NA_character_),
    FLOB = c(0L, 0L, 0L, 0L),
    FLDT = c("DR000", "DR000", "DR000", "DR000"),
    FLDD = c(0L, 0L, 0L, 0L),
    FLDS = c(0L, 0L, 0L, 0L),
    FLST = c(0L, 0L, 0L, 0L),
    SLTX = c("SL", "SA", "SA", "SA"),
    SLDP = c(180L, 180L, 180L, 180L),
    ID_SOIL = c("IBTM910017", "UFQU950002", "UFQU950003", "UFQU950004"),
    FLNAME = c(NA_character_, NA_character_, NA_character_, NA_character_),
    XCRD = c(NA_real_, NA_real_, NA_real_, NA_real_),
    YCRD = c(NA_real_, NA_real_, NA_real_, NA_real_),
    ELEV = c(NA_real_, NA_real_, NA_real_, NA_real_),
    AREA = c(NA_real_, NA_real_, NA_real_, NA_real_),
    SLEN = c(NA_real_, NA_real_, NA_real_, NA_real_),
    FLWR = c(NA_real_, NA_real_, NA_real_, NA_real_),
    SLAS = c(NA_real_, NA_real_, NA_real_, NA_real_),
    FLHST = c(NA_character_, NA_character_, NA_character_, NA_character_),
    FHDUR = c(NA_real_, NA_real_, NA_real_, NA_real_)),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -4L),
    tier_info = list(c("L", "ID_FIELD", "WSTA", "FLSA", "FLOB",
                       "FLDT", "FLDD", "FLDS", "FLST", "SLTX",
                       "SLDP", "ID_SOIL", "FLNAME"),
                     c("L", "XCRD", "YCRD", "ELEV", "AREA", "SLEN",
                       "FLWR", "SLAS", "FLHST", "FHDUR"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*FIELDS",
                "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
                " 1 UFQU0001 UFQU9501   -99     0 DR000     0     0     0 SL     180  IBTM910017 -99",
                " 2 UFQU0002 UFQU9501   -99     0 DR000     0     0     0 SA     180  UFQU950002 -99",
                " 3 UFQU0003 UFQU9501   -99     0 DR000     0     0     0 SA     180  UFQU950003 -99",
                " 4 UFQU0004 UFQU9501   -99     0 DR000     0     0     0 SA     180  UFQU950004 -99",
                "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
                " 1             -99             -99       -99               -99   -99   -99   -99   -99   -99",
                " 2             -99             -99       -99               -99   -99   -99   -99   -99   -99",
                " 3             -99             -99       -99               -99   -99   -99   -99   -99   -99",
                " 4             -99             -99       -99               -99   -99   -99   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "FIELDS multiple")


# "SOIL ANALYSIS single"

  filex_input <- list("SOIL ANALYSIS" = structure(list(
    A = 1L,
    SADAT = structure(1065744000, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    SMHB = NA_character_, SMPX = "SA002", SMKE = NA_character_,
    SANAME = NA_character_, SABL = 5L, SADM = NA_real_, SAOC = 0.48,
    SANI = NA_real_, SAPHW = NA_real_, SAPHB = NA_real_, SAPX = 2.2,
    SAKE = NA_real_, SASC = 0.47),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(
      c("A", "SADAT", "SMHB", "SMPX", "SMKE", "SANAME"),
      c("A", "SABL", "SADM", "SAOC", "SANI", "SAPHW", "SAPHB", "SAPX",
        "SAKE", "SASC"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*SOIL ANALYSIS",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 1 03283   -99 SA002   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 1     5   -99  0.48   -99   -99   -99   2.2   -99 0.470",
                "")

  expect_equal(actual, expected,
               info = "SOIL ANALYSIS single")


# "SOIL ANALYSIS single - missing"

  filex_input <- list("SOIL ANALYSIS" = structure(list(
    A = 1L,
    SADAT = structure(NA_real_, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    SMHB = NA_character_, SMPX = NA_character_, SMKE = NA_character_,
    SANAME = NA_character_, SABL = 15L, SADM = NA_real_, SAOC = NA_real_,
    SANI = NA_real_, SAPHW = NA_real_, SAPHB = NA_real_, SAPX = NA_real_,
    SAKE = NA_real_, SASC = NA_real_),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(
      c("A", "SADAT", "SMHB", "SMPX", "SMKE", "SANAME"),
      c("A", "SABL", "SADM", "SAOC", "SANI", "SAPHW", "SAPHB", "SAPX",
        "SAKE", "SASC"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*SOIL ANALYSIS",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 1   -99   -99   -99   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 1    15   -99   -99   -99   -99   -99   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "SOIL ANALYSIS single - missing")


# "SOIL ANALYSIS multiple"

  filex_input <- list("SOIL ANALYSIS" = structure(list(
    A = 1:4,
    SADAT = structure(c(1065744000, 1065744000, 1065744000, 1065744000),
                      tzone = "UTC", class = c("POSIXct", "POSIXt")),
    SMHB = c(NA_character_, NA_character_, NA_character_, NA_character_),
    SMPX = c("SA002", "SA002", "SA002", "SA002"),
    SMKE = c(NA_character_, NA_character_, NA_character_, NA_character_),
    SANAME = c(NA_character_, NA_character_, NA_character_, NA_character_),
    SABL = list(c(5L, 20L, 40L, 60L, 90L),
                c(5L, 20L, 40L, 60L, 90L),
                c(5L, 20L, 40L, 60L, 90L),
                c(5L, 20L, 40L, 60L, 90L)),
    SADM = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SAOC = list(c(0.48, 0.44, 0.35, 0.35, 0.34),
                c(0.49, 0.44, 0.35, 0.35, 0.34),
                c(0.49, 0.44, 0.35, 0.35, 0.34),
                c(0.48, 0.44, 0.35, 0.35, 0.34)),
    SANI = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SAPHW = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SAPHB = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                 c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SAPX = list(c(2.2, 2.3, 2.3, 2.3, 2.3),
                c(6.7, 3.8, 2.4, 2.3, 2.3),
                c(7.4, 4.6, 2.4, 2.3, 2.3),
                c(2.3, 1.9, 2.4, 2.3, 2.3)),
    SAKE = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SASC = list(c(0.47, 0.43, 0.34, 0.34, 0.33),
                c(0.47, 0.43, 0.34, 0.34, 0.33),
                c(0.47, 0.43, 0.34, 0.34, 0.33),
                c(0.47, 0.43, 0.34, 0.34, 0.33))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -4L),
    tier_info = list(
      c("A", "SADAT", "SMHB", "SMPX", "SMKE", "SANAME"),
      c("A", "SABL", "SADM", "SAOC", "SANI", "SAPHW", "SAPHB", "SAPX",
        "SAKE", "SASC"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*SOIL ANALYSIS",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 1 03283   -99 SA002   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 1     5   -99  0.48   -99   -99   -99   2.2   -99 0.470",
                " 1    20   -99  0.44   -99   -99   -99   2.3   -99 0.430",
                " 1    40   -99  0.35   -99   -99   -99   2.3   -99 0.340",
                " 1    60   -99  0.35   -99   -99   -99   2.3   -99 0.340",
                " 1    90   -99  0.34   -99   -99   -99   2.3   -99 0.330",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 2 03283   -99 SA002   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 2     5   -99  0.49   -99   -99   -99   6.7   -99 0.470",
                " 2    20   -99  0.44   -99   -99   -99   3.8   -99 0.430",
                " 2    40   -99  0.35   -99   -99   -99   2.4   -99 0.340",
                " 2    60   -99  0.35   -99   -99   -99   2.3   -99 0.340",
                " 2    90   -99  0.34   -99   -99   -99   2.3   -99 0.330",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 3 03283   -99 SA002   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 3     5   -99  0.49   -99   -99   -99   7.4   -99 0.470",
                " 3    20   -99  0.44   -99   -99   -99   4.6   -99 0.430",
                " 3    40   -99  0.35   -99   -99   -99   2.4   -99 0.340",
                " 3    60   -99  0.35   -99   -99   -99   2.3   -99 0.340",
                " 3    90   -99  0.34   -99   -99   -99   2.3   -99 0.330",
                "@A SADAT  SMHB  SMPX  SMKE  SANAME",
                " 4 03283   -99 SA002   -99  -99",
                "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
                " 4     5   -99  0.48   -99   -99   -99   2.3   -99 0.470",
                " 4    20   -99  0.44   -99   -99   -99   1.9   -99 0.430",
                " 4    40   -99  0.35   -99   -99   -99   2.4   -99 0.340",
                " 4    60   -99  0.35   -99   -99   -99   2.3   -99 0.340",
                " 4    90   -99  0.34   -99   -99   -99   2.3   -99 0.330",
                "")

  expect_equal(actual, expected,
               info = "SOIL ANALYSIS multiple")


# "INITIAL CONDITIONS one level - no missing"

  filex_input <- list("INITIAL CONDITIONS" = structure(list(
    C = 1L, PCR = "SB",
    ICDAT = structure(-435888000, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    ICRT = 1200L, ICND = 0L, ICRN = 1L, ICRE = 1L,
    ICWD = 3, ICRES = 1000L, ICREN = 0.8, ICREP = 0L, ICRIP = 100L,
    ICRID = 15L, ICNAME = "TEST",
    ICBL = list(c(30L, 60L, 90L, 120L, 150L, 180L)),
    SH2O = list(c(0.406, 0.406, 0.406, 0.406, 0.406, 0.406)),
    SNH4 = list(c(1.78, 0.82, 0.24, 0.24, 0.24, 0.24)),
    SNO3 = list(c(17.8, 8.2, 2.4, 2.4, 2.4, 2.4))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(
      c("C", "PCR", "ICDAT", "ICRT", "ICND", "ICRN", "ICRE", "ICWD",
        "ICRES", "ICREN", "ICREP", "ICRIP", "ICRID", "ICNAME"),
      c("C", "ICBL", "SH2O", "SNH4", "SNO3"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*INITIAL CONDITIONS",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 1    SB 56070  1200     0   1.0     1     3  1000  0.80  0.00   100    15 TEST",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 1    30 0.406  1.78 17.80",
                " 1    60 0.406  0.82  8.20",
                " 1    90 0.406  0.24  2.40",
                " 1   120 0.406  0.24  2.40",
                " 1   150 0.406  0.24  2.40",
                " 1   180 0.406  0.24  2.40",
                "")

  expect_equal(actual, expected,
               info = "INITIAL CONDITIONS one level - no missing")


# "INITIAL CONDITIONS one level - missing"

  filex_input <- list("INITIAL CONDITIONS" = structure(list(
    C = 1L, PCR = NA_character_,
    ICDAT = structure(NA_real_, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    ICRT = NA_real_, ICND = NA_real_, ICRN = NA_real_,
    ICRE = NA_real_, ICWD = NA_real_, ICRES = NA_real_, ICREN = NA_real_,
    ICREP = NA_real_, ICRIP = NA_real_, ICRID = NA_real_,
    ICNAME = NA_character_,
    ICBL = list(c(30L, 60L, 90L, 120L, 150L, 180L)),
    SH2O = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SNH4 = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SNO3 = list(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(
      c("C", "PCR", "ICDAT", "ICRT", "ICND", "ICRN", "ICRE", "ICWD",
        "ICRES", "ICREN", "ICREP", "ICRIP", "ICRID", "ICNAME"),
      c("C", "ICBL", "SH2O", "SNH4", "SNO3"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*INITIAL CONDITIONS",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 1   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99 -99",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 1    30   -99   -99   -99",
                " 1    60   -99   -99   -99",
                " 1    90   -99   -99   -99",
                " 1   120   -99   -99   -99",
                " 1   150   -99   -99   -99",
                " 1   180   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "INITIAL CONDITIONS one level - missing")


# "Two levels - no missing data"

  filex_input <- list("INITIAL CONDITIONS" = structure(list(
    C = 1:2,
    PCR = c("SB", "SB"),
    ICDAT = structure(c(-435888000, -435888000), tzone = "UTC",
                      class = c("POSIXct", "POSIXt")),
    ICRT = c(1200L, 1200L),
    ICND = c(0L, 0L),
    ICRN = c(1L, 1L),
    ICRE = c(1L, 1L),
    ICWD = c(3, 3),
    ICRES = c(1000L, 1000L),
    ICREN = c(0.8, 0.8),
    ICREP = c(0L, 0L),
    ICRIP = c(100L, 100L),
    ICRID = c(15L, 15L),
    ICNAME = c("TEST1", "TEST2"),
    ICBL = list(
      c(30L, 60L, 90L, 120L, 150L, 180L),
      c(30L, 60L, 90L, 120L, 150L)),
    SH2O = list(
      c(0.406, 0.406, 0.406, 0.406, 0.406, 0.406),
      c(0.406, 0.406, 0.406, 0.406, 0.406)),
    SNH4 = list(c(1.78, 0.82, 0.24, 0.24, 0.24, 0.24),
                c(1.78, 0.82, 0.24, 0.24, 0.24)),
    SNO3 = list(c(17.8, 8.2, 2.4, 2.4, 2.4, 2.4),
                c(17.8, 8.2, 2.4, 2.4, 2.4))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -2L),
    tier_info = list(
      c("C", "PCR", "ICDAT", "ICRT", "ICND", "ICRN", "ICRE", "ICWD", "ICRES",
        "ICREN", "ICREP", "ICRIP", "ICRID", "ICNAME"),
      c("C", "ICBL", "SH2O", "SNH4", "SNO3"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*INITIAL CONDITIONS",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 1    SB 56070  1200     0   1.0     1     3  1000  0.80  0.00   100    15 TEST1",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 1    30 0.406  1.78 17.80",
                " 1    60 0.406  0.82  8.20",
                " 1    90 0.406  0.24  2.40",
                " 1   120 0.406  0.24  2.40",
                " 1   150 0.406  0.24  2.40",
                " 1   180 0.406  0.24  2.40",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 2    SB 56070  1200     0   1.0     1     3  1000  0.80  0.00   100    15 TEST2",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 2    30 0.406  1.78 17.80",
                " 2    60 0.406  0.82  8.20",
                " 2    90 0.406  0.24  2.40",
                " 2   120 0.406  0.24  2.40",
                " 2   150 0.406  0.24  2.40",
                "")

  expect_equal(actual, expected,
               info = "Two levels - no missing data")


# "INITIAL CONDITIONS two levels - missing"

  filex_input <- list("INITIAL CONDITIONS" = structure(list(
    C = 1:2,
    PCR = c(NA_character_, NA_character_),
    ICDAT = structure(c(NA_real_, NA_real_),
                      tzone = "UTC", class = c("POSIXct", "POSIXt")),
    ICRT = c(NA_real_, NA_real_),
    ICND = c(NA_real_, NA_real_),
    ICRN = c(NA_real_, NA_real_),
    ICRE = c(NA_real_, NA_real_),
    ICWD = c(NA_real_, NA_real_),
    ICRES = c(NA_real_, NA_real_),
    ICREN = c(NA_real_, NA_real_),
    ICREP = c(NA_real_, NA_real_),
    ICRIP = c(NA_real_, NA_real_),
    ICRID = c(NA_real_, NA_real_),
    ICNAME = c(NA_character_, NA_character_),
    ICBL = list(
      c(30L, 60L, 90L, 120L, 150L, 180L),
      c(30L, 60L, 90L, 120L, 150L)),
    SH2O = list(
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SNH4 = list(
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_)),
    SNO3 = list(
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
      c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -2L),
    tier_info = list(
      c("C", "PCR", "ICDAT", "ICRT", "ICND", "ICRN", "ICRE", "ICWD", "ICRES",
        "ICREN", "ICREP", "ICRIP", "ICRID", "ICNAME"),
      c("C", "ICBL", "SH2O", "SNH4", "SNO3"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*INITIAL CONDITIONS",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 1   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99 -99",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 1    30   -99   -99   -99",
                " 1    60   -99   -99   -99",
                " 1    90   -99   -99   -99",
                " 1   120   -99   -99   -99",
                " 1   150   -99   -99   -99",
                " 1   180   -99   -99   -99",
                "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
                " 2   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99 -99",
                "@C  ICBL  SH2O  SNH4  SNO3",
                " 2    30   -99   -99   -99",
                " 2    60   -99   -99   -99",
                " 2    90   -99   -99   -99",
                " 2   120   -99   -99   -99",
                " 2   150   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "INITIAL CONDITIONS two levels - missing")

# "IRRIGATION AND WATER MANAGEMENT one level - no missing"

  filex_input <- list("IRRIGATION AND WATER MANAGEMENT" = structure(list(
    I = 1, EFIR = 0, IDEP = 1, ITHR = 1,
    IEPT = 1, IOFF = "TEST1", IAME = "TEST1", IAMT = 10,
    IRNAME = "TEST",
    IDATE = list(structure(c(386899200, 388108800, 388713600),
                   tzone = "UTC", class = c("POSIXct", "POSIXt"))),
    IROP = list(c("IR001", "IR001", "IR001")),
    IRVAL = list(c(65L, 78L, 70L))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
                       "IOFF", "IAME", "IAMT", "IRNAME"),
                     c("I", "IDATE", "IROP", "IRVAL"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*IRRIGATION AND WATER MANAGEMENT",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 1  0.00     1     1     1 TEST1 TEST1    10 TEST",
                "@I IDATE  IROP IRVAL",
                " 1 82096 IR001  65.0",
                " 1 82110 IR001  78.0",
                " 1 82117 IR001  70.0",
                "")

  expect_equal(actual, expected,
               info = "IRRIGATION AND WATER MANAGEMENT one level - no missing")


  # "IRRIGATION AND WATER MANAGEMENT one level - missing"

  filex_input <- list("IRRIGATION AND WATER MANAGEMENT" = structure(list(
    I = 1, EFIR = NA_real_, IDEP = NA_real_, ITHR = NA_real_,
    IEPT = NA_real_, IOFF = NA_character_,
    IAME = NA_character_, IAMT = NA_real_,
    IRNAME = NA_character_,
    IDATE = list(structure(rep(NA_real_, 3),
                           tzone = "UTC", class = c("POSIXct", "POSIXt"))),
    IROP = list(rep(NA_character_, 3)),
    IRVAL = list(rep(NA_real_, 3))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -1L),
    tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
                       "IOFF", "IAME", "IAMT", "IRNAME"),
                     c("I", "IDATE", "IROP", "IRVAL"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*IRRIGATION AND WATER MANAGEMENT",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 1   -99   -99   -99   -99   -99   -99   -99 -99",
                "@I IDATE  IROP IRVAL",
                " 1   -99   -99   -99",
                " 1   -99   -99   -99",
                " 1   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "IRRIGATION AND WATER MANAGEMENT one level - missing")

  # "IRRIGATION AND WATER MANAGEMENT two levels - no missing"

  filex_input <- list("IRRIGATION AND WATER MANAGEMENT" = structure(list(
    I = 1:2, EFIR = rep(0, 2), IDEP = rep(1, 2),
    ITHR = rep(1, 2), IEPT = rep(1, 2),
    IOFF = rep("TEST1", 2), IAME = rep("TEST1", 2),
    IAMT = rep(10, 2), IRNAME = rep("TEST", 2),
    IDATE = list(structure(c(386899200, 388108800, 388713600),
                           tzone = "UTC", class = c("POSIXct", "POSIXt")),
                 structure(c(386899200, 388108800, 388713600),
                           tzone = "UTC", class = c("POSIXct", "POSIXt"))),
    IROP = list(c("IR001", "IR001", "IR001"),
                c("IR001", "IR001", "IR001")),
    IRVAL = list(c(65L, 78L, 70L),
                 c(65L, 78L, 70L))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -2L),
    tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
                       "IOFF", "IAME", "IAMT", "IRNAME"),
                     c("I", "IDATE", "IROP", "IRVAL"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*IRRIGATION AND WATER MANAGEMENT",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 1  0.00     1     1     1 TEST1 TEST1    10 TEST",
                "@I IDATE  IROP IRVAL",
                " 1 82096 IR001  65.0",
                " 1 82110 IR001  78.0",
                " 1 82117 IR001  70.0",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 2  0.00     1     1     1 TEST1 TEST1    10 TEST",
                "@I IDATE  IROP IRVAL",
                " 2 82096 IR001  65.0",
                " 2 82110 IR001  78.0",
                " 2 82117 IR001  70.0",
                "")

  expect_equal(actual, expected,
               info = "IRRIGATION AND WATER MANAGEMENT two levels - no missing")


  # "IRRIGATION AND WATER MANAGEMENT two levels - missing"

  filex_input <- list("IRRIGATION AND WATER MANAGEMENT" = structure(list(
    I = 1:2, EFIR = rep(NA_real_, 2),
    IDEP =  rep(NA_real_, 2), ITHR =  rep(NA_real_, 2),
    IEPT =  rep(NA_real_, 2), IOFF =  rep(NA_character_, 2),
    IAME =  rep(NA_character_, 2), IAMT =  rep(NA_real_, 2),
    IRNAME =  rep(NA_character_, 2),
    IDATE = list(structure(rep(NA_real_, 3),
                           tzone = "UTC", class = c("POSIXct", "POSIXt")),
                 structure(rep(NA_real_, 3),
                           tzone = "UTC", class = c("POSIXct", "POSIXt"))),
    IROP = list(rep(NA_character_, 3), rep(NA_character_, 3)),
    IRVAL = list(rep(NA_real_, 3), rep(NA_real_, 3))),
    class = c("DSSAT_tbl", "data.frame"),
    row.names = c(NA, -2L),
    tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
                       "IOFF", "IAME", "IAMT", "IRNAME"),
                     c("I", "IDATE", "IROP", "IRVAL"))))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*IRRIGATION AND WATER MANAGEMENT",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 1   -99   -99   -99   -99   -99   -99   -99 -99",
                "@I IDATE  IROP IRVAL",
                " 1   -99   -99   -99",
                " 1   -99   -99   -99",
                " 1   -99   -99   -99",
                "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
                " 2   -99   -99   -99   -99   -99   -99   -99 -99",
                "@I IDATE  IROP IRVAL",
                " 2   -99   -99   -99",
                " 2   -99   -99   -99",
                " 2   -99   -99   -99",
                "")

  expect_equal(actual, expected,
               info = "IRRIGATION AND WATER MANAGEMENT two levels - missing")


  # "SIMULATION CONTROLS one level - no missing, no FMOPT"

  filex_input <- list("SIMULATION CONTROLS" = structure(list(
    N = 1L, GENERAL = "GE", NYERS = 1L, NREPS = 1L,
    START = "S",
    SDATE = structure(371174400, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    RSEED = 2150L, SNAME = "N x IR ASHLAND,KS", SMODEL = "",
    OPTIONS = "OP", WATER = "Y", NITRO = "Y", SYMBI = "N", PHOSP = "N",
    POTAS = "N", DISES = "N", CHEM = "N", TILL = "N", CO2 = "M",
    METHODS = "ME", WTHER = "M", INCON = "M", LIGHT = "E", EVAPO = "R",
    INFIL = "S", PHOTO = "C", HYDRO = "R", NSWIT = 1L, MESOM = "G",
    MESEV = "S", MESOL = 2L, MANAGEMENT = "MA", PLANT = "R",
    IRRIG = "R", FERTI = "R", RESID = "N", HARVS = "M", OUTPUTS = "OU",
    FNAME = "N", OVVEW = "Y", SUMRY = "Y", FROPT = 1L, GROUT = "Y",
    CAOUT = "N", WAOUT = "Y", NIOUT = "Y", MIOUT = "N", DIOUT = "N",
    VBOSE = "Y", CHOUT = "N", OPOUT = "N", PLANTING = "PL",
    PFRST = structure(371433600, tzone = "UTC", class = c("POSIXct","POSIXt")),
    PLAST = structure(372643200, tzone = "UTC", class = c("POSIXct","POSIXt")),
    PH2OL = 40L, PH2OU = 100L, PH2OD = 30L, PSTMX = 40L,
    PSTMN = 10L, IRRIGATION = "IR", IMDEP = 30L, ITHRL = 50L,
    ITHRU = 100L, IROFF = "GS000", IMETH = "IR001", IRAMT = 10L,
    IREFF = 1L, NITROGEN = "NI", NMDEP = 30L, NMTHR = 50L, NAMNT = 25L,
    NCODE = "FE001", NAOFF = "GS000", RESIDUES = "RE", RIPCN = 100L,
    RTIME = 1L, RIDEP = 20L, HARVEST = "HA",
    HFRST = structure(NA_real_, tzone = "UTC", class = c("POSIXct","POSIXt")),
    HLAST = structure(403574400, tzone = "UTC", class = c("POSIXct","POSIXt")),
    HPCNP = 100L, HPCNR = 0L),
    class = c("DSSAT_tbl", "data.frame"), row.names = c(NA, -1L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*SIMULATION CONTROLS",
                "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL  ",
                " 1 GE              1     1     S 81279  2150 N x IR ASHLAND,KS                 ",
                "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",
                " 1 OP              Y     Y     N     N     N     N     N     N     M",
                "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",
                " 1 ME              M     M     E     R     S     C     R     1     G     S     2",
                "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",
                " 1 MA              R     R     R     N     M",
                "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",
                " 1 OU              N     Y     Y     1     Y     N     Y     Y     N     N     Y     N     N",
                "@  AUTOMATIC MANAGEMENT",
                "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",
                " 1 PL          81282 81296    40   100    30    40    10",
                "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",
                " 1 IR             30    50   100 GS000 IR001    10  1.00",
                "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",
                " 1 NI             30 50.00    25 FE001 GS000",
                "@N RESIDUES    RIPCN RTIME RIDEP",
                " 1 RE            100     1    20",
                "@N HARVEST     HFRST HLAST HPCNP HPCNR",
                " 1 HA            -99 82289   100     0",
                "")

  expect_equal(actual, expected,
               info = "SIMULATION CONTROLS one level - no missing, no FMOPT")


  # "SIMULATION CONTROLS one level - no missing, with FMOPT"

  filex_input <- list("SIMULATION CONTROLS" = structure(list(
    N = 1L, GENERAL = "GE", NYERS = 1L, NREPS = 1L,
    START = "S",
    SDATE = structure(371174400, tzone = "UTC", class = c("POSIXct", "POSIXt")),
    RSEED = 2150L, SNAME = "N x IR ASHLAND,KS", SMODEL = "",
    OPTIONS = "OP", WATER = "Y", NITRO = "Y", SYMBI = "N", PHOSP = "N",
    POTAS = "N", DISES = "N", CHEM = "N", TILL = "N", CO2 = "M",
    METHODS = "ME", WTHER = "M", INCON = "M", LIGHT = "E", EVAPO = "R",
    INFIL = "S", PHOTO = "C", HYDRO = "R", NSWIT = 1L, MESOM = "G",
    MESEV = "S", MESOL = 2L, MANAGEMENT = "MA", PLANT = "R",
    IRRIG = "R", FERTI = "R", RESID = "N", HARVS = "M", OUTPUTS = "OU",
    FNAME = "N", OVVEW = "Y", SUMRY = "Y", FROPT = 1L, GROUT = "Y",
    CAOUT = "N", WAOUT = "Y", NIOUT = "Y", MIOUT = "N", DIOUT = "N",
    VBOSE = "Y", CHOUT = "N", OPOUT = "N", FMOPT = "A",
    PLANTING = "PL",
    PFRST = structure(371433600, tzone = "UTC", class = c("POSIXct","POSIXt")),
    PLAST = structure(372643200, tzone = "UTC", class = c("POSIXct","POSIXt")),
    PH2OL = 40L, PH2OU = 100L, PH2OD = 30L, PSTMX = 40L,
    PSTMN = 10L, IRRIGATION = "IR", IMDEP = 30L, ITHRL = 50L,
    ITHRU = 100L, IROFF = "GS000", IMETH = "IR001", IRAMT = 10L,
    IREFF = 1L, NITROGEN = "NI", NMDEP = 30L, NMTHR = 50L, NAMNT = 25L,
    NCODE = "FE001", NAOFF = "GS000", RESIDUES = "RE", RIPCN = 100L,
    RTIME = 1L, RIDEP = 20L, HARVEST = "HA",
    HFRST = structure(NA_real_, tzone = "UTC", class = c("POSIXct","POSIXt")),
    HLAST = structure(403574400, tzone = "UTC", class = c("POSIXct","POSIXt")),
    HPCNP = 100L, HPCNR = 0L),
    class = c("DSSAT_tbl", "data.frame"), row.names = c(NA, -1L)))

  actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")

  DSSAT::write_filex(filex_input, file_name = actual_file)

  actual <- readLines(actual_file)

  expected <- c("*EXP.DETAILS: ",
                "",
                "*SIMULATION CONTROLS",
                "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL  ",
                " 1 GE              1     1     S 81279  2150 N x IR ASHLAND,KS                 ",
                "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2",
                " 1 OP              Y     Y     N     N     N     N     N     N     M",
                "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL",
                " 1 ME              M     M     E     R     S     C     R     1     G     S     2",
                "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS",
                " 1 MA              R     R     R     N     M",
                "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT",
                " 1 OU              N     Y     Y     1     Y     N     Y     Y     N     N     Y     N     N",
                "@  AUTOMATIC MANAGEMENT",
                "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN",
                " 1 PL          81282 81296    40   100    30    40    10",
                "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF",
                " 1 IR             30    50   100 GS000 IR001    10  1.00",
                "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF",
                " 1 NI             30 50.00    25 FE001 GS000",
                "@N RESIDUES    RIPCN RTIME RIDEP",
                " 1 RE            100     1    20",
                "@N HARVEST     HFRST HLAST HPCNP HPCNR",
                " 1 HA            -99 82289   100     0",
                "")

  expect_equal(actual, expected,
               info = "SIMULATION CONTROLS one level - no missing, with FMOPT")

  # # "SIMULATION CONTROLS one level - missing"
  #
  # filex_input <- list("SIMULATION CONTROLS" = structure(list(
  #   I = 1, EFIR = NA_real_, IDEP = NA_real_, ITHR = NA_real_,
  #   IEPT = NA_real_, IOFF = NA_character_,
  #   IAME = NA_character_, IAMT = NA_real_,
  #   IRNAME = NA_character_,
  #   IDATE = list(structure(rep(NA_real_, 3),
  #                          tzone = "UTC", class = c("POSIXct", "POSIXt"))),
  #   IROP = list(rep(NA_character_, 3)),
  #   IRVAL = list(rep(NA_real_, 3))),
  #   class = c("DSSAT_tbl", "data.frame"),
  #   row.names = c(NA, -1L),
  #   tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
  #                      "IOFF", "IAME", "IAMT", "IRNAME"),
  #                    c("I", "IDATE", "IROP", "IRVAL"))))
  #
  # actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")
  #
  # DSSAT::write_filex(filex_input, file_name = actual_file)
  #
  # actual <- readLines(actual_file)
  #
  # expected <- c("*EXP.DETAILS: ",
  #               "",
  #               "*SIMULATION CONTROLS",
  #               "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
  #               " 1   -99   -99   -99   -99   -99   -99   -99 -99",
  #               "@I IDATE  IROP IRVAL",
  #               " 1   -99   -99   -99",
  #               " 1   -99   -99   -99",
  #               " 1   -99   -99   -99",
  #               "")
  #
  # expect_equal(actual, expected,
  #              info = "SIMULATION CONTROLS one level - missing")
  #
  # # "SIMULATION CONTROLS two levels - no missing"
  #
  # filex_input <- list("SIMULATION CONTROLS" = structure(list(
  #   I = 1:2, EFIR = rep(0, 2), IDEP = rep(1, 2),
  #   ITHR = rep(1, 2), IEPT = rep(1, 2),
  #   IOFF = rep("TEST1", 2), IAME = rep("TEST1", 2),
  #   IAMT = rep(10, 2), IRNAME = rep("TEST", 2),
  #   IDATE = list(structure(c(386899200, 388108800, 388713600),
  #                          tzone = "UTC", class = c("POSIXct", "POSIXt")),
  #                structure(c(386899200, 388108800, 388713600),
  #                          tzone = "UTC", class = c("POSIXct", "POSIXt"))),
  #   IROP = list(c("IR001", "IR001", "IR001"),
  #               c("IR001", "IR001", "IR001")),
  #   IRVAL = list(c(65L, 78L, 70L),
  #                c(65L, 78L, 70L))),
  #   class = c("DSSAT_tbl", "data.frame"),
  #   row.names = c(NA, -2L),
  #   tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
  #                      "IOFF", "IAME", "IAMT", "IRNAME"),
  #                    c("I", "IDATE", "IROP", "IRVAL"))))
  #
  # actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")
  #
  # DSSAT::write_filex(filex_input, file_name = actual_file)
  #
  # actual <- readLines(actual_file)
  #
  # expected <- c("*EXP.DETAILS: ",
  #               "",
  #               "*SIMULATION CONTROLS",
  #               "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
  #               " 1  0.00     1     1     1 TEST1 TEST1    10 TEST",
  #               "@I IDATE  IROP IRVAL",
  #               " 1 82096 IR001  65.0",
  #               " 1 82110 IR001  78.0",
  #               " 1 82117 IR001  70.0",
  #               "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
  #               " 2  0.00     1     1     1 TEST1 TEST1    10 TEST",
  #               "@I IDATE  IROP IRVAL",
  #               " 2 82096 IR001  65.0",
  #               " 2 82110 IR001  78.0",
  #               " 2 82117 IR001  70.0",
  #               "")
  #
  # expect_equal(actual, expected,
  #              info = "SIMULATION CONTROLS two levels - no missing")
  #
  #
  # # "SIMULATION CONTROLS two levels - missing"
  #
  # filex_input <- list("SIMULATION CONTROLS" = structure(list(
  #   I = 1:2, EFIR = rep(NA_real_, 2),
  #   IDEP =  rep(NA_real_, 2), ITHR =  rep(NA_real_, 2),
  #   IEPT =  rep(NA_real_, 2), IOFF =  rep(NA_character_, 2),
  #   IAME =  rep(NA_character_, 2), IAMT =  rep(NA_real_, 2),
  #   IRNAME =  rep(NA_character_, 2),
  #   IDATE = list(structure(rep(NA_real_, 3),
  #                          tzone = "UTC", class = c("POSIXct", "POSIXt")),
  #                structure(rep(NA_real_, 3),
  #                          tzone = "UTC", class = c("POSIXct", "POSIXt"))),
  #   IROP = list(rep(NA_character_, 3), rep(NA_character_, 3)),
  #   IRVAL = list(rep(NA_real_, 3), rep(NA_real_, 3))),
  #   class = c("DSSAT_tbl", "data.frame"),
  #   row.names = c(NA, -2L),
  #   tier_info = list(c("I", "EFIR", "IDEP", "ITHR", "IEPT",
  #                      "IOFF", "IAME", "IAMT", "IRNAME"),
  #                    c("I", "IDATE", "IROP", "IRVAL"))))
  #
  # actual_file <- tempfile(pattern = "TEST0001", fileext = "CRX")
  #
  # DSSAT::write_filex(filex_input, file_name = actual_file)
  #
  # actual <- readLines(actual_file)
  #
  # expected <- c("*EXP.DETAILS: ",
  #               "",
  #               "*SIMULATION CONTROLS",
  #               "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
  #               " 1   -99   -99   -99   -99   -99   -99   -99 -99",
  #               "@I IDATE  IROP IRVAL",
  #               " 1   -99   -99   -99",
  #               " 1   -99   -99   -99",
  #               " 1   -99   -99   -99",
  #               "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME",
  #               " 2   -99   -99   -99   -99   -99   -99   -99 -99",
  #               "@I IDATE  IROP IRVAL",
  #               " 2   -99   -99   -99",
  #               " 2   -99   -99   -99",
  #               " 2   -99   -99   -99",
  #               "")
  #
  # expect_equal(actual, expected,
  #              info = "SIMULATION CONTROLS two levels - missing")

# test_that("PLANTING DETAILS - single",{
#
#   withr::with_file("TEST0000.CRX",{
#     write(
#       ,
#       "TEST0000.CRX")
#
#     filex <- DSSAT::read_filex("TEST0000.CRX")
#
#   })
#
#   test_cols_check(
#     filex$`PLANTING DETAILS`,
#     char_cols = c(),
#     list_cols = c(),
#     date_cols = "",
#     missing = c(),
#     list_col_length = c(6, 5),
#     list_col_groups = list(c()),
#     expected_vals = list(P = ,))
# })

if(FALSE){

  library(tidyverse)

  # code to create write_filex() tests
  create_write_filex_test <- function(){

    clip_in <- clipr::read_clip()

    eval(parse(text = clip_in))

    test_out <- deparse(eval(parse(text = gsub("\\) *",
                                               ", \"\")",
                                               gsub("c\\(",
                                                    "c(\"*EXP.DETAILS: \", \"\",",
                                                    gsub("^.*write\\( +(.*), +\"TEST0000.CRX\".*$",
                                                         "\\1",
                                                         paste0(clip_in, collapse = "")))))))

    filex_input <- deparse(filex)

    filex_input[1] <- paste0("filex_input <- ", filex_input[1])

    test_out[1] <- paste0("expected <- ", test_out[1])

    clipr::write_clip(c(filex_input,
                        "",
                        "actual_file <- tempfile(pattern = \"TEST0001\", fileext = \"CRX\")",
                        "",
                        "DSSAT::write_filex(filex_input, file_name = actual_file)",
                        "",
                        "actual <- readLines(actual_file)",
                        "",
                        test_out,
                        "",
                        "expect_equal(actual, expected)",
                        ""
                        ))

    return(invisible())
  }

  # list.files("~/active/dssat-csm-data/",
  #            recursive = TRUE,
  #            pattern = "X$",
  #            full.names = TRUE) %>%
  #   {file.copy(from = .,
  #              to = file.path("inst/extdata/test_data/FileX/", basename(.)))}

  list.files(path = "inst/extdata/test_data/FileX",
             full.names = TRUE) %>%
    head(3) %>%
    DSSAT:::read_filex_multiple()


        lapply(readLines) %>%
    unlist()

  head(all_x)
}

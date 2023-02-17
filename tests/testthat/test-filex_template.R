test_that("filex_template_treatments()", {

  expected <-
    tibble::tibble(
      N = 1, R = 0, O = 0, TNAME = "",
      CU = 1, FL = 1, SA = 0, IC = 0, MP = 0,
      MI = 0, MF = 0, MR = 0, MC = 0, MT = 0,
      ME = 0, MH = 0, SM = 1
    )

  expect_identical(
    DSSAT:::filex_template_treatments(),
    expected)
})

test_that("filex_template_cultivars()", {

  expected <-
    tibble::tibble(
      C = 1, CR = "FA", INGENO = "IB0001", CNAME = ""
    )

  expect_identical(
    DSSAT:::filex_template_cultivars(),
    expected)
})

test_that("filex_template_fields()", {

  expected <-
    tibble::tibble(
      L = 1,
      ID_FIELD = NA_character_, WSTA = "TEST", FLSA = NA_character_,
      FLOB = NA_real_, FLDT = NA_character_, FLDD = NA_real_,
      FLDS = NA_real_, FLST = NA_character_,
      SLTX = NA_character_, SLDP = NA_real_, ID_SOIL = "IB00000001",
      FLNAME = NA_character_,
      XCRD = NA_real_, YCRD = NA_real_, ELEV = NA_real_,
      AREA = NA_real_, SLEN = NA_real_, FLWR = NA_real_,
      SLAS = NA_real_, FLHST = NA_character_,
      FHDUR = NA_real_
    )

  expect_identical(
    DSSAT:::filex_template_fields(WSTA = "TEST", ID_SOIL = "IB00000001"),
    expected)
})

test_that("filex_template_simulation_controls()", {

  expected <-
    tibble::tibble(
      N = 1,
      GENERAL = "GE",
      NYERS = 1, NREPS = 1, START = "S",
      SDATE = NA_character_, RSEED = 2150,
      SNAME = NA_character_, SMODEL = NA_character_,
      OPTIONS = "OP",
      WATER = "Y", NITRO = "Y", SYMBI = "N", PHOSP = "N",
      POTAS = "Y", DISES = "N", CHEM = "N", TILL = "N",
      CO2 = "M",
      METHODS = "ME",
      WTHER = "M", INCON = "M", LIGHT = "E", EVAPO = "R",
      INFIL = "S", PHOTO = "L", HYDRO = "R", NSWIT = 1,
      MESOM = "G", MESEV = "R", MESOL = 2,
      MANAGEMENT = "MA",
      PLANT = "R", IRRIG = "N", FERTI = "N", RESID = "N",
      HARVS = "M",
      OUTPUTS = "OU",
      FNAME = "N", OVVEW = "Y", SUMRY = "Y", FROPT = 1,
      GROUT = "N", CAOUT = "N", WAOUT = "N", NIOUT = "N",
      MIOUT = "N", DIOUT = "N", VBOSE = "N", CHOUT = "N",
      OPOUT = "N", FMOPT = "A",
      PLANTING = "PL",
      PFRST = NA_character_, PLAST = NA_character_,
      PH2OL = NA_real_, PH2OU = NA_real_,
      PH2OD = NA_real_, PSTMX = NA_real_, PSTMN = NA_real_,
      IRRIGATION = "IR",
      IMDEP = NA_real_, ITHRL = NA_real_,
      ITHRU = NA_real_, IROFF = NA_character_, IMETH = NA_character_,
      IRAMT = NA_real_, IREFF = NA_real_,
      NITROGEN = "NI",
      NMDEP = NA_real_, NMTHR = NA_real_, NAMNT = NA_real_,
      NCODE = NA_character_, NAOFF = NA_character_,
      RESIDUES = "RE",
      RIPCN = NA_real_, RTIME = NA_real_,
      RIDEP = NA_real_,
      HARVEST = "HA",
      HFRST = NA_character_, HLAST = NA_character_,
      HPCNP = NA_real_, HPCNR = NA_real_,
      SIMDATES = "SI",
      ENDAT = NA_character_, SDUR = NA_real_, FODAT = NA_character_,
      FSTRYR = NA_real_, FENDYR = NA_real_, FWFILE = NA_character_,
      FONAME = NA_character_
    )

  expect_identical(
    DSSAT:::filex_template_simulation_controls(),
    expected)

})

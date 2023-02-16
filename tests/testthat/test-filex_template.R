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

# "write_eco() ALFRM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/ALFRM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "ALFRM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/ALFRM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() ALFRM048.ECO")


# "write_eco() BACER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BACER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BACER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BACER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BACER048.ECO")


# "write_eco() BACRP048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BACRP048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BACRP048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BACRP048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BACRP048.ECO")


# "write_eco() BHGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BHGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BHGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BHGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BHGRO048.ECO")


# "write_eco() BMFRM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BMFRM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BMFRM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BMFRM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BMFRM048.ECO")


# "write_eco() BNGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BNGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BNGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BNGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BNGRO048.ECO")


# "write_eco() BRFRM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BRFRM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BRFRM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BRFRM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BRFRM048.ECO")


# "write_eco() BRGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BRGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BRGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BRGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BRGRO048.ECO")


# "write_eco() BSCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/BSCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "BSCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/BSCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() BSCER048.ECO")


# "write_eco() CBGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CBGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CBGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CBGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CBGRO048.ECO")


# "write_eco() CHGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CHGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CHGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CHGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CHGRO048.ECO")


# "write_eco() CIGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CIGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CIGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CIGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CIGRO048.ECO")


# "write_eco() CNGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CNGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CNGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CNGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CNGRO048.ECO")


# "write_eco() COGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/COGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "COGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/COGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() COGRO048.ECO")


# "write_eco() CPGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CPGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CPGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CPGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CPGRO048.ECO")


# "write_eco() CSCAS048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CSCAS048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CSCAS048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CSCAS048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CSCAS048.ECO")


# "write_eco() CSYCA048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/CSYCA048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "CSYCA048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/CSYCA048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() CSYCA048.ECO")


# "write_eco() FBGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/FBGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "FBGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/FBGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() FBGRO048.ECO")


# "write_eco() G0GRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/G0GRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "G0GRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/G0GRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() G0GRO048.ECO")


# "write_eco() GBGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/GBGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "GBGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/GBGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() GBGRO048.ECO")


# "write_eco() GGFRM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/GGFRM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "GGFRM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/GGFRM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() GGFRM048.ECO")


# "write_eco() MLCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/MLCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "MLCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/MLCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() MLCER048.ECO")


# "write_eco() MZCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/MZCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "MZCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/MZCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() MZCER048.ECO")


# "write_eco() MZIXM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/MZIXM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "MZIXM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/MZIXM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() MZIXM048.ECO")


# "write_eco() PNGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/PNGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "PNGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/PNGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() PNGRO048.ECO")


# "write_eco() PPGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/PPGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "PPGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/PPGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() PPGRO048.ECO")


# "write_eco() PRGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/PRGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "PRGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/PRGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() PRGRO048.ECO")


# "write_eco() PTSUB048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/PTSUB048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "PTSUB048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/PTSUB048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() PTSUB048.ECO")


# "write_eco() QUGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/QUGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "QUGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/QUGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() QUGRO048.ECO")


# "write_eco() SBGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SBGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SBGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SBGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SBGRO048.ECO")


# "write_eco() SCCAN048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SCCAN048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SCCAN048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SCCAN048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SCCAN048.ECO")


# "write_eco() SCCSP048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SCCSP048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SCCSP048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SCCSP048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SCCSP048.ECO")


# "write_eco() SCSAM048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SCSAM048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SCSAM048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SCSAM048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SCSAM048.ECO")


# "write_eco() SFGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SFGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SFGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SFGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SFGRO048.ECO")


# "write_eco() SGCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SGCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SGCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SGCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SGCER048.ECO")


# "write_eco() SUGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SUGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SUGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SUGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SUGRO048.ECO")


# "write_eco() SUOIL048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SUOIL048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SUOIL048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SUOIL048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SUOIL048.ECO")


# "write_eco() SWCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/SWCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "SWCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/SWCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() SWCER048.ECO")


# "write_eco() TFAPS048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/TFAPS048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "TFAPS048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/TFAPS048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() TFAPS048.ECO")


# "write_eco() TMGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/TMGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "TMGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/TMGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() TMGRO048.ECO")


# "write_eco() VBGRO048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/VBGRO048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "VBGRO048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/VBGRO048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() VBGRO048.ECO")


# "write_eco() WHAPS048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/WHAPS048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "WHAPS048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/WHAPS048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() WHAPS048.ECO")


# "write_eco() WHCER048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/WHCER048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "WHCER048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/WHCER048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() WHCER048.ECO")


# "write_eco() WHCRP048.ECO"

  eco <- readRDS(
    system.file("tinytest/test_data/write_eco/WHCRP048_ECO_R.rds",
                package = "DSSAT")
  )

  actual_file <- tempfile(pattern = "WHCRP048", fileext = "ECO")

  DSSAT::write_eco(eco, actual_file)

  actual <- readLines(actual_file)

  file.remove(actual_file)

  expected <- readRDS(
    system.file("tinytest/test_data/write_eco/WHCRP048_ECO.rds",
                package = "DSSAT")
  )

  expect_equal(actual, expected,
               info = "write_eco() WHCRP048.ECO")


# Code used to create tests (for posterity):
if(FALSE){
  # library(tidyverse)
  #
  # create_write_eco_test <- function(file_name){
  #
  #   name_root <- gsub("\\.ECO", "", file_name)
  #
  #   input_name <- gsub("\\.ECO", "_ECO_R.rds", file_name)
  #
  #   test_out <- c(paste0("test_that(\"write_eco() ", file_name, "\", {"),
  #                 "",
  #                 "  eco <- readRDS(",
  #                 paste0("    system.file(\"tinytest/test_data/write_eco/", input_name, "\","),
  #                 "                package = \"DSSAT\")", "    )",
  #                 "",
  #                 paste0("  actual_file <- tempfile(pattern = \"", name_root, "\", fileext = \"ECO\")"),
  #                 "",
  #                 "  DSSAT::write_eco(eco, actual_file)",
  #                 "",
  #                 "  actual <- readLines(actual_file)",
  #                 "",
  #                 "  expected <- readLines(",
  #                 paste0("    system.file(\"tinytest/test_data/write_eco/", file_name, "\","),
  #                 "                package = \"DSSAT\")", "  )",
  #                 "",
  #                 "  expect_equal(actual, expected)",
  #                 "",
  #                 "})",
  #                 "")
  #
  #   return(test_out)
  # }
  #
  # all_eco <- list.files("inst/tinytest/test_data/ECO/", full.names = TRUE) %>%
  #   tibble(file_name = .) %>%
  #   mutate(contents = map(file_name, DSSAT::read_eco)) %>%
  #   mutate(new_file = str_replace_all(file_name,
  #                                     c("/ECO//" = "/write_eco/", "\\.ECO" = "_ECO_R.rds")))
  #
  # # Create inputs for tests
  # all_eco %>%
  #   pmap(\(file_name, contents, new_file) dput(contents, new_file))
  #
  # Create the test code for each file
  # all_eco %>%
  #   pull(file_name) %>%
  #   basename() %>%
  #   map(create_write_eco_test) %>%
  #   unlist() %>%
  #   clipr::write_clip()
  #
  # Create validation files
  # eco_out <- all_eco %>%
  #   mutate(valid_file = file.path(dirname(new_file), basename(file_name)),
  #          # raw_text = lapply(file_name, \(.x) readLines(.x, warn = FALSE)),
  #          # comments = lapply(raw_text, \(.x) gsub("!([^ ])",
  #          #                                        "! \\1",
  #          #                                        grep("!", .x, value = TRUE)
  #          #                                        )),
  #          # first_line = lapply(raw_text, \(.x) .x[1]),
  #          # body = lapply(raw_text, \(.x) grep("^ *$",
  #          #                                    gsub("!.*", "", .x[-1]),
  #          #                                    invert = TRUE,
  #          #                                    value = TRUE)),
  #          # valid_contents = pmap(list(first_line, comments, body),
  #          #                       \(first_line, comments, body) c(first_line, "", comments, "", body)),
  #          # write_out = pmap(list(valid_file, valid_contents),
  #          #                      \(valid_file, valid_contents) write(valid_contents, paste0(valid_file, ".orig"))),
  #          write_eco_out = pmap(list(valid_file, contents),
  #                               \(valid_file, contents) DSSAT::write_eco(contents, valid_file))
  #          )

}

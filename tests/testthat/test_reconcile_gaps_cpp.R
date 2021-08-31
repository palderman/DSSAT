library(DSSAT)
library(tibble)

test_that("Test fill in gaps",{

  no_gaps <- tibble(
    start = c(0, 5, 10),
    end = c(4, 9, 15),
    cnames = c("YEAR", "DOY", "DAS"),
    regex = c("YEAR", "DOY", "DAS"),
    col_names = c("YEAR", "DOY", "DAS"),
  )

  with_gaps <- tibble(
    start = c(0, 5, 13),
    end = c(4, 9, 15),
    cnames = c("YEAR", "DOY", "DAS"),
    regex = c("YEAR", "DOY", "DAS"),
    col_names = c("YEAR", "DOY", "DAS"),
  )

  test_df <- reconcile_gaps_cpp(with_gaps, character())

  expect_identical(no_gaps, test_df)

})

test_that("writing SAMPLE.WTH without v_fmt", {

  expected <- c("*WEATHER: Weather Location",
                "",
                "! This is a test dataset",
                "",
                "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
                "  SMPL    0.000    0.000     0   6.0   3.0   -99   -99",
                "",
                "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
                "95001   5.7  -0.6  -9.1   0.3   -99   -99   -99   -99   -99",
                "95002   5.6  -0.7 -11.8   0.0   -99   -99   -99   -99   -99",
                "95003   2.9  -4.6 -13.3   0.0   -99   -99   -99   -99   -99"
  )

  orig_wth <- tibble::tibble(DATE = as.POSIXct(c("95001","95002", "95003"),
                                               format = "%y%j"),
                             SRAD = c(5.7, 5.6, 2.9),
                             TMAX = c(-0.6, -0.7, -4.6),
                             TMIN = c(-9.1, -11.8, -13.3),
                             RAIN = c(0.3, 0, 0),
                             DEWP = c(NA_real_, NA_real_, NA_real_),
                             WIND = c(NA_real_, NA_real_, NA_real_),
                             PAR = c(NA_real_, NA_real_, NA_real_),
                             EVAP = c(NA_real_, NA_real_, NA_real_),
                             RHUM = c(NA_real_, NA_real_, NA_real_))

  attr(orig_wth, "location") <- "Weather Location"
  attr(orig_wth, "comments") <- "This is a test dataset"
  attr(orig_wth, "GENERAL") <- tibble::tibble(INSI = "SMPL",
                                              LAT = 0.0,
                                              LONG = 0.0,
                                              ELEV = 0.0,
                                              TAV = 6.,
                                              AMP = 3.,
                                              REFHT = NA_real_,
                                              WNDHT = NA_real_)

  withr::with_file("SAMPLE.WTH",{
                   DSSAT::write_wth(orig_wth, "SAMPLE.WTH")
                   expect_identical(readLines("SAMPLE.WTH"),
                                    expected)
                   })

})

test_that("writing SAMPLE.WTH without GENERAL", {

  expected <- c("*WEATHER: Weather Location",
                "",
                "! This is a test dataset",
                "",
                "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
                "   -99      -99      -99   -99   -99   -99   -99   -99",
                "",
                "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
                "95001   5.7  -0.6  -9.1   0.3   -99   -99   -99   -99   -99",
                "95002   5.6  -0.7 -11.8   0.0   -99   -99   -99   -99   -99",
                "95003   2.9  -4.6 -13.3   0.0   -99   -99   -99   -99   -99"
  )

  orig_wth <- tibble::tibble(DATE = as.POSIXct(c("95001","95002", "95003"),
                                               format = "%y%j"),
                             SRAD = c(5.7, 5.6, 2.9),
                             TMAX = c(-0.6, -0.7, -4.6),
                             TMIN = c(-9.1, -11.8, -13.3),
                             RAIN = c(0.3, 0, 0),
                             DEWP = c(NA_real_, NA_real_, NA_real_),
                             WIND = c(NA_real_, NA_real_, NA_real_),
                             PAR = c(NA_real_, NA_real_, NA_real_),
                             EVAP = c(NA_real_, NA_real_, NA_real_),
                             RHUM = c(NA_real_, NA_real_, NA_real_))

  attr(orig_wth, "location") <- "Weather Location"
  attr(orig_wth, "comments") <- "This is a test dataset"

  withr::with_file("SAMPLE.WTH",{
    DSSAT::write_wth(orig_wth, "SAMPLE.WTH")
    expect_identical(readLines("SAMPLE.WTH"),
                     expected)
  })

})

test_that("writing SAMPLE.WTH overriding GENERAL variables", {

  expected <- c("*WEATHER: Weather Location",
                "",
                "! This is a test dataset",
                "",
                "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
                "  SAMP    5.000    5.000    10   6.0   3.0   2.0   2.0",
                "",
                "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
                "95001   5.7  -0.6  -9.1   0.3   -99   -99   -99   -99   -99",
                "95002   5.6  -0.7 -11.8   0.0   -99   -99   -99   -99   -99",
                "95003   2.9  -4.6 -13.3   0.0   -99   -99   -99   -99   -99"
  )

  orig_wth <- tibble::tibble(DATE = as.POSIXct(c("95001","95002", "95003"),
                                               format = "%y%j"),
                             SRAD = c(5.7, 5.6, 2.9),
                             TMAX = c(-0.6, -0.7, -4.6),
                             TMIN = c(-9.1, -11.8, -13.3),
                             RAIN = c(0.3, 0, 0),
                             DEWP = c(NA_real_, NA_real_, NA_real_),
                             WIND = c(NA_real_, NA_real_, NA_real_),
                             PAR = c(NA_real_, NA_real_, NA_real_),
                             EVAP = c(NA_real_, NA_real_, NA_real_),
                             RHUM = c(NA_real_, NA_real_, NA_real_))

  attr(orig_wth, "location") <- "Weather Location"
  attr(orig_wth, "comments") <- "This is a test dataset"
  attr(orig_wth, "GENERAL") <- tibble::tibble(INSI = "SMPL",
                                              LAT = 0.0,
                                              LONG = 0.0,
                                              ELEV = 0.0,
                                              TAV = 0.,
                                              AMP = 0.,
                                              REFHT = NA_real_,
                                              WNDHT = NA_real_)

  withr::with_file("SAMPLE.WTH",{
    DSSAT::write_wth(orig_wth, "SAMPLE.WTH",
              INSI = "SAMP",
              LAT = 5.0, LONG = 5.0, ELEV = 10,
              TAV = 6, AMP = 3,
              REFHT = 2, WNDHT = 2)
    expect_identical(readLines("SAMPLE.WTH"),
                     expected)
  })

})

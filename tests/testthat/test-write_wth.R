test_that("writing SAMPLE.WTH", {

  expected <- c("*WEATHER: Weather Location",
                "",
                "! This is a test dataset",
                "",
                "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
                "  SMPL   00.000  000.000     0   6.0   3.0   -99   -99",
                "",
                "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
                "95001   5.7  -0.6  -9.1   0.3   -99   -99   -99   -99   -99",
                "95002   5.6  -0.7 -11.8   0.0   -99   -99   -99   -99   -99",
                "95003   2.9  -4.6 -13.3   0.0   -99   -99   -99   -99   -99"
  )

  orig_wth <- tibble::tibble(DATE = as.POSIXct(c("95001","95002", "95003"),
                                               format = "%Y%j"),
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
                                              REFHT = NA,
                                              WNDHT = NA)

  withr::with_file()

})

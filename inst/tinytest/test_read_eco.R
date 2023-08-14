# "read_eco() ALFRM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.2f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/ALFRM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() ALFRM048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("G00001", "G00002", "G00003",
                                    "G00004", "G00005", "C00001",
                                    "C00002"),
                         `ECONAME` = c("Aragon FD7", "Rugged FD3",
                                       "Cisco II FD6", "CUF101 FD10",
                                       "Aragon", "Apica FD4", "Oneida  FD3"
                         ),
                         `MG` = c(0, 0, 0, 0, 0,
                                  0, 0),
                         `TM` = c(1, 1, 1, 1, 1,
                                  1, 1),
                         `THVAR` = c(1, 1, 1, 1, 1, 1, 1),
                         `PL-EM` = c(0, 0, 0, 0, 0, 0, 0),
                         `EM-V1` = c(0, 0, 0, 0, 0, 0, 0),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(9999, 9999, 9999, 9999, 9999,
                                     9999, 9999),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.75, 0.75, 0.75, 0.75, 0.75,
                                    0.75, 0.75),
                         `LNGSH` = c(10, 10, 10, 10, 10, 10, 10
                         ),
                         `R7-R8` = c(9999, 9999, 9999, 9999, 9999,
                                     9999, 9999),
                         `FL-VS` = c(9999, 9999, 9999, 9999, 9999,
                                     9999, 9999),
                         `TRIFL` = c(0.24, 0.24, 0.24, 0.24, 0.24,
                                     0.2, 0.2),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1),
                         `RHGHT` = c(1, 1, 1, 1, 1, 1, 1),
                         `R1PPO` = c(0, 0, 0, 0, 0, 0, 0),
                         `OPTBI` = c(0, 0, 0, 0, 0, 0, 0),
                         `SLOBI` = c(0, 0, 0, 0, 0, 0, 0),
                         `RDRMT` = c(0.421, 0.5, 0.32, 0.14, 0.421,
                                     0.421, 0.5),
                         `RDRMG` = c(1, 1, 1, 1, 1, 1, 1),
                         `RDRMM` = c(0.85, 0.85, 0.85, 0.85, 0.65,
                                     0.95, 0.95),
                         `RCHDP` = c(1, 1, 1, 1, 1, 1, 1))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() ALFRM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() ALFRM048.ECO")


# "read_eco() BACER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-6s", P1 = "%6.0f", P2FR1 = "%6.2f",
                       P2 = "%6.0f", P3 = "%6.0f", P4FR1 = "%6.2f",
                       P4FR2 = "%6.2f", P4 = "%6.0f", VEFF = "%6.1f",
                       PARUE = "%6.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
                       PHF3 = "%6.1f", LA1S = "%6.1f", LAFV = "%6.2f",
                       LAFR = "%6.2f", SLAS = "%6.0f", LSPHS = "%6.1f",
                       LSPHE = "%6.1f", "TIL#S" = "%6.1f", TIPHE = "%6.1f",
                       TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.0f",
                       TDFAC = "%6.1f", RDGS = "%6.0f", HTSTD = "%6.0f",
                       AWNS = "%6.0f", KCAN = "%6.2f", "RS%S" = "%6.0f",
                       "GN%S" = "%6.1f", "GN%MN" = "%6.0f", TKFH = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BACER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BACER048.ECO"

    `char_cols` <- "ECO#"
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "SY0001", "SY0002", "US0001"),
                         `P1` = c(100, 500, 200, 381, 394, 356),
                         `P2FR1` = c(0, 0.6, 0.25, 0.25, 0.25,
                                     0.25),
                         `P2` = c(100, 500, 200, 285, 294, 265),
                         `P3` = c(100, 500, 200, 191, 198, 179),
                         `P4FR1` = c(0.15, 0.35, 0.25, 0.25, 0.25,
                                     0.25),
                         `P4FR2` = c(0.05, 0.25, 0.1, 0.1, 0.1,
                                     0.1),
                         `P4` = c(100, 500, 200, 258, 267, 241),
                         `VEFF` = c(0, 1, 0.6, 0.3, 0.3, 1),
                         `PARUE` = c(1, 6, 2.7, 2, 2, 2.6),
                         `PARU2` = c(1, 6, 2.7, 2, 2, 2.6),
                         `PHL2` = c(4, 200, 15, 13, 13, 13),
                         `PHF3` = c(1, 1.6, 1.3, 1, 1, 1),
                         `LA1S` = c(1, 20, 5, 4, 4, 4.8),
                         `LAFV` = c(0.01, 0.8, 0.1, 0.1, 0.1, 0.05
                         ),
                         `LAFR` = c(0.1, 3, 0.5, 0.3, 0.3, 0.13
                         ),
                         `SLAS` = c(100, 600, 400, 300, 300, 400
                         ),
                         `LSPHS` = c(4, 5.7, 5.5, 4.2, 4.2, 5.3
                         ),
                         `LSPHE` = c(5.5, 6.5, 6.3, 6, 6, 6.5),
                         `TIL#S` = c(2.5, 7, 3.5, 5, 5, 4.5),
                         `TIPHE` = c(2, 4, 2.5, 2.5, 2.5, 2),
                         `TIFAC` = c(0.5, 2, 1, 1, 1, 1),
                         `TDPHS` = c(1.5, 4, 2.5, 2.5, 2.5, 2),
                         `TDPHE` = c(2, 6, 6, 5, 5, 4),
                         `TDFAC` = c(0, 20, 4, 1, 1, 0.1),
                         `RDGS` = c(1, 5, 3, 3, 3, 3),
                         `HTSTD` = c(60, 150, 100, 100, 100, 100
                         ),
                         `AWNS` = c(0, 10, 0, 0, 0, 5),
                         `KCAN` = c(0.65, 0.95, 0.85, 0.85, 0.85,
                                    0.85),
                         `RS%S` = c(10, 60, 30, 30, 30, 30),
                         `GN%S` = c(1, 3.5, 3, 3, 3, 2),
                         `GN%MN` = c(0, 6, 0, 0, 0, 0),
                         `TKFH` = c(-10, -25, -10, -10, -10, -20
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BACER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BACER048.ECO")


# "read_eco() BACRP048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       PARUE = "%5.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
                       PHF3 = "%6.1f", SLAS = "%6.0f", LSENI = "%6.1f",
                       LSPHS = "%6.1f", LSPHE = "%6.1f", "TIL#S" = "%6.1f",
                       TIPHE = "%6.0f", TIFAC = "%6.1f", TDPHS = "%6.1f",
                       TDPHE = "%6.1f", TDFAC = "%6.1f", TDSF = "%6.0f",
                       RDGS = "%6.0f", HTSTD = "%6.0f", AWNS = "%6.0f",
                       KCAN = "%6.2f", "RS%A" = "%6.0f", "GN%S" = "%6.0f",
                       "GN%MN" = "%6.1f", "GM%H" = "%6.0f", TKFH = "%6.0f",
                       SSPHS = "%6.1f", SSPHE = "%6.1f", GWTAF = "%6.1f",
                       GWTAT = "%6.0f", "G#RF" = "%6.2f", RTNUP = "%6.3f",
                       NUPNF = "%6.1f", NUPWF = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BACRP048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BACRP048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "SY0001", "SY0002", "US0001"),
                         `ECONAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                       "SYRIA", "SYRIA", "USA"),
                         `PARUE` = c(1, 4, 2.3, 2, 2, 2),
                         `PARU2` = c(1, 4, 2.3, 2, 2, 2),
                         `PHL2` = c(4, 200, 12, 200, 200, 200),
                         `PHF3` = c(1, 1.6, 1.3, 1, 1, 1),
                         `SLAS` = c(100, 400, 400, 300, 300, 400
                         ),
                         `LSENI` = c(0.1, 2.5, 1.5, 1, 1, 0.6),
                         `LSPHS` = c(5, 8.5, 8, 8.7, 8.7, 8.7),
                         `LSPHE` = c(5, 9.5, 9.2, 9.3, 9.3, 9.3
                         ),
                         `TIL#S` = c(2, 5, 4, 5, 5, 4.5),
                         `TIPHE` = c(2, 5, 3, 3, 3, 3),
                         `TIFAC` = c(0.1, 1, 1, 0.5, 0.5, 1),
                         `TDPHS` = c(1.5, 3.5, 3, 3, 3, 3),
                         `TDPHE` = c(4.5, 8, 7, 8, 8, 8),
                         `TDFAC` = c(0.1, 15, 5, 3, 5, 5),
                         `TDSF` = c(0, 1, 1, 0, 0, 0),
                         `RDGS` = c(1, 5, 3, 3, 3, 3),
                         `HTSTD` = c(50, 150, 100, 100, 100, 100
                         ),
                         `AWNS` = c(0, 10, 5, 5, 5, 5),
                         `KCAN` = c(0.65, 0.95, 0.85, 0.85, 0.85,
                                    0.85),
                         `RS%A` = c(5, 30, 15, 30, 30, 30),
                         `GN%S` = c(1, 3, 2, 2, 2, 2),
                         `GN%MN` = c(0.5, 2.5, 1.5, 1, 1, 1),
                         `GM%H` = c(0, 25, 15, 15, 15, 15),
                         `TKFH` = c(-10, -30, -15, -10, -10, -20
                         ),
                         `SSPHS` = c(5, 8.5, 8, 8.7, 8.7, 8.7),
                         `SSPHE` = c(6, 9.5, 9.3, 9.3, 9.3, 9.3
                         ),
                         `GWTAF` = c(0, 0.7, 0.3, 0.3, 0.3, 0.3
                         ),
                         `GWTAT` = c(1000, 7000, 4000, 4000, 4000,
                                     4000),
                         `G#RF` = c(0, 0.05, 0, 0.03, 0.03, 0.03
                         ),
                         `RTNUP` = c(0.001, 0.01, 0.006, 0.006,
                                     0.006, 0.006),
                         `NUPNF` = c(0.1, 2, 1, 0.4, 0.4, 1),
                         `NUPWF` = c(0, 2, 1, 1, 1, 1))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BACRP048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BACRP048.ECO")


# "read_eco() BHGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BHGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BHGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "BH0001",
                         `ECONAME` = "PENSACOLA BAHIA",
                         `MG` = 0,
                         `TM` = 1,
                         `THVAR` = 1,
                         `PL-EM` = 0,
                         `EM-V1` = 0,
                         `V1-JU` = 9999,
                         `JU-R0` = 9999,
                         `PM06` = 0,
                         `PM09` = 0.75,
                         `LNGSH` = 10,
                         `R7-R8` = 9999,
                         `FL-VS` = 9999,
                         `TRIFL` = 0.15,
                         `RWDTH` = 1,
                         `RHGHT` = 1,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BHGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BHGRO048.ECO")


# "read_eco() BMFRM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BMFRM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BMFRM048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "G00002",
                         `ECONAME` = "TIFTON 85 BERMUDA",
                         `MG` = 0,
                         `TM` = 1,
                         `THVAR` = 1,
                         `PL-EM` = 0,
                         `EM-V1` = 0,
                         `V1-JU` = 0,
                         `JU-R0` = 9999,
                         `PM06` = 0,
                         `PM09` = 0.75,
                         `LNGSH` = 10,
                         `R7-R8` = 9999,
                         `FL-VS` = 9999,
                         `TRIFL` = 0.15,
                         `RWDTH` = 1,
                         `RHGHT` = 1,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0,
                         `RDRMT` = 0.538,
                         `RDRMG` = 1,
                         `RDRMM` = 0.867,
                         `RCHDP` = 1)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BMFRM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BMFRM048.ECO")


# "read_eco() BNGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BNGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BNGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("MESIND", "MESDET", "ANDIND",
                                    "ANDDET", "MEXHIL", "EMBRAP",
                                    "DFAULT"),
                         `ECONAME` = c("MESO AMER T 2-4", "MESO AMER TYPE 1",
                                       "ANDEAN TYPE 2-4", "ANDEAN TYPE 1",
                                       "Mex Highland Ind", "EMBRAPA",
                                       "DEFAULT ECOTYPE"),
                         `MG` = c(1, 1, 2, 2, 1,
                                  1, 1),
                         `TM` = c(1, 1, 2, 2, 1,
                                  1, 1),
                         `THVAR` = c(0, 0, 0, 0, 0, 0, 1),
                         `PL-EM` = c(3, 3, 4, 4, 3.5, 3, 4),
                         `EM-V1` = c(3, 3, 3, 3, 3, 5, 5),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(5, 5, 5, 5, 5, 5, 5),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.55, 0.55, 0.55, 0.55, 0.55,
                                    0.75, 0.5),
                         `LNGSH` = c(8, 8, 8, 8, 8, 8, 8),
                         `R7-R8` = c(9, 7, 9, 7, 9, 10, 10),
                         `FL-VS` = c(11, 0, 11, 0, 11, 13, 13),
                         `TRIFL` = c(0.35, 0.35, 0.35, 0.35, 0.35,
                                     0.35, 0.35),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1),
                         `RHGHT` = c(1, 1, 1, 1, 1, 1, 1),
                         `R1PPO` = c(0, 0, 0, 0, 0, 0, 0),
                         `OPTBI` = c(0, 0, 0, 0, 0, 0, 0),
                         `SLOBI` = c(0, 0, 0, 0, 0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BNGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BNGRO048.ECO")


# "read_eco() BRFRM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.2f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BRFRM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BRFRM048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "G00001",
                         `ECONAME` = "Brachiaria",
                         `MG` = 0,
                         `TM` = 1,
                         `THVAR` = 1,
                         `PL-EM` = 0,
                         `EM-V1` = 0,
                         `V1-JU` = 0,
                         `JU-R0` = 9999,
                         `PM06` = 0,
                         `PM09` = 0.75,
                         `LNGSH` = 10,
                         `R7-R8` = 9999,
                         `FL-VS` = 9999,
                         `TRIFL` = 0.15,
                         `RWDTH` = 1,
                         `RHGHT` = 1,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0,
                         `RDRMT` = 0.475,
                         `RDRMG` = 1,
                         `RDRMM` = 0.85,
                         `RCHDP` = 1)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BRFRM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BRFRM048.ECO")


# "read_eco() BRGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNHSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.1f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BRGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BRGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("BR0001", "DFAULT"),
                         `ECONAME` = c("DEFAULT BRACHI", "DEFAULT ECOTYPE"
                         ),
                         `MG` = c(0, 0),
                         `TM` = c(1, 1),
                         `PP-SS` = c(1, 1),
                         `PL-EM` = c(3, 0),
                         `EM-V1` = c(6, 0),
                         `V1-JU` = c(9999, 9999),
                         `JU-R0` = c(9999, 9999),
                         `PM06` = c(0, 0),
                         `PM09` = c(0.75, 0.75),
                         `LNHSH` = c(10, 10),
                         `R7-R8` = c(9999, 9999),
                         `FL-VS` = c(9999, 9999),
                         `TRIFL` = c(0.1, 0.1),
                         `RWDTH` = c(1, 1),
                         `RHGHT` = c(1, 1),
                         `R1PPO` = c(0, 0),
                         `OPTBI` = c(0, 0),
                         `SLOBI` = c(0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BRGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BRGRO048.ECO")


# "read_eco() BSCER048.ECO"

  `v_fmt_expected` = c(ECO = "%-7s", ECONAME = "%-18s", TBASE = "%5.0f",
                       TOPT = "%6.0f", ROPT = "%5.0f", P20 = "%6.1f",
                       DJTI = "%6.0f", GDDE = "%6.1f", DSGFT = "%7.0f",
                       RUE = "%5.1f", KCAN = "%7.2f", TSEN = "%6f",
                       CDAY = "%6f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/BSCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() BSCER048.ECO"

    `char_cols` <- c("ECO", "ECONAME")
    expected_vals <- list(`ECO` = c("IB0001", "IB0002", "DFAULT",
                                   "IHSTUT"),
                         `ECONAME` = c("GENERIC 1", "GENERIC 2",
                                       "DEFAULT", "Betaseed, Germany"
                         ),
                         `TBASE` = c(3, 3, 3, 3),
                         `TOPT` = c(27, 27, 32, 27),
                         `ROPT` = c(27, 27, 27, 27),
                         `P20` = c(12.5, 12.5, 12.5, 12.5),
                         `DJTI` = c(4, 4, 4, 4),
                         `GDDE` = c(6, 5.9, 6, 6),
                         `DSGFT` = c(170, 170, 180, 170),
                         `RUE` = c(3.7, 3, 3.8, 3.8),
                         `KCAN` = c(0.75, 0.75, 0.85, 0.7),
                         `TSEN` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_),
                         `CDAY` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() BSCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() BSCER048.ECO")


# "read_eco() CBGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNHSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.2f", RWDTH = "%6.1f",
                       RHGHT = "%6.1f", R1PPO = "%6.0f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CBGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CBGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("CB0401", "CB0402", "CB0403",
                                    "DFAULT"),
                         `ECONAME` = c("CABBAGE TYPE 1", "CABBAGE TYPE 2",
                                       "Kalorama", "DEFAULT TYPE"
                         ),
                         `MG` = c(4, 4, 4, 4),
                         `TM` = c(1, 1, 1, 1),
                         `PP-SS` = c(0, 0, 0, 0),
                         `PL-EM` = c(3.6, 3.6, 3.6, 3.6),
                         `EM-V1` = c(6, 6, 6, 6),
                         `V1-JU` = c(0, 0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0
                         ),
                         `PM06` = c(0, 0, 0, 0),
                         `PM09` = c(0.35, 0.35, 0.35, 0.35),
                         `LNHSH` = c(25, 25, 25, 25),
                         `R7-R8` = c(12, 12, 12, 12),
                         `FL-VS` = c(35, 39, 23, 39),
                         `TRIFL` = c(0.38, 0.38, 0.45, 0.38),
                         `RWDTH` = c(1, 1, 1.8, 1),
                         `RHGHT` = c(1, 1, 1.2, 1),
                         `R1PPO` = c(0, 0, 0, 0),
                         `OPTBI` = c(20, 20, 20, 20),
                         `SLOBI` = c(0.035, 0.035, 0.035, 0.035
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CBGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CBGRO048.ECO")


# "read_eco() CHGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.1f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.1f", RWDTH = "%6.0f",
                       RHGHT = "%6.0f", R1PPO = "%6.0f", OPTBI = "%6.0f",
                       SLOBI = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CHGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CHGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("DESI", "KABULI", "DFAULT"),
                         `ECONAME` = c("DESI TYPE", "KABULI TYPE",
                                       "DEFAULT"),
                         `MG` = c(1, 1, 1),
                         `TM` = c(1, 1, 1),
                         `THVAR` = c(0, 0, 0),
                         `PL-EM` = c(2, 2, 2),
                         `EM-V1` = c(1.5, 1.5, 1.5),
                         `V1-JU` = c(0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0),
                         `PM06` = c(0, 0, 0),
                         `PM09` = c(0.2, 0.2, 0.2),
                         `LNGSH` = c(7, 7, 7),
                         `R7-R8` = c(8, 8, 8),
                         `FL-VS` = c(19, 19, 19),
                         `TRIFL` = c(0.6, 0.6, 0.6),
                         `RWDTH` = c(1, 1, 1),
                         `RHGHT` = c(1, 1, 1),
                         `R1PPO` = c(0, 0, 0),
                         `OPTBI` = c(0, 0, 0),
                         `SLOBI` = c(0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CHGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CHGRO048.ECO")


# "read_eco() CIGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.1f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.0f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CIGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CIGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("CI1111", "CI2222", "DFAULT"
    ),
    `ECONAME` = c("MATURITY GROUP 0", "MATURITY GROUP 0",
                  "DEFAULT        0"),
    `MG` = c(0, 0, 0),
    `TM` = c(1, 1, 1),
    `THVAR` = c(0, 0, 0),
    `PL-EM` = c(3, 3, 3),
    `EM-V1` = c(3, 3, 3),
    `V1-JU` = c(0, 0, 0),
    `JU-R0` = c(5.0, 5.0, 5.0),
    `PM06` = c(0, 0, 0),
    `PM09` = c(0.35, 0.35, 0.35),
    `LNGSH` = c(13, 10, 13),
    `R7-R8` = c(12, 12, 12),
    `FL-VS` = c(0.5, 0.5, 0.5),
    `TRIFL` = c(0.72, 0.72, 0.72),
    `RWDTH` = c(1, 1, 1),
    `RHGHT` = c(1, 1, 1),
    `R1PPO` = c(0, 0.189, 0),
    `OPTBI` = c(18, 18, 18),
    `SLOBI` = c(0.028, 0.028, 0.028))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CIGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CIGRO048.ECO")


# "read_eco() CNGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.1f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CNGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CNGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0", "R7-R8",
                    "OPTBI")
    expected_vals <- list(`ECO#` = c("CN0001", "DFAULT"),
                         `ECONAME` = c("MATURITY GROUP 01", "DEFAULT TYPE"
                         ),
                         `MG` = c(1, 1),
                         `TM` = c(1, 1),
                         `THVAR` = c(0, 0),
                         `PL-EM` = c(3.6, 3.6),
                         `EM-V1` = c(6, 6),
                         `V1-JU` = c(0, 0),
                         `JU-R0` = c(5.0, 5.0),
                         `PM06` = c(0, 0),
                         `PM09` = c(0.35, 0.35),
                         `LNGSH` = c(10, 10),
                         `R7-R8` = c(3.0, 12.0),
                         `FL-VS` = c(0, 0),
                         `TRIFL` = c(0.35, 0.32),
                         `RWDTH` = c(1, 1),
                         `RHGHT` = c(1.5, 0.9),
                         `R1PPO` = c(0, 0.504),
                         `OPTBI` = c(.0, 20.0),
                         `SLOBI` = c(0, 0.035))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CNGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CNGRO048.ECO")


# "read_eco() COGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.1f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f",
                       KCAN = "%6f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/COGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() COGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("CO0001", "CO0003", "CO0005",
                                    "CO0006", "CO0021"),
                         `ECONAME` = c("DP 77", "DP 458", "DP 555",
                                       "DP 1219", "GP 3774"),
                         `MG` = c(2, 2, 2, 2, 2),
                         `TM` = c(1, 1, 1, 1, 1),
                         `THVAR` = c(0, 0, 0, 0, 0),
                         `PL-EM` = c(4, 4, 4, 4, 4),
                         `EM-V1` = c(4, 4, 4, 4, 4),
                         `V1-JU` = c(0, 0, 0, 0, 0),
                         `JU-R0` = c(0, 0, 0, 0, 0),
                         `PM06` = c(0, 0, 0, 0, 0),
                         `PM09` = c(0.9, 0.9, 0.9, 0.9, 0.9),
                         `LNGSH` = c(10, 12, 6, 8, 8),
                         `R7-R8` = c(10, 10, 10, 10, 10),
                         `FL-VS` = c(75, 65, 75, 40, 75),
                         `TRIFL` = c(0.2, 0.25, 0.2, 0.2, 0.2),
                         `RWDTH` = c(0.8, 1, 1, 1, 0.85),
                         `RHGHT` = c(0.85, 0.9, 1, 0.9, 0.95),
                         `R1PPO` = c(0.001, 0.001, 0.001, 0.001,
                                     0.001),
                         `OPTBI` = c(20, 20, 20, 20, 20),
                         `SLOBI` = c(0.001, 0.001, 0.001, 0.001,
                                     0.001),
                         `KCAN` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() COGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() COGRO048.ECO")


# "read_eco() CPGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNHSH = "%6.1f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.1f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CPGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CPGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0", "FL-VS")
    expected_vals <- list(`ECO#` = c("DFAULT", "CP0409", "CP0410",
                                    "CP0411", "CP0412", "CP0413",
                                    "CP0414"),
                         `ECONAME` = c("DEFAULT TYPE", "MG 4 USA",
                                       "MG 4 Colombia", "MG 4 India",
                                       "MG 4 Kenya", "MG 4 Nigeria",
                                       "MG 4 Africa"),
                         `MG` = c(7, 4, 4, 4, 4,
                                  4, 4),
                         `TM` = c(1, 1, 1, 1, 1,
                                  1, 1),
                         `PP-SS` = c(0, 0, 0, 0, 0, 0, 0),
                         `PL-EM` = c(3.6, 3.6, 3.5, 3.5, 3.5, 3.5,
                                     3.5),
                         `EM-V1` = c(6, 6, 6, 6, 6, 6, 6),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0,
                                     5.0, 10.0, 5.0),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.35, 0.35, 1.35, 0.35, 0.35,
                                    0.35, 0.35),
                         `LNHSH` = c(10, 6.5, 6.5, 6.5, 6.5, 6.5,
                                     6.5),
                         `R7-R8` = c(12, 7, 7, 7, 7, 7, 7),
                         `FL-VS` = c(9.00, 8.00, 26.00,
                                     10.00, 26.00, 10.00, 10.00
                         ),
                         `TRIFL` = c(0.32, 0.45, 0.4, 0.4, 0.4,
                                     0.4, 0.45),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1),
                         `RHGHT` = c(0.9, 1, 1, 1, 1, 1, 1),
                         `R1PPO` = c(0.504, 0.369, 0.369, 0.369,
                                     0.369, 0.369, 0.369),
                         `OPTBI` = c(20, 17, 17, 17, 17, 17, 17
                         ),
                         `SLOBI` = c(0.035, 0, 0, 0, 0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CPGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CPGRO048.ECO")


# "read_eco() CSCAS048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       PARUE = "%5.1f", HTSTD = "%6.0f", DUSRI = "%6.0f",
                       "SRN%S" = "%6.2f", BR1FX = "%6.0f", BR2FX = "%6.0f",
                       BR3FX = "%6.0f", BR4FX = "%6.0f", BR5FX = "%6.0f",
                       BR6FX = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CSCAS048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CSCAS048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "990001", "990002", "990003",
                                    "990004"),
                         `ECONAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                       "STANDARD1", "STANDARD2",
                                       "STANDARD3", "STANDARD4"),
                         `PARUE` = c(2, 3.2, 2.8, 2.1, 2.3, 2.3,
                                     2.3),
                         `HTSTD` = c(100, 400, 200, 200, 200, 200,
                                     200),
                         `DUSRI` = c(300, 2000, 600, 600, 600,
                                     600, 1400),
                         `SRN%S` = c(0.25, 1, 0.65, 0.65, 0.65,
                                     0.65, 0.65),
                         `BR1FX` = c(1, 4, 3, 3, 3, 3, 3),
                         `BR2FX` = c(1, 4, 3, 3, 3, 3, 3),
                         `BR3FX` = c(1, 4, 3, 3, 3, 3, 3),
                         `BR4FX` = c(1, 4, 3, 3, 3, 3, 3),
                         `BR5FX` = c(1, 4, 3, 3, 3, 3, 3),
                         `BR6FX` = c(1, 4, 3, 3, 3, 3, 3))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CSCAS048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CSCAS048.ECO")


# "read_eco() CSYCA048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       PARUE = "%5.1f", TBLSZ = "%6.0f", "SRN%S" = "%6.2f",
                       KCAN = "%6.2f", PGERM = "%6.0f", PPS1 = "%6.0f",
                       PPS2 = "%6.0f", PPS3 = "%6.0f", PHTV = "%6.1f",
                       PHSV = "%6.2f", RDGS = "%6.1f", RLWR = "%6.0f",
                       WFSU = "%6.1f", RSUSE = "%6.2f", HMPC = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/CSYCA048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CSYCA048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "990001", "990002", "990003",
                                    "990004", "990005", "990006",
                                    "990007", "990008", "990009",
                                    "990010", "990011", "990012",
                                    "990013", "990014", "990015"),
                         `ECONAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                       "STANDARD1", "STANDARD2",
                                       "STANDARD3", "STANDARD4",
                                       "STANDARD5", "STANDARD6",
                                       "STANDARD7", "STANDARD8",
                                       "STANDARD9", "STANDARD10",
                                       "STANDARD11", "STANDARD12",
                                       "STANDARD13", "STANDARD14",
                                       "STANDARD15"),
                         `PARUE` = c(2, 3.2, 2.8, 1.7, 1.3, 1.5,
                                     1.4, 1.5, 1.5, 2, 1.9, 1.9,
                                     1.9, 1.9, 1.9, 2.4, 1.9, 3.8
                         ),
                         `TBLSZ` = c(12, 12, 12, 12, 14, 12, 12,
                                     12, 12, 12, 14, 14, 14, 14,
                                     14, 12, 14, 14),
                         `SRN%S` = c(0.25, 1, 0.65, 0.65, 0.65,
                                     0.65, 0.65, 0.65, 0.65, 0.65,
                                     0.65, 0.65, 0.65, 0.65, 0.65,
                                     0.65, 0.65, 0.65),
                         `KCAN` = c(0.65, 0.65, 0.65, 0.6, 0.88,
                                    0.85, 0.86, 0.72, 0.61, 0.72,
                                    0.88, 0.88, 0.88, 0.88, 0.88,
                                    0.72, 0.88, 0.5),
                         `PGERM` = c(120, 120, 120, 120, 120, 120,
                                     120, 120, 120, 120, 120, 120,
                                     120, 120, 120, 120, 120, 120
                         ),
                         `PPS1` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `PPS2` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `PPS3` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `PHTV` = c(0.8, 0.8, 0.8, 0.8, 0.8, 0.8,
                                    0.8, 0.8, 0.8, 0.8, 0.8, 0.8,
                                    0.8, 0.8, 0.8, 0.8, 0.8, 0.8),
                         `PHSV` = c(0.23, 0.23, 0.23, 0.23, 0.23,
                                    0.23, 0.23, 0.23, 0.23, 0.23,
                                    0.23, 0.23, 0.23, 0.23, 0.23,
                                    0.23, 0.23, 0.23),
                         `RDGS` = c(2.2, 2.2, 2.2, 2.2, 2.2, 2.2,
                                    2.2, 2.2, 2.2, 2.2, 2.2, 2.2,
                                    2.2, 2.2, 2.2, 2.2, 2.2, 2.2),
                         `RLWR` = c(50, 50, 50, 50, 50, 50, 50,
                                    50, 50, 50, 50, 50, 50, 50, 50,
                                    50, 50, 50),
                         `WFSU` = c(0.3, 0.3, 0.3, 0.5, 0, 0.4,
                                    0.5, 0.5, 0.3, 0.3, 0.3, 0.3,
                                    0.3, 0.3, 0.3, 0.3, 0.3, 0),
                         `RSUSE` = c(0.1, 0.1, 0.1, 0, 0.05, 0.05,
                                     0.1, 0.1, 0.1, 0.1, 0.1, 0.1,
                                     0.1, 0.1, 0.1, 0.05, 0.1, 0),
                         `HMPC` = c(30, 30, 30, 30, 30, 30, 30,
                                    30, 30, 30, 30, 30, 30, 30, 30,
                                    30, 30, 30))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() CSYCA048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() CSYCA048.ECO")


# "read_eco() FBGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.1f", RHGHT = "%6.2f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/FBGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() FBGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("FABSHO", "FABMED", "FABLON",
                                    "FABLN2", "DFAULT"),
                         `ECONAME` = c("120d seas .40g/s", "142d seas .65g/s",
                                       "170d seas 1.2g/s", "170d seas 1.2g/s",
                                       "DEFAULT"),
                         `MG` = c(2, 2, 2, 2, 2),
                         `TM` = c(2, 2, 2, 2, 2),
                         `PP-SS` = c(0, 0, 0, 0, 0),
                         `PL-EM` = c(4.8, 6, 6, 6, 6),
                         `EM-V1` = c(2.8, 4, 4, 4, 4),
                         `V1-JU` = c(0, 0, 0, 0, 0),
                         `JU-R0` = c(3.5, 5, 5, 5, 5),
                         `PM06` = c(0, 0, 0, 0, 0),
                         `PM09` = c(0.58, 0.58, 0.58, 0.58, 0.58
                         ),
                         `LNHSH` = c(12, 14, 17.5, 17.5, 14),
                         `R7-R8` = c(12, 12, 12, 12, 12),
                         `FL-VS` = c(28, 33, 44, 44, 33),
                         `TRIFL` = c(0.35, 0.35, 0.35, 0.35, 0.35
                         ),
                         `RWDTH` = c(1, 1, 1, 1.1, 1),
                         `RHGHT` = c(0.8, 1, 1.1, 1.16, 1),
                         `R1PPO` = c(0, 0, 0, 0, 0),
                         `OPTBI` = c(0, 0, 0, 0, 0),
                         `SLOBI` = c(0, 0, 0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() FBGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() FBGRO048.ECO")


# "read_eco() G0GRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/G0GRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() G0GRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "G00001",
                         `ECONAME` = "PENSACOLA BAHIA",
                         `MG` = 0,
                         `TM` = 1,
                         `THVAR` = 1,
                         `PL-EM` = 0,
                         `EM-V1` = 0,
                         `V1-JU` = 9999,
                         `JU-R0` = 9999,
                         `PM06` = 0,
                         `PM09` = 0.75,
                         `LNGSH` = 10,
                         `R7-R8` = 9999,
                         `FL-VS` = 9999,
                         `TRIFL` = 0.15,
                         `RWDTH` = 1,
                         `RHGHT` = 1,
                         `THRSH` = 78,
                         `SDPRO` = 0.115,
                         `SDLIP` = 0.035,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() G0GRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() G0GRO048.ECO")


# "read_eco() GBGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.1f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/GBGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() GBGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "SNAPBN",
                         `ECONAME` = "X-ANDEAN TYPE",
                         `MG` = 2,
                         `TM` = 2,
                         `THVAR` = 0,
                         `PL-EM` = 4,
                         `EM-V1` = 3,
                         `V1-JU` = 0,
                         `JU-R0` = 5,
                         `PM06` = 0,
                         `PM09` = 0.55,
                         `LNGSH` = 8,
                         `R7-R8` = 7,
                         `FL-VS` = 1,
                         `TRIFL` = 0.33,
                         `RWDTH` = 1.1,
                         `RHGHT` = 1,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() GBGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() GBGRO048.ECO")


# "read_eco() GGFRM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.2f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/GGFRM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() GGFRM048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = "GG0009",
                         `ECONAME` = "Panicum",
                         `MG` = 0,
                         `TM` = 1,
                         `THVAR` = 1,
                         `PL-EM` = 0,
                         `EM-V1` = 0,
                         `V1-JU` = 0,
                         `JU-R0` = 9999,
                         `PM06` = 0,
                         `PM09` = 0.75,
                         `LNGSH` = 10,
                         `R7-R8` = 9999,
                         `FL-VS` = 9999,
                         `TRIFL` = 0.15,
                         `RWDTH` = 1,
                         `RHGHT` = 1,
                         `R1PPO` = 0,
                         `OPTBI` = 0,
                         `SLOBI` = 0,
                         `RDRMT` = 0.35,
                         `RDRMG` = 1,
                         `RDRMM` = 0.574,
                         `RCHDP` = 1)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() GGFRM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() GGFRM048.ECO")


# "read_eco() MLCER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%5.0f", ROPT = "%6.0f",
                       DJTI = "%6.0f", GDDE = "%6.0f", RUE = "%6.1f",
                       KCAN = "%6.2f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/MLCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() MLCER048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "DFAULT", "IB0101",
                                    "IB0201", "IB0301"),
                         `ECONAME` = c("GENERIC", "DEFAULT", "GENERIC",
                                       "GENERIC", "GENERIC"),
                         `TBASE` = c(10, 10, 10, 10, 10),
                         `TOPT` = c(34, 34, 34, 34, 34),
                         `ROPT` = c(34, 34, 34, 34, 34),
                         `DJTI` = c(68, 68, 68, 68, 68),
                         `GDDE` = c(6, 6, 6, 6, 6),
                         `RUE` = c(4, 4, 4.4, 4.8, 4.5),
                         `KCAN` = c(0.85, 0.85, 0.85, 0.85, 0.85
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() MLCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() MLCER048.ECO")


# "read_eco() MZCER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%6.0f", ROPT = "%5.0f",
                       P20 = "%6.1f", DJTI = "%6.0f", GDDE = "%6.0f",
                       DSGFT = "%7.0f", RUE = "%5.1f", KCAN = "%7.2f",
                       TSEN = "%6f", CDAY = "%6f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/MZCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() MZCER048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "IB0003",
                                    "IB0004", "DFAULT"),
                         `ECONAME` = c("GENERIC MIDWEST1", "GENERIC MIDWEST2",
                                       "GENERIC MIDWEST3", "+5% RUE MIDWEST1",
                                       "DEFAULT"),
                         `TBASE` = c(8, 8, 8, 8, 8),
                         `TOPT` = c(34, 34, 34, 34, 34),
                         `ROPT` = c(34, 34, 34, 34, 34),
                         `P20` = c(12.5, 12.5, 12.5, 12.5, 12.5
                         ),
                         `DJTI` = c(4, 4, 4, 4, 4),
                         `GDDE` = c(6, 6, 6, 6, 6),
                         `DSGFT` = c(170, 170, 170, 170, 170),
                         `RUE` = c(4.2, 4.5, 2, 4.4, 4.2),
                         `KCAN` = c(0.85, 0.85, 0.85, 0.85, 0.85
                         ),
                         `TSEN` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_),
                         `CDAY` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() MZCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() MZCER048.ECO")


# "read_eco() MZIXM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%5.0f", ROPT = "%6.0f",
                       P20 = "%5.0f", DJTI = "%7s", GDDE = "%6.0f",
                       DSGFT = "%7.0f", RUE = "%5.1f", KCAN = "%7.2f",
                       PSTM = "%6.2f", PEAR = "%6.2f", TSEN = "%6f",
                       CDAY = "%6f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/MZIXM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() MZIXM048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "DJTI")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "IB0003",
                                    "IB0004"),
                         `ECONAME` = c("HEAVY STEMS", "LIGHT STEMS",
                                       "MEDIUM STEMS", "DEFAULT"),
                         `TBASE` = c(8, 8, 8, 8),
                         `TOPT` = c(34, 34, 34, 34),
                         `ROPT` = c(34, 34, 34, 34),
                         `P20` = c(12, 12, 12, 12),
                         `DJTI` = c("5   4.0", "5   4.0", "5   4.0",
                                    "5   4.0"),
                         `GDDE` = c(6, 6, 6, 6),
                         `DSGFT` = c(170, 170, 170, 170),
                         `RUE` = c(4.2, 4.2, 4.2, 4.2),
                         `KCAN` = c(0.85, 0.85, 0.85, 0.85),
                         `PSTM` = c(0.75, 0.1, 0.5, 0.4),
                         `PEAR` = c(0.15, 0.15, 0.15, 0.15),
                         `TSEN` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_),
                         `CDAY` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() MZIXM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() MZIXM048.ECO")


# "read_eco() PNGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.1f", PM09 = "%6.0f", LNGSH = "%6.0f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.2f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/PNGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() PNGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
    expected_vals <- list(`ECO#` = c("RUNNER", "VIRGIN", "SPANIS",
                                    "PN0001", "PN0002", "PN0003",
                                    "PN0004", "PN0005", "PN0006",
                                    "PN0007", "PN0008", "PN0009",
                                    "PN0010", "PN0011", "PN0012",
                                    "PN0013", "PN0014", "PN0015",
                                    "PN0016", "PN0017", "PN0018",
                                    "PN0019", "PN0020", "DFAULT",
                                    "PN0095"),
                         `ECONAME` = c("RUNNER TYPE", "VIRGINIA TYPE",
                                       "SPANISH TYPE", "FLORUNNER VARS",
                                       "SLOW RUNNER", "MEDIUM RUNNER",
                                       "FAST BUNCH, VA", "SLOW BUNCH, VA",
                                       "SHORT SPANISH", "MEDIUM SPANISH",
                                       "FAST VIRGINIA", "FAST   RUNNER",
                                       "FAST VA BUN,Q188", "FAST VIRG, TIF-8",
                                       "SHORT SPANISH", "SLOW BUNCH, VA",
                                       "SLOW,RUN,loshel%", "SMALL RUNNER",
                                       "SLOW,SHORT VA BU", "MEDIUM SPAN chin",
                                       "SLOW,SHORT 97-98", "MEDIUM SPAN97-98",
                                       "SLOW,SHORT 97-98", "DEFAULT ECOTYPE",
                                       "FLORIGRAZE PEREN"),
                         `MG` = c(2, 1, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2, 2),
                         `TM` = c(1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1),
                         `THVAR` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0),
                         `PL-EM` = c(5, 5, 4.6, 5, 5, 5, 5, 5,
                                     4.6, 4.6, 5, 5, 5, 5, 4.6, 5,
                                     5, 4.6, 5, 4.6, 5, 4.6, 5, 5,
                                     5),
                         `EM-V1` = c(3.3, 3.3, 3.1, 3.3, 3.3, 3.3,
                                     3.3, 3.3, 3.1, 3.1, 3.3, 3.3,
                                     3.3, 3.3, 3.1, 3.3, 3.3, 3.1,
                                     3.3, 3.1, 3.3, 3.1, 3.3, 3.3,
                                     3.3),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(17.7, 17.7, 15.1, 17.7, 17.7,
                                     17.7, 17.7, 17.7, 15.1, 15.1,
                                     17.7, 17.7, 17.7, 17.7, 15.1,
                                     17.7, 17.7, 15.1, 17.7, 15.1,
                                     17.7, 15.1, 17.7, 17.7, 17.7
                         ),
                         `PM06` = c(0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.5),
                         `PM09` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1),
                         `LNGSH` = c(16, 18, 15, 16, 16, 16, 18,
                                     18, 15, 15, 18, 16, 18, 18,
                                     15, 18, 17, 15, 18, 15, 18,
                                     15, 18, 16, 18),
                         `R7-R8` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0),
                         `FL-VS` = c(68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68, 68),
                         `TRIFL` = c(0.35, 0.35, 0.35, 0.35, 0.34,
                                     0.35, 0.37, 0.35, 0.35, 0.35,
                                     0.36, 0.37, 0.37, 0.36, 0.35,
                                     0.35, 0.34, 0.36, 0.34, 0.35,
                                     0.34, 0.35, 0.34, 0.35, 0.2),
                         `RWDTH` = c(1, 1, 0.85, 1, 0.9, 0.95,
                                     0.9, 0.9, 0.7, 0.85, 1, 1, 0.95,
                                     0.92, 0.75, 0.86, 0.9, 0.88,
                                     0.75, 0.8, 0.75, 0.8, 0.75,
                                     1, 1),
                         `RHGHT` = c(1, 1, 0.95, 1, 0.95, 1, 1,
                                     1, 0.85, 0.95, 1, 1, 1, 1, 0.85,
                                     1, 0.95, 0.95, 0.6, 0.85, 0.6,
                                     0.85, 0.6, 1, 1),
                         `R1PPO` = c(0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01
                         ),
                         `OPTBI` = c(20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20),
                         `SLOBI` = c(0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() PNGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() PNGRO048.ECO")


# "read_eco() PPGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.2f",
                       "FL-VS" = "%6.2f", TRIFL = "%6.1f", RWDTH = "%6.0f",
                       RHGHT = "%6.0f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/PPGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() PPGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("DFAULT", "PP0001", "PP0002"
    ),
    `ECONAME` = c("PIGEONPEA", "DEFAULT PIGEONPEA",
                  "INDIA ICPL88039"),
    `MG` = c(3, 3, 3),
    `TM` = c(1, 1, 1),
    `THVAR` = c(0, 0, 0),
    `PL-EM` = c(5.02, 5.02, 4.88),
    `EM-V1` = c(6, 6, 6),
    `V1-JU` = c(0, 0, 0),
    `JU-R0` = c(5.0, 5.0, 5.0),
    `PM06` = c(0, 0, 0),
    `PM09` = c(0.35, 0.35, 0.35),
    `LNGSH` = c(10, 10, 10),
    `R7-R8` = c(8.43, 8.43, 22.51),
    `FL-VS` = c(11.26, 11.26, 12.03),
    `TRIFL` = c(0.8, 0.8, 0.8),
    `RWDTH` = c(1, 1, 1),
    `RHGHT` = c(1, 1, 1),
    `R1PPO` = c(0.435, 0.435, 0.35),
    `OPTBI` = c(18, 18, 18),
    `SLOBI` = c(0.028, 0.028, 0.028))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() PPGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() PPGRO048.ECO")


# "read_eco() PRGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNHSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.0f", R1PPO = "%6.0f", OPTBI = "%6.0f",
                       SLOBI = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/PRGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() PRGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0", "OPTBI")
    expected_vals <- list(`ECO#` = c("PR0001", "PR0002", "PR0003",
                                    "DFAULT"),
                         `ECONAME` = c("CAPISTRANO", "BISCAYNE",
                                       "BISCAYNE-JJ", "DEFAULT TYPE"
                         ),
                         `MG` = c(1, 1, 1, 1),
                         `TM` = c(1, 1, 1, 1),
                         `PP-SS` = c(0, 0, 0, 0),
                         `PL-EM` = c(5, 5, 5, 5),
                         `EM-V1` = c(10, 10, 10, 20),
                         `V1-JU` = c(24, 24, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0
                         ),
                         `PM06` = c(0, 0, 0, 0),
                         `PM09` = c(0.75, 0.75, 0.75, 0.75),
                         `LNHSH` = c(35, 35, 35, 35),
                         `R7-R8` = c(0, 0, 15, 0),
                         `FL-VS` = c(53, 53, 53, 18),
                         `TRIFL` = c(0.35, 0.35, 0.35, 0.52),
                         `RWDTH` = c(1, 1, 1, 1),
                         `RHGHT` = c(1, 1, 1, 1),
                         `R1PPO` = c(0, 0, 0, 0),
                         `OPTBI` = c(.0, .0, .0, .0
                         ),
                         `SLOBI` = c(0, 0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() PRGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() PRGRO048.ECO")


# "read_eco() PTSUB048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-19s",
                       RUE1 = "%4.1f", RUE2 = "%6.1f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/PTSUB048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() PTSUB048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "DFAULT"
    ),
    `ECONAME` = c("GENERIC POTATO", "GENERIC POTATO+10%",
                  "DEFAULT"),
    `RUE1` = c(3.5, 3.8, 3.5),
    `RUE2` = c(4, 4.4, 4))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() PTSUB048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() PTSUB048.ECO")


# "read_eco() QUGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.1f", RWDTH = "%6.1f",
                       RHGHT = "%6.1f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/QUGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() QUGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("QU0001", "QU0002", "DFAULT"
    ),
    `ECONAME` = c("MATURITY GROUP 0", "MATURITY GROUP 0",
                  "DEFAULT"),
    `MG` = c(0, 0, 0),
    `TM` = c(1, 1, 1),
    `THVAR` = c(0, 0, 0),
    `PL-EM` = c(3.2, 3.2, 3.2),
    `EM-V1` = c(2, 2, 2),
    `V1-JU` = c(0, 0, 0),
    `JU-R0` = c(5.0, 5.0, 5.0),
    `PM06` = c(0, 0, 0),
    `PM09` = c(0.35, 0.35, 0.35),
    `LNGSH` = c(10, 10, 10),
    `R7-R8` = c(12, 12, 12),
    `FL-VS` = c(20, 20, 20),
    `TRIFL` = c(0.9, 1.2, 0.9),
    `RWDTH` = c(1, 0.8, 1),
    `RHGHT` = c(1, 0.8, 1),
    `R1PPO` = c(0.189, 0.189, 0.189),
    `OPTBI` = c(18, 18, 18),
    `SLOBI` = c(0.028, 0.028, 0.028))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() QUGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() QUGRO048.ECO")


# "read_eco() SBGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.1f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SBGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SBGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("DETERM", "INDETE", "SB1000",
                                    "SB0100", "SB0000", "SB0001",
                                    "SB0101", "SB0113", "SB0115",
                                    "SB0116", "SB0201", "SB0211",
                                    "SB0212", "SB0214", "SB0301",
                                    "SB0302", "SB0303", "SB0401",
                                    "SB0501", "SB0601", "SB0701",
                                    "SB0702", "SB0801", "SB0901",
                                    "SB1001", "DFAULT", "SB0304",
                                    "SB0305", "SB0777", "SB0888"),
                         `ECONAME` = c("DETERMINATE TYPE", "INDETERMINATE",
                                       "MATURITY GP  000", "MATURITY GP   00",
                                       "MATURITY GROUP 0", "MATURITY GROUP 0",
                                       "MATURITY GROUP 1", "MATURITY GROUP 1",
                                       "MATURITY GROUP 1", "MATURITY GROUP 1",
                                       "MATURITY GROUP 2", "MATURITY GROUP 2",
                                       "MATURITY GROUP 2", "MATURITY GROUP 2",
                                       "MATURITY GROUP 3", "MATURITY GROUP 3",
                                       "MATURITY GROUP 3", "MATURITY GROUP 4",
                                       "MATURITY GROUP 5", "MATURITY GROUP 6",
                                       "MATURITY GROUP 7", "MATURITY GROUP 7",
                                       "MATURITY GROUP 8", "MATURITY GROUP 9",
                                       "MATURITY GROUP 10", "DEFAULT TYPE",
                                       "MATURITY GROUP 3", "MATURITY GROUP 3",
                                       "MATURITY GROUP 7", "MATURITY GROUP 8"
                         ),
                         `MG` = c(7, 3, 0, 0, 0,
                                  0, 1, 1, 1, 1, 2,
                                  2, 2, 2, 3, 3, 3,
                                  4, 5, 6, 7, 7, 8,
                                  9, 10, 7, 3, 3, 7,
                                  8),
                         `TM` = c(1, 1, 1, 2, 3,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1),
                         `THVAR` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0),
                         `PL-EM` = c(3.6, 3.6, 3.6, 3.6, 3.6, 3.6,
                                     3.6, 3.6, 3.6, 3.6, 3.6, 3.6,
                                     3.6, 3.6, 3.6, 3.6, 3.6, 3.6,
                                     3.6, 3.6, 3.6, 3.6, 3.6, 3.6,
                                     3.6, 3.6, 3.6, 3.6, 3.6, 3.6
                         ),
                         `EM-V1` = c(6, 6, 6, 6, 6, 6, 6, 6, 6,
                                     6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                     6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                     6),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 6,
                                     6),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0),
                         `PM09` = c(0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35),
                         `LNGSH` = c(10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10),
                         `R7-R8` = c(12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12,
                                     12, 12),
                         `FL-VS` = c(9, 26, 25, 29, 29, 26, 26,
                                     26, 26, 26, 26, 26, 26, 26,
                                     26, 24, 26, 26, 9, 9, 9, 9,
                                     9, 9, 9, 9, 26, 26, 9, 9),
                         `TRIFL` = c(0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.33, 0.33, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32
                         ),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1),
                         `RHGHT` = c(0.9, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     0.9, 0.9, 0.9, 0.9, 0.9, 0.9,
                                     0.9, 0.9, 1, 1, 0.9, 0.9),
                         `R1PPO` = c(0.504, 0.324, 0.189, 0.189,
                                     0.189, 0.189, 0.234, 0.234,
                                     0.234, 0.234, 0.279, 0.279,
                                     0.279, 0.279, 0.324, 0.324,
                                     0.324, 0.369, 0.414, 0.459,
                                     0.504, 0.504, 0.549, 0.549,
                                     0.549, 0.504, 0.1, 0.166, 0.504,
                                     0.549),
                         `OPTBI` = c(20, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 18, 18,
                                     20, 20),
                         `SLOBI` = c(0.035, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.035, 0.035, 0.035,
                                     0.035, 0.035, 0.035, 0.035,
                                     0.035, 0.035, 0.028, 0.028,
                                     0.035, 0.035))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SBGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SBGRO048.ECO")


# "read_eco() SCCAN048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", "ECO-NAME" = "%-25s",
                       DELTTMAX = "%8.2f", SWDF2AMP = "%15.1f",
                       EXTCFN = "%15.2f", EXTCFST = "%15.2f",
                       LFNMXEXT = "%15.0f", "AREAMX_CF(2)" = "%15.1f",
                       "AREAMX_CF(3)" = "%15.1f", WIDCOR = "%15.0f",
                       "WMAX_CF(1)" = "%15.4f", "WMAX_CF(2)" = "%15.3f",
                       "WMAX_CF(3)" = "%15.2f", POPDECAY = "%15.3f",
                       TTBASEEM = "%15.0f", TTBASELFEX = "%15.0f",
                       LG_AMRANGE = "%15.0f", LG_GP_REDUC = "%15.2f",
                       LDG_FI_REDUC = "%15.1f", "LMAX_CF(1)" = "%15.3f",
                       "LMAX_CF(2)" = "%15.1f", "LMAX_CF(3)" = "%15.1f",
                       MAXLFLENGTH = "%15.0f", MAXLFWIDTH = "%15.1f",
                       TBASE_GE_EM = "%15.0f", TOPT_GE_EM = "%14.0f",
                       TFin_GE_EM = "%16.0f", TBASE_LFEM = "%15.0f",
                       TOPT_LFEM = "%15.0f", TFin_LFEM = "%15.0f",
                       TBASE_TLREM = "%15.0f", TOPT_TLREM = "%15.0f",
                       TFin_TLREM = "%15.0f", TBASE_LFSEN = "%15.0f",
                       TOPT_LFSEN = "%15.0f", TFin_LFSEN = "%15.0f",
                       TBASE_STKEX = "%15.0f", TOPT_STKEX = "%15.0f",
                       TFin_STKEX = "%15.0f", TBASE_LFEX = "%15.0f",
                       TOPT_LFEX = "%15.0f", TFin_LFEX = "%15.0f",
                       TBASE_REX = "%15.0f", TOPT_REX = "%15.0f",
                       TFin_REX = "%15.0f", TOPT_PHOT = "%15.0f",
                       TOPT_PHO2 = "%15.0f", TFin_PHOT = "%15.0f",
                       TBASE_RESP = "%15.0f", TOPT_RESP = "%15.0f",
                       TFin_RESP = "%15.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SCCAN048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SCCAN048.ECO"

    `char_cols` <- c("ECO#", "ECO-NAME")
    expected_vals <- list(`ECO#` = c("DFAULT", "SC0001", "SC0013",
                                    "SC0014", "SC0015", "SC0016"),
                         `ECO-NAME` = c("DEFAULT", "SOUTH AFRICAN  1",
                                        "SOUTH AFRICAN 13", "SOUTH AFRICAN 14",
                                        "SOUTH AFRICAN 15", "CENTR. BRAZIL 16"
                         ),
                         `DELTTMAX` = c(0.07, 0.07, 0.07, 0.07,
                                        0.07, 0.07),
                         `SWDF2AMP` = c(0.5, 0.5, 0.5, 0.5, 0.5,
                                        0.5),
                         `EXTCFN` = c(0.84, 0.84, 0.84, 0.84, 0.84,
                                      0.84),
                         `EXTCFST` = c(0.58, 0.58, 0.58, 0.58,
                                       0.58, 0.58),
                         `LFNMXEXT` = c(20, 20, 20, 20, 20, 20),
                         `AREAMX_CF(2)` = c(27.2, 27.2, 27.2, 27.2,
                                            27.2, 27.2),
                         `AREAMX_CF(3)` = c(-20.8, -20.8, -20.8,
                                            -20.8, -20.8, -20.8),
                         `WIDCOR` = c(1, 1, 1, 1, 1, 1),
                         `WMAX_CF(1)` = c(-0.0345, -0.0345, -0.0345,
                                          -0.0345, -0.0345, -0.0345
                         ),
                         `WMAX_CF(2)` = c(2.243, 2.243, 2.243,
                                          2.243, 2.243, 2.243),
                         `WMAX_CF(3)` = c(7.75, 7.75, 7.75, 7.75,
                                          7.75, 7.75),
                         `POPDECAY` = c(0.004, 0.004, 0.004, 0.004,
                                        0.004, 0.001),
                         `TTBASEEM` = c(10, 10, 10, 10, 10, 10),
                         `TTBASELFEX` = c(10, 10, 10, 10, 10, 10
                         ),
                         `LG_AMRANGE` = c(30, 30, 30, 30, 30, 30
                         ),
                         `LG_GP_REDUC` = c(0.28, 0.28, 0.28, 0.28,
                                           0.28, 0.28),
                         `LDG_FI_REDUC` = c(0.1, 0.1, 0.1, 0.1,
                                            0.1, 0.1),
                         `LMAX_CF(1)` = c(-0.376, -0.376, -0.376,
                                          -0.376, -0.376, -0.376),
                         `LMAX_CF(2)` = c(12.2, 12.2, 12.2, 12.2,
                                          12.2, 12.2),
                         `LMAX_CF(3)` = c(21.8, 21.8, 21.8, 21.8,
                                          21.8, 21.8),
                         `MAXLFLENGTH` = c(100, 100, 100, 100,
                                           100, 100),
                         `MAXLFWIDTH` = c(3.5, 3.5, 3.5, 3.5, 3.5,
                                          3.5),
                         `TBASE_GE_EM` = c(16, 16, 16, 16, 16,
                                           12),
                         `TOPT_GE_EM` = c(28, 28, 28, 28, 28, 28
                         ),
                         `TFin_GE_EM` = c(41, 41, 41, 41, 41, 41
                         ),
                         `TBASE_LFEM` = c(10, 10, 10, 10, 10, 10
                         ),
                         `TOPT_LFEM` = c(30, 30, 30, 30, 30, 30
                         ),
                         `TFin_LFEM` = c(43, 43, 43, 43, 43, 43
                         ),
                         `TBASE_TLREM` = c(16, 16, 16, 16, 16,
                                           12),
                         `TOPT_TLREM` = c(35, 35, 35, 35, 35, 35
                         ),
                         `TFin_TLREM` = c(48, 48, 48, 48, 48, 48
                         ),
                         `TBASE_LFSEN` = c(10, 10, 10, 10, 10,
                                           10),
                         `TOPT_LFSEN` = c(30, 30, 30, 30, 30, 30
                         ),
                         `TFin_LFSEN` = c(43, 43, 43, 43, 43, 43
                         ),
                         `TBASE_STKEX` = c(16, 16, 16, 16, 16,
                                           16),
                         `TOPT_STKEX` = c(35, 35, 35, 35, 35, 35
                         ),
                         `TFin_STKEX` = c(48, 48, 48, 48, 48, 48
                         ),
                         `TBASE_LFEX` = c(10, 10, 10, 10, 10, 10
                         ),
                         `TOPT_LFEX` = c(30, 30, 30, 30, 30, 30
                         ),
                         `TFin_LFEX` = c(43, 43, 43, 43, 43, 43
                         ),
                         `TBASE_REX` = c(10, 10, 10, 10, 10, 10
                         ),
                         `TOPT_REX` = c(30, 30, 30, 30, 30, 30),
                         `TFin_REX` = c(43, 43, 43, 43, 43, 43),
                         `TOPT_PHOT` = c(20, 20, 20, 20, 20, 20
                         ),
                         `TOPT_PHO2` = c(40, 40, 40, 40, 40, 40
                         ),
                         `TFin_PHOT` = c(47, 47, 47, 47, 47, 47
                         ),
                         `TBASE_RESP` = c(0, 0, 0, 0, 0, 0),
                         `TOPT_RESP` = c(40, 40, 40, 40, 40, 40
                         ),
                         `TFin_RESP` = c(47, 47, 47, 47, 47, 47
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SCCAN048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SCCAN048.ECO")


# "read_eco() SCCSP048.ECO"

  `v_fmt_expected` = list(c(KCAN_ECO = "%10.1f", SMAX = "%6.0f",
                            CAB = "%5.0f", CanLmtFac = "%11.2f", LfShdFac = "%10.2f",
                            MINSHD = "%8.2f", StkSenFrac = "%12.5f",
                            SENDAY = "%8.2f", XDAY = "%6.0f", YSLA = "%6.0f",
                            XLI = "%9.2f", YVTR = "%9.4f", XVSHT = "%6.0f",
                            YVSHT = "%6.2f", ZVSDI = "%6.1f", YVSWH = "%6.2f",
                            XLFNUM = "%6.0f", YLFSZ = "%6.0f", XStkNum = "%5.0f",
                            YLfFac = "%5.1f", XFRSU = "%6.0f", YFRSU = "%6.3f",
                            XSENMX = "%6.0f", SENMAX = "%6.3f", XShdMX = "%6.0f",
                            ShdMAX = "%6.3f", XSTAGE = "%6.0f", SENPOR = "%6.3f",
                            XTMIN = "%6.0f", YLOSS = "%6.1f"), c(KCAN_ECO = "%10.1f",
                                                                 SMAX = "%6.0f", CAB = "%5.0f", CanLmtFac = "%11.2f",
                                                                 LfShdFac = "%10.2f", MINSHD = "%8.2f",
                                                                 StkSenFrac = "%12.5f", SENDAY = "%8.2f",
                                                                 XDAY = "%6.0f", YSLA = "%6.0f", XLI = "%9.2f",
                                                                 YVTR = "%9.4f", XVSHT = "%6.0f", YVSHT = "%6.2f",
                                                                 ZVSDI = "%6.1f", YVSWH = "%6.2f", XLFNUM = "%6.0f",
                                                                 YLFSZ = "%6.0f", XStkNum = "%5.0f", YLfFac = "%5.1f",
                                                                 XFRSU = "%6.0f", YFRSU = "%6.3f", XSENMX = "%6.0f",
                                                                 SENMAX = "%6.3f", XShdMX = "%6.0f", ShdMAX = "%6.3f",
                                                                 XSTAGE = "%6.0f", SENPOR = "%6.3f", XTMIN = "%6.0f",
                                                                 YLOSS = "%6.1f"), c(KCAN_ECO = "%10.1f",
                                                                                     SMAX = "%6.0f", CAB = "%5.0f", CanLmtFac = "%11.3f",
                                                                                     LfShdFac = "%10.2f", MINSHD = "%8.2f",
                                                                                     StkSenFrac = "%12.5f", SENDAY = "%8.2f",
                                                                                     XDAY = "%6.0f", YSLA = "%6.0f", XLI = "%9.2f",
                                                                                     YVTR = "%9.4f", XVSHT = "%6.0f", YVSHT = "%6.2f",
                                                                                     ZVSDI = "%6.2f", YVSWH = "%6.2f", XLFNUM = "%6.0f",
                                                                                     YLFSZ = "%6.0f", XStkNum = "%5.0f", YLfFac = "%5.1f",
                                                                                     XFRSU = "%6.0f", YFRSU = "%6.3f", XSENMX = "%6.0f",
                                                                                     SENMAX = "%6.3f", XShdMX = "%6.0f", ShdMAX = "%6.3f",
                                                                                     XSTAGE = "%6.0f", SENPOR = "%6.3f", XTMIN = "%6.0f",
                                                                                     YLOSS = "%6.1f"), c(KCAN_ECO = "%10.1f",
                                                                                                         SMAX = "%6.0f", CAB = "%5.0f", CanLmtFac = "%11.2f",
                                                                                                         LfShdFac = "%10.2f", MINSHD = "%8.2f",
                                                                                                         StkSenFrac = "%12.5f", SENDAY = "%8.2f",
                                                                                                         XDAY = "%6.0f", YSLA = "%6.0f", XLI = "%9.2f",
                                                                                                         YVTR = "%9.4f", XVSHT = "%6.0f", YVSHT = "%6.2f",
                                                                                                         ZVSDI = "%6.2f", YVSWH = "%6.3f", XLFNUM = "%6.0f",
                                                                                                         YLFSZ = "%6.0f", XStkNum = "%5.0f", YLfFac = "%5.1f",
                                                                                                         XFRSU = "%6.0f", YFRSU = "%6.2f", XSENMX = "%6.0f",
                                                                                                         SENMAX = "%6.3f", XShdMX = "%6.0f", ShdMAX = "%6.3f",
                                                                                                         XSTAGE = "%6.0f", SENPOR = "%6.3f", XTMIN = "%6.0f",
                                                                                                         YLOSS = "%6.1f"))

  `tier_info_expected` = list("KCAN_ECO", "SMAX", "CAB", "CanLmtFac",
                              "LfShdFac", "MINSHD", "StkSenFrac",
                              "SENDAY", "XDAY", "YSLA", "XLI",
                              "YVTR", "XVSHT", "YVSHT", "ZVSDI",
                              "YVSWH", "XLFNUM", "YLFSZ", "XStkNum",
                              "YLfFac", "XFRSU", "YFRSU", "XSENMX",
                              "SENMAX", "XShdMX", "ShdMAX",
                              "XSTAGE", "SENPOR", "XTMIN", "YLOSS",
                              c("ECO#", "ECONAME"))

  rds_file <- system.file("tinytest/test_data/ECO/SCCSP048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SCCSP048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    `list_cols` <- c("XDAY", "YSLA", "XLI", "YVTR", "XVSHT", "YVSHT",
                    "ZVSDI", "YVSWH", "XLFNUM", "YLFSZ", "XStkNum",
                    "YLfFac", "XFRSU", "YFRSU", "XSENMX", "SENMAX",
                    "XShdMX", "ShdMAX", "XSTAGE", "SENPOR", "XTMIN",
                    "YLOSS")
    expected_vals <- list(`ECO#` = c("DFAULT", "CA0001", "CA0002",
                                    "CA0003"),
                         `ECONAME` = c("(MINIMA,MAXIMA)", "(CP 80-1743; CP 88-1762)",
                                       "(CP 72-2086)", "(CP89-2143)"
                         ),
                         `KCAN_ECO` = c(0.8, 0.8, 0.7, 0.7),
                         `SMAX` = c(20, 20, 25, 25),
                         `CAB` = c(8, 8, 8, 8),
                         `CanLmtFac` = c(0.01, 0.01, 0.013, 0.01
                         ),
                         `LfShdFac` = c(0.35, 0.35, 0.35, 0.35),
                         `MINSHD` = c(0.15, 0.15, 0.15, 0.15),
                         `StkSenFrac` = c(5e-05, 5e-05, 5e-05,
                                          5e-05),
                         `SENDAY` = c(0.05, 0.05, 0.05, 0.05),
                         `XDAY` = list(c(1, 65, 77, 90, 182, 273
                         ),
                         c(1, 65, 77, 90, 182, 273),
                         c(1, 65, 77, 90, 182, 273
                         ),
                         c(1, 65, 77, 90, 182,
                           273)),
                         `YSLA` = list(c(250, 230, 130, 80, 67,
                                         60),
                                       c(250, 230, 130, 80, 67,
                                         60),
                                       c(250, 230, 130, 80, 67,
                                         60),
                                       c(250, 230, 130, 80, 67,
                                         60)),
                         `XLI` = list(c(0, 0.2, 0.35, 0.45, 0.5,
                                        0.6),
                                      c(0, 0.2, 0.35, 0.45, 0.5,
                                        0.6),
                                      c(0, 0.2, 0.35, 0.45, 0.5,
                                        0.6),
                                      c(0, 0.2, 0.35, 0.45, 0.5,
                                        0.6)),
                         `YVTR` = list(c(0.018, 0.0087, 0.0067,
                                         0.0035, 0.001, 0),
                                       c(0.018, 0.0087,
                                         0.0067, 0.0035, 0.001, 0),
                                       c(0.018,
                                         0.0087, 0.0067, 0.0035, 0, 0),
                                       c(0.018, 0.0087, 0.0067,
                                         0.0035, 0, 0)),
                         `XVSHT` = list(c(0, 7, 11, 14, 17, 20,
                                          24, 28, 31, 50),
                                        c(0, 7, 11,
                                          14, 17, 20, 24, 28, 31, 50),
                                        c(0, 6, 10, 13, 16, 20,
                                          24, 27, 32, 50),
                                        c(0, 4,
                                          8, 13, 19, 22, 26, 29, 32,
                                          50)),
                         `YVSHT` = list(c(0.65, 4, 12.1, 14.4,
                                          15, 14.5, 12.5, 6, 1.5, 0.7),
                                        c(0.65, 4, 12.1, 14.4, 15,
                                          14.5, 12.5, 6, 1.5, 0.7),
                                        c(0.65, 4.4, 8.3, 11.4,
                                          13.5, 13.8, 11.4, 4.6, 2,
                                          0.5),
                                        c(0.65, 3, 7, 10.6,
                                          12.5, 12, 10, 5, 4.1, 1)),
                         `ZVSDI` = list(c(3.6, 3.5, 3.3, 3.1, 2.9,
                                          2.7, 2.3, 1.7, 1.2, 0.7),
                                        c(3.6,
                                          3.5, 3.3, 3.1, 2.9, 2.7, 2.3,
                                          1.7, 1.2, 0.7),
                                        c(3.2, 3.2,
                                          3.2, 3.1, 2.94, 2.7, 2.4, 1.6,
                                          1.2, 0.09),
                                        c(3.2, 3.2, 3.2,
                                          3.1, 2.94, 2.7, 2.4, 2, 1.7,
                                          1.2)),
                         `YVSWH` = list(c(0.34, 0.52, 3.04, 5.57,
                                          6.9, 4.07, 3.14, 2.23, 0.34,
                                          0.07),
                                        c(0.34, 0.52, 3.04, 5.57,
                                          6.9, 4.07, 3.14, 2.23, 0.34,
                                          0.07),
                                        c(0.34, 0.52, 3.04, 5.57,
                                          6.9, 4.07, 3.14, 2.23, 0.34,
                                          0.07),
                                        c(0.51, 0.78, 4.56, 8.355,
                                          10.35, 6.105, 4.71, 3.345, 0.51,
                                          0.105)),
                         `XLFNUM` = list(c(0, 13, 16, 24, 29, 36
                         ),
                         c(0, 13, 16, 24, 29, 36),
                         c(0, 6, 22, 25, 32, 36),
                         c(0, 11, 14, 23, 32, 36
                         )),
                         `YLFSZ` = list(c(0, 315, 493, 580, 560,
                                          482),
                                        c(0, 315, 493, 580, 560,
                                          482),
                                        c(0, 150, 510, 535, 515,
                                          500),
                                        c(0, 216, 400, 515, 515,
                                          500)),
                         `XStkNum` = list(c(1, 3, 5, 10, 13, 20,
                                            30, 50),
                                          c(1, 3, 5, 10, 13,
                                            20, 30, 50),
                                          c(1, 3, 5, 10,
                                            13, 20, 30, 50),
                                          c(1, 3, 5,
                                            10, 13, 20, 30, 50)),
                         `YLfFac` = list(c(1, 1.4, 1.8, 2.5, 2.8,
                                           2.8, 2.8, 2.8),
                                         c(1, 1.4, 1.8,
                                           2.5, 2.8, 2.8, 2.8, 2.8),
                                         c(1,
                                           1.3, 1.6, 2, 2, 1.4, 1.1, 0.8
                                         ),
                                         c(1, 1.3, 1.6, 2, 2, 1.4,
                                           1.1, 0.8)),
                         `XFRSU` = list(c(10, 14, 25, 50),
                                        c(10,
                                          14, 25, 50),
                                        c(10, 14, 25, 50
                                        ),
                                        c(10, 20, 30, 50)),
                         `YFRSU` = list(c(0, 0.005, 0.13, 0.65),
                                        c(0, 0.005, 0.13, 0.65),
                                        c(0, 0.005, 0.13, 0.65),
                                        c(0, 0.04, 0.16, 0.67)),
                         `XSENMX` = list(c(3, 5, 10, 45),
                                         c(3,
                                           5, 10, 45),
                                         c(3, 5, 10, 45),
                                         c(3, 5, 10, 45)),
                         `SENMAX` = list(c(0.1, 0.02, 0.006, 0.002
                         ),
                         c(0.1, 0.02, 0.006, 0.002
                         ),
                         c(0.1, 0.02, 0.006, 0.002
                         ),
                         c(0.1, 0.02, 0.006, 0.002
                         )),
                         `XShdMX` = list(c(0, 5, 45, 50),
                                         c(0,
                                           5, 45, 50),
                                         c(0, 5, 45, 50),
                                         c(0, 5, 45, 50)),
                         `ShdMAX` = list(c(0, 0.01, 0.015, 0.017
                         ),
                         c(0, 0.01, 0.015, 0.017),
                         c(0, 0.01, 0.015, 0.017
                         ),
                         c(0, 0.01, 0.015, 0.017
                         )),
                         `XSTAGE` = list(c(0, 5, 12, 45),
                                         c(0,
                                           5, 12, 45),
                                         c(0, 5, 12, 45),
                                         c(0, 5, 12, 45)),
                         `SENPOR` = list(c(0, 0, 0.008, 0.008),
                                         c(0, 0, 0.008, 0.008),
                                         c(0, 0, 0.008, 0.008),
                                         c(0, 0, 0.008, 0.008)),
                         `XTMIN` = list(c(-9, -7, -5, 0),
                                        c(-9,
                                          -7, -5, 0),
                                        c(-9, -7, -5, 0),
                                        c(-9, -7, -5, 0)),
                         `YLOSS` = list(c(1, 0.5, 0.3, 0.1),
                                        c(1,
                                          0.5, 0.3, 0.1),
                                        c(1, 0.5, 0.3,
                                          0.1),
                                        c(1, 0.5, 0.3, 0.1)))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SCCSP048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SCCSP048.ECO")


# "read_eco() SCSAM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", "ECO-NAME" = "%-24s",
                       NS_LF_TIL = "%9.0f", N_LF_MAX_ILA = "%15.0f",
                       TB0PHO = "%15.0f", TB1PHO = "%15.0f",
                       TB2PHO = "%15.0f", TBFPHO = "%15.0f",
                       TBPER = "%15.0f", TBMAX_PER = "%15.0f",
                       LTTHRESHOLD = "%15.1f", FDEADLF = "%15.2f",
                       RDM = "%15.0f", DPERCOEFF = "%15.2f",
                       RWUEP1 = "%15.1f", RWUEP2 = "%15.1f",
                       T_MAX_WS_PHO = "%15.0f", T_MID_WS_PHO = "%15.1f",
                       T_MIN_WS_PHO = "%15.1f", T_MAX_WS_EXP = "%15.0f",
                       T_MID_WS_EXP = "%15.1f", T_MIN_WS_EXP = "%15.0f",
                       FRAC_SUC_BG = "%15.1f", FRAC_HEX_BG = "%15.1f",
                       INIT_PD_RAT = "%15.0f", IT_STR_TB_INI = "%15.0f",
                       IT_STR_TO1 = "%15.0f", IT_STR_TO2 = "%15.0f",
                       IT_STR_TB_END = "%15.0f", IT_STR_PF_MAX = "%15.2f",
                       IT_STR_PF_MIN = "%15.0f", IT_STR_PF_TB = "%15.0f",
                       IT_STR_PF_TM = "%15.0f", IT_STR_PF_TE = "%15.0f",
                       IT_STR_PF_D = "%15.0f", IT_STR_T_RED = "%15.2f",
                       IT_STR_W_RED = "%15.2f", MAX_PER_IT = "%15.0f",
                       DSWAT_DDWS = "%15.6f", DSWAT_DSUC = "%15.5f",
                       HEX_MIN = "%15.3f", SUC_ACC_INI = "%15.2f",
                       DSUC_FRAC_TS = "%15.1f", TT_CHUMAT_LT = "%15.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SCSAM048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SCSAM048.ECO"

    `char_cols` <- c("ECO#", "ECO-NAME")
    expected_vals <- list(`ECO#` = "SC0001",
                         `ECO-NAME` = "RIDESA BRAZIL",
                         `NS_LF_TIL` = 3,
                         `N_LF_MAX_ILA` = 15,
                         `TB0PHO` = 12,
                         `TB1PHO` = 16,
                         `TB2PHO` = 32,
                         `TBFPHO` = 40,
                         `TBPER` = 18,
                         `TBMAX_PER` = 35,
                         `LTTHRESHOLD` = 0.4,
                         `FDEADLF` = 0.75,
                         `RDM` = 120,
                         `DPERCOEFF` = 2.75,
                         `RWUEP1` = 0.3,
                         `RWUEP2` = 0.9,
                         `T_MAX_WS_PHO` = 0,
                         `T_MID_WS_PHO` = 0.2,
                         `T_MIN_WS_PHO` = 0.6,
                         `T_MAX_WS_EXP` = 0,
                         `T_MID_WS_EXP` = 0.4,
                         `T_MIN_WS_EXP` = 1,
                         `FRAC_SUC_BG` = 0.5,
                         `FRAC_HEX_BG` = 0.5,
                         `INIT_PD_RAT` = 12,
                         `IT_STR_TB_INI` = 18,
                         `IT_STR_TO1` = 31,
                         `IT_STR_TO2` = 55,
                         `IT_STR_TB_END` = 60,
                         `IT_STR_PF_MAX` = 0.95,
                         `IT_STR_PF_MIN` = 0,
                         `IT_STR_PF_TB` = 0,
                         `IT_STR_PF_TM` = 50,
                         `IT_STR_PF_TE` = 800,
                         `IT_STR_PF_D` = 1,
                         `IT_STR_T_RED` = 0.15,
                         `IT_STR_W_RED` = 0.15,
                         `MAX_PER_IT` = 4,
                         `DSWAT_DDWS` = 9.881798,
                         `DSWAT_DSUC` = 11.24845,
                         `HEX_MIN` = 0.004,
                         `SUC_ACC_INI` = 0.35,
                         `DSUC_FRAC_TS` = 2.5,
                         `TT_CHUMAT_LT` = 1600)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SCSAM048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SCSAM048.ECO")


# "read_eco() SFGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.0f", RWDTH = "%6.2f",
                       RHGHT = "%6.2f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SFGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SFGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("SF0401", "DFAULT", "BW0001",
                                    "BW0002"),
                         `ECONAME` = c("MATURITY GROUP 4", "DEFAULT",
                                       "Goldschopf", "Thornless Saff"
                         ),
                         `MG` = c(4, 4, 4, 4),
                         `TM` = c(1, 1, 1, 1),
                         `THVAR` = c(0, 0, 0, 0),
                         `PL-EM` = c(5, 5, 5, 5),
                         `EM-V1` = c(6, 6, 3, 3),
                         `V1-JU` = c(0, 0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0
                         ),
                         `PM06` = c(0, 0, 0, 0),
                         `PM09` = c(0.35, 0.35, 0.35, 0.35),
                         `LNGSH` = c(10, 10, 10, 10),
                         `R7-R8` = c(26, 26, 26, 26),
                         `FL-VS` = c(7, 7, 14, 14),
                         `TRIFL` = c(1, 1, 1, 1),
                         `RWDTH` = c(0.75, 0.75, 0.75, 1),
                         `RHGHT` = c(0.75, 0.75, 0.8, 1),
                         `R1PPO` = c(0.369, 0.369, 0.369, 0.369
                         ),
                         `OPTBI` = c(20, 20, 20, 20),
                         `SLOBI` = c(0.035, 0.035, 0.035, 0.035
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SFGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SFGRO048.ECO")


# "read_eco() SGCER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%6.0f", ROPT = "%6.0f",
                       GDDE = "%6.0f", RUE = "%6.1f", KCAN = "%6.2f",
                       STPC = "%6.1f", RTPC = "%6.2f", TILFC = "%6.0f",
                       PLAM = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SGCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SGCER048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "DFAULT"
    ),
    `ECONAME` = c("GENERIC", "West Africa",
                  "DEFAULT"),
    `TBASE` = c(8, 11, 8),
    `TOPT` = c(34, 34, 34),
    `ROPT` = c(34, 34, 34),
    `GDDE` = c(6, 6, 6),
    `RUE` = c(3.2, 3.8, 3.2),
    `KCAN` = c(0.85, 0.85, 0.85),
    `STPC` = c(0.1, 3, 0.1),
    `RTPC` = c(0.25, 0.2, 0.25),
    `TILFC` = c(0, 1, 1),
    `PLAM` = c(6000, 6000, 6000))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SGCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SGCER048.ECO")


# "read_eco() SUGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.1f", TRIFL = "%6.1f", RWDTH = "%6.1f",
                       RHGHT = "%6.1f", R1PPO = "%6.0f", OPTBI = "%6.0f",
                       SLOBI = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SUGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SUGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("SU0702", "DFAULT"),
                         `ECONAME` = c("MATURITY GROUP 7", "DEFAULT"
                         ),
                         `MG` = c(7, 7),
                         `TM` = c(1, 1),
                         `THVAR` = c(0, 0),
                         `PL-EM` = c(4.8, 4.8),
                         `EM-V1` = c(1, 1),
                         `V1-JU` = c(0, 0),
                         `JU-R0` = c(5.0, 5.0),
                         `PM06` = c(0, 0),
                         `PM09` = c(0.35, 0.35),
                         `LNGSH` = c(8, 8),
                         `R7-R8` = c(4, 4),
                         `FL-VS` = c(9.5, 9.5),
                         `TRIFL` = c(0.8, 0.8),
                         `RWDTH` = c(0.6, 0.6),
                         `RHGHT` = c(1.2, 1.2),
                         `R1PPO` = c(0, 0),
                         `OPTBI` = c(0, 0),
                         `SLOBI` = c(0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SUGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SUGRO048.ECO")


# "read_eco() SUOIL048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%6.0f", ROPT = "%5.0f",
                       P20 = "%6.0f", DJTI = "%6.0f", GDDE = "%6.1f",
                       DSGFT = "%7.0f", RUE = "%5.1f", KCAN = "%7.0f",
                       TSEN = "%6.0f", CDAY = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SUOIL048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SUOIL048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = "DFAULT",
                         `ECONAME` = "DEFAULT",
                         `TBASE` = 4,
                         `TOPT` = 28,
                         `ROPT` = 28,
                         `P20` = 15,
                         `DJTI` = 3,
                         `GDDE` = 6.7,
                         `DSGFT` = 150,
                         `RUE` = 2.2,
                         `KCAN` = 1,
                         `TSEN` = -3,
                         `CDAY` = 7)

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SUOIL048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SUOIL048.ECO")


# "read_eco() SWCER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%6.0f", ROPT = "%6.0f",
                       P20 = "%6.1f", DJTI = "%6.0f", GDDE = "%6.0f",
                       DSGFT = "%6.0f", RUE = "%6.1f", KCAN = "%6.2f",
                       TSEN = "%6f", CDAY = "%6f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/SWCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SWCER048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "DFAULT"),
                         `ECONAME` = c("GENERIC", "DEFAULT"),
                         `TBASE` = c(8, 8),
                         `TOPT` = c(34, 34),
                         `ROPT` = c(34, 34),
                         `P20` = c(12.5, 12.5),
                         `DJTI` = c(4, 4),
                         `GDDE` = c(6, 6),
                         `DSGFT` = c(170, 170),
                         `RUE` = c(4.2, 4.2),
                         `KCAN` = c(0.85, 0.85),
                         `TSEN` = c(NA_real_, NA_real_),
                         `CDAY` = c(NA_real_, NA_real_))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() SWCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() SWCER048.ECO")


# "read_eco() TFAPS048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.1f", TOPT = "%6.0f", ROPT = "%6.0f",
                       TTOP = "%6.0f", P20 = "%6.1f", VREQ = "%6.0f",
                       GDDE = "%6.1f", DSGFT = "%6.0f", RUE1 = "%6.1f",
                       RUE2 = "%6.1f", KVAL1 = "%6.1f", KVAL2 = "%6.1f",
                       SLAP2 = "%6.0f", TC1P1 = "%6.1f", TC1P2 = "%6.1f",
                       DTNP1 = "%6.3f", PLGP1 = "%6.0f", PLGP2 = "%6.1f",
                       P2AF = "%6.1f", P3AF = "%6.0f", P4AF = "%6.0f",
                       P5AF = "%6.0f", P6AF = "%6.0f", ADLAI = "%6.0f",
                       ADTIL = "%6.0f", ADPHO = "%6.0f", STEMN = "%6.0f",
                       MXNUP = "%6.1f", MXNCR = "%6.2f", WFNU = "%6.0f",
                       PNUPR = "%6.2f", EXNO3 = "%6.2f", MNNO3 = "%6.0f",
                       EXNH4 = "%6.1f", MNNH4 = "%6.0f", INGWT = "%6.2f",
                       INGNC = "%6.2f", FREAR = "%6.2f", MNNCR = "%6.2f",
                       GPPSS = "%6.0f", GPPES = "%6.0f", MXGWT = "%6.0f",
                       MNRTN = "%6.1f", NOMOB = "%6.2f", RTDP1 = "%6.0f",
                       RTDP2 = "%6.0f", FOZ1 = "%6f", SFOZ1 = "%6f",
                       TSEN = "%6.1f", CDAY = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/TFAPS048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() TFAPS048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "IB0003",
                                    "IB0004", "DFAULT", "IB0099",
                                    "IB0098"),
                         `ECONAME` = c("GENERIC", "GENERIC", "GENERIC",
                                       "TEF 1", "DEFAULT", "Cold Hardy (test)",
                                       "Cold Sens. (test)"),
                         `TBASE` = c(0, 1, 0, 7.8, 0, 0, 0),
                         `TOPT` = c(26, 34, 34, 30, 34, 26, 26),
                         `ROPT` = c(26, 34, 34, 30, 34, 26, 26),
                         `TTOP` = c(34, 34, 34, 42, 34, 34, 34),
                         `P20` = c(12.5, 12.5, 12.5, 12.5, 12.5,
                                   12.5, 12.5),
                         `VREQ` = c(50, 70, 50, 0, 50, 50, 50),
                         `GDDE` = c(10.2, 6, 6, 10.2, 6, 6, 6),
                         `DSGFT` = c(200, 170, 170, 200, 170, 170,
                                     170),
                         `RUE1` = c(3.8, 3.8, 3.8, 3.8, 3.8, 3.8,
                                    3.8),
                         `RUE2` = c(3.8, 3.8, 3.8, 3.8, 3.8, 3.8,
                                    3.8),
                         `KVAL1` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6),
                         `KVAL2` = c(0.7, 0.7, 0.7, 0.7, 0.7, 0.7,
                                     0.7),
                         `SLAP2` = c(300, 300, 300, 300, 300, 300,
                                     300),
                         `TC1P1` = c(2.5, 2.5, 2.5, 2.5, 2.5, 2.5,
                                     2.5),
                         `TC1P2` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6),
                         `DTNP1` = c(0.005, 0.005, 0.005, 0.005,
                                     0.005, 0.005, 0.005),
                         `PLGP1` = c(1400, 1400, 1400, 1400, 1400,
                                     1400, 1400),
                         `PLGP2` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6),
                         `P2AF` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                    0.6),
                         `P3AF` = c(50, 50, 50, 50, 50, 50, 50),
                         `P4AF` = c(3, 3, 3, 3, 3, 3, 3),
                         `P5AF` = c(1, 1, 1, 1, 1, 1, 1),
                         `P6AF` = c(3, 3, 3, 3, 3, 3, 3),
                         `ADLAI` = c(1, 1, 1, 1, 1, 1, 1),
                         `ADTIL` = c(1, 1, 1, 1, 1, 1, 1),
                         `ADPHO` = c(1, 1, 1, 1, 1, 1, 1),
                         `STEMN` = c(0, 0, 0, 0, 0, 0, 0),
                         `MXNUP` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6),
                         `MXNCR` = c(0.04, 0.04, 0.04, 0.04, 0.04,
                                     0.04, 0.04),
                         `WFNU` = c(2, 2, 2, 2, 2, 2, 2),
                         `PNUPR` = c(0.45, 0.45, 0.45, 0.45, 0.45,
                                     0.45, 0.45),
                         `EXNO3` = c(6.75, 6.75, 6.75, 6.75, 6.75,
                                     6.75, 6.75),
                         `MNNO3` = c(0, 0, 0, 0, 0, 0, 0),
                         `EXNH4` = c(6.5, 6.5, 6.5, 6.5, 6.5, 6.5,
                                     6.5),
                         `MNNH4` = c(0, 0, 0, 0, 0, 0, 0),
                         `INGWT` = c(3.5, 3.5, 3.5, 2.47, 2.47,
                                     3.5, 3.5),
                         `INGNC` = c(0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03),
                         `FREAR` = c(0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25),
                         `MNNCR` = c(1.23, 1.23, 1.23, 1.23, 1.23,
                                     1.23, 1.23),
                         `GPPSS` = c(2, 2, 2, 2, 2, 2, 2),
                         `GPPES` = c(5, 5, 5, 5, 5, 5, 5),
                         `MXGWT` = c(55, 55, 55, 55, 55, 55, 55
                         ),
                         `MNRTN` = c(4.5, 4.5, 4.5, 4.5, 4.5, 4.5,
                                     4.5),
                         `NOMOB` = c(0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25),
                         `RTDP1` = c(1, 1, 1, 1, 1, 1, 1),
                         `RTDP2` = c(1, 1, 1, 1, 1, 1, 1),
                         `FOZ1` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_),
                         `SFOZ1` = c(NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_),
                         `TSEN` = c(NA, NA, NA, NA, NA, 0.5, 10
                         ),
                         `CDAY` = c(NA, NA, NA, NA, NA, 20, 5))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() TFAPS048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() TFAPS048.ECO")


# "read_eco() TMGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.0f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.2f",
                       PM09 = "%6.2f", LNGSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.1f", TRIFL = "%6.2f", RWDTH = "%6.0f",
                       RHGHT = "%6.0f", R1PPO = "%6.0f", OPTBI = "%6.0f",
                       SLOBI = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/TMGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() TMGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0", "OPTBI")
    expected_vals <- list(`ECO#` = c("TM0001", "DFAULT"),
                         `ECONAME` = c("SEMI-DETERMINATE", "DEFAULT TYPE"
                         ),
                         `MG` = c(1, 1),
                         `TM` = c(1, 1),
                         `THVAR` = c(0, 0),
                         `PL-EM` = c(6, 6),
                         `EM-V1` = c(22, 22),
                         `V1-JU` = c(0, 0),
                         `JU-R0` = c(5.0, 5.0),
                         `PM06` = c(0.55, 0.55),
                         `PM09` = c(0.75, 0.75),
                         `LNGSH` = c(39, 39),
                         `R7-R8` = c(0, 0),
                         `FL-VS` = c(24.5, 24.5),
                         `TRIFL` = c(0.45, 0.45),
                         `RWDTH` = c(1, 1),
                         `RHGHT` = c(1, 1),
                         `R1PPO` = c(0, 0),
                         `OPTBI` = c(.0, .0),
                         `SLOBI` = c(0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() TMGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() TMGRO048.ECO")


# "read_eco() VBGRO048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", "PP-SS" = "%6.0f",
                       "PL-EM" = "%6.1f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f", PM06 = "%6.0f",
                       PM09 = "%6.2f", LNHSH = "%6.0f", "R7-R8" = "%6.0f",
                       "FL-VS" = "%6.0f", TRIFL = "%6.1f", RWDTH = "%6.0f",
                       RHGHT = "%6.1f", R1PPO = "%6.3f", OPTBI = "%6.0f",
                       SLOBI = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/VBGRO048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() VBGRO048.ECO"

    `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
    expected_vals <- list(`ECO#` = c("VB0001", "VB0002", "DFAULT"
    ),
    `ECONAME` = c("MUCUNA GENERAL", "MUCUNA Small",
                  "DEFAULT"),
    `MG` = c(8, 8, 8),
    `TM` = c(1, 1, 1),
    `PP-SS` = c(0, 0, 0),
    `PL-EM` = c(3, 3.8, 3),
    `EM-V1` = c(4, 5, 4),
    `V1-JU` = c(0, 0, 0),
    `JU-R0` = c(5.0, 5.0, 5.0),
    `PM06` = c(0, 0, 0),
    `PM09` = c(0.35, 0.35, 0.35),
    `LNHSH` = c(25, 12, 25),
    `R7-R8` = c(21, 12, 21),
    `FL-VS` = c(90, 12, 90),
    `TRIFL` = c(0.3, 0.3, 0.3),
    `RWDTH` = c(1, 1, 1),
    `RHGHT` = c(1, 0.8, 1),
    `R1PPO` = c(0.549, 0.549, 0.549),
    `OPTBI` = c(20, 20, 20),
    `SLOBI` = c(0, 0, 0))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() VBGRO048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() VBGRO048.ECO")


# "read_eco() WHAPS048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       TBASE = "%5.0f", TOPT = "%6.0f", ROPT = "%6.0f",
                       TTOP = "%6.0f", P20 = "%6.1f", VREQ = "%6.0f",
                       GDDE = "%6.1f", DSGFT = "%6.0f", RUE1 = "%6.1f",
                       RUE2 = "%6.1f", KVAL1 = "%6.2f", KVAL2 = "%6.2f",
                       SLAP2 = "%6.0f", TC1P1 = "%6.1f", TC1P2 = "%6.1f",
                       DTNP1 = "%6.3f", PLGP1 = "%6.0f", PLGP2 = "%6.1f",
                       P2AF = "%6.1f", P3AF = "%6.0f", P4AF = "%6.0f",
                       P5AF = "%6.0f", P6AF = "%6.0f", ADLAI = "%6.1f",
                       ADTIL = "%6.0f", ADPHO = "%6.0f", STEMN = "%6.0f",
                       MXNUP = "%6.1f", MXNCR = "%6.2f", WFNU = "%6.0f",
                       PNUPR = "%6.2f", EXNO3 = "%6.2f", MNNO3 = "%6.0f",
                       EXNH4 = "%6.1f", MNNH4 = "%6.0f", INGWT = "%6.1f",
                       INGNC = "%6.2f", FREAR = "%6.2f", MNNCR = "%6.2f",
                       GPPSS = "%6.0f", GPPES = "%6.0f", MXGWT = "%6.0f",
                       MNRTN = "%6.1f", NOMOB = "%6.2f", RTDP1 = "%6.0f",
                       RTDP2 = "%6.0f", FOZ1 = "%6.2f", SFOZ1 = "%6.2f",
                       TSEN = "%6.1f", CDAY = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/WHAPS048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() WHAPS048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("IB0001", "IB0002", "IB0003",
                                    "IB0004", "IB0005", "IB0006",
                                    "IB0007", "IB0008", "DFAULT",
                                    "IB0099", "IB0098"),
                         `ECONAME` = c("GENERIC", "GENERIC2", "GENERIC3",
                                       "GENERIC4", "GENERIC5", "GENERIC6",
                                       "GENERIC7", "GENERIC8", "DEFAULT",
                                       "Cold Hardy (test)", "Cold Sens. (test)"
                         ),
                         `TBASE` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0),
                         `TOPT` = c(26, 26, 26, 26, 26, 26, 26,
                                    26, 34, 26, 26),
                         `ROPT` = c(26, 26, 26, 26, 26, 26, 26,
                                    26, 34, 26, 26),
                         `TTOP` = c(34, 34, 34, 34, 34, 34, 34,
                                    34, 34, 34, 34),
                         `P20` = c(12.5, 12.5, 12.5, 12.5, 12.5,
                                   12.5, 12.5, 12.5, 12.5, 12.5,
                                   12.5),
                         `VREQ` = c(50, 50, 50, 50, 50, 50, 50,
                                    50, 50, 50, 50),
                         `GDDE` = c(10.2, 10.2, 10.2, 10.2, 10.2,
                                    10.2, 10.2, 10.2, 6, 6, 6),
                         `DSGFT` = c(200, 200, 200, 200, 200, 200,
                                     200, 200, 170, 170, 170),
                         `RUE1` = c(3.8, 3.8, 3.8, 3.8, 3.8, 3.8,
                                    3.8, 3.8, 3.8, 3.8, 3.8),
                         `RUE2` = c(3.8, 3.8, 3.8, 3.8, 3.8, 3.8,
                                    3.8, 3.8, 3.8, 3.8, 3.8),
                         `KVAL1` = c(0.63, 0.63, 0.63, 0.63, 0.63,
                                     0.63, 0.63, 0.63, 0.63, 0.63,
                                     0.63),
                         `KVAL2` = c(0.63, 0.63, 0.63, 0.63, 0.63,
                                     0.63, 0.63, 0.63, 0.63, 0.63,
                                     0.63),
                         `SLAP2` = c(300, 270, 270, 225, 270, 270,
                                     270, 270, 270, 300, 300),
                         `TC1P1` = c(2.5, 2.5, 2.5, 2.5, 2.5, 2.5,
                                     2.5, 2.5, 2.5, 2.5, 2.5),
                         `TC1P2` = c(0.6, 0.6, 1, 1, 0.6, 0.6,
                                     0.6, 0.6, 0.6, 0.6, 0.6),
                         `DTNP1` = c(0.005, 0.005, 0.005, 0.005,
                                     0.005, 0.005, 0.005, 0.005,
                                     0.005, 0.005, 0.005),
                         `PLGP1` = c(1400, 1400, 1400, 1400, 1400,
                                     1400, 1400, 1400, 1400, 1400,
                                     1400),
                         `PLGP2` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6, 0.6, 0.6, 0.6, 0.6),
                         `P2AF` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.1,
                                    0.6, 0.1, 0.6, 0.6, 0.6),
                         `P3AF` = c(50, 50, 50, 50, 50, 50, 50,
                                    50, 50, 50, 50),
                         `P4AF` = c(3, 3, 3, 3, 3, 3, 3, 3, 3,
                                    3, 3),
                         `P5AF` = c(1, 1, 1, 1, 3, 3, 1, 3, 1,
                                    1, 1),
                         `P6AF` = c(3, 3, 3, 3, 3, 3, 3, 3, 3,
                                    3, 3),
                         `ADLAI` = c(1, 1, 1, 1, 1, 1, 0.7, 0.5,
                                     1, 1, 1),
                         `ADTIL` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1),
                         `ADPHO` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1),
                         `STEMN` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0),
                         `MXNUP` = c(0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6, 0.6, 0.6, 0.6, 0.6),
                         `MXNCR` = c(0.04, 0.04, 0.04, 0.04, 0.04,
                                     0.04, 0.04, 0.04, 0.04, 0.04,
                                     0.04),
                         `WFNU` = c(2, 2, 2, 2, 2, 2, 2, 2, 2,
                                    2, 2),
                         `PNUPR` = c(0.45, 0.45, 0.45, 0.45, 0.45,
                                     0.45, 0.45, 0.45, 0.45, 0.45,
                                     0.45),
                         `EXNO3` = c(6.75, 6.75, 6.75, 6.75, 6.75,
                                     6.75, 6.75, 6.75, 6.75, 6.75,
                                     6.75),
                         `MNNO3` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0),
                         `EXNH4` = c(6.5, 6.5, 6.5, 6.5, 6.5, 6.5,
                                     6.5, 6.5, 6.5, 6.5, 6.5),
                         `MNNH4` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0),
                         `INGWT` = c(3.5, 3.5, 3.5, 3.5, 3.5, 3.5,
                                     3.5, 3.5, 3.5, 3.5, 3.5),
                         `INGNC` = c(0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03),
                         `FREAR` = c(0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25),
                         `MNNCR` = c(1.23, 1.23, 1.23, 1.23, 1.23,
                                     1.23, 1.23, 1.23, 1.23, 1.23,
                                     1.23),
                         `GPPSS` = c(2, 2, 2, 2, 2, 2, 2, 2, 2,
                                     2, 2),
                         `GPPES` = c(5, 5, 5, 5, 5, 5, 5, 5, 5,
                                     5, 5),
                         `MXGWT` = c(55, 55, 55, 55, 55, 55, 55,
                                     55, 55, 55, 55),
                         `MNRTN` = c(4.5, 4.5, 4.5, 4.5, 4.5, 4.5,
                                     4.5, 4.5, 4.5, 4.5, 4.5),
                         `NOMOB` = c(0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25),
                         `RTDP1` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1),
                         `RTDP2` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1),
                         `FOZ1` = c(0.06, 0.06, 0.06, 0.06, 0.06,
                                    0.06, 0.06, 0.06, 0.06, 0.06,
                                    0.06),
                         `SFOZ1` = c(0.08, 0.08, 0.08, 0.08, 0.08,
                                     0.08, 0.08, 0.08, 0.08, 0.08,
                                     0.08),
                         `TSEN` = c(NA, NA, NA, NA, NA, NA, NA,
                                    NA, NA, 0.5, 10),
                         `CDAY` = c(NA, NA, NA, NA, NA, NA, NA,
                                    NA, NA, 20, 5))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() WHAPS048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() WHAPS048.ECO")


# "read_eco() WHCER048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-6s", P1 = "%6.0f", P2FR1 = "%6.2f",
                       P2 = "%6.0f", P3 = "%6.0f", P4FR1 = "%6.2f",
                       P4FR2 = "%6.2f", P4 = "%6.0f", VEFF = "%6.1f",
                       PARUE = "%6.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
                       PHF3 = "%6.1f", LA1S = "%6.0f", LAFV = "%6.2f",
                       LAFR = "%6.2f", SLAS = "%6.0f", LSPHS = "%6.1f",
                       LSPHE = "%6.1f", "TIL#S" = "%6.1f", TIPHE = "%6.2f",
                       TIFAC = "%6.1f", TDPHS = "%6.1f", TDPHE = "%6.0f",
                       TDFAC = "%6.1f", RDGS = "%6.0f", HTSTD = "%6.0f",
                       AWNS = "%6.0f", KCAN = "%6.2f", "RS%S" = "%6.0f",
                       "GN%S" = "%6.1f", "GN%MN" = "%6.1f", TKFH = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/WHCER048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() WHCER048.ECO"

    `char_cols` <- "ECO#"
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "CAWH01", "USWH01", "UKWH01",
                                    "AZWH18", "CI0001", "TXWH01",
                                    "TWKG01"),
                         `P1` = c(100, 500, 200, 362, 400, 421,
                                  460, 400, 400, 421),
                         `P2FR1` = c(0, 0.6, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25
                         ),
                         `P2` = c(100, 500, 200, 258, 285, 300,
                                  328, 280, 285, 300),
                         `P3` = c(100, 500, 200, 172, 190, 200,
                                  219, 200, 190, 240),
                         `P4FR1` = c(0.15, 0.35, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25
                         ),
                         `P4FR2` = c(0.05, 0.25, 0.1, 0.1, 0.1,
                                     0.1, 0.1, 0.1, 0.1, 0.1),
                         `P4` = c(100, 500, 200, 200, 200, 200,
                                  200, 260, 200, 240),
                         `VEFF` = c(0, 1, 0.6, 0.5, 1, 0.5, 0.6,
                                    0.6, 1, 1),
                         `PARUE` = c(1, 6, 2.7, 2.7, 2.3, 2.7,
                                     2.7, 2, 1.5, 2.3),
                         `PARU2` = c(1, 6, 2.7, 2.7, 2.3, 2.7,
                                     2.7, 2.5, 1.5, 2.3),
                         `PHL2` = c(4, 200, 15, 13, 13, 13, 13,
                                    13, 13, 13),
                         `PHF3` = c(1, 1.6, 1.3, 1, 1, 1, 1, 1,
                                    1, 1),
                         `LA1S` = c(1, 20, 5, 3, 2, 2, 2, 10, 2,
                                    5),
                         `LAFV` = c(0.01, 0.8, 0.1, 0.05, 0.15,
                                    0.1, 0.15, 0.3, 0.15, 0.1),
                         `LAFR` = c(0.1, 3, 0.5, 0.3, 0.01, 0.3,
                                    0.5, 0.4, 0.01, 0.55),
                         `SLAS` = c(100, 600, 400, 300, 400, 485,
                                    400, 350, 400, 400),
                         `LSPHS` = c(4, 5.7, 5.5, 4.2, 5.1, 5.7,
                                     5.3, 5.4, 5.1, 5.7),
                         `LSPHE` = c(5.5, 6.5, 6.3, 6, 6.5, 6.3,
                                     6.5, 6.1, 6.5, 6.3),
                         `TIL#S` = c(2.5, 7, 3.5, 3, 4.5, 4.5,
                                     4.5, 2.3, 4.5, 4.5),
                         `TIPHE` = c(2, 4, 2.5, 2.5, 2, 2, 2, 1.95,
                                     2, 2),
                         `TIFAC` = c(0.5, 2, 1, 1, 0.8, 0.5, 0.8,
                                     2, 0.8, 0.5),
                         `TDPHS` = c(1.5, 4, 2.5, 2.7, 2.2, 2.2,
                                     2.2, 2.8, 2.2, 2),
                         `TDPHE` = c(2, 6, 6, 6, 6, 6, 6, 6, 6,
                                     5),
                         `TDFAC` = c(0, 20, 4, 4, 4, 20, 4, 4,
                                     4, 0.5),
                         `RDGS` = c(1, 5, 3, 3, 3, 3, 3, 3, 3,
                                    3),
                         `HTSTD` = c(60, 150, 100, 100, 100, 100,
                                     100, 100, 100, 100),
                         `AWNS` = c(0, 10, 0, 0, 5, 0, 5, 5, 5,
                                    0),
                         `KCAN` = c(0.65, 0.95, 0.85, 0.85, 0.85,
                                    0.85, 0.85, 0.85, 0.85, 0.85),
                         `RS%S` = c(10, 60, 30, 30, 30, 60, 30,
                                    30, 30, 60),
                         `GN%S` = c(1, 3.5, 3, 3, 2.2, 2, 2.2,
                                    2.2, 2.2, 2),
                         `GN%MN` = c(0, 6, 0, 2, 1.9, 1, 1.9, 1.9,
                                     1.9, 0),
                         `TKFH` = c(-10, -25, -10, -10, -20, -15,
                                    -20, -20, -20, -15))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() WHCER048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() WHCER048.ECO")


# "read_eco() WHCRP048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       PARUE = "%5.1f", PARU2 = "%6.1f", PHL2 = "%6.0f",
                       PHF3 = "%6.1f", SLAS = "%6.0f", LSENI = "%6.1f",
                       LSPHS = "%6.1f", LSPHE = "%6.1f", "TIL#S" = "%6.1f",
                       TILPE = "%6.1f", TIFAC = "%6.1f", TDPHS = "%6.1f",
                       TDPHE = "%6.1f", TDFAC = "%6.1f", TDSF = "%6.0f",
                       RDGS = "%6.0f", HTSTD = "%6.0f", AWNS = "%6.0f",
                       KCAN = "%6.2f", "RS%A" = "%6.0f", "GN%S" = "%6.1f",
                       "GN%MN" = "%6.1f", "GM%H" = "%6.0f", TKFH = "%6.0f",
                       SSPHS = "%6.1f", SSPHE = "%6.1f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/ECO/WHCRP048_ECO.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_ECO\\.rds$", ".ECO", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_eco(input_file)

  info_prefix <- "read_eco() WHCRP048.ECO"

    `char_cols` <- c("ECO#", "ECONAME")
    expected_vals <- list(`ECO#` = c("999991", "999992", "DFAULT",
                                    "CA0001", "US0001", "UK0001"),
                         `ECONAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                       "CANADA(SPRING)", "USA(WINTER)",
                                       "UK(MFUNDIN)"),
                         `PARUE` = c(1, 4, 2.7, 2.7, 2.5, 2.7),
                         `PARU2` = c(1, 4, 2.7, 2.7, 2.7, 2.7),
                         `PHL2` = c(4, 200, 12, 200, 200, 15),
                         `PHF3` = c(1, 1.6, 1.3, 1, 1, 1.5),
                         `SLAS` = c(100, 600, 400, 300, 400, 485),
                         `LSENI` = c(0.1, 2.5, 1.5, 0.3, 1.5, 0.3
                         ),
                         `LSPHS` = c(5, 8.5, 8, 5.5, 8.3, 8.7),
                         `LSPHE` = c(5, 9.5, 9.2, 9, 9.3, 9.2),
                         `TIL#S` = c(2, 5, 4, 3, 4.5, 4.5),
                         `TILPE` = c(2, 5, 3, 3.5, 3, 3),
                         `TIFAC` = c(0.1, 1, 1, 1, 0.8, 0.2),
                         `TDPHS` = c(1.5, 3.5, 3, 3.7, 3.2, 3),
                         `TDPHE` = c(4.5, 8, 7, 9, 9, 9),
                         `TDFAC` = c(0.1, 15, 5, 4, 4, 12),
                         `TDSF` = c(0, 2, 1, 1, 1, 1),
                         `RDGS` = c(1, 5, 3, 3, 4, 3),
                         `HTSTD` = c(50, 150, 100, 100, 100, 100
                         ),
                         `AWNS` = c(0, 10, 5, 0, 5, 0),
                         `KCAN` = c(0.65, 0.95, 0.85, 0.85, 0.85,
                                    0.85),
                         `RS%A` = c(5, 30, 15, 15, 10, 25),
                         `GN%S` = c(1, 4, 2, 4, 2.3, 2.5),
                         `GN%MN` = c(0.5, 2.5, 1.5, 1.5, 1.7, 1
                         ),
                         `GM%H` = c(0, 25, 15, 15, 8, 15),
                         `TKFH` = c(-10, -30, -15, -8, -30, -10
                         ),
                         `SSPHS` = c(5, 8.5, 8, 8.7, 8.3, 8.5),
                         `SSPHE` = c(7, 9.5, 9.3, 9.4, 8.5, 9.7
                         ))

  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }


  expect_equal(attr(actual, "v_fmt"), v_fmt_expected,
               info = "read_eco() WHCRP048.ECO")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_eco() WHCRP048.ECO")


# Code used to create tests (for posterity):
if(FALSE){
  library(tidyverse)

  create_read_eco_test <- function(file_name, expected){

    name_root <- gsub("\\.ECO", "", file_name)

    # expected_name <- gsub("\\.ECO", "_ECO.R", file_name)

    v_fmt <- DSSAT:::create_test_arg("v_fmt_expected",
                                     attr(expected, "v_fmt"))

    tier_info <- DSSAT:::create_test_arg("tier_info_expected",
                                         attr(expected, "tier_info"))

    test_cols_check_call <- DSSAT:::create_call_test_cols_check("actual", expected)

    test_out <- c(paste0("test_that(\"read_eco() ", file_name, "\", {"),
                  "",
                  v_fmt,
                  "",
                  tier_info,
                  "",
                  paste0("  input_file <- system.file(\"tinytest/test_data/ECO/", file_name, "\","),
                  "                            package = \"DSSAT\")",
                  "",
                  "  actual <- DSSAT::read_eco(input_file)",
                  "",
                  paste0("  ", test_cols_check_call),
                  "",
                  "  expect_equal(attr(actual, \"v_fmt\"), v_fmt_expected)",
                  "",
                  "  expect_equal(attr(actual, \"tier_info\"), tier_info_expected)",
                  "",
                  "})",
                  "")

    return(test_out)
  }

  all_eco <- list.files("inst/tinytest/test_data/ECO/", full.names = TRUE) %>%
    tibble(file_name = .) %>%
    mutate(contents = map(file_name, DSSAT::read_eco))

  # # Create inputs for tests
  # all_eco %>%
  #   pmap(\(file_name, contents, new_file) dput(contents, new_file))
  #
  # Create the test code for each file
  all_eco %>%
    mutate(file_name = basename(file_name)) %>%
    select(file_name, contents) %>%
    pmap(\(file_name, contents)
         create_read_eco_test(file_name, contents)) %>%
    unlist() %>%
    clipr::write_clip()

  # # Create validation files
  # eco_out <- all_eco %>%
  #   mutate(valid_file = file.path(dirname(new_file), basename(file_name)),
  #          raw_text = lapply(file_name, \(.x) readLines(.x, warn = FALSE)),
  #          comments = lapply(raw_text, \(.x) gsub("!([^ ])",
  #                                                 "! \\1",
  #                                                 grep("!", .x, value = TRUE)
  #                                                 )),
  #          first_line = lapply(raw_text, \(.x) .x[1]),
  #          body = lapply(raw_text, \(.x) grep("^ *$",
  #                                             gsub("!.*", "", .x[-1]),
  #                                             invert = TRUE,
  #                                             value = TRUE)),
  #          valid_contents = pmap(list(first_line, comments, body),
  #                                \(first_line, comments, body) c(first_line, "", comments, "", body)),
  #          write_out = pmap(list(valid_file, valid_contents),
  #                               \(valid_file, valid_contents) write(valid_contents, paste0(valid_file, ".orig"))),
  #          write_eco_out = pmap(list(valid_file, contents),
  #                               \(valid_file, contents) DSSAT::write_eco(contents, valid_file))
  #          )

}

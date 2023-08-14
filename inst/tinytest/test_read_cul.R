# "read_cul() ALFRM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.1f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/ALFRM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() ALFRM048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("AL0001", "AL0002", "AL0003",
                                    "AL0004", "AL0005", "CA0001",
                                    "CA0002", "CA0003"),
                         `VRNAME` = c("Aragon  FD7", "Rugged  FD3",
                                      "Cisco II  FD6", "CUF101  FD10",
                                      "Aragon RDRMM", "CFIA-alfalfa FD4",
                                      "Apica FD4", "Oneida FD3"),
                         `EXPNO` = c("", "", "", "", "", "", "",
                                     ""),
                         `ECO#` = c("G00001", "G00002", "G00003",
                                    "G00004", "G00005", "C00001",
                                    "C00001", "C00002"),
                         `CSDL` = c(12.5, 12.5, 12.5, 12.5, 12.5,
                                    12.5, 12.5, 12.5),
                         `PPSEN` = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2,
                                     0.2, 0.2),
                         `EM-FL` = c(99, 99, 99, 99, 99, 99, 99,
                                     99),
                         `FL-SH` = c(10, 10, 10, 10, 10, 10, 10,
                                     10),
                         `FL-SD` = c(18, 18, 18, 18, 18, 18, 18,
                                     18),
                         `SD-PM` = c(33, 33, 33, 33, 33, 33, 33,
                                     33),
                         `FL-LF` = c(25, 25, 25, 25, 25, 25, 25,
                                     25),
                         `LFMAX` = c(1.4, 1.32, 1.38, 1.46, 1.4,
                                     1.34, 1.34, 1.32),
                         `SLAVR` = c(240, 240, 240, 240, 240, 240,
                                     240, 240),
                         `SIZLF` = c(2, 2, 2, 2, 2, 2, 2, 2),
                         `XFRT` = c(0.01, 0.01, 0.01, 0.01, 0.01,
                                    0.01, 0.01, 0.01),
                         `WTPSD` = c(0.02, 0.02, 0.02, 0.02, 0.02,
                                     0.02, 0.02, 0.02),
                         `SFDUR` = c(15, 15, 15, 15, 15, 15, 15,
                                     15),
                         `SDPDV` = c(2.05, 2.05, 2.05, 2.05, 2.05,
                                     2.05, 2.05, 2.05),
                         `PODUR` = c(20, 20, 20, 20, 20, 20, 20,
                                     20),
                         `THRSH` = c(78, 78, 78, 78, 78, 78, 78,
                                     78),
                         `SDPRO` = c(0.115, 0.115, 0.115, 0.115,
                                     0.115, 0.115, 0.115, 0.115),
                         `SDLIP` = c(0.035, 0.035, 0.035, 0.035,
                                     0.035, 0.035, 0.035, 0.035))

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
               info = "read_cul() ALFRM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() ALFRM048.CUL")


# "read_cul() BACER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", P1V = "%6.0f",
                       P1D = "%6.0f", P5 = "%6.0f", G1 = "%6.0f",
                       G2 = "%6.0f", G3 = "%6.1f", PHINT = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BACER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BACER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "IB0101", "IB0102", "IB0030"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                        "A.Abiad (2)", "Beecher (6)",
                                        "Maris Badger"),
                         `EXP#` = c(".", ".", ".", ".", ".", "."
                         ),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "SY0001", "SY0002", "US0001"),
                         `P1V` = c(0, 60, 5, 10, 10, 0),
                         `P1D` = c(0, 200, 75, 30, 30, 40
                         ),
                         `P5` = c(100, 999, 450, 220, 220,
                                  750),
                         `G1` = c(10, 50, 30, 16, 13, 20),
                         `G2` = c(10, 80, 35, 40, 40, 52),
                         `G3` = c(0.5, 8, 1, 2.7, 2.7, 1.5),
                         `PHINT` = c(30, 150, 60, 89, 92,
                                     64))

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
               info = "read_cul() BACER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BACER048.CUL")


# "read_cul() BACRP048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P2 = "%6.0f", P3 = "%6.0f", P4 = "%6.0f",
                       P5 = "%6.0f", P6 = "%6.0f", P7 = "%6.0f",
                       P8 = "%6.0f", VREQ = "%6.0f", VBASE = "%6.0f",
                       VEFF = "%6.0f", PPS1 = "%6.0f", PPS2 = "%6.0f",
                       PHINT = "%6.0f", LA1S = "%6.1f", LAFV = "%6.2f",
                       LAFR = "%6.2f", SHWTS = "%6.1f", "G#WTS" = "%6.0f",
                       GWTS = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BACRP048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BACRP048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "IB0101", "IB0102", "IB0030"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULTS",
                                        "A.Abiad(2row)", "Beecher(6row)",
                                        "Maris Badger"),
                         `EXP#` = c(".", ".", ".", ".", ".", "."
                         ),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "SY0001", "SY0002", "US0001"),
                         `P1` = c(100, 800, 380, 390, 411,
                                  400),
                         `P2` = c(60, 100, 70, 73, 77, 66
                         ),
                         `P3` = c(100, 300, 200, 218, 230,
                                  199),
                         `P4` = c(50, 500, 200, 196, 206,
                                  178),
                         `P5` = c(50, 400, 60, 66, 70, 60
                         ),
                         `P6` = c(10, 100, 25, 26, 28, 24
                         ),
                         `P7` = c(50, 300, 150, 171, 181,
                                  156),
                         `P8` = c(100, 800, 500, 220, 220,
                                  650),
                         `VREQ` = c(0, 60, 0, 10, 10, 0),
                         `VBASE` = c(0, 30, 0, 0, 0, 0),
                         `VEFF` = c(0, 1, 0, 1, 1, 1),
                         `PPS1` = c(0, 300, 0, 20, 20, 0),
                         `PPS2` = c(0L, 200L, 0L, 0L, 0L, 0L),
                         `PHINT` = c(40L, 120L, 80L, 91L, 96L,
                                     83L),
                         `LA1S` = c(0.1, 10, 3, 4, 5, 4),
                         `LAFV` = c(0.01, 5, 0.1, 0.1, 0.1, 0.1
                         ),
                         `LAFR` = c(0.01, 5, 0.5, 0.3, 0.4, 0.3
                         ),
                         `SHWTS` = c(0.5, 5, 2.5, 3, 3, 2.5),
                         `G#WTS` = c(10L, 50L, 25L, 10L, 7L, 14L
                         ),
                         `GWTS` = c(10L, 75L, 40L, 40L, 40L, 50L
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
               info = "read_cul() BACRP048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BACRP048.CUL")


# "read_cul() BHGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.2f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BHGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BHGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "UF0001"
    ),
    `VRNAME` = c("MINIMA", "MAXIMA", "PENSACOLA BAHIA"
    ),
    `EXPNO` = c(".", ".", "."),
    `ECO#` = c("DFAULT", "DFAULT", "BH0001"
    ),
    `CSDL` = c(12, 23, 12),
    `PPSEN` = c(0.01, 0.2, 0.2),
    `EM-FL` = c(29, 45, 99),
    `FL-SH` = c(10, 10, 10),
    `FL-SD` = c(12, 18, 18),
    `SD-PM` = c(40, 54, 33),
    `FL-LF` = c(25, 75, 25),
    `LFMAX` = c(0.95, 1.5, 1.44),
    `SLAVR` = c(170, 300, 285),
    `SIZLF` = c(250, 300, 2),
    `XFRT` = c(0.01, 0.75, 0.01),
    `WTPSD` = c(0.018, 0.02, 0.02),
    `SFDUR` = c(15, 40, 15),
    `SDPDV` = c(2.05, 2.05, 2.05),
    `PODUR` = c(20, 20, 20),
    `THRSH` = c(78, 78, 78),
    `SDPRO` = c(0.115, 0.153, 0.115),
    `SDLIP` = c(0.035, 0.035, 0.035))

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
               info = "read_cul() BHGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BHGRO048.CUL")


# "read_cul() BMFRM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BMFRM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BMFRM048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "UF0001"
    ),
    `VRNAME` = c("MINIMA", "MAXIMA", "TIFTON 85 BERMUD"
    ),
    `EXPNO` = c(".", ".", ""),
    `ECO#` = c("DFAULT", "DFAULT", "G00002"
    ),
    `CSDL` = c(12.5, 23, 12.5),
    `PPSEN` = c(0.001, 0.2, 0.2),
    `EM-FL` = c(29, 45, 99),
    `FL-SH` = c(10, 10, 10),
    `FL-SD` = c(12, 18, 18),
    `SD-PM` = c(33, 54, 33),
    `FL-LF` = c(25, 75, 25),
    `LFMAX` = c(0.95, 1.86, 1.86),
    `SLAVR` = c(170, 250, 170),
    `SIZLF` = c(2, 2, 2),
    `XFRT` = c(0.01, 0.75, 0.01),
    `WTPSD` = c(0.02, 0.18, 0.02),
    `SFDUR` = c(15, 40, 15),
    `SDPDV` = c(2.05, 2.05, 2.05),
    `PODUR` = c(20, 20, 20),
    `THRSH` = c(78, 78, 78),
    `SDPRO` = c(0.115, 0.115, 0.115),
    `SDLIP` = c(0.035, 0.035, 0.035))

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
               info = "read_cul() BMFRM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BMFRM048.CUL")


# "read_cul() BNGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.0f", WTPSD = "%6.2f",
                       SFDUR = "%6.1f", SDPDV = "%6.1f", PODUR = "%6.1f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BNGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BNGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "990003", "990004",
                                    "990005", "990006", "990007",
                                    "IB0001", "IB0002", "IB0003",
                                    "IB0004", "IB0005", "IB0006",
                                    "IB0007", "IB0008", "IB0010",
                                    "IB0011", "IB0012", "IB0013",
                                    "IB0014", "IB0016", "IB0028",
                                    "IB0029", "IB0031", "IB0032",
                                    "IB0033", "IB0034", "IB0035",
                                    "IB0036", "IB0037"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Andean Habit 1",
                                      "Andean Habit 2", "Andean Habit 3",
                                      "Andean Habit 4", "Meso Amer. Hab.1",
                                      "MesoAm Hab 2 & 3", "Mex Highland H 3",
                                      "Porrillo Sinteti", "BAT 477",
                                      "Seafarer", "C-20", "BAT 881",
                                      "ICTA-Ostua", "Rabia de Gato",
                                      "TURBO-III", "Carioca (G4017)",
                                      "Isabella", "Manitou", "Redkloud",
                                      "Canadian Wonder", "A 70",
                                      "Jatu Rong", "San Crist. 83",
                                      "A 465", "A 486", "A 193 (hab 2)",
                                      "A 195", "BAT 1393", "WAF 9",
                                      "Brasil 2 Pico"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "co   .", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "ANDDET",
                                    "ANDIND", "ANDIND", "ANDIND",
                                    "MESDET", "MESIND", "MEXHIL",
                                    "MESIND", "MESIND", "MESDET",
                                    "MESIND", "MESIND", "MESIND",
                                    "MESIND", "MESIND", "MESIND",
                                    "ANDDET", "ANDDET", "ANDDET",
                                    "ANDDET", "MESIND", "ANDDET",
                                    "MESIND", "MESIND", "ANDDET",
                                    "ANDIND", "ANDDET", "ANDDET",
                                    "ANDDET", "MESDET"),
                         `CSDL` = c(12.17, 12.17, 12.17, 12.17,
                                    12.17, 12.17, 12.17, 12.17, 12.17,
                                    13.5, 12.17, 12.17, 12.17, 12.17,
                                    12.17, 12.17, 12.17, 12.17, 12.17,
                                    12.17, 12.17, 12.17, 12.17, 12.17,
                                    12.17, 12.17, 12.17, 12.17, 12.17,
                                    12.17, 12.17, 12.17),
                         `PPSEN` = c(0, 0.07, 0, 0.05, 0.05, 0.05,
                                     0, 0, 0.05, 0.017, 0, 0, 0,
                                     0, 0, 0, 0.05, 0, 0, 0.015,
                                     0, 0.02, 0.02, 0.04, 0.02, 0.02,
                                     0.03, 0.04, 0.02, 0.02, 0.04,
                                     0.02),
                         `EM-FL` = c(20, 35, 22.6, 26, 30, 34,
                                     27, 31, 27, 31.5, 30, 28, 33.6,
                                     32, 26.5, 24, 29, 32.5, 26.3,
                                     29, 23.5, 24, 31, 23, 31, 29,
                                     27, 30, 28, 25, 23.5, 29),
                         `FL-SH` = c(2, 5, 3, 4, 4.5, 5, 3, 3.5,
                                     3, 3, 3, 4, 4.5, 3.5, 3.5, 3.5,
                                     3.5, 3.5, 2.5, 4.5, 3, 3.5,
                                     3.5, 2, 3, 4, 2.5, 4, 2.5, 3.5,
                                     2.5, 2.5),
                         `FL-SD` = c(6, 13, 12, 11, 9.5, 9, 9,
                                     10, 9, 8, 8.5, 11, 11.5, 10.8,
                                     8.5, 8, 8, 10.8, 10, 12, 9.8,
                                     10, 10.2, 9.5, 9.5, 10.5, 9.5,
                                     11.6, 9.2, 11, 10.5, 9),
                         `SD-PM` = c(14, 29, 18.4, 21, 22, 25,
                                     20, 22, 22, 20.5, 21, 19, 21.5,
                                     20.2, 18.5, 19.2, 17, 18.2,
                                     21, 22, 19.7, 19.5, 18.8, 18.5,
                                     18.5, 20.5, 21.5, 18.4, 21.5,
                                     22, 19, 17),
                         `FL-LF` = c(10, 34, 10, 18, 22, 34, 16,
                                     21, 20, 21, 21, 18, 20, 20,
                                     18, 14, 22, 18, 10, 10, 10,
                                     10, 18, 10, 18, 10, 9, 12, 12,
                                     12, 10, 14),
                         `LFMAX` = c(0.98, 1, 0.98, 0.98, 0.98,
                                     0.98, 1, 1, 1, 1, 1, 0.95, 0.97,
                                     1.01, 1, 1, 1, 1, 0.95, 0.93,
                                     1, 0.96, 1, 0.99, 1, 0.97, 0.94,
                                     0.95, 0.99, 0.99, 1, 0.99),
                         `SLAVR` = c(250, 350, 305, 320, 320, 320,
                                     310, 320, 320, 300, 300, 315,
                                     310, 280, 320, 295, 295, 300,
                                     300, 310, 320, 315, 285, 295,
                                     310, 270, 295, 285, 300, 325,
                                     320, 290),
                         `SIZLF` = c(133, 180, 133, 133, 133, 133,
                                     133, 133, 133, 150, 140, 133,
                                     133, 140, 133, 133, 133, 140,
                                     140, 140, 150, 150, 140, 140,
                                     150, 133, 150, 140, 160, 133,
                                     150, 150),
                         `XFRT` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1),
                         `WTPSD` = c(0.22, 0.66, 0.6, 0.6, 0.6,
                                     0.65, 0.23, 0.23, 0.4, 0.23,
                                     0.23, 0.22, 0.22, 0.22, 0.2,
                                     0.2, 0.24, 0.25, 0.5, 0.5, 0.55,
                                     0.55, 0.28, 0.35, 0.32, 0.34,
                                     0.55, 0.5, 0.55, 0.4, 0.5, 0.22
                         ),
                         `SFDUR` = c(11, 22, 15, 15, 20, 22, 16,
                                     20, 17, 21, 21, 17, 17, 19,
                                     19, 20.5, 19, 19, 19, 17, 18,
                                     18, 19, 14, 19, 19, 19, 19,
                                     17.5, 15, 14, 15),
                         `SDPDV` = c(3, 5, 3.5, 3.5, 4.2, 4.7,
                                     5.2, 5.5, 3.2, 5.2, 5.5, 5,
                                     5.2, 5.2, 5.4, 5.4, 4, 5.5,
                                     3.5, 3.5, 3.5, 3.5, 5.2, 4.3,
                                     5, 4, 3.5, 3.5, 3.5, 3.3, 3.4,
                                     5),
                         `PODUR` = c(4, 16, 10, 10, 14, 15, 5,
                                     10, 5, 11.5, 11.5, 11, 14, 10,
                                     14, 13, 10, 11.5, 10, 12, 11,
                                     10, 12, 9, 12, 14, 11, 10, 11,
                                     11, 9, 11),
                         `THRSH` = c(78, 78, 78, 78, 78, 78, 78,
                                     78, 78, 78, 78, 78, 78, 78,
                                     78, 78, 78, 78, 78, 78, 78,
                                     78, 78, 78, 78, 78, 78, 78,
                                     78, 78, 78, 78),
                         `SDPRO` = c(0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235,
                                     0.235, 0.235, 0.235, 0.235),
                         `SDLIP` = c(0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03, 0.03, 0.03, 0.03,
                                     0.03, 0.03))

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
               info = "read_cul() BNGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BNGRO048.CUL")


# "read_cul() BRFRM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.1f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.1f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BRFRM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BRFRM048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "SP0001"
    ),
    `VRNAME` = c("MINIMA", "MAXIMA", "Marandu"
    ),
    `EXPNO` = c(".", ".", ""),
    `ECO#` = c("DFAULT", "DFAULT", "G00001"
    ),
    `CSDL` = c(12.5, 12.5, 12.5),
    `PPSEN` = c(0.2, 0.2, 0.2),
    `EM-FL` = c(99, 99, 99),
    `FL-SH` = c(10, 10, 10),
    `FL-SD` = c(18, 18, 18),
    `SD-PM` = c(33, 33, 33),
    `FL-LF` = c(25, 25, 25),
    `LFMAX` = c(1.8, 1.8, 1.8),
    `SLAVR` = c(190, 190, 190),
    `SIZLF` = c(2, 2, 2),
    `XFRT` = c(0.01, 0.01, 0.01),
    `WTPSD` = c(0.02, 0.02, 0.02),
    `SFDUR` = c(15, 15, 15),
    `SDPDV` = c(2.05, 2.05, 2.05),
    `PODUR` = c(20, 20, 20),
    `THRSH` = c(78, 78, 78),
    `SDPRO` = c(0.115, 0.115, 0.115),
    `SDLIP` = c(0.035, 0.035, 0.035))

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
               info = "read_cul() BRFRM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BRFRM048.CUL")


# "read_cul() BRGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.1f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.1f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.1f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BRGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BRGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("CC0001", "CC0002", "CN0003",
                                    "CC0004", "CC0005", "CN0006",
                                    "SA0001", "BG0001"),
                         `VRNAME` = c("Brachiaria 1", "Brachiaria 2",
                                      "Brachiaria 3", "Brachiaria 4",
                                      "Brachiaria 5", "Brachiaria 6",
                                      "Brachiaria 7", "UF0001"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", "."),
                         `ECO#` = c("BR0001", "BR0001", "BR0001",
                                    "BR0001", "BR0001", "BR0001",
                                    "BR0001", "BR0001"),
                         `CSDL` = c(12, 12, 12, 12, 12, 12, 12,
                                    12),
                         `PPSEN` = c(0.2, 0.2, 0.2, 0.2, 0.2, 0.2,
                                     0.2, 0.2),
                         `EM-FL` = c(99, 99, 99, 99, 99, 99, 99,
                                     99),
                         `FL-SH` = c(10, 10, 10, 10, 10, 10, 10,
                                     10),
                         `FL-SD` = c(18, 18, 18, 18, 18, 18, 18,
                                     18),
                         `SD-PM` = c(33, 33, 33, 33, 33, 33, 33,
                                     33),
                         `FL-LF` = c(25, 25, 25, 25, 25, 25, 25,
                                     25),
                         `LFMAX` = c(2.2, 2.2, 2.2, 2.2, 2.2, 2.2,
                                     2.2, 2.2),
                         `SLAVR` = c(225, 225, 225, 225, 225, 225,
                                     225, 225),
                         `SIZLF` = c(2, 2, 2, 2, 2, 2, 2, 2),
                         `XFRT` = c(0.01, 0.01, 0.01, 0.01, 0.01,
                                    0.01, 0.01, 0.01),
                         `WTPSD` = c(0.0017, 0.0017, 0.0017, 0.0017,
                                     0.0017, 0.0017, 0.0017, 0.0017
                         ),
                         `SFDUR` = c(18, 18, 18, 18, 18, 18, 18,
                                     18),
                         `SDPDV` = c(2.05, 2.05, 2.05, 2.05, 2.05,
                                     2.05, 2.05, 2.05),
                         `PODUR` = c(20, 20, 20, 20, 20, 20, 20,
                                     20),
                         `THRSH` = c(78, 78, 78, 78, 78, 78, 78,
                                     78),
                         `SDPRO` = c(0.398, 0.398, 0.398, 0.398,
                                     0.398, 0.398, 0.398, 0.398),
                         `SDLIP` = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                                     0.5, 0.5))

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
               info = "read_cul() BRGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BRGRO048.CUL")


# "read_cul() BSCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", P1 = "%6.0f", P2 = "%6.0f",
                       P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.1f",
                       PHINT = "%6.1f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/BSCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() BSCER048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("CR0001", "BU0003", "IH0001"
    ),
    `VRNAME` = c("SVRR1142E", "Emma", "BTS940"
    ),
    `EXPNO` = c(".", ".", "."),
    `ECO#` = c("IB0001", "IB0002", "IHSTUT"
    ),
    `P1` = c(940, 969, 760),
    `P2` = c(0, 0, 0),
    `P5` = c(700, 730, 700),
    `G2` = c(220, 160, 420),
    `G3` = c(37.5, 25.2, 27.5),
    `PHINT` = c(42, 43.4, 43))

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
               info = "read_cul() BSCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() BSCER048.CUL")


# "read_cul() CBGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.0f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CBGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CBGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "990003"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Tastie    4",
                                      "CG        4", "Kalorama  4"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "CB0401",
                                    "CB0402", "CB0403"),
                         `CSDL` = c(12.33, 12.33, 13.09, 13.09,
                                    13.09),
                         `PPSEN` = c(0, 0, 0, 0, 0),
                         `EM-FL` = c(25, 28, 26, 27, 26),
                         `FL-SH` = c(4, 6, 5, 6, 6),
                         `FL-SD` = c(11, 13, 11, 13, 16),
                         `SD-PM` = c(50, 60, 55, 55, 82),
                         `FL-LF` = c(40, 60, 42, 40, 20),
                         `LFMAX` = c(1, 1.1, 1.03, 1.03, 1.25),
                         `SLAVR` = c(210, 240, 220, 220, 80),
                         `SIZLF` = c(40, 60, 50, 50, 20),
                         `XFRT` = c(0.55, 0.8, 0.6, 0.75, 0.65),
                         `WTPSD` = c(0.19, 0.25, 0.25, 0.19, 0.19
                         ),
                         `SFDUR` = c(23, 23, 23, 23, 23),
                         `SDPDV` = c(2.2, 2.2, 2.2, 2.2, 2.2),
                         `PODUR` = c(10, 40, 40, 10, 40),
                         `THRSH` = c(10, 10, 10, 10, 10),
                         `SDPRO` = c(0.18, 0.18, 0.18, 0.18, 0.18
                         ),
                         `SDLIP` = c(0.02, 0.02, 0.02, 0.02, 0.02
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
               info = "read_cul() CBGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CBGRO048.CUL")


# "read_cul() CHGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.1f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CHGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CHGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "IB0001", "IB0002",
                                    "IB0003", "IB0004", "IB0005",
                                    "IB0006", "IB0007", "IB0008",
                                    "IB0009", "IB0010", "IB0012",
                                    "IB0013", "GF0005", "GF0105",
                                    "GF0205", "GF0305", "GF0405",
                                    "GF0505", "GF0006", "GF0106",
                                    "GF0206", "GF0306", "GF0406",
                                    "GF0506", "GF0007", "GF0107",
                                    "GF0207", "GF0307", "GF0407",
                                    "GF0507"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Kabuli Type",
                                      "Desi Type", "ANNIGERI v48cali",
                                      "K 850   v48calib", "G 130   v48calib",
                                      "JG 74  v48calib", "ICCV 88202 v48ca",
                                      "ICCC 42    v48ca", "ICCV 10    v48ca",
                                      "ICCV 2     v48ca", "ICCC 32    v48ca",
                                      "ICCC 37", "KAK-2", "JG 218",
                                      "JG11-baseline", "JG11-10%shortcyc",
                                      "JG11-10%longercy", "JG11-base+yield",
                                      "JG11-10%short+yi", "JG11-10%long+yie",
                                      "RSG888-baseline", "RSG888-10%shortc",
                                      "RSG888-10%longer", "RSG888-base+yiel",
                                      "RSG888-10%short+", "RSG888-10%long+y",
                                      "Vijay-baseline", "Vijay-10%shortcy",
                                      "Vijay-10%longerc", "Vijay-base+yield",
                                      "Vijay-10%short+y", "Vijay-10%long+yi"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", "b    .",
                                     ".", ".", ".", "lib  .", "lib  .",
                                     "lib  .", "lib  .", "lib  .",
                                     ".", ".", ".", ".", "le   .",
                                     "cle  .", ".", "eld  .", "ld   .",
                                     ".", "ycl  .", "cycl .", "d    .",
                                     "yiel .", "iel  .", ".", "cle  .",
                                     "ycle .", ".", "ield .", "eld  ."
                         ),
                         `ECO#` = c("DFAULT", "DFAULT", "KABULE",
                                    "DESI", "DESI", "DFAULT", "DFAULT",
                                    "DESI", "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "KABULE", "JG 218", "DESI", "DESI",
                                    "DESI", "DESI", "DESI", "DESI",
                                    "DESI", "DESI", "DESI", "DESI",
                                    "DESI", "DESI", "DESI", "DESI",
                                    "DESI", "DESI", "DESI", "DESI"
                         ),
                         `CSDL` = c(11, 11, 11, 11, 11, 11, 11,
                                    11, 11, 11, 11, 11, 11, 11, 11,
                                    11, 11, 11, 11, 11, 11, 11, 10.9,
                                    10.9, 10.9, 10.9, 10.9, 10.9,
                                    11, 11, 11, 11, 11, 11),
                         `PPSEN` = c(-0.143, -0.143, -0.143, -0.143,
                                     -0.143, -0.143, -0.143, -0.143,
                                     -0.143, -0.143, -0.143, -0.143,
                                     -0.143, -0.143, -0.143, -0.143,
                                     -0.43, -0.43, -0.43, -0.43,
                                     -0.43, -0.43, -0.32, -0.32,
                                     -0.32, -0.32, -0.32, -0.32,
                                     -0.22, -0.22, -0.22, -0.22,
                                     -0.22, -0.22),
                         `EM-FL` = c(28, 42, 30, 37, 32, 38.5,
                                     39, 41, 29, 35, 35, 26.5, 40,
                                     38.5, 40, 36, 36.5, 32.9, 40.2,
                                     36.5, 32.9, 40.2, 40.8, 35,
                                     47.4, 40.8, 35, 47.4, 37.2,
                                     33.2, 41.5, 37.2, 33.2, 41.5
                         ),
                         `FL-SH` = c(6, 11, 8, 8, 7.5, 9, 13.5,
                                     7.5, 5.5, 5, 5, 5, 5, 6, 10,
                                     9, 7, 6.3, 7.7, 7, 6.3, 7.7,
                                     8, 7.2, 8.8, 8, 7.2, 8.8, 9,
                                     8.1, 9.9, 9, 8.1, 9.9),
                         `FL-SD` = c(12.5, 16.5, 15, 15, 18.5,
                                     13.5, 22.5, 14.5, 9.5, 9, 10,
                                     9, 11.5, 11, 15, 12.5, 14.5,
                                     13.1, 16, 14.5, 13.1, 16, 13,
                                     11.7, 14.3, 13, 11.7, 14.3,
                                     13, 11.7, 14.3, 13, 11.7, 14.3
                         ),
                         `SD-PM` = c(26, 40, 35, 38, 31, 31, 28.5,
                                     27.5, 28.5, 29, 28, 27, 29,
                                     39, 35, 39, 35, 29.7, 41.5,
                                     35, 29.7, 41.5, 41, 30, 54,
                                     41, 30, 54, 48, 38, 58.2, 48,
                                     38, 58.2),
                         `FL-LF` = c(34, 44, 42, 42, 42, 38, 36,
                                     34, 38, 37, 36, 35, 37, 46,
                                     42, 47, 42, 35, 49, 42, 35,
                                     49, 48, 40, 60, 48, 40, 60,
                                     55, 45, 65, 55, 45, 65),
                         `LFMAX` = c(0.9, 1.7, 1, 1, 0.95, 1.02,
                                     1, 1.04, 1, 1, 1.01, 1.01, 0.98,
                                     1, 1, 1, 1, 1, 1, 1.1, 1.1,
                                     1.1, 1, 1, 1, 1.1, 1.1, 1.1,
                                     1, 1, 1, 1.1, 1.1, 1.1),
                         `SLAVR` = c(130, 220, 200, 200, 200, 200,
                                     200, 200, 200, 155, 200, 200,
                                     150, 160, 200, 200, 200, 200,
                                     200, 200, 200, 200, 200, 200,
                                     200, 200, 200, 200, 200, 200,
                                     200, 200, 200, 200),
                         `SIZLF` = c(10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10),
                         `XFRT` = c(0.94, 1, 0.96, 0.96, 0.95,
                                    0.96, 0.96, 0.95, 0.96, 0.96,
                                    0.96, 0.96, 0.96, 0.96, 0.96,
                                    0.96, 0.95, 0.95, 0.95, 1.05,
                                    1.05, 1.05, 0.91, 0.91, 0.91,
                                    1, 1, 1, 0.91, 0.91, 0.91, 1,
                                    1, 1),
                         `WTPSD` = c(0.15, 0.3, 0.181, 0.283, 0.23,
                                     0.34, 0.23, 0.225, 0.255, 0.32,
                                     0.23, 0.26, 0.32, 0.22, 0.181,
                                     0.18, 0.225, 0.225, 0.225, 0.225,
                                     0.225, 0.225, 0.18, 0.18, 0.18,
                                     0.18, 0.18, 0.18, 0.21, 0.21,
                                     0.21, 0.21, 0.21, 0.21),
                         `SFDUR` = c(22, 29, 29, 29, 22, 27, 28,
                                     22, 29, 29, 29, 29, 29, 28,
                                     29, 29, 20, 20, 20, 22, 22,
                                     22, 20, 20, 20, 22, 22, 22,
                                     29, 29, 29, 31.9, 31.9, 31.9
                         ),
                         `SDPDV` = c(1, 1.8, 1.2, 1, 1.2, 1, 1.2,
                                     1.6, 1.3, 1.2, 1.3, 1, 1.1,
                                     1.2, 1.2, 1.5, 1.2, 1.2, 1.2,
                                     1.2, 1.2, 1.2, 1.2, 1.2, 1.2,
                                     1.2, 1.2, 1.2, 1.2, 1.2, 1.2,
                                     1.2, 1.2, 1.2),
                         `PODUR` = c(15, 18, 18, 18, 17, 17, 19,
                                     18, 18, 17, 17, 16, 17, 18,
                                     18, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 18, 18, 18),
                         `THRSH` = c(80, 85, 85, 85, 82, 84, 84,
                                     77, 85, 85, 85, 85, 85, 85,
                                     85, 85, 85, 85, 85, 85, 85,
                                     85, 85, 85, 85, 85, 85, 85,
                                     85, 85, 85, 85, 85, 85),
                         `SDPRO` = c(0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216, 0.216, 0.216,
                                     0.216, 0.216),
                         `SDLIP` = c(0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048, 0.048, 0.048,
                                     0.048, 0.048))

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
               info = "read_cul() CHGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CHGRO048.CUL")


# "read_cul() CIGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.1f",
                       PPSEN = "%6.3f", "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.1f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.1f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CIGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CIGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "CI0001"
    ),
    `VAR-NAME` = c("MINIMA", "MAXIMA", "Geotype G8"
    ),
    `EXPNO` = c(".", ".", "."),
    `ECO#` = c("DFAULT", "DFAULT", "CI1111"
    ),
    `CSDL` = c(14.1, 14.1, 14.1),
    `PPSEN` = c(0.001, 0.001, 0.001),
    `EM-FL` = c(20, 30, 25),
    `FL-SH` = c(4, 7, 6),
    `FL-SD` = c(13, 17, 14.2),
    `SD-PM` = c(17, 20, 19.2),
    `FL-LF` = c(28, 32, 32),
    `LFMAX` = c(1.5, 1.55, 1.53),
    `SLAVR` = c(300, 375, 360),
    `SIZLF` = c(11, 17, 12.6),
    `XFRT` = c(0.94, 0.98, 0.97),
    `WTPSD` = c(0.001, 0.002, 0.001),
    `SFDUR` = c(17, 21, 18),
    `SDPDV` = c(2, 2.5, 2.2),
    `PODUR` = c(19, 25, 25),
    `THRSH` = c(30, 45, 33.6),
    `SDPRO` = c(0.21, 0.21, 0.21),
    `SDLIP` = c(0.3, 0.41, 0.41))

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
               info = "read_cul() CIGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CIGRO048.CUL")


# "read_cul() CNGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.0f", WTPSD = "%6.3f",
                       SFDUR = "%6.0f", SDPDV = "%6.0f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CNGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CNGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "000001",
                                    "OT0001", "CA0001"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "M GROUP  01",
                                      "KABEL (11)", "Invigor5440"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "CN0001",
                                    "CN0001", "CN0001"),
                         `CSDL` = c(14, 24, 24, 16, 16),
                         `PPSEN` = c(-0.006, -0.006, -0.03, -0.006,
                                     -0.011),
                         `EM-FL` = c(20, 45, 29, 45, 28.5),
                         `FL-SH` = c(10, 16, 15, 12.5, 13),
                         `FL-SD` = c(15, 35, 30.5, 18.5, 19),
                         `SD-PM` = c(20, 40, 25, 33.5, 26.5),
                         `FL-LF` = c(1, 10, 3, 1, 3),
                         `LFMAX` = c(1, 1, 1.03, 1, 1.28),
                         `SLAVR` = c(200, 275, 250, 230, 300),
                         `SIZLF` = c(90, 110, 100, 95, 100),
                         `XFRT` = c(1, 1, 1, 1, 1),
                         `WTPSD` = c(0.003, 0.003, 0.003, 0.003,
                                     0.003),
                         `SFDUR` = c(18, 22, 20, 20, 20),
                         `SDPDV` = c(15, 25, 22, 18, 22),
                         `PODUR` = c(8, 12, 10, 10, 10),
                         `THRSH` = c(81, 81, 81, 81, 81),
                         `SDPRO` = c(0.23, 0.23, 0.23, 0.23, 0.23
                         ),
                         `SDLIP` = c(0.48, 0.48, 0.48, 0.48, 0.48
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
               info = "read_cul() CNGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CNGRO048.CUL")


# "read_cul() COGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.2f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.0f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/COGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() COGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0001",
                                    "IB0002", "IB0003", "IB0004",
                                    "IB0006", "GA0001", "TX0003"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Deltapine 77",
                                      "Deltapine 458", "Delapine 555 (er",
                                      "Deltapine 555 BG", "Deltapine 1219",
                                      "Georgia King", "GP 3774 (RLD,LAI"
                         ),
                         `EXPNO` = c(".", ".", "2", "9", "ror) 1",
                                     "/RR  6", "1", "10", ")   1"
                         ),
                         `ECO#` = c("DFAULT", "DFAULT", "CO0001",
                                    "CO0003", "CO0005", "CO0005",
                                    "CO0006", "CO0005", "CO0021"),
                         `CSDL` = c(23, 23, 23, 23, 23, 23, 23,
                                    23, 23),
                         `PPSEN` = c(0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01),
                         `EM-FL` = c(34, 44, 34, 39, 40, 38, 48,
                                     44, 35),
                         `FL-SH` = c(8, 12, 8, 12, 12, 11, 4, 11,
                                     10),
                         `FL-SD` = c(15, 18, 15, 15, 17, 16, 8,
                                     16, 18),
                         `SD-PM` = c(40, 49, 49, 40, 45, 43, 40,
                                     38, 45),
                         `FL-LF` = c(65, 75, 75, 75, 75, 65, 50,
                                     75, 75),
                         `LFMAX` = c(1, 1.1, 1.1, 1.05, 1.1, 1.1,
                                     1.1, 1.05, 1.1),
                         `SLAVR` = c(170, 175, 170, 170, 170, 170,
                                     170, 170, 175),
                         `SIZLF` = c(250, 300, 280, 300, 300, 300,
                                     300, 300, 250),
                         `XFRT` = c(0.55, 0.8, 0.8, 0.72, 0.64,
                                    0.76, 0.8, 0.61, 0.55),
                         `WTPSD` = c(0.18, 0.18, 0.18, 0.18, 0.18,
                                     0.18, 0.18, 0.18, 0.18),
                         `SFDUR` = c(24, 35, 35, 34, 35, 35, 35,
                                     35, 24),
                         `SDPDV` = c(20, 27, 27, 27, 27, 27, 27,
                                     27, 20),
                         `PODUR` = c(8, 14, 8, 14, 12, 12, 12,
                                     12, 8),
                         `THRSH` = c(70, 72, 70, 70, 72, 70, 70,
                                     70, 70),
                         `SDPRO` = c(0.153, 0.153, 0.153, 0.153,
                                     0.153, 0.153, 0.153, 0.153,
                                     0.153),
                         `SDLIP` = c(0.12, 0.12, 0.12, 0.12, 0.12,
                                     0.12, 0.12, 0.12, 0.12))

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
               info = "read_cul() COGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() COGRO048.CUL")


# "read_cul() CPGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.1f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.1f", SDPDV = "%6.1f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.1f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CPGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CPGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "CP0001",
                                    "CP0003", "CP0004", "CP0005",
                                    "CP0006", "CP0012", "CP0014",
                                    "II0001", "II0002", "II0003",
                                    "II0004", "II0014"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "CAL # 5  MG4",
                                      "TVU3046 - India", "UCR 368 - Kenya",
                                      "TVU3644 - Nigeri", "VERDE BRASIL",
                                      "277", "349", "Kanannado",
                                      "IT86D-719", "IT90K-277-2",
                                      "IT96D-748", "349*"),
                         `EXPNO` = c(".", ".", "1,2", "1,1", "1,1",
                                     "a  1,1", ".", ".", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "CP0409",
                                    "CP0411", "CP0412", "CP0413",
                                    "CP0410", "CP0414", "CP0414",
                                    "CP0414", "CP0414", "CP0414",
                                    "CP0414", "CP0414"),
                         `CSDL` = c(12.5, 13.1, 12.8, 12.8, 12.8,
                                    12.8, 12.8, 12.8, 12.8, 12.5,
                                    12.8, 12.8, 12.8, 12.8),
                         `PPSEN` = c(0.02, 0.3, 0.2646, 0.1096,
                                     0.0545, 0.1576, 0.294, 0.294,
                                     0.294, 0.3, 0.294, 0.294, 0.294,
                                     0.294),
                         `EM-FL` = c(22, 38, 23.46, 25.6, 25.6,
                                     37, 33.2, 28.57, 34.14, 40,
                                     30.5, 34.14, 34.14, 34.14),
                         `FL-SH` = c(2.5, 3.6, 3.8, 3, 2.5, 2.5,
                                     3.5, 3, 3, 3, 2.5, 3, 3, 3),
                         `FL-SD` = c(5, 8, 6, 6, 5, 6, 7.2, 6,
                                     6, 6, 6, 6, 6, 6),
                         `SD-PM` = c(23, 48, 24.85, 32, 48, 22,
                                     31, 11.52, 13.17, 25, 18, 20,
                                     20, 20),
                         `FL-LF` = c(34, 44, 7, 9, 16, 15, 17,
                                     18, 18, 18, 5, 18, 18, 18),
                         `LFMAX` = c(0.9, 1.1, 1, 0.9, 0.9, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1),
                         `SLAVR` = c(200, 260, 250, 250, 250, 200,
                                     260, 325, 325, 325, 275, 325,
                                     325, 325),
                         `SIZLF` = c(170, 260, 260, 220, 240, 170,
                                     270, 133, 133, 150, 150, 150,
                                     150, 150),
                         `XFRT` = c(0.5, 1, 1, 0.84, 0.82, 0.52,
                                    0.85, 1, 1, 0.5, 1, 0.9, 0.9,
                                    0.9),
                         `WTPSD` = c(0.05, 0.65, 0.14, 0.0405,
                                     0.0775, 0.042, 0.22, 0.6, 0.65,
                                     0.6, 0.24, 0.6, 0.6, 0.6),
                         `SFDUR` = c(5.5, 8.5, 8.5, 7, 8, 5.5,
                                     7, 14.4, 21.9, 8, 7, 8, 8, 8
                         ),
                         `SDPDV` = c(6, 15, 6.4, 9.7, 10.3, 15,
                                     6.4, 3.5, 5.2, 3.5, 5.2, 3.5,
                                     3.5, 3.5),
                         `PODUR` = c(13, 30, 16, 20, 31, 14, 32,
                                     3.5, 6, 16, 14, 16, 16, 16),
                         `THRSH` = c(74, 83, 83, 74.9, 77.7, 74.6,
                                     66.5, 82, 82, 82, 82, 82, 82,
                                     82),
                         `SDPRO` = c(0.3, 0.3, 0.3, 0.3, 0.3, 0.3,
                                     0.3, 0.3, 0.3, 0.3, 0.3, 0.3,
                                     0.3, 0.3),
                         `SDLIP` = c(0.065, 0.065, 0.065, 0.065,
                                     0.065, 0.065, 0.065, 0.065,
                                     0.065, 0.065, 0.065, 0.065,
                                     0.065, 0.065))

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
               info = "read_cul() CPGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CPGRO048.CUL")


# "read_cul() CSCAS048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", PPS1 = "%6.0f",
                       B01ND = "%6.0f", B12ND = "%6.0f", B23ND = "%6.0f",
                       B34ND = "%6.0f", B45ND = "%6.0f", B56ND = "%6.0f",
                       "SR#WT" = "%6.2f", SRFR = "%6.2f", HMPC = "%6.0f",
                       PHINT = "%6.0f", LA1S = "%6.0f", LAXS = "%6.0f",
                       LAXND = "%6.0f", LAXN2 = "%6.0f", LAFS = "%6.0f",
                       LAFND = "%6.0f", SLAS = "%6.0f", LLIFA = "%6.0f",
                       LPEFR = "%6.2f", STFR = "%6.2f")

  `tier_info_expected` = list(c("VAR#", "VAR-NAME", "EXP#",
                                "ECO#", "PPS1", "B01ND", "B12ND",
                                "B23ND", "B34ND", "B45ND", "B56ND",
                                "SR#WT", "SRFR", "HMPC", "PHINT",
                                "LA1S", "LAXS", "LAXND", "LAXN2",
                                "LAFS", "LAFND", "SLAS", "LLIFA",
                                "LPEFR", "STFR"))

  rds_file <- system.file("tinytest/test_data/CUL/CSCAS048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CSCAS048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "UC0002", "UC0004", "UC0006",
                                    "UC0007", "UC0008", "UC0009",
                                    "TH0001", "TH0002", "TH0003",
                                    "TH0004", "TH0005", "TH0006",
                                    "TH0002", "TH0003", "TH0004",
                                    "TH0005", "TH0006", "TH0007",
                                    "TH0009", "TH0051", "TH0052",
                                    "TH0053"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                        "MCol-22", "MMEX-59", "MCol-1684",
                                        "MVen-77", "MPtr-26", "MCol-638",
                                        "Rayong1 (RY1)", "Rayong90 (RY90)",
                                        "Rayong5 (RY5)", "KU50 (KU50)",
                                        "Rayong3 (RY3)", "Rayong72 (RY72)",
                                        "Rayong90 (RY90)", "Rayong5 (RY5)",
                                        "KU50 (KU50)", "Rayong3 (RY3)",
                                        "Rayong3 (RY3)", "RY11(try)",
                                        "RY9 (try)", "RY72", "RY72",
                                        "RY72"),
                         `EXP#` = c(".", ".", ".", ".", ".", ".",
                                    ".", ".", ".", ".", ".", ".",
                                    ".", ".", ".", ".", ".", ".",
                                    ".", ".", ".", ".", ".", ".",
                                    "."),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "990001", "990001", "990001",
                                    "990001", "990003", "990001",
                                    "990001", "990001", "990001",
                                    "990001", "990001", "990001",
                                    "990001", "990001", "990001",
                                    "990001", "990001", "990001",
                                    "990001", "990001", "990001",
                                    "990001"),
                         `PPS1` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                    0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                    0L, 0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                    0L, 0L),
                         `B01ND` = c(25, 35, 10, 25, 25, 25, 35,
                                     35, 35, 35, 25, 25, 25, 35,
                                     35, 25, 25, 25, 35, 35, 35,
                                     35, 35, 35, 35),
                         `B12ND` = c(25, 35, 20, 25, 25, 25, 35,
                                     35, 35, 35, 25, 25, 25, 35,
                                     35, 25, 25, 25, 35, 35, 35,
                                     35, 35, 35, 35),
                         `B23ND` = c(25, 35, 20, 25, 25, 25, 35,
                                     35, 35, 35, 25, 25, 25, 35,
                                     35, 25, 25, 25, 35, 35, 35,
                                     35, 35, 35, 35),
                         `B34ND` = c(25, 300, 30, 255, 255, 255,
                                     35, 35, 35, 35, 255, 255, 255,
                                     35, 35, 255, 255, 255, 35, 35,
                                     35, 35, 35, 35, 35),
                         `B45ND` = c(25, 35, 200, 25, 25, 25, 35,
                                     35, 35, 35, 25, 25, 25, 35,
                                     35, 25, 25, 25, 35, 35, 35,
                                     35, 35, 35, 35),
                         `B56ND` = c(25, 35, 200, 25, 25, 25, 35,
                                     35, 35, 35, 25, 25, 25, 35,
                                     35, 25, 25, 25, 35, 35, 35,
                                     35, 35, 35, 35),
                         `SR#WT` = c(0.2, 0.35, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25,
                                     0.25, 0.25, 0.25, 0.25, 0.25
                         ),
                         `SRFR` = c(0, 0.35, 0.3, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0),
                         `HMPC` = c(40L, 80L, 50L, 50L, 50L, 50L,
                                    50L, 50L, 50L, 50L, 50L, 50L,
                                    50L, 50L, 50L, 50L, 50L, 50L,
                                    50L, 50L, 50L, 50L, 50L, 50L,
                                    50L),
                         `PHINT` = c(15L, 30L, 24L, 17L, 17L, 17L,
                                     17L, 17L, 17L, 17L, 17L, 17L,
                                     17L, 17L, 17L, 17L, 17L, 17L,
                                     17L, 17L, 17L, 17L, 17L, 17L,
                                     17L),
                         `LA1S` = c(200L, 400L, 300L, 50L, 50L,
                                    50L, 50L, 50L, 50L, 50L, 400L,
                                    50L, 50L, 30L, 50L, 400L, 50L,
                                    50L, 30L, 30L, 30L, 30L, 30L,
                                    30L, 30L),
                         `LAXS` = c(1000L, 2000L, 1900L, 120L,
                                    120L, 200L, 400L, 400L, 400L,
                                    400L, 120L, 200L, 300L, 200L,
                                    400L, 120L, 200L, 300L, 200L,
                                    200L, 200L, 200L, 200L, 200L,
                                    200L),
                         `LAXND` = c(80L, 200L, 100L, 60L, 60L,
                                     60L, 60L, 60L, 60L, 60L, 60L,
                                     60L, 60L, 60L, 60L, 60L, 60L,
                                     60L, 60L, 60L, 60L, 60L, 60L,
                                     60L, 60L),
                         `LAXN2` = c(80L, 200L, 100L, 80L, 80L,
                                     80L, 80L, 80L, 80L, 80L, 80L,
                                     80L, 80L, 80L, 80L, 80L, 80L,
                                     80L, 80L, 80L, 80L, 80L, 80L,
                                     80L, 80L),
                         `LAFS` = c(20L, 50L, 30L, 70L, 70L, 50L,
                                    70L, 70L, 70L, 70L, 70L, 50L,
                                    100L, 70L, 70L, 70L, 50L, 100L,
                                    70L, 70L, 70L, 70L, 70L, 70L,
                                    70L),
                         `LAFND` = c(100L, 350L, 150L, 150L, 150L,
                                     150L, 150L, 150L, 150L, 150L,
                                     150L, 150L, 150L, 150L, 150L,
                                     150L, 150L, 150L, 150L, 150L,
                                     150L, 150L, 150L, 150L, 150L
                         ),
                         `SLAS` = c(100L, 400L, 200L, 180L, 180L,
                                    180L, 180L, 180L, 180L, 180L,
                                    180L, 180L, 180L, 180L, 180L,
                                    180L, 180L, 180L, 180L, 180L,
                                    180L, 180L, 180L, 180L, 180L),
                         `LLIFA` = c(300L, 1200L, 800L, 900L, 900L,
                                     600L, 800L, 800L, 800L, 800L,
                                     900L, 600L, 900L, 800L, 800L,
                                     900L, 600L, 900L, 800L, 800L,
                                     800L, 600L, 800L, 800L, 800L
                         ),
                         `LPEFR` = c(0.2, 0.4, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33
                         ),
                         `STFR` = c(0.25, 0.45, 0.35, 0.35, 0.35,
                                    0.45, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.45, 0.45, 0.35, 0.35,
                                    0.35, 0.45, 0.45, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35))

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
               info = "read_cul() CSCAS048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CSCAS048.CUL")


# "read_cul() CSYCA048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", B01ND = "%6.1f",
                       B12ND = "%6.1f", B23ND = "%6.1f", B34ND = "%6.0f",
                       BR1FX = "%6.1f", BR2FX = "%6.1f", BR3FX = "%6.1f",
                       BR4FX = "%6.1f", LAXS = "%6.0f", SLAS = "%6.0f",
                       LLIFA = "%6.0f", LPEFR = "%6.2f", LNSLP = "%6.1f",
                       NODWT = "%6.2f", NODLT = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/CSYCA048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() CSYCA048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "UC0002", "UC0003", "UC0004",
                                    "UC0005", "UC0006", "UC0007",
                                    "UC0008", "UC0009", "UC0010",
                                    "UC0011", "UC0012", "UC0013",
                                    "UC0014", "UC0015", "UC0016",
                                    "UC0017", "UC0018", "UC0019"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                        "MCol-22", "CMC 40", "MMEX-59",
                                        "Ceiba", "MCol-1684", "MVen-77",
                                        "MPtr-26", "MCol-638", "TMS 30572",
                                        "MCol-113", "CM 523-7", "MCol-72",
                                        "CM 507-37", "MMex-11", "MCol-113 3Br",
                                        "MCol-113 2Br", "MCol-113 1Br",
                                        "MCol-113 1-4Br"),
                         `EXP#` = c(".", ".", ".", ".", ".", ".",
                                    ".", ".", ".", ".", ".", ".",
                                    ".", ".", ".", ".", ".", ".",
                                    ".", ".", "."),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "990002", "990014", "990001",
                                    "990013", "990003", "990005",
                                    "990004", "990006", "990015",
                                    "990008", "990007", "990002",
                                    "990007", "990002", "990009",
                                    "990010", "990011", "990012"),
                         `B01ND` = c(100, 1800, 200, 252.2, 680,
                                     200, 350, 150, 450, 500, 700,
                                     350, 300, 696, 1500, 750, 696,
                                     300, 300, 300, 300),
                         `B12ND` = c(100, 1800, 250, 232.6, 300,
                                     150, 350, 200, 150, 200, 450,
                                     120, 380, 1206, 700, 500, 1206,
                                     380, 380, 260, 380),
                         `B23ND` = c(100, 1800, 250, 200.6, 300,
                                     150, 350, 200, 150, 200, 450,
                                     120, 380, 1206, 700, 500, 1206,
                                     380, 380, 260, 380),
                         `B34ND` = c(100, 1800, 250, 214, 300,
                                     150, 350, 200, 200, 200, 450,
                                     120, 380, 1206, 700, 500, 1206,
                                     380, 380, 260, 380),
                         `BR1FX` = c(1, 4, 2.2, 2.4, 3, 2, 3.1,
                                     2.2, 3.1, 3, 3, 3, 4, 3.1, 3,
                                     3.1, 3, 3, 2, 1, 1),
                         `BR2FX` = c(1, 4, 2.7, 2.9, 2, 2.5, 2.7,
                                     3, 2.7, 2.6, 3, 3, 4, 2.7, 2,
                                     2.7, 2, 3, 2, 1, 1),
                         `BR3FX` = c(1, 4, 2, 2.2, 2, 2.3, 2.7,
                                     2, 2, 1.5, 3, 2.5, 4, 2.7, 2,
                                     2.7, 2, 3, 2, 1, 4),
                         `BR4FX` = c(1, 4, 1.5, 1.6, 2, 1.6, 2.7,
                                     1.2, 1.5, 1.5, 3, 1.5, 4, 2.7,
                                     2, 2.7, 2, 3, 2, 1, 4),
                         `LAXS` = c(300L, 900L, 350L, 325L, 320L,
                                    650L, 650L, 300L, 700L, 700L,
                                    900L, 600L, 430L, 400L, 430L,
                                    600L, 600L, 430L, 430L, 430L,
                                    430L),
                         `SLAS` = c(150L, 280L, 220L, 277L, 200L,
                                    180L, 200L, 220L, 200L, 180L,
                                    180L, 180L, 200L, 253L, 200L,
                                    220L, 220L, 200L, 200L, 200L,
                                    200L),
                         `LLIFA` = c(600L, 1800L, 1000L, 720L,
                                     600L, 900L, 800L, 800L, 1200L,
                                     1019L, 1060L, 1200L, 957L, 1000L,
                                     957L, 600L, 700L, 957L, 957L,
                                     957L, 957L),
                         `LPEFR` = c(0.2, 0.35, 0.33, 0.2, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33),
                         `LNSLP` = c(0.7, 1.8, 1.2, 1.2, 1.6, 1.1,
                                     1.1, 1.1, 1.4, 1.6, 1.1, 1.1,
                                     1.2, 1.8, 1.4, 1.8, 0.8, 1.2,
                                     1.2, 1.2, 1.2),
                         `NODWT` = c(3, 15, 4, 3.04, 8, 6, 6, 3,
                                     10, 8, 8, 8, 6.3, 5, 6.3, 5,
                                     5.6, 6.3, 6.3, 6.3, 6.3),
                         `NODLT` = c(1, 4, 2, 2, 2, 2, 2, 2, 2,
                                     2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                                     2, 2))

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
               info = "read_cul() CSYCA048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() CSYCA048.CUL")


# "read_cul() FBGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.1f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.0f", WTPSD = "%6.1f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/FBGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() FBGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "CORD01",
                                    "CORD02"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "ALAME LD170 1.2g",
                                      "BROCA LD170 1.2G"),
                         `EXPNO` = c(".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "FABLON",
                                    "FABLN2"),
                         `CSDL` = c(24, 24, 24, 24),
                         `PPSEN` = c(-0.031, -0.031, -0.031, -0.031
                         ),
                         `EM-FL` = c(16, 22, 18, 18),
                         `FL-SH` = c(9, 12, 10.9, 10.5),
                         `FL-SD` = c(20, 28, 24, 23.5),
                         `SD-PM` = c(28, 36, 34.5, 32.8),
                         `FL-LF` = c(45, 45, 45, 45),
                         `LFMAX` = c(0.9, 1.1, 1, 1),
                         `SLAVR` = c(260, 340, 285, 300),
                         `SIZLF` = c(100, 150, 110, 110),
                         `XFRT` = c(1, 1, 1, 1),
                         `WTPSD` = c(0.9, 1.3, 1.1, 1.1),
                         `SFDUR` = c(21, 21, 21, 21),
                         `SDPDV` = c(2.4, 2.4, 2.4, 2.4),
                         `PODUR` = c(18, 18, 18, 18),
                         `THRSH` = c(77, 77, 77, 77),
                         `SDPRO` = c(0.315, 0.315, 0.315, 0.315
                         ),
                         `SDLIP` = c(0.02, 0.02, 0.02, 0.02))

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
               info = "read_cul() FBGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() FBGRO048.CUL")


# "read_cul() G0GRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.1f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/G0GRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() G0GRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "UF0001"
    ),
    `VRNAME` = c("MINIMA", "MAXIMA", "PENSACOLA BAHIA"
    ),
    `EXPNO` = c(".", ".", ""),
    `ECO#` = c("DFAULT", "DFAULT", "G00001"
    ),
    `CSDL` = c(12, 12, 12),
    `PPSEN` = c(0.2, 0.2, 0.2),
    `EM-FL` = c(99, 99, 99),
    `FL-SH` = c(10, 10, 10),
    `FL-SD` = c(18, 18, 18),
    `SD-PM` = c(33, 33, 33),
    `FL-LF` = c(25, 25, 25),
    `LFMAX` = c(1.44, 1.44, 1.44),
    `SLAVR` = c(285, 285, 285),
    `SIZLF` = c(2, 2, 2),
    `XFRT` = c(0.01, 0.01, 0.01),
    `WTPSD` = c(0.02, 0.02, 0.02),
    `SFDUR` = c(15, 15, 15),
    `SDPDV` = c(2.05, 2.05, 2.05),
    `PODUR` = c(20, 20, 20))

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
               info = "read_cul() G0GRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() G0GRO048.CUL")


# "read_cul() GBGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/GBGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() GBGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "GB0001"
    ),
    `VRNAME` = c("MINIMA", "MAXIMA", "Bronco Habit 1"
    ),
    `EXPNO` = c(".", ".", "."),
    `ECO#` = c("DFAULT", "DFAULT", "SNAPBN"
    ),
    `CSDL` = c(11.78, 14.6, 12.17),
    `PPSEN` = c(0, 0.385, 0),
    `EM-FL` = c(9, 28.9, 21),
    `FL-SH` = c(2.8, 10, 2.8),
    `FL-SD` = c(11, 15, 12),
    `SD-PM` = c(12, 16, 15),
    `FL-LF` = c(18, 18, 12),
    `LFMAX` = c(0.85, 1.2, 1),
    `SLAVR` = c(220, 300, 250),
    `SIZLF` = c(124, 140, 133),
    `XFRT` = c(1, 1, 0.97),
    `WTPSD` = c(0.25, 0.34, 0.29),
    `SFDUR` = c(12, 16, 14),
    `SDPDV` = c(4, 6, 5.4),
    `PODUR` = c(6, 10, 6),
    `THRSH` = c(77, 77, 77),
    `SDPRO` = c(0.255, 0.255, 0.255),
    `SDLIP` = c(0.03, 0.03, 0.03))

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
               info = "read_cul() GBGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() GBGRO048.CUL")


# "read_cul() GGFRM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.1f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/GGFRM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() GGFRM048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("SP0009", "SP0009"),
                         `VRNAME` = c("Mombaca", "Tanzania"),
                         `EXPNO` = c("", ""),
                         `ECO#` = c("GG0009", "GG0009"),
                         `CSDL` = c(12, 12),
                         `PPSEN` = c(0.2, 0.2),
                         `EM-FL` = c(99, 99),
                         `FL-SH` = c(10, 10),
                         `FL-SD` = c(18, 18),
                         `SD-PM` = c(33, 33),
                         `FL-LF` = c(25, 25),
                         `LFMAX` = c(1.91, 1.91),
                         `SLAVR` = c(180, 180),
                         `SIZLF` = c(2, 2),
                         `XFRT` = c(0.01, 0.01),
                         `WTPSD` = c(0.02, 0.02),
                         `SFDUR` = c(15, 15),
                         `SDPDV` = c(2.05, 2.05),
                         `PODUR` = c(20, 20),
                         `THRSH` = c(78, 78),
                         `SDPRO` = c(0.115, 0.115),
                         `SDLIP` = c(0.035, 0.035))

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
               info = "read_cul() GGFRM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() GGFRM048.CUL")


# "read_cul() MLCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P2O = "%6.1f", P2R = "%6.1f", P5 = "%6.0f",
                       G1 = "%6.2f", G4 = "%6.2f", PHINT = "%6.0f",
                       GT = "%6.1f", G5 = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/MLCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() MLCER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "990003", "IB0033",
                                    "IB0034", "IB0035", "IB0036",
                                    "IB0037", "IB0038", "IB0039",
                                    "IB0040", "IB0041", "IB0042",
                                    "IB0043", "IB0044", "IB0045",
                                    "IB0046", "IB0047", "IB0048",
                                    "IB0049", "IB0050", "IB0149",
                                    "IM0015", "IM0016", "IB0052",
                                    "IB0054", "IB0051", "IB0053",
                                    "IB0072", "IB0060", "IB0061",
                                    "IB0062", "IB0063", "IB0064",
                                    "IB0065", "IB0066", "IB0067",
                                    "IB0068", "IB0069", "IB0070",
                                    "IB0071", "IB0073", "IB0074",
                                    "IB0075", "IB0076", "IB0077",
                                    "IB0078", "IB0079", "IB0080",
                                    "IB0082", "IB0083", "IB0045",
                                    "IB0046", "IB0047", "IB0048",
                                    "IB0049", "IB0050", "IB0087",
                                    "IB0088", "IB0089"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "NORTH VARIETY",
                                        "MIDDLE VARIETY", "SOUTH VARIETY",
                                        "BJ104", "CZH-859", "CZP-87",
                                        "CZMP-2", "MBH-110", "RCB-2",
                                        "CZP-78", "CZP-85", "WCC-75",
                                        "CZP-84", "CZH-83-J1", "CIVT",
                                        "59022A X 89-083", "1011A X 086R",
                                        "1361M X 6Rm", "Heini Kirey",
                                        "Zatib", "3/4HK", "Sadore-Local",
                                        "SaniobaB", "SaniobaB", "PUSA 23",
                                        "GHB 558", "ICMH356-baseline",
                                        "Sharda-baseline", "CIVT-baseline",
                                        "ICTP 8203", "ICMV 221",
                                        "ERajPop", "NokhaLocal",
                                        "WRajPop", "RCBIC 911", "CZIC 922",
                                        "Landrace", "Non-landrace",
                                        "WCC-75", "BK 560", "ICMH 451",
                                        "81A X Souna B", "841A X J104",
                                        "Heini Kirey", "Zatib", "3/4HK",
                                        "59022A X 89-083", "1011A X 086R",
                                        "1361M X 6Rm", "BJ104", "ICMVIS 89305",
                                        "59022A X 89-083", "1011A X 086R",
                                        "1361M X 6Rm", "Heini Kirey",
                                        "Zatib", "3/4HK", "BJ104",
                                        "81A X Souna B", "841A X J104"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0201", "IB0001",
                                    "IB0201", "IB0201", "IB0201",
                                    "IB0201", "IB0201", "IB0201",
                                    "IB0201", "IB0201", "IB0001",
                                    "IB0001", "IB0201", "IB0301",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0201", "IB0301"),
                         `P1` = c(100, 400, 120, 140, 180, 120,
                                  170, 136, 135, 140, 136, 136, 142,
                                  160, 138, 136, 100, 100, 100, 100,
                                  396, 309, 270, 170, 413, 413, 120,
                                  145, 120, 120, 365, 120, 120, 110,
                                  110, 110, 120, 110, 110, 120, 120,
                                  100, 120, 120, 120, 396, 340, 270,
                                  100, 100, 100, 120, 365, 100, 100,
                                  100, 396, 309, 270, 120, 120, 120
                         ),
                         `P2O` = c(10, 15, 12, 12, 12, 13.4, 12.1,
                                   12.4, 12.6, 12.5, 12.1, 12.1,
                                   12.3, 12, 12.2, 12.6, 12, 12,
                                   12, 12, 12, 12, 12, 12, 12.8,
                                   12.8, 12.9, 12.7, 12.7, 12, 12,
                                   12.8, 12, 13.9, 13.9, 13.9, 13.4,
                                   13.4, 13.4, 12.2, 13.5, 13.4,
                                   12, 13.4, 13.2, 12, 12, 12, 12.5,
                                   12.5, 12.5, 13.4, 12, 12, 12,
                                   12, 12, 12, 12, 13.4, 13.4, 13.2
                         ),
                         `P2R` = c(50, 900, 125, 150, 150, 145,
                                   138, 130, 140, 148, 135, 125,
                                   130, 142, 128, 130, 142, 18, 35,
                                   55, 470, 410, 390, 150, 999.9,
                                   999.9, 110, 15, 86, 15, 260, 10,
                                   125, 440, 440, 440, 15, 15, 15,
                                   15, 142, 15, 110, 95, 100, 410,
                                   260, 390, 3, 3, 8, 145, 210, 18,
                                   35, 55, 470, 410, 390, 145, 95,
                                   100),
                         `P5` = c(100, 700, 360, 500, 600, 340,
                                  420, 370, 370, 365, 365, 362, 380,
                                  422, 360, 300, 390, 200, 120, 105,
                                  140, 108, 108, 450, 640, 640, 350,
                                  360, 340, 360, 285, 310, 360, 230,
                                  230, 390, 340, 360, 250, 300, 230,
                                  230, 360, 265, 250, 285, 285, 108,
                                  280, 280, 330, 340, 285, 200, 120,
                                  105, 140, 108, 108, 340, 265, 250
                         ),
                         `G1` = c(0.1, 3, 2, 2, 2, 0.6, 2.13, 2.1,
                                  2, 2.12, 2.14, 2, 2.15, 2.1, 2.3,
                                  2.3, 0.6, 0, 0, 0, 0.5, 0.5, 0.5,
                                  1, 3, 3, 1, 1, 1, 1, 0.6, 0.9,
                                  0.5, 0.7, 0.7, 0.7, 0.7, 0.7, 0.7,
                                  0.7, 0.7, 0.7, 0.9, 0.8, 0.7, 0.6,
                                  0.45, 0.4, 0.9, 0.9, 0.4, 0.6,
                                  0.6, 0, 0, 0, 0.5, 0.5, 0.5, 0.5,
                                  0.5, 0.5),
                         `G4` = c(0.5, 20, 0.5, 0.5, 0.5, 1, 0.5,
                                  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                                  0.5, 0.5, 0.6, 19, 17, 11, 11.8,
                                  13, 18, 0.55, 6.5, 6.5, 0.7, 1,
                                  1, 1, 0.73, 0.9, 0.57, 0.9, 0.78,
                                  0.63, 1, 0.69, 0.83, 1, 1, 1, 0.8,
                                  1.05, 1, 0.8, 0.9, 18, 1, 0.9,
                                  0.53, 1, 1, 19, 17, 11, 11.8, 13,
                                  18, 1, 1.6, 1),
                         `PHINT` = c(43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 65, 65, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43, 43,
                                     43, 43, 43, 43, 43, 43),
                         `GT` = c(1, 1.5, 1, 1, 1, 1.5, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1, 1, 1.2, 1, 1,
                                  1, 1, 1, 1, 1, 1, 1, 1.5, 1.5,
                                  1.5, 1.5, 1.2, 1.2, 1.2, 1, 1,
                                  1, 1, 1, 1, 1, 1, 1.2, 1.5, 1.5,
                                  1.5, 1.2, 1, 1, 1, 1, 1, 1.5, 1.2,
                                  1, 1, 1, 1, 1, 1, 1.5, 1.5, 1.5
                         ),
                         `G5` = c(10, 11, 11, 11, 11, 10, 11, 11,
                                  11, 11, 11, 11, 11, 11, 11, 11,
                                  11, 11, 11, 11, 11, 11, 11, 11,
                                  11, 11, 11, 11, 11, 11, 11, 11,
                                  11, 11, 11, 11, 11, 11, 11, 11,
                                  11, 11, 11, 11, 11, 11, 11, 11,
                                  11, 11, 11, 10, 11, 11, 11, 11,
                                  11, 11, 11, 10, 11, 11))

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
               info = "read_cul() MLCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() MLCER048.CUL")


# "read_cul() MZCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.3f",
                       P5 = "%6.1f", G2 = "%6.1f", G3 = "%6.2f",
                       PHINT = "%6.2f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/MZCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() MZCER048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "PC0001",
                                    "PC0002", "PC0003", "PC0004",
                                    "PC0005", "990001", "990002",
                                    "990003", "990004", "IB0001",
                                    "IB0002", "IB0003", "IB0004",
                                    "IB0005", "IB0006", "IB0007",
                                    "IB0008", "IB0009", "IB0010",
                                    "IB0011", "IB0012", "IB0013",
                                    "IB0014", "IB0015", "IB0016",
                                    "IB0017", "IB0018", "IB0019",
                                    "IB0020", "IB0021", "IB0022",
                                    "IB0023", "IB0024", "IB0025",
                                    "IB0026", "IB0027", "IB0028",
                                    "IB0029", "IB0030", "IB0031",
                                    "IB0032", "IB0033", "IB0034",
                                    "IB0035", "IB0036", "IB0037",
                                    "IB0038", "IB0039", "IB0040",
                                    "IB0041", "IB0042", "IB0043",
                                    "IB0044", "IB0045", "IB0046",
                                    "IB0047", "IB0048", "IB0049",
                                    "IB0050", "IB0051", "IB0052",
                                    "IB0053", "IB0054", "IB0055",
                                    "IB0056", "IB0057", "IB0058",
                                    "IB0059", "IB0060", "IB0061",
                                    "IB0062", "IB0063", "IB0064",
                                    "IB0065", "IB0066", "IB0067",
                                    "IB0068", "IB0168", "IB0069",
                                    "IB0070", "IB0071", "IB0089",
                                    "IB0090", "IB0091", "IB0092",
                                    "IB0093", "IB0099", "IB0100",
                                    "IB1051", "IB1052", "IB1053",
                                    "IB0154", "IB0155", "IB0171",
                                    "IB0172", "IB0173", "IB0174",
                                    "IB0185", "IB1065", "IB1066",
                                    "IB1067", "IB1069", "IB1072",
                                    "IB1068", "IB1168", "LL0499",
                                    "LL0564", "LL0581", "LL0599",
                                    "LL0542", "LL0661", "LL0674",
                                    "ZA0001", "ZA0002", "IF0001",
                                    "IF0002", "IF0003", "IF0004",
                                    "IF0005", "IF0006", "IF0007",
                                    "IF0008", "IF0009", "IF0010",
                                    "IF0011", "AC0001", "VI0001",
                                    "IM0001", "IM0002", "IM0003",
                                    "IF0018", "IF0019", "IF0020",
                                    "IF0021", "IF0022", "IB0067",
                                    "KA0001", "EM0001", "KY0001",
                                    "KY0002", "KY0003", "KY0004",
                                    "KY0005", "KY0006", "KY0007",
                                    "KY0008", "KY0009", "KY0010",
                                    "KY0011", "KY0012", "KY0013",
                                    "KY0014", "KY0015", "KY0016",
                                    "KY0017", "KY0018", "GH0010",
                                    "GF0001", "GF0101", "GF0201",
                                    "GF0301", "GF0401", "GF0501",
                                    "CYMA01", "EBSL06", "IB0200"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "2500-2600 GDD",
                                      "2600-2650 GDD", "2650-2700 GDD",
                                      "2700-2750 GDD", "2750-2800 GDD",
                                      "LONG SEASON", "MEDIUM SEASON",
                                      "SHORT SEASON", "V.SHORT SEASON",
                                      "CORNL281", "CP170", "LG11",
                                      "F7 X F2", "PIO 3995", "INRA",
                                      "EDO", "A654 X F2", "DEKALB XL71",
                                      "F478 X W705A", "DEKALBXL45",
                                      "PIO 3382", "B59*OH43", "F16 X F19",
                                      "WASHINGTON", "B14XOH43", "R1*(N32*B14)",
                                      "B60*R71", "WF9*B37", "B59*C103",
                                      "Garst 8702", "B14*C103", "B14*C131A",
                                      "PIO 3720", "WASH/GRAIN-1",
                                      "A632 X W117", "Garst 8750",
                                      "TAINAN-11", "PIO 3541", "PIO 3707",
                                      "PIO 3475*", "PIO 3382*", "PIO 3780",
                                      "PIO 3780*", "McCurdy 84aa",
                                      "C281", "SWEET CORN", "Garst 8555",
                                      "PIO 3901", "B8*153R", "Garst 8808",
                                      "B73 X MO17", "PIO 511A", "W69A X F546",
                                      "A632 X VA26", "W64A X W117",
                                      "PIO 3147", "WF9*B37", "NEB 611",
                                      "PV82S", "PV76S", "PIO 3183",
                                      "CESDA-28", "B14*OH43", "MCCURDY 6714",
                                      "FM 6", "TOCORON-3", "NC+59",
                                      "H6", "H610(UH)", "PB 8", "B56*C131A",
                                      "PIO X 304C", "H.OBREGON",
                                      "SUWAN-1", "PIO 3165", "PIO 3324",
                                      "PIO 3475", "PIO 3475 orig",
                                      "PIO 3790", "CARGILL 111S",
                                      "PIO 31G98", "GL 582", "GL 482",
                                      "GL 450", "LAURENT 3733", "GL 582 MOD KBS",
                                      "AGETI76", "PARTAP1", "AS 740",
                                      "DK 611", "LH198XLH185", "PIO 3192",
                                      "DEA", "AG9010", "DAS CO32",
                                      "DKB 333B", "EXCELER", "JACKSON HYBRI",
                                      "PIO 33Y09", "PIO 3489", "PIO 3394",
                                      "PIO 3563", "DEKALB 485", "DEKALB 521",
                                      "DEKALB 591", "C/LOL 499",
                                      "C/LOL 564", "C/LOL 581", "C/LOL 599",
                                      "C/LOL 542", "C/LOL 661", "C/LOL 674",
                                      "Prisma (FAO 700)", "Prisma GC Avg",
                                      "OBA SUPER 2", "EV8728-SR",
                                      "Mokwa 87TZPB-SR", "SPL (semi-prol)",
                                      "TZB-SR (open p)", "EV 8449-SR",
                                      "EV 8449-SRx", "AG-KADUNA",
                                      "OBA S2 Benin", "EV-8449_TG",
                                      "EV-8443_TG", "TOHONO O'odham",
                                      "LVN 10", "SOTUBAKA", "NIELENI",
                                      "APPOLO", "TZE C0MP4C2", "TZESRW X GUA 314",
                                      "AB-11-TG", "TZEEY-SRBC5",
                                      "IKENNE", "TEST", "H625", "H512",
                                      "H622", "H511", "CCOMP", "MAKUCOMP",
                                      "H625", "KCB", "PWANI", "H613",
                                      "CUZCO", "H512", "H614", "H5012",
                                      "H626", "KATUMANICOMPI", "PH 1",
                                      "HAC", "H612", "KATUMANICOMP-II",
                                      "OBATANPA", "Base Garst808-wh",
                                      "Baseline 10%shor", "Baseline 10%long",
                                      "Yield norm cycle", "Yield 10%shorter",
                                      "Yield 10%longer", "wh403",
                                      "BRS1030-SL2009", "32P55"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "403  .", "ter  .",
                                     "er   .", ".", ".", ".", ".",
                                     ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0003", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0001", "IB0001", "IB0004"),
                         `P1` = c(5, 450, 160, 185, 212, 240, 260,
                                  320, 200, 110, 5, 110, 120, 125,
                                  125, 130, 135, 135, 135, 140, 140,
                                  150, 160, 162, 165, 165, 172, 172,
                                  172, 172, 172, 175, 180, 180, 180,
                                  185, 187, 190, 200, 200, 200, 200,
                                  200, 200, 200, 265, 202, 210, 215,
                                  215, 218, 220, 220, 220, 240, 240,
                                  245, 255, 260, 260, 260, 260, 260,
                                  260, 265, 265, 276, 276, 280, 310,
                                  365, 300, 318, 365, 360, 380, 320,
                                  320, 200, 220, 212.4, 290, 165,
                                  200, 240, 200, 200, 180, 325, 450,
                                  215, 260, 205, 215, 165, 196, 220,
                                  250, 210, 200, 245, 225, 240, 216,
                                  215, 215, 225, 182, 210, 200, 200,
                                  185, 200, 200, 280, 280, 270, 265,
                                  305, 270, 290, 385, 385, 220, 170,
                                  260, 300, 200, 350, 300, 232, 216,
                                  210, 170, 250, 130, 280, 130, 130,
                                  130, 358.5, 317.6, 366.2, 183.6,
                                  341.1, 125, 182.4, 182.4, 182.4,
                                  332.9, 396.9, 351.7, 458, 238.6,
                                  234.5, 245, 130, 125, 280, 250,
                                  215, 285, 250, 215, 285, 265, 263.8,
                                  215),
                         `P2` = c(0, 2, 0.75, 0.75, 0.75, 0.75,
                                  0.75, 0.52, 0.3, 0.3, 0.3, 0.3,
                                  0, 0, 0, 0.3, 0, 0.3, 0, 0.3, 0,
                                  0.4, 0.7, 0.8, 0, 0.4, 0.3, 0.8,
                                  0.8, 0.8, 0.8, 0.2, 0.5, 0.5, 0.8,
                                  0.4, 0, 0.2, 0.8, 0.3, 0.7, 0.7,
                                  0.7, 0.76, 0.76, 0.3, 0.3, 0.52,
                                  0.4, 0.76, 0.3, 0.4, 0.52, 0.3,
                                  0.3, 0.3, 0, 0.76, 0.8, 0.3, 0.5,
                                  0.5, 0.5, 0.5, 0.8, 0.3, 0.52,
                                  0.52, 0.3, 0.3, 0.52, 0.52, 0.5,
                                  0.52, 0.8, 0.6, 0.52, 0.52, 0.7,
                                  0.7, 0.52, 0.5, 0.75, 0.7, 0.7,
                                  0.7, 0.7, 0.7, 2, 2, 0.75, 0.1,
                                  0.75, 0.3, 0.1, 0.5, 0.5, 0.5,
                                  0.5, 0.3, 0.5, 0.6, 0.5, 0.6, 0.6,
                                  0.4, 0.4, 0.5, 0.5, 0.5, 0.5, 0.5,
                                  0.5, 0.5, 0.4, 0.3, 0.6, 0.6, 0.6,
                                  0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                  0.6, 0.1, 1, 0.52, 0.3, 0.3, 0.1,
                                  0.1, 0.1, 0.1, 0.6, 0.5, 0.5, 0.5,
                                  0.5, 0.5, 1.235, 0.5, 0.5, 0.5,
                                  0.5, 0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                                  0.5, 0.5, 0.5, 0.5, 0.5, 0, 0.5,
                                  0.5, 0.5, 0.5, 0.5, 0.5, 0.76,
                                  0.5, 0.5),
                         `P5` = c(580, 999, 780, 850, 850, 850,
                                  850, 940, 800, 680, 680, 685, 685,
                                  685, 685, 685, 685, 685, 685, 685,
                                  685, 685, 950, 685, 685, 715, 685,
                                  685, 685, 685, 685, 960, 685, 685,
                                  685, 775, 685, 930, 670, 800, 800,
                                  800, 800, 685, 685, 920, 685, 625,
                                  890, 600, 760, 780, 880, 685, 685,
                                  685, 685, 685, 710, 720, 750, 750,
                                  750, 669, 665, 825, 867, 867, 750,
                                  685, 850, 990, 700, 920, 685, 780,
                                  940, 940, 750, 850, 792.8, 1035,
                                  680, 750, 990, 850, 680, 750, 625,
                                  580, 850, 800, 850, 990, 476, 758,
                                  747.8, 842, 770, 950, 905, 895,
                                  900, 830, 785, 795, 895, 650, 670,
                                  668, 670, 700, 670, 670, 850, 789,
                                  780, 800, 765, 740, 775, 860, 860,
                                  780, 760, 630, 850, 610, 980, 930,
                                  688, 530, 660, 660, 620, 600, 630,
                                  720, 720, 720, 616.1, 530.4, 611.3,
                                  611, 612, 500.3, 616, 616, 616,
                                  601.6, 623.6, 859, 429, 654, 429,
                                  825, 390, 660, 750, 730, 650, 810,
                                  730, 650, 810, 685, 1034, 650),
                         `G2` = c(248, 990, 750, 800, 800, 800,
                                  800, 620, 700, 820.4, 820.4, 907.9,
                                  907.9, 907.9, 907.9, 907.9, 907.9,
                                  907.9, 907.9, 907.9, 907.9, 907.9,
                                  845, 862.4, 907.9, 825, 907.9,
                                  907.9, 781.4, 907.9, 907.9, 855.8,
                                  907.9, 907.9, 907.9, 836, 907.9,
                                  891, 803, 770, 649, 797.5, 715,
                                  660, 797.5, 920, 907.9, 907.5,
                                  880, 616, 632.5, 858, 803, 709.5,
                                  907.9, 907.9, 907.9, 917.4, 907.9,
                                  907.5, 660, 660, 660, 858, 858,
                                  907.9, 677.6, 660, 907.5, 907.9,
                                  680, 440, 885.5, 780, 907.9, 825,
                                  625, 625, 907, 907, 625, 580, 820.4,
                                  750, 907, 700, 725, 750, 580, 600,
                                  700, 980, 731, 660, 442, 830, 1100,
                                  920, 1170, 980, 780, 875, 820,
                                  860, 750, 890, 880, 750, 880, 850,
                                  850, 835, 850, 800, 750, 700, 840,
                                  900, 810, 920, 990, 700, 945.4,
                                  845, 800, 900, 850, 248, 760, 500,
                                  540, 455, 850, 780, 920, 850, 900,
                                  380, 380, 550, 550, 550, 600, 380,
                                  700, 450, 720, 825, 380, 550, 825,
                                  550, 450, 450, 720, 750, 825, 450,
                                  540, 800, 800, 800, 840, 840, 840,
                                  760, 700, 740),
                         `G3` = c(5, 16.5, 8.5, 8.5, 8.5, 8.5,
                                  8.5, 6, 8.5, 6.6, 6.6, 6.6, 10,
                                  10, 10, 8.6, 10, 10.4, 10, 10.5,
                                  10, 10.15, 8.4, 6.9, 10, 11, 8.5,
                                  10.15, 7.7, 10.15, 10.15, 6, 10.15,
                                  10.15, 10, 12, 10, 6.3, 6.8, 8.5,
                                  6.3, 8.6, 8.5, 9.6, 9.6, 8, 5.8,
                                  10, 9, 9, 8.8, 8.5, 10, 10.5, 10,
                                  10, 8, 10, 6.5, 9, 8.5, 8.5, 8.5,
                                  7.1, 6.9, 9.8, 10.7, 8.12, 10,
                                  10, 6.5, 7, 6.4, 5.7, 10.15, 7,
                                  6, 6, 9, 9.9, 6, 5.5, 6.6, 8.6,
                                  8.8, 7, 9, 8.6, 7.3, 16.5, 5, 5.7,
                                  5, 8.5, 5.35, 5.1, 5.4, 4.8, 5.8,
                                  7.15, 6, 8.8, 8.5, 8.8, 8.7, 8,
                                  8, 8.7, 11.25, 8.8, 8.8, 8.7, 9,
                                  8.9, 6.8, 6.05, 7.8, 7.2, 8, 7.4,
                                  6.8, 8, 7.2, 8, 8, 9, 8.8, 9.8,
                                  9.2, 6, 8.8, 11, 9.7, 8, 8.5, 8,
                                  8.8, 7.5, 7.5, 7.5, 7.2, 7.5, 6.5,
                                  10, 8.5, 10.5, 10.5, 10.15, 7.5,
                                  7.5, 10.15, 7.5, 10.5, 10.5, 10.5,
                                  10.5, 10.15, 10.5, 7.5, 7.8, 7.8,
                                  7.8, 8.19, 8.19, 8.19, 7.6, 5.2,
                                  8.19),
                         `PHINT` = c(38, 75, 49, 49, 49, 49, 49,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 43, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 47,
                                     48, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 50, 50, 48, 48, 48, 48,
                                     40, 40, 45, 45, 45, 43, 48,
                                     48, 48, 48, 45, 48, 48, 46,
                                     46, 45, 45, 46, 45, 45, 38.9,
                                     48, 45, 45, 45, 41, 45, 50,
                                     50, 40, 50, 45, 45, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 55, 55, 55,
                                     55, 45, 75, 75, 75, 75, 75,
                                     75, 75, 75, 75, 75, 75, 75,
                                     75, 75, 75, 75, 75, 75, 75,
                                     75, 75, 40, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 44.22,
                                     45.9))

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
               info = "read_cul() MZCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() MZCER048.CUL")


# "read_cul() MZIXM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.2f",
                       P5 = "%6.1f", G2 = "%6.1f", G3 = "%6.2f",
                       PHINT = "%6.1f", AX = "%6.0f", ALL = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/MZIXM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() MZIXM048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "PC0001",
                                    "PC0002", "PC0003", "PC0004",
                                    "PC0005", "990001", "990002",
                                    "990003", "990004", "IB0001",
                                    "IB0002", "IB0003", "IB0004",
                                    "IB0005", "IB0006", "IB0007",
                                    "IB0008", "IB0009", "IB0010",
                                    "IB0011", "IB0012", "IB0013",
                                    "IB0014", "IB0015", "IB0016",
                                    "IB0017", "IB0018", "IB0019",
                                    "IB0020", "IB0021", "IB0022",
                                    "IB0023", "IB0024", "IB0025",
                                    "IB0026", "IB0027", "IB0028",
                                    "IB0029", "IB0030", "IB0031",
                                    "IB0032", "IB0033", "IB0034",
                                    "IB0035", "IB0155", "IB0036",
                                    "IB0037", "IB0038", "IB0039",
                                    "IB0040", "IB0041", "IB0042",
                                    "IB0043", "IB0044", "IB0045",
                                    "IB0046", "IB0047", "IB0048",
                                    "IB0049", "IB0050", "IB0051",
                                    "IB0052", "IB0053", "IB0054",
                                    "IB0055", "IB0056", "IB0057",
                                    "IB0058", "IB0059", "IB0060",
                                    "IB0061", "IB0062", "IB0063",
                                    "IB0064", "IB0065", "IB0066",
                                    "IB0067", "IB0068", "IB0168",
                                    "IB0069", "IB0070", "IB0071",
                                    "IB0089", "IB0090", "IB0091",
                                    "IB0092", "IB0099", "IB0100",
                                    "IB0171", "IB0172", "IB0173",
                                    "IB0174", "IB1051", "IB1052",
                                    "IB1053", "IB0154", "IB1065",
                                    "IB1066", "IB1067", "IB1069",
                                    "IB1072", "IB1068", "IB1168",
                                    "LL0499", "LL0564", "LL0581",
                                    "LL0599", "LL0542", "LL0661",
                                    "LL0674", "ZA0001", "ZA0002",
                                    "IF0001", "IF0002", "IF0003",
                                    "IF0004", "IF0005", "IF0006",
                                    "IF0007", "IF0008", "IF0009",
                                    "IF0010", "IF0011", "AC0001",
                                    "VI0001", "IM0001", "IM0002",
                                    "IM0003", "IB9999", "IB9998",
                                    "IF0018", "GH0004"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "2500-2600 GDD",
                                      "2600-2650 GDD", "2650-2700 GDD",
                                      "2700-2750 GDD", "2750-2800 GDD",
                                      "LONG SEASON", "MEDIUM SEASON",
                                      "SHORT SEASON", "V.SHORT SEASON",
                                      "CORNL281", "CP170", "LG11",
                                      "F7 X F2", "PIO 3995", "INRA",
                                      "EDO", "A654 X F2", "DEKALB XL71",
                                      "F478 X W705A", "DEKALBXL45",
                                      "PIO 3382", "B59*OH43", "F16 X F19",
                                      "WASHINGTON", "B14XOH43", "R1*(N32*B14)",
                                      "B60*R71", "WF9*B37", "B59*C103",
                                      "Garst 8702", "B14*C103", "B14*C131A",
                                      "PIO 3720", "WASH/GRAIN-1",
                                      "A632 X W117", "Garst 8750",
                                      "TAINAN-11", "PIO 3541", "PIO 3707",
                                      "PIO 3475", "PIO 3382", "PIO 3780",
                                      "PIO 3780*", "McCurdy 84aa",
                                      "DEA", "C281", "SWEET CORN",
                                      "Garst 8555", "PIO 3901", "B8*153R",
                                      "Garst 8808", "B73 X MO17",
                                      "PIO 511A", "W69A X F546",
                                      "A632 X VA26", "W64A X W117",
                                      "PIO 3147", "WF9*B37", "NEB 611",
                                      "PV82S", "PV76S", "PIO 3183",
                                      "CESDA-28", "B14*OH43", "MCCURDY 6714",
                                      "FM 6", "TOCORON-3", "NC+59",
                                      "H6", "H610(UH)", "PB 8", "B56*C131A",
                                      "PIO X 304C", "H.OBREGON",
                                      "SUWAN-1", "PIO 3165", "PIO 3324",
                                      "PIO 3475", "PIO 3475 orig",
                                      "PIO 3790", "CARGILL 111S",
                                      "PIO 31G98", "GL 582", "GL 482",
                                      "GL 450", "LAURENT 3733", "AGETI76",
                                      "PARTAP1", "AG9010", "DAS CO32",
                                      "DKB 333B", "EXCELER", "AS 740",
                                      "DK 611", "LH198XLH185", "PIO 3192",
                                      "PIO 33Y09", "PIO 3489", "PIO 3394",
                                      "PIO 3563", "DEKALB 485", "DEKALB 521",
                                      "DEKALB 591", "C/LOL 499",
                                      "C/LOL 564", "C/LOL 581", "C/LOL 599",
                                      "C/LOL 542", "C/LOL 661", "C/LOL 674",
                                      "Prisma (FAO 700)", "Prisma GC Avg",
                                      "OBA SUPER 2", "EV8728-SR",
                                      "Mokwa 87TZPB-SR", "SPL (semi-prol)",
                                      "TZB-SR (open p)", "EV 8449-SR",
                                      "EV 8449-SRx", "AG-KADUNA",
                                      "OBA S2 Benin", "EV-8449_TG",
                                      "EV-8443_TG", "TOHONO O'odham",
                                      "LVN 10", "SOTUBAKA", "NIELENI",
                                      "APPOLO", "DK 611-mod1", "DK 611-mod2",
                                      "TZE C0MP4C2", "OBATAMPA"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0002",
                                    "IB0001", "IB0001", "IB0002",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0003",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0002",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0099", "IB0098",
                                    "IB0001", "IB0001"),
                         `P1` = c(5, 450, 160, 185, 212, 240, 260,
                                  320, 200, 110, 5, 110, 120, 125,
                                  125, 130, 135, 135, 135, 140, 140,
                                  150, 150, 162, 165, 165, 172, 172,
                                  172, 172, 172, 175, 180, 180, 180,
                                  185, 187, 190, 200, 200, 200, 200,
                                  200, 200, 200, 260, 168, 202, 210,
                                  215, 215, 218, 220, 220, 220, 240,
                                  240, 245, 255, 260, 260, 260, 260,
                                  260, 260, 265, 265, 276, 276, 280,
                                  310, 355, 300, 318, 340, 360, 380,
                                  320, 250, 200, 220, 212.4, 290,
                                  165, 200, 240, 200, 200, 325, 450,
                                  196, 235, 250, 220, 260, 275, 250,
                                  215, 245, 225, 240, 216, 215, 215,
                                  225, 182, 210, 200, 200, 185, 200,
                                  200, 280, 312, 270, 265, 305, 270,
                                  290, 385, 385, 220, 170, 260, 300,
                                  200, 350, 300, 232, 216, 260, 260,
                                  210, 300),
                         `P2` = c(0.1, 0.8, 0.75, 0.75, 0.75, 0.75,
                                  0.75, 0.52, 0.3, 0.3, 0.3, 0.3,
                                  0, 0, 0, 0.3, 0, 0.3, 0, 0.3, 0,
                                  0.4, 0.3, 0.8, 0, 0.4, 0.3, 0.8,
                                  0.8, 0.8, 0.8, 0.2, 0.5, 0.5, 0.8,
                                  0.4, 0, 0.2, 0.8, 0.3, 0.7, 0.7,
                                  0.7, 0.76, 0.76, 0.3, 0, 0.3, 0.52,
                                  0.4, 0.76, 0.3, 0.4, 0.52, 0.3,
                                  0.3, 0.3, 0, 0.76, 0.8, 0.3, 0.5,
                                  0.5, 0.5, 0.5, 0.8, 0.3, 0.52,
                                  0.52, 0.3, 0.3, 0.3, 0.52, 0.5,
                                  0.52, 0.8, 0.6, 0.52, 0.52, 0.7,
                                  0.7, 0.52, 0.5, 0.5, 0.7, 0.7,
                                  0.7, 0.7, 2, 2, 0.5, 0.5, 0.5,
                                  0.5, 0.1, 0.1, 0.1, 0.3, 0.5, 0.6,
                                  0.5, 0.6, 0.6, 0.4, 0.4, 0.5, 0.5,
                                  0.5, 0.5, 0.5, 0.5, 0.5, 0.4, 0.1,
                                  0.6, 0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                  0.6, 0.6, 0.6, 0.6, 0.1, 1, 0.52,
                                  0.3, 0.3, 0.1, 0.1, 0.1, 0),
                         `P5` = c(500, 1100, 780, 850, 850, 850,
                                  850, 940, 800, 680, 680, 685, 685,
                                  685, 685, 685, 685, 685, 685, 685,
                                  685, 685, 1000, 685, 685, 715,
                                  685, 685, 685, 685, 685, 960, 685,
                                  685, 685, 775, 685, 930, 670, 800,
                                  800, 800, 800, 685, 685, 955, 476,
                                  685, 625, 890, 600, 760, 780, 880,
                                  685, 685, 685, 685, 685, 710, 720,
                                  750, 750, 750, 669, 665, 825, 867,
                                  867, 750, 685, 870, 990, 700, 990,
                                  685, 780, 940, 940, 750, 850, 792.8,
                                  1040, 500, 750, 990, 850, 680,
                                  625, 580, 745, 740.8, 855, 770,
                                  700, 800, 770, 990, 905, 895, 900,
                                  830, 785, 795, 895, 650, 670, 668,
                                  670, 700, 670, 670, 850, 795, 780,
                                  800, 765, 740, 775, 860, 860, 780,
                                  760, 630, 850, 610, 980, 930, 688,
                                  530, 800, 800, 660, 700),
                         `G2` = c(400, 1100, 750, 800, 800, 800,
                                  800, 620, 700, 820.4, 820.4, 907.9,
                                  907.9, 907.9, 907.9, 907.9, 907.9,
                                  907.9, 907.9, 907.9, 907.9, 907.9,
                                  560, 862.4, 907.9, 825, 907.9,
                                  907.9, 781.4, 907.9, 907.9, 855.8,
                                  907.9, 907.9, 907.9, 836, 907.9,
                                  891, 803, 770, 649, 797.5, 715,
                                  660, 797.5, 700, 442, 907.9, 907.5,
                                  880, 616, 632.5, 858, 803, 709.5,
                                  907.9, 907.9, 907.9, 917.4, 907.9,
                                  907.5, 660, 660, 660, 858, 858,
                                  907.9, 677.6, 660, 907.5, 907.9,
                                  550, 440, 885.5, 670, 907.9, 825,
                                  625, 625, 907, 907, 625, 500, 820.4,
                                  750, 907, 700, 725, 580, 600, 800,
                                  580, 560, 600, 700, 750, 731, 660,
                                  780, 875, 820, 860, 750, 890, 880,
                                  750, 880, 850, 850, 835, 850, 800,
                                  750, 760, 840, 900, 810, 920, 990,
                                  700, 945.4, 845, 800, 900, 850,
                                  248, 760, 500, 540, 455, 850, 850,
                                  850, 907),
                         `G3` = c(4, 20, 8.5, 8.5, 8.5, 8.5, 8.5,
                                  6, 8.5, 6.6, 6.6, 6.6, 10, 10,
                                  10, 8.6, 10, 10.4, 10, 10.5, 10,
                                  10.15, 8.5, 6.9, 10, 11, 8.5, 10.15,
                                  7.7, 10.15, 10.15, 6, 10.15, 10.15,
                                  10, 12, 10, 6.3, 6.8, 8.5, 6.3,
                                  8.6, 8.5, 9.6, 9.6, 8.5, 5.35,
                                  5.8, 10, 9, 9, 8.8, 8.5, 10, 10.5,
                                  10, 10, 8, 10, 6.5, 9, 8.5, 8.5,
                                  8.5, 7.1, 6.9, 9.8, 10.7, 8.12,
                                  10, 10, 5.8, 7, 6.4, 5.4, 10.15,
                                  7, 6, 6, 9, 9.9, 6, 4.5, 6.6, 8.6,
                                  8.8, 7, 9, 7.3, 16.5, 5, 4.5, 4.4,
                                  4.4, 5, 5, 5, 8.5, 6, 8.8, 8.5,
                                  8.8, 8.7, 8, 8, 8.7, 11.25, 8.8,
                                  8.8, 8.7, 9, 8.9, 6.8, 6.03, 7.8,
                                  7.2, 8, 7.4, 6.8, 8, 7.2, 8, 8,
                                  9, 8.8, 9.8, 9.2, 6, 8.8, 11, 6,
                                  6, 9.7, 5.3),
                         `PHINT` = c(38, 55, 49, 49, 49, 49, 49,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     40, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 43, 39, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 45, 38.9,
                                     38.9, 45, 38.9, 38.9, 38.9,
                                     38.9, 38.9, 38.9, 38.9, 48,
                                     48, 38.9, 38.9, 38.9, 38.9,
                                     50, 50, 43, 43, 40, 43, 45,
                                     43, 44, 48, 48, 48, 48, 48,
                                     45, 48, 48, 46, 46, 45, 45,
                                     46, 45, 45, 38.9, 45, 45, 45,
                                     45, 41, 45, 50, 50, 40, 50,
                                     45, 45, 38.9, 38.9, 38.9, 38.9,
                                     38.9, 48, 48, 55, 38.9),
                         `AX` = c(200, 850, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, 850,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, 770, 680,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  850, NA, NA, 780, NA, NA, NA, NA,
                                  NA, NA, NA, 650, 250, NA, NA, NA,
                                  NA, NA, NA, 775, 825, 880, 720,
                                  750, 650, 770, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, 750, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA, NA, NA, NA, NA, NA, NA, NA,
                                  NA),
                         `ALL` = c(600, 900, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, 900,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, 930, 650,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   850, NA, NA, 800, NA, NA, NA,
                                   NA, NA, NA, NA, 800, 650, NA,
                                   NA, NA, NA, NA, NA, 750, 850,
                                   760, 800, 900, 850, 900, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, 850, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA, NA, NA, NA, NA, NA,
                                   NA, NA, NA))

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
               info = "read_cul() MZIXM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() MZIXM048.CUL")


# "read_cul() PIALO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", TC = "%6.0f",
                       P1 = "%6.0f", P2 = "%6.0f", P3 = "%6.0f",
                       P4 = "%6.0f", P5 = "%6.0f", P6 = "%6.0f",
                       P7 = "%6.0f", P8 = "%6.0f", G1 = "%6.0f",
                       G2 = "%6.0f", G3 = "%6.0f", PHINT = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/PIALO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() PIALO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0066",
                                    "IB0068", "IB0069"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "SC-F153",
                                        "HB-MD2CR", "HB-MD2CRp"),
                         `EXPNO` = c(".", ".", "", "", ""),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0002", "IB0003"),
                         `TC` = c(60, 130, 60, 60, 127),
                         `P1` = c(60L, 60L, 60L, 60L, 60L),
                         `P2` = c(60L, 900L, 60L, 530L, 812L),
                         `P3` = c(35L, 35L, 35L, 35L, 35L),
                         `P4` = c(65L, 65L, 65L, 65L, 65L),
                         `P5` = c(520L, 700L, 629L, 520L, 520L),
                         `P6` = c(260L, 400L, 381L, 260L, 260L),
                         `P7` = c(300L, 2640L, 2640L, 300L, 300L
                         ),
                         `P8` = c(400L, 2000L, 400L, 1910L, 1910L
                         ),
                         `G1` = c(200L, 215L, 200L, 215L, 215L),
                         `G2` = c(190L, 220L, 200L, 200L, 200L),
                         `G3` = c(12, 24, 14, 14, 14),
                         `PHINT` = c(35, 83, 40, 40, 83))

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
               info = "read_cul() PIALO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() PIALO048.CUL")


# "read_cul() PNGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.0f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.1f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/PNGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() PNGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "IB0001", "IB0002",
                                    "IB0003", "IB0004", "IB0005",
                                    "IB0006", "IB0007", "IB0008",
                                    "IB0009", "IB0011", "IB0013",
                                    "IB0015", "IB0016", "IB0017",
                                    "IB0018", "IB0019", "IB0020",
                                    "IB0021", "IB0022", "IB0023",
                                    "IB0024", "IB0025", "IB0026",
                                    "IB0027", "IB0031", "IB0032",
                                    "IB0033", "IB0034", "IB0035",
                                    "IB0036", "IB0037", "IB0038",
                                    "GA0001", "IB0082", "GH0001",
                                    "GH0002", "IB0040"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Spanish type",
                                      "Runner Type", "STARR, v tamnut",
                                      "FLORUNNER", "FLORIGIANT",
                                      "VALENCIA, v tamn", "TAMNUT",
                                      "PRONTO, v tamnu", "MARC I",
                                      "CHICO", "AGRITEC-127,v Ma",
                                      "EARLY RUNNER", "SUNRUNNER,v flor",
                                      "SOUTHERN RUNNER", "EARLY BUNCH",
                                      "NC7, VIRGINIA", "GK3, VIRGINIA",
                                      "SHULAMIT, VA BUN", "TIFTON-8,FLORIG",
                                      "Q18801,earlybun", "VIRG BUN, MODIF",
                                      "MCCUBBIN, m TAMN", "TMV2, mod tamnu",
                                      "TAPIR, mod tamn", "ROBUT-33,uf v35",
                                      "TMV-2,uf v 24", "F81206,LS-RES",
                                      "MA72*94-12,LS-Rs", "861 VIRGINIA BUN",
                                      "897 VIRGINIA BUN", "ROBUT 33-1 v 5",
                                      "CIANJUR #5 TAM", "RANGKASBITUNG 5",
                                      "PIDIE  #5 TAMN", "Georgia Green",
                                      "Non-Nodulated", "CHINESE TMV2 TAM",
                                      "F_MIX3,short bun", "FLORIGRAZE PEREN"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", ".", "18",
                                     "1", ".", "1", ".", "2", "1",
                                     ".", "1", ".", "4", "2", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", "2", "2",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", "1", "7", "7", "PN001"),
                         `ECO#` = c("DFAULT", "DFAULT", "PN0007",
                                    "PN0001", "PN0007", "PN0001",
                                    "PN0008", "PN0007", "PN0007",
                                    "PN0007", "PN0009", "PN0006",
                                    "PN0009", "PN0002", "PN0001",
                                    "PN0002", "PN0004", "PN0004",
                                    "PN0001", "PN0005", "PN0011",
                                    "PN0010", "PN0013", "PN0007",
                                    "PN0007", "PN0007", "PN0015",
                                    "PN0007", "PN0014", "PN0014",
                                    "PN0004", "PN0004", "PN0015",
                                    "PN0007", "PN0007", "PN0007",
                                    "RUNNER", "PN0001", "PN0019",
                                    "PN0020", "5 11.84"),
                         `CSDL` = c(11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 11.84, 11.84, 11.84, 11.84,
                                    11.84, 0),
                         `PPSEN` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 70),
                         `EM-FL` = c(15, 25, 17.4, 21.2, 17.4,
                                     21.2, 21.2, 17.4, 17.4, 17.4,
                                     20, 16.4, 20, 21.6, 21.2, 22.9,
                                     21.9, 21, 21, 20.8, 21.9, 21.9,
                                     21.9, 20, 17.4, 17.4, 19, 19,
                                     23, 27.3, 21, 21, 17.4, 17.4,
                                     17.4, 17.4, 21.2, 21.2, 17,
                                     19, 7.5),
                         `FL-SH` = c(5, 12, 7, 8, 7, 9.2, 8.5,
                                     7, 7, 7, 7, 7, 7, 8.5, 8, 9.2,
                                     7.6, 8, 8, 7.8, 8.2, 8, 8.5,
                                     7.5, 7, 7, 7, 7, 8, 11, 8, 8,
                                     7, 7, 7, 7, 9.2, 9.2, 7, 8.8,
                                     18.5),
                         `FL-SD` = c(13, 24, 17.5, 17.8, 17.5,
                                     18.8, 20.3, 17.5, 17, 17.5,
                                     17, 15, 17, 17.8, 17.8, 18.2,
                                     16.5, 20.3, 20.3, 17.5, 19.7,
                                     17.8, 20.3, 17.5, 17.5, 17.5,
                                     17.5, 17.5, 19.5, 24.5, 20,
                                     20, 17.5, 17.5, 17.5, 17.5,
                                     18.8, 18.8, 17.5, 19, 155),
                         `SD-PM` = c(50, 85, 62, 75.3, 62, 74.3,
                                     73, 62, 62, 62, 74, 58, 74,
                                     80, 75.3, 82.6, 72.4, 73, 73,
                                     76.1, 74.5, 74.6, 74.5, 70,
                                     62, 62, 70, 62, 77, 68.5, 78,
                                     78, 65, 65, 65, 65, 77.3, 77.3,
                                     53, 69, 155),
                         `FL-LF` = c(70, 90, 70, 88, 70, 88, 88,
                                     70, 70, 70, 80, 66, 80, 87,
                                     88, 91, 80, 88, 88, 83, 83,
                                     78, 90, 78, 78, 78, 78, 72,
                                     91, 91, 85, 85, 77, 77, 77,
                                     77, 85, 85, 73, 80, 1),
                         `LFMAX` = c(1, 1.5, 1.28, 1.4, 1.28, 1.4,
                                     1.38, 1.28, 1.28, 1.28, 1.42,
                                     1.04, 1.4, 1.28, 1.4, 1.3, 1.34,
                                     1.36, 1.36, 1.35, 1.37, 1.37,
                                     1.33, 1.32, 1.31, 1.32, 1.28,
                                     1.28, 1.27, 1.25, 1.3, 1.3,
                                     1.23, 1.23, 1.23, 1.23, 1.45,
                                     1.3, 1.2, 1.24, 200),
                         `SLAVR` = c(230, 290, 245, 260, 245, 260,
                                     250, 245, 245, 245, 270, 285,
                                     275, 265, 260, 265, 265, 270,
                                     270, 220, 205, 240, 275, 230,
                                     270, 265, 260, 270, 265, 250,
                                     275, 275, 260, 250, 250, 250,
                                     270, 260, 270, 265, 18),
                         `SIZLF` = c(13, 21, 16, 18, 16, 18, 18,
                                     16, 16, 16, 18, 16, 18, 18,
                                     18, 17, 20, 20, 18, 19, 19,
                                     19, 19, 17, 16, 16, 16, 16,
                                     18, 18, 20, 20, 16, 16, 16,
                                     16, 18, 18, 20, 19, 0.01),
                         `XFRT` = c(0.63, 1, 0.84, 0.94, 0.84,
                                    0.92, 0.86, 0.84, 0.83, 0.84,
                                    0.93, 0.9, 0.95, 0.85, 0.94,
                                    0.85, 0.93, 0.94, 0.94, 0.93,
                                    0.73, 0.87, 0.76, 0.82, 0.8,
                                    0.8, 0.84, 0.8, 0.85, 0.59, 0.76,
                                    0.76, 0.84, 0.84, 0.84, 0.84,
                                    0.95, 0.56, 0.72, 0.77, 0.15),
                         `WTPSD` = c(0.36, 1.2, 0.36, 0.66, 0.36,
                                     0.69, 0.99, 0.36, 0.38, 0.36,
                                     0.69, 0.31, 0.66, 0.57, 0.65,
                                     0.63, 1.1, 1, 1, 0.98, 0.91,
                                     1.18, 0.88, 0.52, 0.36, 0.36,
                                     0.5, 0.37, 0.72, 0.72, 0.55,
                                     0.96, 0.5, 0.36, 0.36, 0.36,
                                     0.69, 0.455, 0.36, 0.45, 36),
                         `SFDUR` = c(23, 46, 29, 40, 29, 40, 37,
                                     29, 29, 29, 40, 22, 40, 36,
                                     40, 40, 44, 38, 38, 40, 38,
                                     44, 38, 32, 29, 29, 29, 29,
                                     38, 38, 38, 38, 29, 29, 29,
                                     29, 42, 40, 29, 36, 1.65),
                         `SDPDV` = c(1.4, 2, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 2.5, 1.65, 1.65,
                                     1.65, 1.75, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 1.65, 1.65, 1.65,
                                     1.65, 1.65, 1.65, 1.65, 1.65,
                                     30),
                         `PODUR` = c(10, 34, 15, 25, 15, 24, 25,
                                     15, 16, 15, 23, 13, 23, 27,
                                     25, 30, 21, 30, 30, 25, 28,
                                     24, 27, 19, 15, 13, 15, 15,
                                     29, 30, 30, 30, 15, 15, 15,
                                     15, 28, 26, 15, 26, NA),
                         `THRSH` = c(78, 80, 78, 80, 78, 80, 74,
                                     78, 78, 78, 80, 77, 80, 79,
                                     80, 79, 75, 75, 80, 74, 74,
                                     75, 74, 78, 78, 78, 78, 78,
                                     77, 77, 75, 75, 78, 78, 78,
                                     78, 80, 72, 74.5, 74, NA),
                         `SDPRO` = c(0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.27, 0.27, 0.27,
                                     0.27, 0.27, 0.19, 0.27, 0.27,
                                     NA),
                         `SDLIP` = c(0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     0.51, 0.51, 0.51, 0.51, 0.51,
                                     NA))

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
               info = "read_cul() PNGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() PNGRO048.CUL")


# "read_cul() PPGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.2f",
                       PPSEN = "%6.2f", "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.1f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.1f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/PPGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() PPGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "PP0001",
                                    "I88039", "GH0001"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "76W est",
                                        "ICRISAT ICPL8803", "KPATINGA"
                         ),
                         `EXPNO` = c(".", ".", ".", "9    .", "."
                         ),
                         `ECO#` = c("DFAULT", "DFAULT", "PP0001",
                                    "PP0002", "PP0002"),
                         `CSDL` = c(11.5, 13, 12.94, 11.6, 12.89
                         ),
                         `PPSEN` = c(0.2, 0.8, 0.71, 0.74, 0.26
                         ),
                         `EM-FL` = c(20, 75, 32.7, 29.3, 73.7),
                         `FL-SH` = c(9, 18, 17.4, 9.1, 13.8),
                         `FL-SD` = c(20, 30, 24.1, 25.8, 29.9),
                         `SD-PM` = c(25, 40, 37.72, 29.01, 30.22
                         ),
                         `FL-LF` = c(23, 30, 28.87, 23.23, 23.23
                         ),
                         `LFMAX` = c(0.9, 1.1, 1.1, 1.06, 0.9),
                         `SLAVR` = c(300, 350, 320, 320, 320),
                         `SIZLF` = c(171.4, 171.4, 171.4, 171.4,
                                     171.4),
                         `XFRT` = c(0.7, 1, 0.95, 0.68, 0.81),
                         `WTPSD` = c(0.1, 0.3, 0.18, 0.1, 0.26),
                         `SFDUR` = c(23, 70, 24.6, 23.4, 63.2),
                         `SDPDV` = c(1.8, 4, 3.89, 1.81, 1.82),
                         `PODUR` = c(11, 20, 17.3, 18, 11.3),
                         `THRSH` = c(74, 76, 74, 75, 74),
                         `SDPRO` = c(0.223, 0.223, 0.224, 0.223,
                                     0.223),
                         `SDLIP` = c(0.015, 0.015, 0.015, 0.015,
                                     0.015))

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
               info = "read_cul() PPGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() PPGRO048.CUL")


# "read_cul() PRGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.0f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.0f", SDPDV = "%6.0f", PODUR = "%6.0f",
                       THRSH = "%6.1f", SDPRO = "%6.1f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/PRGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() PRGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "PR0001",
                                    "PRX001", "PR0002", "PR0003",
                                    "PR0011"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "CAPISTRANO",
                                      "CAPISTRANO", "BISCAYNE", "BISCAYNE-JJ",
                                      "CAPISTRANO-GL"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     "."),
                         `ECO#` = c("DFAULT", "DFAULT", "PR0001",
                                    "PR0001", "PR0002", "PR0003",
                                    "PR0001"),
                         `CSDL` = c(12.33, 12.33, 12.33, 12.33,
                                    12.33, 12.33, 12.33),
                         `PPSEN` = c(0, 0, 0, 0, 0, 0, 0),
                         `EM-FL` = c(20, 42, 37, 35, 22, 30, 21.74
                         ),
                         `FL-SH` = c(9, 11, 10, 10, 11, 30, 10.85
                         ),
                         `FL-SD` = c(15, 18, 15, 15, 15, 35, 15.15
                         ),
                         `SD-PM` = c(85, 110, 100, 100, 100, 65,
                                     92.2),
                         `FL-LF` = c(200, 200, 200, 200, 200, 100,
                                     200),
                         `LFMAX` = c(0.98, 1.1, 0.98, 0.98, 1.1,
                                     1.05, 1.054),
                         `SLAVR` = c(250, 300, 275, 275, 250, 400,
                                     294.7),
                         `SIZLF` = c(225, 325, 250, 250, 300, 50,
                                     250),
                         `XFRT` = c(0.6, 0.85, 0.85, 0.85, 0.75,
                                    0.7, 0.75),
                         `WTPSD` = c(0.007, 0.007, 0.007, 0.007,
                                     0.007, 0.0027, 0.007),
                         `SFDUR` = c(25, 25, 25, 25, 25, 25, 25
                         ),
                         `SDPDV` = c(150, 150, 150, 150, 150, 100,
                                     150),
                         `PODUR` = c(42, 42, 42, 42, 42, 84, 42
                         ),
                         `THRSH` = c(6.5, 6.5, 6.5, 6.5, 6.5, 6.5,
                                     6.5),
                         `SDPRO` = c(0.3, 0.3, 0.3, 0.3, 0.3, 0.3,
                                     0.3),
                         `SDLIP` = c(0.05, 0.05, 0.05, 0.05, 0.05,
                                     0.05, 0.05))

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
               info = "read_cul() PRGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() PRGRO048.CUL")


# "read_cul() PTSUB048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", G2 = "%6.0f",
                       G3 = "%6.1f", PD = "%6.1f", P2 = "%6.1f",
                       TC = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/PTSUB048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() PTSUB048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0001",
                                    "IB0002", "IB0003", "IB0004",
                                    "IB0005", "CI0001", "CI0002",
                                    "AR0003", "DM0004", "IB0006",
                                    "IB0007", "IB0008", "IB0009",
                                    "IB0010", "IB0011", "IB0012",
                                    "IB0018", "UF0001"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "MAJESTIC",
                                        "SEBAGO", "Russet Burbank",
                                        "KATHADIN", "ATLANTIC", "CLON7316",
                                        "CLON7716", "ACHIRANA", "KAPTAH",
                                        "MARIS PIPER", "KING EDWARD",
                                        "DESIREE", "LT-1", "C14-343",
                                        "NORCHIP", "SHEPODY", "Hilite Russet",
                                        "RED LASODA"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001"),
                         `G2` = c(900, 2100, 2000, 1100, 1100,
                                  2000, 1000, 1100, 1100, 1100, 1500,
                                  2000, 2000, 2000, 2000, 2000, 2000,
                                  2000, 1000, 2000),
                         `G3` = c(21, 26, 22.5, 22.5, 26, 25, 30,
                                  25, 25, 26, 24, 25, 22.5, 25, 25,
                                  25, 25, 25, 27, 22),
                         `PD` = c(0.5, 1, 0.8, 0.9, 0.9, 0.5, 0.8,
                                  0.2, 0.2, 0.9, 0.6, 0.8, 1, 0.9,
                                  0.9, 0.9, 1, 0.7, 0.2, 0.7),
                         `P2` = c(0.3, 0.9, 0.6, 0, 0.2, 0.7, 0.1,
                                  0.8, 0.8, 0.2, 0.4, 0.4, 0.6, 0.6,
                                  0.8, 0.4, 0.4, 0.6, 0.1, 0.4),
                         `TC` = c(15, 22, 17, 19, 17, 20, 21, 21,
                                  21, 21, 18, 17, 17, 16, 17, 21,
                                  17, 19, 20, 19))

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
               info = "read_cul() PTSUB048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() PTSUB048.CUL")


# "read_cul() QUGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.2f",
                       PPSEN = "%6.3f", "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.1f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.1f", SDPDV = "%6.1f", PODUR = "%6.1f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/QUGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() QUGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "UH0001",
                                    "UH0002"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "Zeno (00)",
                                        "Jessie (00)"),
                         `EXPNO` = c(".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "QU0001",
                                    "QU0002"),
                         `CSDL` = c(14.25, 14.45, 14.35, 14.35),
                         `PPSEN` = c(0.006, 0.01, 0.008, 0.008),
                         `EM-FL` = c(8, 15, 11.2, 11.2),
                         `FL-SH` = c(1, 5, 2.9, 3),
                         `FL-SD` = c(6, 12, 8.6, 9.1),
                         `SD-PM` = c(25, 35, 33.8, 30.4),
                         `FL-LF` = c(20, 35, 26, 26),
                         `LFMAX` = c(0.75, 1.75, 1.73, 1.7),
                         `SLAVR` = c(225, 275, 250, 255),
                         `SIZLF` = c(6, 8, 7, 6.5),
                         `XFRT` = c(0.97, 1, 0.99, 0.97),
                         `WTPSD` = c(0.05, 0.065, 0.06, 0.06),
                         `SFDUR` = c(20, 25, 22, 22.5),
                         `SDPDV` = c(2, 2.5, 2.2, 2.2),
                         `PODUR` = c(14, 17, 15.6, 14.8),
                         `THRSH` = c(70, 80, 77, 76),
                         `SDPRO` = c(0.13, 0.16, 0.135, 0.155),
                         `SDLIP` = c(0.05, 0.08, 0.06, 0.07))

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
               info = "read_cul() QUGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() QUGRO048.CUL")


# "read_cul() RICER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.1f",
                       P2R = "%6.2f", P5 = "%6.1f", P2O = "%6.2f",
                       G1 = "%6.2f", G2 = "%6.4f", G3 = "%6.2f",
                       PHINT = "%6.0f", THOT = "%6.1f", TCLDP = "%6.0f",
                       TCLDF = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/RICER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() RICER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "990003", "990004",
                                    "IB0003", "IB0012", "IB0020",
                                    "IB0050", "IB0055", "IB0118",
                                    "IB0001", "IB0002", "IB0004",
                                    "IB0005", "IB0006", "IB0007",
                                    "IB0008", "IB0009", "IB0010",
                                    "IB0011", "IB0013", "IB0014",
                                    "IB0015", "IB0016", "IB0017",
                                    "IB0018", "IB0019", "IB0021",
                                    "IB0022", "IB0023", "IB0024",
                                    "IB0025", "IB0026", "IB0027",
                                    "IB0029", "IB0030", "IB0031",
                                    "IB0032", "IB0115", "IB0116",
                                    "IB0117", "IB0119", "IB0120",
                                    "IB0121", "IB0122", "IB0151",
                                    "IB0200", "IB0051", "IB0052",
                                    "MC0020", "TR0001", "TR0002",
                                    "TR0003", "TR0004", "TR0005"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "IRRI ORIGINALS",
                                        "IRRI RECENT", "JAPANESE",
                                        "N.AMERICAN", "IR 36", "IR 58",
                                        "RD 23", "PR114", "Basmati 385",
                                        "IR 72", "IR 8", "IR 20",
                                        "IR 43", "LABELLE", "MARS",
                                        "NOVA 66", "PETA", "STARBONNETT",
                                        "UPLRI5", "UPLRI7", "SenTaNi (???)",
                                        "IR 54", "IR 64", "IR 60(Est)",
                                        "IR 66", "IR 72x", "RD 7 (cal.)",
                                        "CICA8", "LOW TEMP.SEN",
                                        "LOW TEMP.TOL", "17 BR11,T.AMAN",
                                        "18 BR22,T.AMAN", "19 BR 3,T.AMAN",
                                        "20 BR 3,BORO", "CPIC8",
                                        "LEMONT", "RN12", "TW", "IR 64*",
                                        "HEAT SENSITIVE", "BR14",
                                        "BR11", "PANT-4", "JAYA",
                                        "BPRI10", "ZHENG DAO 9380",
                                        "CL-448", "KS-282 CRice",
                                        "Basmati-515 FRic", "RD 23",
                                        "KDML105", "NIEW SANPATONG",
                                        "SUPANBURI 60", "CHAINAT 1",
                                        "DOA 1"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", "e    .", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001"),
                         `P1` = c(150, 800, 880, 450, 220, 318,
                                  556.8, 254.8, 528.6, 662.5, 498.3,
                                  437.1, 880, 500, 720, 318, 698,
                                  389, 420, 880, 620, 760, 320, 350,
                                  500, 490, 500, 400, 603.3, 700,
                                  400, 400, 740, 650, 650, 650, 380,
                                  500, 380, 360, 540, 460, 560, 825,
                                  830, 830, 740, 400, 100, 290, 460,
                                  310.3, 502.3, 495.8, 540, 570,
                                  388.5),
                         `P2R` = c(5, 300, 52, 149, 35, 189, 53.88,
                                   96.44, 156.5, 184.4, 130.1, 61.02,
                                   52, 166, 120, 189, 134, 155, 240,
                                   164, 160, 150, 50, 125, 160, 100,
                                   50, 100, 150, 120, 120, 120, 180,
                                   110, 110, 90, 150, 50, 50, 50,
                                   160, 5, 200, 300, 160, 100, 200,
                                   120, 120, 17, 120, 140, 123.3,
                                   128.3, 154.7, 122.8, 20),
                         `P5` = c(150, 850, 550, 350, 510, 550,
                                  373.4, 378.4, 387.4, 503, 420,
                                  371.8, 550, 500, 580, 550, 550,
                                  550, 550, 550, 380, 450, 550, 520,
                                  450, 320, 490, 580, 452.5, 360,
                                  420, 420, 400, 400, 420, 400, 300,
                                  300, 300, 290, 490, 390, 500, 390,
                                  300, 200, 225, 420, 250, 490, 512,
                                  370, 386.5, 364.2, 497, 334.8,
                                  381.8),
                         `P2O` = c(11, 13, 12, 11.7, 12, 12.8,
                                   12.87, 10.63, 12.64, 12.38, 12.9,
                                   11.58, 12.1, 11.2, 10.5, 12.8,
                                   13, 11, 11.3, 13, 11.5, 11.7,
                                   10, 11.5, 12, 11.5, 12.5, 12,
                                   11.2, 11.7, 12, 12, 10.5, 12,
                                   12, 13, 12.8, 12.8, 12.8, 12.8,
                                   12, 13.5, 11.5, 11.5, 11.4, 11.4,
                                   13.5, 13, 12, 13, 11, 11.2, 12.7,
                                   12.7, 11.9, 11.9, 12),
                         `G1` = c(50, 70, 65, 68, 55, 65, 68, 77.03,
                                  52.65, 62.86, 74.76, 77.8, 65,
                                  65, 65, 65, 65, 65, 65, 65, 50,
                                  65, 70, 60, 60, 75, 62, 76, 65,
                                  60, 60, 60, 55, 60, 65, 65, 38,
                                  60, 40, 55, 50, 62, 45, 52, 45,
                                  40, 40, 60, 40, 55, 37, 53, 45.7,
                                  40.7, 77.7, 63.1, 73.8),
                         `G2` = c(0.015, 0.03, 0.028, 0.023, 0.025,
                                  0.028, 0.023, 0.02, 0.022, 0.023,
                                  0.022, 0.026, 0.028, 0.028, 0.028,
                                  0.028, 0.028, 0.028, 0.028, 0.028,
                                  0.022, 0.028, 0.03, 0.028, 0.025,
                                  0.0275, 0.0265, 0.023, 0.023, 0.027,
                                  0.025, 0.025, 0.025, 0.025, 0.025,
                                  0.025, 0.021, 0.0207, 0.0199, 0.021,
                                  0.025, 0.025, 0.026, 0.024, 0.03,
                                  0.03, 0.023, 0.027, 0.025, 0.05,
                                  0.021, 0.023, 0.027, 0.0277, 0.028,
                                  0.0278, 0.0275),
                         `G3` = c(0.7, 1.3, 1, 1, 1, 1, 1, 1, 1,
                                  1, 0.53, 1, 1, 1, 1, 1, 1, 1, 1,
                                  1, 0.6, 1, 1, 1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                  1.1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                  1, 0.3, 1, 0.7, 1, 1, 1.1),
                         `PHINT` = c(55, 90, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 83, 83, 83, 83, 83, 83,
                                     83, 75, 83, 83, 83, 83, 83,
                                     83),
                         `THOT` = c(25, 34, 28, 28, 28, 28, 31.3,
                                    33.9, 29, 25.7, 30.9, 30.4, 28,
                                    28, 28, 28, 28, 28, 28, 28, 28,
                                    28, 28, 28, 28, 28, 28, 28, 28,
                                    28, 35, 22.4, 31.1, 28, 28, 28,
                                    28, 28, 24.3, 28, 28, 24.3, 28,
                                    28, 35, 35, 28, 24.3, 22.4, 40,
                                    28, 28, 29.5, 32.9, 27.2, 28,
                                    24.3),
                         `TCLDP` = c(12, 18, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15),
                         `TCLDF` = c(10, 20, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15))

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
               info = "read_cul() RICER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() RICER048.CUL")


# "read_cul() SBGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.2f",
                       PPSEN = "%6.3f", "EM-FL" = "%6.2f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.1f", LFMAX = "%6.3f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.0f", WTPSD = "%6.3f",
                       SFDUR = "%6.1f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SBGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SBGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990011",
                                    "990012", "990013", "990001",
                                    "990002", "990003", "990004",
                                    "990005", "990006", "990007",
                                    "990008", "990009", "990010",
                                    "990015", "990016", "UC0001",
                                    "UC0002", "UC0003", "IB0011",
                                    "IB0037", "IB0003", "IB0010",
                                    "IB0001", "IB0101", "IB0002",
                                    "IB0014", "IB0015", "IB0008",
                                    "IB0006", "IB0013", "IB0044",
                                    "IB0012", "IB0043", "IB0033",
                                    "IB0051", "IB0055", "LU0003",
                                    "LU0004", "LU0005", "ST3660",
                                    "KR2828", "MS0077", "MS0078",
                                    "MS0079", "ISU113", "IB0057",
                                    "IB0058", "IB0059", "CCCA01",
                                    "IB0045", "IB0056", "RB0002",
                                    "RB0003"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "M GROUP 000",
                                        "M GROUP  00", "M GROUP   0",
                                        "M GROUP   1", "M GROUP   2",
                                        "M GROUP   3", "M GROUP   4",
                                        "M GROUP   5", "M GROUP   6",
                                        "M GROUP   7", "M GROUP   8",
                                        "M GROUP   9", "M GROUP  10",
                                        "M GROUP Savoy", "M GROUP Vinton",
                                        "ALTONA (00)", "MAPLE ARROW (00)",
                                        "MCCALL (00)", "EVANS (0)",
                                        "ELGIN-87 (2)", "WAYNE (3)",
                                        "WILLIAMS-82 (3)", "BRAGG",
                                        "BRAGG (7)", "COBB (8)",
                                        "CENTENNIAL(6)", "ESSEX (5)",
                                        "FORREST (5)", "RANSOM (7)",
                                        "LEFLORE (6)", "COKER 6847 (7)",
                                        "JUPITER (10)", "CLARK (4)",
                                        "PAPILLON (9)", "PK-472 (8)",
                                        "Hutcheson", "CHAND. 0",
                                        "LABR.  00", "MAJ. 000",
                                        "STIN3660  MG 3.6", "KRUG2828  MG 2.7",
                                        "PIO9272 (00)", "PIO9202 (00)",
                                        "MS MAT GROUP 2", "KENWOOD TEMPPAP",
                                        "AK 06", "SAMRAT", "MAUS 47",
                                        "SAMIRA 1", "DON MARIO (4)",
                                        "ASGROW (4)", "MG77PA (13)",
                                        "MG88PA (11)"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     "."),
                         `ECO#` = c("DFAULT", "DFAULT", "SB0001",
                                    "SB0001", "SB0001", "SB0101",
                                    "SB0201", "SB0301", "SB0401",
                                    "SB0501", "SB0601", "SB0701",
                                    "SB0801", "SB0901", "SB1001",
                                    "SB0304", "SB0305", "SB0001",
                                    "SB0001", "SB0001", "SB0001",
                                    "SB0201", "SB0301", "SB0301",
                                    "SB0701", "SB0701", "SB0801",
                                    "SB0601", "SB0501", "SB0501",
                                    "SB0702", "SB0601", "SB0701",
                                    "SB0901", "SB0501", "SB0901",
                                    "SB0801", "SB0501", "SB0000",
                                    "SB0100", "SB1000", "SB0301",
                                    "SB0201", "SB0001", "SB0001",
                                    "SB0201", "SB0201", "SB0801",
                                    "SB0801", "SB0801", "SB0401",
                                    "SB0501", "SB0401", "SB0777",
                                    "SB0888"),
                         `CSDL` = c(11.78, 14.6, 14.6, 14.35, 14.1,
                                    13.84, 13.59, 13.4, 13.09, 12.83,
                                    12.58, 12.33, 12.07, 11.88, 11.78,
                                    14.33, 14.16, 14.3, 14.3, 14.3,
                                    14.1, 13.59, 13.45, 13.4, 12.33,
                                    12.33, 12.25, 12.48, 12.83, 12.82,
                                    12.38, 12.55, 12.35, 11.88, 12.83,
                                    11.88, 12.07, 12.58, 13.7, 14,
                                    14.2, 13.44, 13.5, 13.4, 14.35,
                                    13.59, 13.59, 12.15, 12.2, 12.2,
                                    13.09, 12.95, 13.2, 11.8, 11.5
                         ),
                         `PPSEN` = c(0.129, 0.385, 0.129, 0.148,
                                     0.171, 0.203, 0.249, 0.285,
                                     0.294, 0.303, 0.311, 0.32, 0.33,
                                     0.34, 0.349, 0.11, 0.173, 0.155,
                                     0.155, 0.155, 0.171, 0.249,
                                     0.255, 0.285, 0.32, 0.32, 0.33,
                                     0.311, 0.303, 0.303, 0.32, 0.312,
                                     0.319, 0.34, 0.303, 0.34, 0.33,
                                     0.311, 0.171, 0.148, 0.129,
                                     0.284, 0.258, 0.28, 0.148, 0.249,
                                     0.249, 0.2, 0.22, 0.385, 0.294,
                                     0.294, 0.294, 0.325, 0.34),
                         `EM-FL` = c(9, 28.9, 15.5, 16, 16.8, 17,
                                     17.4, 19, 19.4, 19.8, 20.2,
                                     20.8, 21.5, 23, 23.5, 20.77,
                                     22.57, 17, 17, 16.5, 16.8, 17,
                                     19.5, 19, 19.5, 19.5, 21, 20,
                                     19.8, 21.1, 18.4, 19.6, 20.1,
                                     28.9, 18, 28, 21.5, 22, 18.6,
                                     16.6, 17, 18.8, 17.4, 20, 16,
                                     17.4, 17, 21, 16.5, 17, 19.4,
                                     15, 12.5, 25, 24.5),
                         `FL-SH` = c(5, 10, 5, 5, 6, 6, 6, 6, 7,
                                     8, 9, 10, 10, 10, 10, 6, 6,
                                     7.2, 6.9, 5.5, 7.8, 8.9, 8,
                                     8.3, 10, 10, 9.4, 9, 8.5, 8.8,
                                     9, 8.4, 9, 7, 9, 6, 8, 8, 6.6,
                                     7, 6.2, 7, 7, 9, 5, 6, 6.5,
                                     6, 7, 6, 7, 9.7, 8.5, 5, 8.2
                         ),
                         `FL-SD` = c(11, 22, 12, 12, 13, 13, 13.5,
                                     14, 15, 15.5, 16, 16, 16, 16,
                                     16, 11.7, 12.08, 13.4, 12.8,
                                     12, 13.8, 13, 14.7, 14.2, 15.2,
                                     15.2, 16, 15.5, 15.5, 15.2,
                                     14.2, 16, 14.8, 13.5, 15, 11,
                                     16, 15.5, 12.3, 13.2, 11, 11,
                                     12, 16, 15, 13.5, 13.5, 12,
                                     12.5, 12.5, 15, 19.4, 15, 10.5,
                                     12),
                         `SD-PM` = c(22, 37.7, 29.5, 30, 30.8,
                                     31.6, 32.4, 33.2, 34, 34.8,
                                     35.6, 36.4, 37.2, 37.4, 37.4,
                                     35.2, 34.2, 32.5, 33.4, 34.3,
                                     30, 35.8, 26.7, 32.2, 37.6,
                                     37.6, 37.2, 34.5, 35, 35.2,
                                     33.5, 37.3, 36.5, 31.5, 32,
                                     30, 36, 35, 33, 36.8, 34.6,
                                     37.6, 37.7, 30, 30, 32.4, 33.5,
                                     26, 25, 25, 34.5, 35.1, 28,
                                     27.5, 25),
                         `FL-LF` = c(18, 26, 26, 26, 26, 26, 26,
                                     26, 26, 18, 18, 18, 18, 18,
                                     18, 26, 26, 26, 26, 26, 26,
                                     30, 28, 28, 19, 19, 19, 18,
                                     18, 18, 18, 18, 18, 15, 26,
                                     15, 18, 18, 30, 34.8, 32, 26,
                                     26, 30, 30, 26, 26, 20, 18,
                                     18, 26, 26, 26, 22, 18),
                         `LFMAX` = c(1, 1.4, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.02, 1.04, 1.09,
                                     1.02, 1.09, 1, 0.97, 1, 1, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03,
                                     1.05, 1.05, 1.08, 1.05, 1.07,
                                     1.08, 1.03, 1.022, 1.03, 1.05,
                                     1.03, 1.03, 1.03, 1.03, 1.2,
                                     1.25, 1.2, 1.175),
                         `SLAVR` = c(300, 400, 375, 375, 375, 375,
                                     375, 375, 375, 375, 375, 375,
                                     375, 375, 375, 375, 375, 385,
                                     385, 385, 400, 395, 375, 385,
                                     355, 355, 370, 375, 375, 355,
                                     355, 375, 345, 375, 390, 375,
                                     300, 400, 387, 397, 395, 370,
                                     370, 390, 350, 375, 375, 385,
                                     400, 400, 375, 390, 400, 365,
                                     388),
                         `SIZLF` = c(137, 230, 180, 180, 180, 180,
                                     180, 180, 180, 180, 180, 180,
                                     180, 180, 180, 180, 180, 190,
                                     190, 200, 180, 180, 180, 180,
                                     170, 170, 190, 180, 180, 140,
                                     170, 180, 180, 180, 200, 180,
                                     180, 230, 200, 200, 200, 180,
                                     180, 200, 180, 180, 180, 137,
                                     150, 180, 180, 200, 200, 230,
                                     216),
                         `XFRT` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1),
                         `WTPSD` = c(0.15, 0.19, 0.19, 0.19, 0.19,
                                     0.19, 0.19, 0.19, 0.19, 0.18,
                                     0.18, 0.18, 0.18, 0.18, 0.18,
                                     0.19, 0.19, 0.19, 0.19, 0.19,
                                     0.18, 0.175, 0.18, 0.18, 0.17,
                                     0.17, 0.155, 0.18, 0.18, 0.18,
                                     0.17, 0.175, 0.17, 0.18, 0.19,
                                     0.18, 0.18, 0.18, 0.185, 0.153,
                                     0.178, 0.165, 0.165, 0.18, 0.18,
                                     0.19, 0.19, 0.155, 0.155, 0.155,
                                     0.19, 0.19, 0.19, 0.15, 0.16
                         ),
                         `SFDUR` = c(17, 25.5, 23, 23, 23, 23,
                                     23, 23, 23, 23, 23, 23, 23,
                                     23, 23, 23, 23, 19, 19, 21,
                                     24, 24.5, 23, 26, 24, 25, 23.5,
                                     23, 23, 23, 22.5, 23, 23, 22,
                                     20, 22, 23, 23, 25, 25, 25,
                                     25, 24.5, 22, 22, 23, 22, 22,
                                     23, 23, 23, 21, 21, 18.2, 25
                         ),
                         `SDPDV` = c(1.7, 2.44, 2.2, 2.2, 2.2,
                                     2.2, 2.2, 2.2, 2.2, 2.05, 2.05,
                                     2.05, 2.05, 2.05, 2.05, 2.2,
                                     2.2, 2.2, 2.2, 2.2, 2.2, 2.2,
                                     2.2, 2.4, 2, 2, 1.9, 2.05, 2.05,
                                     2.05, 2.05, 2.05, 2.05, 2.05,
                                     2.1, 2.05, 2.05, 2.05, 2.01,
                                     2.03, 1.97, 2.2, 2.2, 2.05,
                                     2.05, 2.2, 2.44, 2.2, 1.7, 1.7,
                                     2.2, 2.1, 2.1, 2, 2.06),
                         `PODUR` = c(10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 11.5, 10.5, 10.5,
                                     11.5, 11.5, 12, 12, 10, 10,
                                     10, 10, 10, 9, 10, 10.5, 10,
                                     10, 12, 10, 8, 10, 11.5, 11.2,
                                     12, 8, 8, 10, 10, 10, 10, 13,
                                     7.5, 7.5, 10, 16, 12, 10, 10
                         ),
                         `THRSH` = c(77, 78, 77, 77, 77, 77, 77,
                                     77, 77, 78, 78, 78, 78, 78,
                                     78, 76, 76, 77, 77, 77, 77,
                                     77, 77, 77, 78, 78, 78, 78,
                                     78, 78, 78, 78, 78, 78, 78,
                                     78, 78, 78, 77, 77, 77, 77,
                                     77, 77, 77, 77, 77, 78, 78,
                                     78, 77, 78, 77, 76, 78),
                         `SDPRO` = c(0.4, 0.405, 0.405, 0.405,
                                     0.405, 0.405, 0.405, 0.405,
                                     0.405, 0.4, 0.4, 0.4, 0.4, 0.4,
                                     0.4, 0.405, 0.405, 0.405, 0.405,
                                     0.405, 0.405, 0.405, 0.405,
                                     0.405, 0.4, 0.4, 0.4, 0.4, 0.4,
                                     0.4, 0.42, 0.4, 0.4, 0.4, 0.4,
                                     0.4, 0.4, 0.4, 0.405, 0.405,
                                     0.405, 0.405, 0.405, 0.405,
                                     0.405, 0.405, 0.405, 0.4, 0.4,
                                     0.4, 0.405, 0.4, 0.405, 0.4,
                                     0.4),
                         `SDLIP` = c(0.2, 0.205, 0.205, 0.205,
                                     0.205, 0.205, 0.205, 0.205,
                                     0.205, 0.2, 0.2, 0.2, 0.2, 0.2,
                                     0.2, 0.205, 0.205, 0.205, 0.205,
                                     0.205, 0.205, 0.205, 0.205,
                                     0.205, 0.2, 0.2, 0.2, 0.2, 0.2,
                                     0.2, 0.2, 0.2, 0.2, 0.2, 0.2,
                                     0.2, 0.2, 0.2, 0.205, 0.205,
                                     0.205, 0.205, 0.205, 0.205,
                                     0.205, 0.205, 0.205, 0.2, 0.2,
                                     0.2, 0.205, 0.2, 0.205, 0.2,
                                     0.2))

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
               info = "read_cul() SBGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SBGRO048.CUL")


# "read_cul() SCCAN048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", MaxPARCE = "%15.2f",
                       APFMX = "%15.3f", STKPFMAX = "%15.2f",
                       SUCA = "%15.2f", TBFT = "%15.0f", LFMAX = "%15.0f",
                       MXLFAREA = "%15.0f", MXLFARNO = "%15.0f",
                       PI1 = "%15.0f", PI2 = "%15.0f", PSWITCH = "%15.0f",
                       TTPLNTEM = "%15.0f", TTRATNEM = "%15.0f",
                       CHUPIBASE = "%15.2f", TT_POPGROWTH = "%15.0f",
                       POPTT16 = "%15.1f", TAR0 = "%15.3f", TDELAY = "%15.0f",
                       LER0 = "%15.2f", SER0 = "%15.2f", LG_AMBASE = "%15.0f",
                       AQP_UP5 = "%15.2f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SCCAN048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SCCAN048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0001",
                                    "HYP_HS", "HYP_HF", "RB7515",
                                    "CP1743", "CP1762", "CP2086",
                                    "CP2143"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "NCo376",
                                        "High-sucrose", "High-fibre",
                                        "RB867515", "CP 80-1743",
                                        "CP 88-1762", "CP 72-2086",
                                        "CP 89-2143"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "SC0013",
                                    "SC0013", "SC0014", "SC0016",
                                    "SC0013", "SC0013", "SC0013",
                                    "SC0013"),
                         `MaxPARCE` = c(5, 7, 5.7, 5.8, 6.9, 14.69,
                                        5.7, 5.7, 5.7, 5.7),
                         `APFMX` = c(0.88, 0.88, 0.88, 0.88, 0.88,
                                     0.602, 0.88, 0.88, 0.88, 0.88
                         ),
                         `STKPFMAX` = c(0.6, 0.8, 0.7, 0.65, 0.6,
                                        0.59, 0.7, 0.7, 0.7, 0.7),
                         `SUCA` = c(0.5, 0.7, 0.58, 0.63, 0.3,
                                    0.58, 0.58, 0.58, 0.58, 0.58),
                         `TBFT` = c(25, 25, 25, 25, 25, 25, 25,
                                    25, 25, 25),
                         `LFMAX` = c(10, 13, 12, 11, 13, 10, 12,
                                     12, 12, 12),
                         `MXLFAREA` = c(360, 600, 360, 400, 382,
                                        594, 360, 360, 360, 360),
                         `MXLFARNO` = c(15, 23, 15, 17, 23, 18,
                                        15, 15, 15, 15),
                         `PI1` = c(50, 90, 69, 50, 59, 89, 69,
                                   69, 69, 69),
                         `PI2` = c(107, 170, 169, 146, 117, 107,
                                   169, 169, 169, 169),
                         `PSWITCH` = c(12, 18, 18, 12, 12, 18,
                                       18, 18, 18, 18),
                         `TTPLNTEM` = c(150, 150, 80, 150, 150,
                                        150, 80, 80, 80, 80),
                         `TTRATNEM` = c(30, 50, 30, 50, 50, 30,
                                        30, 30, 30, 30),
                         `CHUPIBASE` = c(1000, 1500, 1050, 1000,
                                         1000, 1478.95, 1050, 1050,
                                         1050, 1050),
                         `TT_POPGROWTH` = c(500, 700, 600, 600,
                                            600, 1010, 600, 600,
                                            600, 600),
                         `POPTT16` = c(10, 13.5, 13.3, 10, 10,
                                       11.5, 13.3, 13.3, 13.3, 13.3
                         ),
                         `TAR0` = c(0.01, 0.045, 0.02, 0.015, 0.02,
                                    0.045, 0.02, 0.02, 0.02, 0.02
                         ),
                         `TDELAY` = c(20, 50, 50, 50, 50, 20, 50,
                                      50, 50, 50),
                         `LER0` = c(0.2, 0.3, 0.25, 0.25, 0.3,
                                    0.25, 0.25, 0.25, 0.25, 0.25),
                         `SER0` = c(0.14, 0.3, 0.14, 0.25, 0.3,
                                    0.25, 0.14, 0.14, 0.14, 0.14),
                         `LG_AMBASE` = c(220, 220, 220, 220, 220,
                                         220, 220, 220, 220, 220),
                         `AQP_UP5` = c(0.5, 0.7, 0.45, 0.45, 0.65,
                                       0.45, 0.45, 0.45, 0.45, 0.45
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
               info = "read_cul() SCCAN048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SCCAN048.CUL")


# "read_cul() SCCSP048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", LFMAX = "%6.1f",
                       PHTMX = "%6.1f", Stalk = "%6.3f", Sucro = "%6.3f",
                       Null1 = "%6.0f", PLF1 = "%6.3f", PLF2 = "%6.3f",
                       Gamma = "%6.3f", StkB = "%6.3f", StkM = "%6.3f",
                       Null3 = "%6.0f", SIZLF = "%6.0f", LIsun = "%6.3f",
                       LIshd = "%6.3f", Null4 = "%6.0f", TB_1 = "%6.1f",
                       TO1_1 = "%6.0f", TO2_1 = "%6.0f", TM_1 = "%6.0f",
                       PI1 = "%6.2f", PI2 = "%6.2f", DTPI = "%6.1f",
                       LSFAC = "%6.1f", Null5 = "%6.0f", LI1 = "%6.3f",
                       TELOM = "%6.1f", TB_2 = "%6.0f", TO1_2 = "%6.0f",
                       TO2_2 = "%6.0f", TM_2 = "%6.0f", Ph1P = "%6.1f",
                       Ph1R = "%6.0f", Ph2 = "%6.2f", Ph3 = "%6.0f",
                       Ph4 = "%6.0f", StHrv = "%6.0f", RTNFC = "%6.2f",
                       MinGr = "%6.2f", Null7 = "%6.0f", RE30C = "%6.3f",
                       RL30C = "%6.3f", R30C2 = "%6.3f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SCCSP048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SCCSP048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "CP1743",
                                    "CP1762", "CP2086", "CP2143",
                                    "IB0001", "HYP_HS", "HYP_HF",
                                    "RB7515"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "CP 80-1743",
                                        "CP 88-1762", "CP 72-2086",
                                        "CP 89-2143", "NCo376", "High-sucrose",
                                        "High-fibre", "RB867515"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "CA0001",
                                    "CA0001", "CA0002", "CA0003",
                                    "CA0001", "CA0001", "CA0001",
                                    "CA0001"),
                         `LFMAX` = c(0.8, 1.2, 1, 1, 1, 1, 1, 1,
                                     1, 1),
                         `PHTMX` = c(200, 284, 211.2, 202.3, 212.6,
                                     191.9, 211.2, 211.2, 211.2,
                                     211.2),
                         `Stalk` = c(3.4, 4.7, 3.547, 4.629, 3.458,
                                     4.296, 3.547, 3.547, 3.547,
                                     3.547),
                         `Sucro` = c(1.195, 1.83, 1.195, 1.83,
                                     1.289, 1.219, 1.195, 1.195,
                                     1.195, 1.195),
                         `Null1` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `PLF1` = c(0.382, 0.422, 0.382, 0.395,
                                    0.422, 0.386, 0.382, 0.382, 0.382,
                                    0.382),
                         `PLF2` = c(0.202, 0.379, 0.202, 0.379,
                                    0.255, 0.247, 0.202, 0.202, 0.202,
                                    0.202),
                         `Gamma` = c(0.423, 0.562, 0.562, 0.423,
                                     0.436, 0.45, 0.562, 0.562, 0.562,
                                     0.562),
                         `StkB` = c(0.515, 0.8, 0.799, 0.628, 0.515,
                                    0.638, 0.799, 0.799, 0.799, 0.799
                         ),
                         `StkM` = c(0.301, 0.367, 0.367, 0.301,
                                    0.304, 0.302, 0.367, 0.367, 0.367,
                                    0.367),
                         `Null3` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `SIZLF` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `LIsun` = c(0.552, 0.683, 0.552, 0.683,
                                     0.65, 0.584, 0.552, 0.552, 0.552,
                                     0.552),
                         `LIshd` = c(0.88, 0.919, 0.907, 0.884,
                                     0.9, 0.919, 0.907, 0.907, 0.907,
                                     0.907),
                         `Null4` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `TB_1` = c(9.5, 9.5, 9.5, 9.5, 9.5, 9.5,
                                    9.5, 9.5, 9.5, 9.5),
                         `TO1_1` = c(27, 27, 27, 27, 27, 27, 27,
                                     27, 27, 27),
                         `TO2_1` = c(32, 32, 32, 32, 32, 32, 32,
                                     32, 32, 32),
                         `TM_1` = c(45, 45, 45, 45, 45, 45, 45,
                                    45, 45, 45),
                         `PI1` = c(97.51, 101, 97.51, 97.62, 101,
                                   101, 97.51, 97.51, 97.51, 97.51
                         ),
                         `PI2` = c(98, 103, 102.6, 98.04, 101,
                                   101, 102.6, 102.6, 102.6, 102.6
                         ),
                         `DTPI` = c(999, 1100, 1051, 1005, 999.8,
                                    1091, 1051, 1051, 1051, 1051),
                         `LSFAC` = c(0.5, 0.5, 0.5, 0.5, 0.5, 0.5,
                                     0.5, 0.5, 0.5, 0.5),
                         `Null5` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `LI1` = c(0.165, 0.276, 0.165, 0.271,
                                   0.257, 0.276, 0.165, 0.165, 0.165,
                                   0.165),
                         `TELOM` = c(169.3, 174.5, 169.3, 171.5,
                                     174.5, 170.3, 169.3, 169.3,
                                     169.3, 169.3),
                         `TB_2` = c(16, 16, 16, 16, 16, 16, 16,
                                    16, 16, 16),
                         `TO1_2` = c(27, 27, 27, 27, 27, 27, 27,
                                     27, 27, 27),
                         `TO2_2` = c(32, 32, 32, 32, 32, 32, 32,
                                     32, 32, 32),
                         `TM_2` = c(45, 45, 45, 45, 45, 45, 45,
                                    45, 45, 45),
                         `Ph1P` = c(175.5, 185.5, 178.4, 177.5,
                                    185.5, 175.5, 178.4, 178.4, 178.4,
                                    178.4),
                         `Ph1R` = c(100, 100, 100, 100, 100, 100,
                                    100, 100, 100, 100),
                         `Ph2` = c(1.44, 1.44, 1.44, 1.44, 1.44,
                                   1.44, 1.44, 1.44, 1.44, 1.44),
                         `Ph3` = c(1275, 1475, 1475, 1275, 1275,
                                   1275, 1475, 1475, 1475, 1475),
                         `Ph4` = c(6300, 6300, 6300, 6300, 6300,
                                   6300, 6300, 6300, 6300, 6300),
                         `StHrv` = c(8, 8, 8, 8, 8, 8, 8, 8, 8,
                                     8),
                         `RTNFC` = c(1.62, 1.62, 1.62, 1.62, 1.62,
                                     1.62, 1.62, 1.62, 1.62, 1.62
                         ),
                         `MinGr` = c(50, 70.71, 70.71, 51.52, 60,
                                     60, 70.71, 70.71, 70.71, 70.71
                         ),
                         `Null7` = c(0L, 0L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L, 0L),
                         `RE30C` = c(0.23, 0.27, 0.27, 0.23, 0.245,
                                     0.255, 0.27, 0.27, 0.27, 0.27
                         ),
                         `RL30C` = c(1.25, 1.605, 1.521, 1.25,
                                     1.605, 1.6, 1.521, 1.521, 1.521,
                                     1.521),
                         `R30C2` = c(3.602, 4.12, 4.096, 4.12,
                                     3.602, 4.071, 4.096, 4.096,
                                     4.096, 4.096))

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
               info = "read_cul() SCCSP048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SCCSP048.CUL")


# "read_cul() SCSAM048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", MAXGL = "%15.0f",
                       N_LF_STK_EM = "%15.0f", N_LF_IT_FORM = "%15.0f",
                       MAXDGL = "%15.0f", AMAX = "%15.1f", EFF = "%15.3f",
                       CHUSTK = "%15.0f", CHUPEAK = "%15.0f",
                       CHUDEC = "%15.0f", CHUMAT = "%15.0f",
                       POPMAT = "%15.1f", POPPEAK = "%15.0f",
                       TILLOCHRON = "%15.1f", PHYLLOCHRON = "%15.0f",
                       SLA = "%15.0f", MLA = "%15.0f", PLASTOCHRON = "%15.0f",
                       INIT_LF_AREA = "%15.0f", MAX_INI_LA = "%15.0f",
                       MAX_IT_DW = "%15.0f", MID_TT_IT_GRO = "%15.0f",
                       END_TT_IT_GRO = "%15.0f", MID_TT_LF_GRO = "%15.0f",
                       END_TT_LF_GRO = "%15.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SCSAM048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SCSAM048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "RB7515",
                                    "IB0001", "HYP_HS", "HYP_HF",
                                    "CP1743", "CP1762", "CP2086",
                                    "CP2143"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "RB867515",
                                        "NCo376", "High-sucrose",
                                        "High-fibre", "CP 80-1743",
                                        "CP 88-1762", "CP 72-2086",
                                        "CP 89-2143"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "SC0001",
                                    "SC0001", "SC0001", "SC0001",
                                    "SC0001", "SC0001", "SC0001",
                                    "SC0001"),
                         `MAXGL` = c(10, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12),
                         `N_LF_STK_EM` = c(3, 8, 4, 4, 4, 4, 4,
                                           4, 4, 4),
                         `N_LF_IT_FORM` = c(3, 8, 3, 3, 3, 3, 3,
                                            3, 3, 3),
                         `MAXDGL` = c(6, 12, 6, 6, 6, 6, 6, 6,
                                      6, 6),
                         `AMAX` = c(41.3, 60.7, 44.9, 44.9, 44.9,
                                    44.9, 44.9, 44.9, 44.9, 44.9),
                         `EFF` = c(0, 0.1, 0.069, 0.069, 0.069,
                                   0.069, 0.069, 0.069, 0.069, 0.069
                         ),
                         `CHUSTK` = c(404, 1050, 650, 650, 650,
                                      650, 650, 650, 650, 650),
                         `CHUPEAK` = c(400, 1950, 1400, 1400, 1400,
                                       1400, 1400, 1400, 1400, 1400
                         ),
                         `CHUDEC` = c(1200, 1800, 1600, 1600, 1600,
                                      1600, 1600, 1600, 1600, 1600
                         ),
                         `CHUMAT` = c(1500, 3900, 3200, 3200, 3200,
                                      3200, 3200, 3200, 3200, 3200
                         ),
                         `POPMAT` = c(6, 18, 9.5, 9.5, 9.5, 9.5,
                                      9.5, 9.5, 9.5, 9.5),
                         `POPPEAK` = c(17, 30, 22, 22, 22, 22,
                                       22, 22, 22, 22),
                         `TILLOCHRON` = c(48.1, 134.8, 69, 69,
                                          69, 69, 69, 69, 69, 69),
                         `PHYLLOCHRON` = c(107, 200, 132, 132,
                                           132, 132, 132, 132, 132,
                                           132),
                         `SLA` = c(56, 158, 120, 120, 120, 120,
                                   120, 120, 120, 120),
                         `MLA` = c(450, 800, 600, 600, 600, 600,
                                   600, 600, 600, 600),
                         `PLASTOCHRON` = c(107, 200, 132, 132,
                                           132, 132, 132, 132, 132,
                                           132),
                         `INIT_LF_AREA` = c(10, 30, 15, 15, 15,
                                            15, 15, 15, 15, 15),
                         `MAX_INI_LA` = c(80, 180, 120, 120, 120,
                                          120, 120, 120, 120, 120
                         ),
                         `MAX_IT_DW` = c(18, 35, 28, 28, 28, 28,
                                         28, 28, 28, 28),
                         `MID_TT_IT_GRO` = c(380, 700, 400, 400, 400, 400, 400, 400, 400, 400),
                         `END_TT_IT_GRO` = c(600, 1400, 1200, 1200, 1200, 1200, 1200, 1200, 1200, 1200),
                         `MID_TT_LF_GRO` = c(400, 800, 700, 700, 700, 700, 700, 700, 700, 700),
                         `END_TT_LF_GRO` = c(1100, 1500, 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300))

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
               info = "read_cul() SCSAM048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SCSAM048.CUL")


# "read_cul() SFGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.0f",
                       PPSEN = "%6.3f", "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.1f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SFGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SFGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0001",
                                    "IB0002", "IB0003", "UH0001",
                                    "UH0002"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "PI8311",
                                        "99OL", "Nutrisaff", "Goldschopf",
                                        "Thornless Safflo"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     "wer  ."),
                         `ECO#` = c("DFAULT", "DFAULT", "SF0401",
                                    "SF0401", "SF0401", "BW0001",
                                    "BW0002"),
                         `CSDL` = c(23, 23, 23, 23, 23, 23, 23),
                         `PPSEN` = c(0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001),
                         `EM-FL` = c(10.3, 16.5, 16.5, 16.5, 16.5,
                                     10.3, 10.3),
                         `FL-SH` = c(4, 4.5, 3.2, 3.2, 3.2, 4.5,
                                     4.5),
                         `FL-SD` = c(13, 13.5, 14.7, 14.7, 14.7,
                                     13, 13),
                         `SD-PM` = c(28.5, 30.5, 30.5, 30.5, 30.5,
                                     28.5, 28.5),
                         `FL-LF` = c(18, 20.25, 20.25, 20.25, 20.25,
                                     18, 18),
                         `LFMAX` = c(1.55, 1.8, 1.4, 1.4, 1.4,
                                     1.55, 1.8),
                         `SLAVR` = c(250, 275, 250, 250, 250, 250,
                                     260),
                         `SIZLF` = c(115, 115, 115, 115, 115, 115,
                                     115),
                         `XFRT` = c(0.66, 0.76, 0.64, 0.64, 0.64,
                                    0.67, 0.76),
                         `WTPSD` = c(0.052, 0.064, 0.052, 0.052,
                                     0.052, 0.064, 0.052),
                         `SFDUR` = c(29, 30, 29, 29, 29, 30, 30
                         ),
                         `SDPDV` = c(18, 22.25, 18, 18, 18, 22.25,
                                     22.25),
                         `PODUR` = c(17, 19, 18, 18, 18, 19, 17
                         ),
                         `THRSH` = c(46, 61, 46.5, 46.5, 46.5,
                                     55, 61),
                         `SDPRO` = c(0.14, 0.14, 0.14, 0.14, 0.14,
                                     0.14, 0.14),
                         `SDLIP` = c(0.33, 0.33, 0.33, 0.33, 0.33,
                                     0.33, 0.33))

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
               info = "read_cul() SFGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SFGRO048.CUL")


# "read_cul() SGCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P2 = "%6.0f", P2O = "%6.1f", P2R = "%6.1f",
                       PANTH = "%6.1f", P3 = "%6.1f", P4 = "%6.1f",
                       P5 = "%6.0f", PHINT = "%6.0f", G1 = "%6.1f",
                       G2 = "%6.1f", PBASE = "%6f", PSAT = "%6f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SGCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SGCER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "990001",
                                    "990002", "990003", "990004",
                                    "IB0001", "IB0002", "IB0003",
                                    "IB0004", "IB0005", "IB0006",
                                    "IB0007", "IB0008", "IB0009",
                                    "IB0010", "IB0011", "IB0012",
                                    "IB0013", "IB0014", "IB0015",
                                    "IB0016", "IB0017", "IB0018",
                                    "IB0019", "IB0020", "IB0021",
                                    "IB0022", "IB0023", "IB0024",
                                    "IB0025", "IB0026", "IB0027",
                                    "IB0028", "IB0029", "IB0030",
                                    "IB0031", "IB0032", "IB0040",
                                    "IB0041", "IB0042", "IB0043",
                                    "IB0044", "IB0046", "IB0047",
                                    "IB0048", "IB0049", "IB0050",
                                    "IB0051", "IB0052", "IB0053",
                                    "IB0054", "IB0055", "IB0056",
                                    "IB0057", "IB0058", "IB0059"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "N.AMERICAN",
                                        "INDIAN", "AUSTRALIAN", "W.AFRICAN",
                                        "RIO", "9188", "BRANDES",
                                        "MN1500", "HEGARI", "100M",
                                        "80M", "60M", "SM100", "SM80",
                                        "SM60", "REDLON", "CAPROCK",
                                        "ATx378XRTx7000", "ATx623",
                                        "RTx430", "ATx623XRTx430",
                                        "BTx3197", "RTx7078", "TX 610",
                                        "WHEATLAND", "ATx399XRTx430",
                                        "ATx378XRTx430", "ATx623XRTx7000",
                                        "38M", "CSH-1", "DE KALB 46",
                                        "PIONEER 8333", "DK", "PIONEER 8515",
                                        "RS 626", "DK- E57", "RS610",
                                        "NK212", "PIONEER 846", "CSH-6",
                                        "CSH-6*", "M-35-1", "SPV-504",
                                        "CSH-5", "CSH-9", "SPH-388",
                                        "CARGIL_1090", "CARGIL DR.1125",
                                        "CARGIL 837", "ORGO-G-EXTRA",
                                        "PIONEER 850", "CSM335",
                                        "CSM63E", "Fadda", "IS15401"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0002",
                                    "IB0002", "IB0002", "IB0002"),
                         `P1` = c(200, 500, 360, 410, 460, 413,
                                  430, 393, 374, 495, 273, 291, 337,
                                  337, 365, 356, 365, 393, 393, 384,
                                  380, 400, 390, 411, 421, 180, 365,
                                  393, 411, 374, 291, 410, 325, 325,
                                  200, 275, 300, 325, 460, 420, 480,
                                  410, 320, 320, 310, 255, 225, 232,
                                  460, 460, 460, 460, 460, 400, 300,
                                  300, 500),
                         `P2` = c(102, 300, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 102, 102,
                                  102, 102, 102, 102, 102, 252, 102,
                                  252, 300),
                         `P2O` = c(11, 17, 12.5, 13.6, 12.5, 13.6,
                                   11.6, 13, 11, 11.8, 11.5, 11,
                                   12.6, 12.8, 13, 12, 12.2, 12.5,
                                   12.8, 11.3, 13, 13, 13, 13, 14.4,
                                   16.5, 12.5, 12.8, 12.5, 13, 13,
                                   13.6, 15.5, 15.5, 15.5, 15.5,
                                   15.5, 15.5, 12.5, 15.5, 12.5,
                                   13.6, 13.5, 14, 13, 13.5, 13.5,
                                   12.5, 12.5, 12.5, 12.5, 12.5,
                                   12.5, 12.8, 12.8, 12.8, 12.8),
                         `P2R` = c(1, 300, 30, 40, 90, 40, 24,
                                   23, 116, 139, 136, 127, 262, 290,
                                   45, 74, 74, 30, 84, 24, 35, 123,
                                   35, 108, 221, 1, 30, 40, 20, 14,
                                   12, 40, 30, 30, 12, 30, 30, 30,
                                   90, 30, 190, 40, 180, 45.6, 35,
                                   40.5, 45.1, 43.7, 90, 90, 90,
                                   90, 90, 1000, 100, 1000, 1800),
                         `PANTH` = c(617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 617.5, 617.5,
                                     617.5, 617.5, 647.5, 617.5,
                                     640.5),
                         `P3` = c(152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 152.5, 152.5,
                                  152.5, 152.5, 152.5, 252.5, 142.5,
                                  152.5, 300.5),
                         `P4` = c(81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 81.5, 81.5, 81.5, 81.5, 81.5,
                                  81.5, 61.5, 81.5, 81.5),
                         `P5` = c(300, 700, 540, 540, 600, 640,
                                  540, 540, 540, 540, 540, 540, 540,
                                  540, 540, 540, 540, 540, 540, 540,
                                  540, 540, 540, 540, 540, 580, 540,
                                  540, 540, 540, 540, 640, 540, 540,
                                  540, 500, 400, 450, 600, 500, 650,
                                  510, 540, 556, 554, 490, 573, 590,
                                  600, 600, 600, 600, 600, 400, 450,
                                  350, 350),
                         `PHINT` = c(49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 49, 49, 49,
                                     49, 49, 49, 49, 60, 55, 49,
                                     55),
                         `G1` = c(0, 22, 0, 3, 5, 3, 0, 0, 0, 0,
                                  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                  0, 0, 0, 0, 22, 0, 0, 0, 0, 0,
                                  3, 9, 11, 0, 0, 0, 13, 5, 13, 5,
                                  7, 7, 15, 15, 10, 10, 10, 5, 5,
                                  5, 5, 5, 10, 16, 10, 0.5),
                         `G2` = c(2, 6, 6, 5.5, 6, 6.5, 6, 6, 6,
                                  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                  6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                  6.5, 6, 6, 6, 6, 6, 6, 6, 6, 5,
                                  4.5, 5.5, 4.5, 4.5, 5.5, 5.5, 4.5,
                                  6, 6, 6, 6, 6, 3, 3, 6, 2),
                         `PBASE` = c(NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_,
                                     NA_real_, NA_real_, NA_real_
                         ),
                         `PSAT` = c(NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_,
                                    NA_real_, NA_real_, NA_real_))

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
               info = "read_cul() SGCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SGCER048.CUL")


# "read_cul() SUGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", CSDL = "%6.0f",
                       PPSEN = "%6.3f", "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.1f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.1f", LFMAX = "%6.1f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.1f",
                       THRSH = "%6.0f", SDPRO = "%6.2f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SUGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SUGRO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0009",
                                    "IB0013", "IB0014", "IB0015",
                                    "IB0019", "IB0018", "IB0029",
                                    "IB0020", "IB0021", "IB0022"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "E-353",
                                        "SUNGRO-385", "SW-101", "S-530",
                                        "Sungold", "Hysun-33", "Hysun-38",
                                        "Pioneer 64A93", "Heliasol RM",
                                        "Melody"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", "."
                         ),
                         `ECO#` = c("DFAULT", "DFAULT", "SU0702",
                                    "SU0702", "SU0702", "SU0702",
                                    "SU0702", "SU0702", "SU0702",
                                    "SU0702", "SU0702", "SU0702"),
                         `CSDL` = c(15, 15, 15, 15, 15, 15, 15,
                                    15, 15, 15, 15, 15),
                         `PPSEN` = c(-0.085, -0.09, -0.086, -0.086,
                                     -0.086, -0.086, -0.086, -0.19,
                                     -0.19, -0.19, -0.086, -0.086
                         ),
                         `EM-FL` = c(15, 21, 18.6, 20.6, 17.6,
                                     22, 17.6, 20.4, 20.2, 20.2,
                                     17.6, 17.6),
                         `FL-SH` = c(5, 7.5, 6.5, 7, 5.5, 6.5,
                                     5.5, 6, 6, 6.5, 5.5, 5.5),
                         `FL-SD` = c(10, 13, 12.2, 12.2, 10.2,
                                     12.5, 10.2, 11.3, 11.7, 12.2,
                                     10.2, 10.2),
                         `SD-PM` = c(24, 31, 25, 29, 30, 29, 28.4,
                                     27.5, 29, 27.6, 28.4, 28.4),
                         `FL-LF` = c(14, 14.5, 14, 14.5, 14, 15,
                                     14, 14, 14, 14, 14, 14),
                         `LFMAX` = c(1.8, 2.2, 1.9, 2.1, 1.9, 2.1,
                                     1.9, 1.9, 1.9, 1.9, 1.9, 1.9
                         ),
                         `SLAVR` = c(220, 280, 260, 260, 260, 260,
                                     260, 260, 260, 260, 240, 240
                         ),
                         `SIZLF` = c(180, 220, 200, 200, 200, 200,
                                     200, 200, 200, 200, 200, 200
                         ),
                         `XFRT` = c(0.7, 0.85, 0.8, 0.74, 0.72,
                                    0.74, 0.74, 0.7, 0.69, 0.7, 0.76,
                                    0.76),
                         `WTPSD` = c(0.05, 0.12, 0.11, 0.07, 0.09,
                                     0.07, 0.06, 0.07, 0.07, 0.07,
                                     0.06, 0.06),
                         `SFDUR` = c(22, 26, 24, 24, 24, 24, 24,
                                     24, 24, 24, 24, 24),
                         `SDPDV` = c(1.8, 2.2, 2, 2, 2, 2, 2, 2,
                                     2, 2, 2, 2),
                         `PODUR` = c(4.5, 4.5, 4.5, 4.5, 4.5, 4.5,
                                     4.2, 4.5, 4.5, 4.5, 4.2, 4.2
                         ),
                         `THRSH` = c(65, 75, 73, 69, 68, 69, 68,
                                     68, 68, 68, 68, 68),
                         `SDPRO` = c(0.14, 0.14, 0.14, 0.14, 0.14,
                                     0.14, 0.14, 0.14, 0.14, 0.14,
                                     0.14, 0.14),
                         `SDLIP` = c(0.42, 0.49, 0.45, 0.48, 0.43,
                                     0.45, 0.48, 0.45, 0.45, 0.45,
                                     0.48, 0.48))

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
               info = "read_cul() SUGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SUGRO048.CUL")


# "read_cul() SUOIL048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", P1 = "%6.1f", P2 = "%6.2f",
                       P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.2f",
                       O1 = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SUOIL048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SUOIL048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0003",
                                    "IB0005", "IB0008", "IB0009",
                                    "IB0011", "IB0013", "IB0014",
                                    "IB0015", "IB0016", "IB0017",
                                    "IB0019", "IB0021", "IB0022",
                                    "IB0018", "IB0029", "IB0020",
                                    "IB0030"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "894",
                                      "SUNGRO-380", "SH-3000", "E-353",
                                      "FLORASOL", "SUNGRO-385", "SW-101",
                                      "S-530", "G-100", "CONTIFLOR-3",
                                      "Sungold", "Heliasol_RM", "Melody",
                                      "Hysun-33", "Hysun-38", "Pioneer 64A93",
                                      "E-353 long"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     "."),
                         `ECO#` = c("DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT", "DFAULT", "DFAULT",
                                    "DFAULT"),
                         `P1` = c(100, 450, 274, 295, 250, 245,
                                  360, 325, 210, 335, 309, 325.5,
                                  320, 285, 290, 435, 438, 444, 300
                         ),
                         `P2` = c(0, 15, 9.33, 12.32, 2.45, 3.74,
                                  1.6, 12.32, 3.74, 12.32, 2.99,
                                  0.14, 3.74, 3.74, 3.74, 1, 1, 1,
                                  3.74),
                         `P5` = c(300, 950, 600, 600, 600, 600,
                                  600, 600, 660, 600, 732, 712, 600,
                                  850, 850, 585, 570, 560, 600),
                         `G2` = c(500, 4000, 2800, 2800, 2800,
                                  1500, 2800, 2800, 520, 3700, 2800,
                                  2900, 3000, 1108, 1500, 1193, 1276,
                                  1260, 1500),
                         `G3` = c(1.5, 3.5, 1.8, 1.8, 1.7, 3.35,
                                  1.8, 1.8, 2.69, 2, 1.8, 1.67, 3.3,
                                  1.65, 3.4, 2.33, 2.33, 2.44, 3.35
                         ),
                         `O1` = c(60, 87, 65, 65, 65, 85, 65, 65,
                                  65, 65, 65, 65, 65, 65, 65, 54,
                                  56, 65, 85))

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
               info = "read_cul() SUOIL048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SUOIL048.CUL")


# "read_cul() SWCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", P1 = "%6.0f", P2 = "%6.1f",
                       P5 = "%6.0f", G2 = "%6.0f", G3 = "%6.1f",
                       PHINT = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/SWCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() SWCER048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "SW0001",
                                    "SW0002", "SW0003"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "GSS0966 sh2",
                                      "Saturn sh2", "BSS0977 sh2"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001"),
                         `P1` = c(150, 180, 150, 180, 175),
                         `P2` = c(0.3, 0.3, 0.3, 0.3, 0.3),
                         `P5` = c(680, 738, 680, 738, 700),
                         `G2` = c(600, 850, 600, 850, 500),
                         `G3` = c(5.5, 15, 5.5, 15, 5),
                         `PHINT` = c(35, 50, 43, 35, 50))

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
               info = "read_cul() SWCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() SWCER048.CUL")


# "read_cul() TFAPS048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", VSEN = "%6.0f", PPSEN = "%6.1f",
                       P1 = "%6.0f", P5 = "%6.0f", PHINT = "%6.0f",
                       GRNO = "%6.0f", MXFIL = "%6.1f", STMMX = "%6.0f",
                       SLAP1 = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/TFAPS048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() TFAPS048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0135",
                                    "IB0136", "IB0157", "IB0161",
                                    "IB0221", "IB0244", "IB0245",
                                    "IB0246", "IB0247", "IB0248",
                                    "IB0249", "IB0250", "IB0251",
                                    "IB0252", "IB0253", "IB0254",
                                    "IB0255", "IB0256", "IB0257",
                                    "IB0304"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Keyh (local)",
                                      "DZ-974 & Keyh", "DZ-Cr-387",
                                      "DZ-01-354", "UK Brown", "PI 193508",
                                      "PI 193514", "PI 557457", "PI 494366",
                                      "UK White", "PI 494465", "PI 273889",
                                      "Dessie", "PI 347632", "PI 494432",
                                      "PI 195932", "PI 329680", "PI 494479",
                                      "PI 494433", "Wajera (local)"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004", "IB0004", "IB0004",
                                    "IB0004"),
                         `VSEN` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1),
                         `PPSEN` = c(14, 19, 18, 18, 18, 18, 16.5,
                                     19, 19, 17, 14, 18, 19, 19,
                                     16.5, 19, 15.5, 19, 19, 19,
                                     19, 18),
                         `P1` = c(100, 100, 100, 100, 100, 100,
                                  100, 100, 100, 100, 100, 100, 100,
                                  100, 100, 100, 100, 100, 100, 100,
                                  100, 100),
                         `P5` = c(100, 700, 600, 500, 100, 550,
                                  450, 200, 200, 600, 700, 450, 140,
                                  190, 500, 190, 500, 200, 200, 200,
                                  140, 200),
                         `PHINT` = c(70, 120, 110, 105, 120, 100,
                                     100, 100, 105, 75, 70, 85, 120,
                                     105, 80, 105, 100, 105, 105,
                                     105, 120, 80),
                         `GRNO` = c(16, 36, 16, 16, 32, 16, 16,
                                    28, 16, 16, 16, 16, 16, 27, 32,
                                    32, 26, 16, 16, 16, 16, 36),
                         `MXFIL` = c(1, 1.8, 1, 1, 1.3, 1, 1, 1.1,
                                     1, 1, 1, 1, 1, 1, 1.2, 1.8,
                                     1, 1, 1, 1, 1, 1),
                         `STMMX` = c(1, 3, 3, 1, 3, 3, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 3),
                         `SLAP1` = c(400, 400, 400, 400, 400, 400,
                                     400, 400, 400, 400, 400, 400,
                                     400, 400, 400, 400, 400, 400,
                                     400, 400, 400, 400))

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
               info = "read_cul() TFAPS048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() TFAPS048.CUL")


# "read_cul() TFCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.1f",
                       P2R = "%6.2f", P5 = "%6.1f", P2O = "%6.2f",
                       G1 = "%6.0f", G2 = "%6.4f", G3 = "%6.3f",
                       PHINT = "%6.0f", THOT = "%6.2f", TCLDP = "%6.0f",
                       TCLDF = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/TFCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() TFCER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0304",
                                    "IB0306", "IB0135", "IB0136",
                                    "IB0156", "IB0157", "IB0158",
                                    "IB0161", "IB0162", "IB0163",
                                    "IB0164", "IB0221", "IB0244",
                                    "IB0245", "IB0246", "IB0247",
                                    "IB0248", "IB0249", "IB0250",
                                    "IB0251", "IB0252", "IB0253",
                                    "IB0254", "IB0255", "IB0256",
                                    "IB0257", "IB0166", "IB0167"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "Wajera(local)",
                                        "Buseye", "Keyh (local)",
                                        "DZ-974 & Keyh", "DZ-Cr-387",
                                        "DZ-Cr-387", "DZ-Cr-387",
                                        "DZ-01-354", "DZ-01-354",
                                        "DZ-Cr-37", "DZ-Cr-3186",
                                        "UK Brown", "PI 193508",
                                        "PI 193514", "PI 557457",
                                        "PI 494366", "UK White",
                                        "PI 494465", "PI 273889",
                                        "Dessie", "PI 347632", "PI 494432",
                                        "PI 195932", "PI 329680",
                                        "PI 494479", "PI 494433",
                                        "DZ-01-354", "DZ-01-354"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", "."
                         ),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001"),
                         `P1` = c(100, 880, 135, 135, 140, 140,
                                  140, 140, 190, 120, 105, 165, 145,
                                  140, 140, 140, 140, 140, 140, 140,
                                  140, 140, 140, 140, 140, 140, 140,
                                  140, 281.5, 115.6),
                         `P2R` = c(5, 300, 50, 50, 50, 50, 50,
                                   50, 50, 50, 50, 50, 50, 50, 50,
                                   50, 50, 50, 50, 50, 50, 50, 50,
                                   50, 50, 50, 50, 50, 237.2, 37.79
                         ),
                         `P5` = c(150, 850, 265, 255, 260, 260,
                                  285, 260, 250, 250, 270, 240, 250,
                                  260, 260, 260, 260, 260, 260, 260,
                                  260, 260, 260, 260, 260, 260, 260,
                                  260, 211, 614.5),
                         `P2O` = c(11, 14, 13, 13, 13, 13, 12,
                                   13, 13, 14, 13, 13, 13, 13, 13,
                                   13, 13, 13, 13, 13, 13, 13, 13,
                                   13, 13, 13, 13, 13, 12.57, 11.62
                         ),
                         `G1` = c(50, 9999, 9800, 9800, 9500, 9500,
                                  9500, 9500, 9500, 9990, 9990, 9990,
                                  9990, 9500, 9500, 9500, 9500, 9500,
                                  9500, 9500, 9500, 9500, 9500, 9500,
                                  9500, 9500, 9500, 9500, 7561, 8720
                         ),
                         `G2` = c(2e-04, 0.03, 3e-04, 3e-04, 3e-04,
                                  3e-04, 3e-04, 3e-04, 3e-04, 3e-04,
                                  3e-04, 3e-04, 3e-04, 0.003, 0.003,
                                  0.003, 0.003, 0.003, 0.003, 0.003,
                                  0.003, 0.003, 0.003, 0.003, 0.003,
                                  0.003, 0.003, 0.003, 0.001, 0.022
                         ),
                         `G3` = c(0.7, 1.5, 1.3, 1, 1, 1, 1, 1,
                                  1, 1.3, 1.1, 1.1, 1.1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                  1, 0.824, 1.295),
                         `PHINT` = c(50, 90, 50, 50, 50, 50, 50,
                                     50, 50, 50, 50, 50, 50, 50,
                                     50, 50, 50, 50, 50, 50, 50,
                                     50, 50, 50, 50, 50, 50, 50,
                                     50, 50),
                         `THOT` = c(25, 34, 28, 28, 28, 28, 28,
                                    28, 28, 28, 28, 28, 28, 28, 28,
                                    28, 28, 28, 28, 28, 28, 28, 28,
                                    28, 28, 28, 28, 28, 27.51, 25.49
                         ),
                         `TCLDP` = c(9, 18, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10),
                         `TCLDF` = c(9, 20, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10))

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
               info = "read_cul() TFCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() TFCER048.CUL")


# "read_cul() TMGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.0f",
                       "EM-FL" = "%6.1f", "FL-SH" = "%6.1f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.1f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.3f",
                       SFDUR = "%6.0f", SDPDV = "%6.0f", PODUR = "%6.0f",
                       THRSH = "%6.1f", SDPRO = "%6.1f", SDLIP = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/TMGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() TMGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "TM0001",
                                    "TM0002", "TM0005", "TM0007"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Florida 47 2010",
                                      "Solarset 2010 Ca", "Agriset 761 10'",
                                      "Sunny S-D 2010 C"),
                         `EXPNO` = c(".", ".", "Cal  .", "l    .",
                                     "Cal  .", "al   ."),
                         `ECO#` = c("DFAULT", "DFAULT", "TM0001",
                                    "TM0001", "TM0001", "TM0001"),
                         `CSDL` = c(12.33, 12.33, 12.33, 12.33,
                                    12.33, 12.33),
                         `PPSEN` = c(0, 0, 0, 0, 0, 0),
                         `EM-FL` = c(24.4, 31, 24.4, 31, 24.4,
                                     24.4),
                         `FL-SH` = c(2.2, 4.6, 2.2, 4.6, 2.2, 3
                         ),
                         `FL-SD` = c(19, 21, 19, 21, 19, 19),
                         `SD-PM` = c(45, 47, 45.2, 47, 45.2, 45.2
                         ),
                         `FL-LF` = c(47, 52, 52, 47, 52, 52),
                         `LFMAX` = c(1.36, 1.36, 1.36, 1.36, 1.36,
                                     1.36),
                         `SLAVR` = c(300, 300, 300, 300, 300, 300
                         ),
                         `SIZLF` = c(300, 300, 300, 300, 300, 300
                         ),
                         `XFRT` = c(0.73, 0.78, 0.78, 0.78, 0.78,
                                    0.73),
                         `WTPSD` = c(0.004, 0.004, 0.004, 0.004,
                                     0.004, 0.004),
                         `SFDUR` = c(26, 27, 26, 27, 26, 26),
                         `SDPDV` = c(300, 300, 300, 300, 300, 300
                         ),
                         `PODUR` = c(54, 58, 55, 56, 54, 58),
                         `THRSH` = c(8.5, 8.5, 8.5, 8.5, 8.5, 8.5
                         ),
                         `SDPRO` = c(0.3, 0.3, 0.3, 0.3, 0.3, 0.3
                         ),
                         `SDLIP` = c(0.05, 0.05, 0.05, 0.05, 0.05,
                                     0.05))

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
               info = "read_cul() TMGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() TMGRO048.CUL")


# "read_cul() TNARO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P3 = "%6.0f", P4 = "%6.0f", P5 = "%6.0f",
                       G2 = "%6.0f", G3 = "%6.1f", G4 = "%6.0f",
                       PHINT = "%6.0f", PCINT = "%6.0f", PCGRD = "%6.2f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/TNARO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() TNARO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0005",
                                    "IB0006", "IB0007"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "KELLY",
                                        "BLANCA", "MORANDA"),
                         `EXPNO` = c(".", ".", ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", NA, NA,
                                    NA),
                         `P1` = c(1400L, 1600L, 1500L, 1540L, 1440L
                         ),
                         `P3` = c(1200L, 3000L, 1200L, 1500L, 3000L
                         ),
                         `P4` = c(400L, 1000L, 400L, 900L, 1000L
                         ),
                         `P5` = c(600L, 1850L, 600L, 1850L, 1000L
                         ),
                         `G2` = c(1, 1, 1, 1, 1),
                         `G3` = c(1, 1.5, 1.5, 1, 1),
                         `G4` = c(1, 1, 1, 1, 1),
                         `PHINT` = c(150, 150, 150, 150, 150),
                         `PCINT` = c(122, 150, 150, 122, 120),
                         `PCGRD` = c(0, 2.03, 0, 1.75, 2.03))

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
               info = "read_cul() TNARO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() TNARO048.CUL")


# "read_cul() TRARO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       EXPNO = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P3 = "%6.0f", P4 = "%6.0f", P5 = "%6.0f",
                       G2 = "%6.1f", G3 = "%6.2f", G4 = "%6.1f",
                       PHINT = "%6.0f", PCINT = "%6.0f", PCGRD = "%7.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/TRARO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() TRARO048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "IB0001",
                                    "IB0002", "IB0003", "IB0004",
                                    "IB0008", "IB0009", "IB0010"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "LEHUA",
                                        "BUN LONG", "SAMOA HYBRID",
                                        "TAUSALA-SAMOA", "BLANCA",
                                        "LILA", "LEHUA-MAUI"),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", "."),
                         `ECO#` = c("DFAULT", "DFAULT", "IB0001",
                                    "IB0001", "IB0001", "IB0001",
                                    "IB0001", "IB0001", "IB0001"),
                         `P1` = c(700L, 1200L, 800L, 700L, 1200L,
                                  1200L, 1200L, 1200L, 1150L),
                         `P3` = c(900L, 1500L, 1130L, 900L, 1000L,
                                  1000L, 1500L, 900L, 1200L),
                         `P4` = c(600L, 1600L, 940L, 1600L, 900L,
                                  900L, 600L, 1300L, 1050L),
                         `P5` = c(700L, 1000L, 980L, 800L, 700L,
                                  700L, 900L, 1000L, 900L),
                         `G2` = c(1, 2, 1, 1, 1, 1, 1, 1, 2.5),
                         `G3` = c(1, 1.3, 1, 1.3, 1, 1, 0.85, 1.3,
                                  0.65),
                         `G4` = c(1, 1.5, 1, 1.5, 1, 1, 1, 1, 1.1
                         ),
                         `PHINT` = c(150, 150, 150, 150, 150, 150,
                                     150, 150, 150),
                         `PCINT` = c(120, 120, 120, 120, 120, 120,
                                     120, 120, 120),
                         `PCGRD` = c(1, 1, 1, 1, 1, 1, 1, 1, 1))

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
               info = "read_cul() TRARO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() TRARO048.CUL")


# "read_cul() VBGRO048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.0f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.0f", WTPSD = "%6.1f",
                       SFDUR = "%6.0f", SDPDV = "%6.1f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/VBGRO048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() VBGRO048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "CC0001",
                                    "CC0002", "CC0003", "CC0004",
                                    "CC0005", "CC0006", "CC0007",
                                    "CC0008", "CI0003", "CI0004",
                                    "CI0005", "CI0006", "CI0007",
                                    "CI0008", "CI0009", "CI0010",
                                    "CI0011", "CI0012", "CI0013",
                                    "IT0002"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "Georgia",
                                      "Rayada", "Tlaltizapan", "Honduras",
                                      "Ghana", "Br.IITABenin", "Litoral Atlant",
                                      "CIAT 9394", "Veracruz Mottle",
                                      "Veracruz Black", "Veracruz White",
                                      "Malawi Black", "Zim.BlackMottle",
                                      "Tamulte", "Frailesca", "Braziljaspeada",
                                      "Brazil", "Cochinensis", "Africa Utilis",
                                      "IRZ"),
                         `EXPNO` = c(".", ".", ".", ".", "2,3",
                                     ".", ".", ".", ".", ".", ".",
                                     "2,4", "2,3", ".", ".", ".",
                                     ".", ".", ".", ".", ".", "."
                         ),
                         `ECO#` = c("999991", "999992", "VB0002",
                                    "VB0001", "VB0001", "VB0001",
                                    "VB0001", "VB0001", "VB0001",
                                    "VB0001", "VB0001", "VB0001",
                                    "VB0001", "VB0002", "VB0002",
                                    "VB0001", "VB0001", "VB0001",
                                    "VB0001", "VB0001", "VB0001",
                                    "VB0001"),
                         `CSDL` = c(12, 12, 12, 12, 12, 12, 12,
                                    12, 12, 12, 12, 12, 12, 12, 12,
                                    12, 12, 12, 12, 12, 12, 12),
                         `PPSEN` = c(0.6, 0.6, 0.6, 0.6, 0.3864,
                                     0.6, 0.6, 0.6, 0.6, 0.6, 0.6,
                                     0.6595, 0.6241, 0.6, 0.6, 0.6,
                                     0.6, 0.6, 0.6, 0.6, 0.6, 0.6
                         ),
                         `EM-FL` = c(30, 90, 30, 60, 59.07, 85,
                                     85, 85, 85, 85, 62, 57.92, 55.77,
                                     30, 45, 62, 60, 58, 58, 58,
                                     58, 58),
                         `FL-SH` = c(5, 6, 5, 6, 6, 6, 6, 6, 6,
                                     6, 6, 6, 6, 5, 6, 6, 6, 6, 6,
                                     6, 6, 6),
                         `FL-SD` = c(10, 15, 10, 13, 13, 13, 13,
                                     13, 13, 13, 13, 15, 13, 10,
                                     13, 13, 13, 13, 13, 13, 13,
                                     13),
                         `SD-PM` = c(40, 80, 60, 70, 44.95, 70,
                                     70, 70, 70, 70, 70, 55.49, 60,
                                     65, 65.15, 80, 80, 80, 80, 80,
                                     80, 80),
                         `FL-LF` = c(15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15, 15, 15, 15, 15, 15, 15,
                                     15),
                         `LFMAX` = c(1.03, 1.03, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03,
                                     1, 1, 1, 1.03, 1.03, 1.03, 1.03,
                                     1.03, 1.03, 1.03, 1.03, 1.03
                         ),
                         `SLAVR` = c(400, 500, 400, 400, 450, 450,
                                     400, 400, 400, 400, 455, 500,
                                     500, 270, 400, 455, 455, 455,
                                     455, 455, 455, 455),
                         `SIZLF` = c(200, 500, 235, 325, 500, 400,
                                     485, 400, 400, 400, 540, 400,
                                     500, 400, 400, 545, 400, 500,
                                     500, 500, 500, 500),
                         `XFRT` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1),
                         `WTPSD` = c(0.7, 1.1, 0.7, 0.9, 0.9, 0.9,
                                     0.9, 0.9, 0.9, 0.9, 0.9, 1.1,
                                     1.1, 0.9, 0.9, 0.9, 0.9, 0.9,
                                     0.9, 0.9, 0.9, 0.9),
                         `SFDUR` = c(20, 22, 20, 22, 22, 22, 22,
                                     22, 22, 22, 22, 22, 22, 20,
                                     20, 22, 22, 22, 22, 22, 22,
                                     22),
                         `SDPDV` = c(4.5, 5, 5, 4.5, 4.8, 4.5,
                                     4.5, 4.5, 4.5, 4.5, 4.8, 4.5,
                                     4.8, 5, 5, 4.5, 4.5, 4.5, 4.5,
                                     4.5, 4.5, 4.5),
                         `PODUR` = c(20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20),
                         `THRSH` = c(70, 70, 70, 70, 70, 70, 70,
                                     70, 70, 70, 70, 70, 70, 70,
                                     70, 70, 70, 70, 70, 70, 70,
                                     70),
                         `SDPRO` = c(0.265, 0.265, 0.265, 0.265,
                                     0.265, 0.265, 0.265, 0.265,
                                     0.265, 0.265, 0.265, 0.265,
                                     0.265, 0.265, 0.265, 0.265,
                                     0.265, 0.265, 0.265, 0.265,
                                     0.265, 0.265),
                         `SDLIP` = c(0.043, 0.043, 0.043, 0.043,
                                     0.043, 0.043, 0.043, 0.043,
                                     0.043, 0.043, 0.043, 0.043,
                                     0.043, 0.043, 0.043, 0.043,
                                     0.043, 0.043, 0.043, 0.043,
                                     0.043, 0.043))

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
               info = "read_cul() VBGRO048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() VBGRO048.CUL")


# "read_cul() WHAPS048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", VRNAME = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", VSEN = "%6.2f", PPSEN = "%6.2f",
                       P1 = "%6.0f", P5 = "%6.0f", PHINT = "%6.0f",
                       GRNO = "%6.2f", MXFIL = "%6.2f", STMMX = "%6.2f",
                       SLAP1 = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/WHAPS048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() WHAPS048.CUL"

    `char_cols` <- c("VAR#", "VRNAME", "EXPNO", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "AW0071",
                                    "IB0001", "IB0002", "IB0003",
                                    "IB0004", "AW0005", "AW0006",
                                    "SP0007", "WI0008", "IB0010",
                                    "IB0012", "IB0013", "IB1500",
                                    "IB0488", "IB1015"),
                         `VRNAME` = c("MINIMA", "MAXIMA", "YECORA ROJO",
                                      "YECORA", "ARMINDA", "Lely",
                                      "RONGOTEA", "Bacanora 88",
                                      "Nesser", "Spear", "Wilgoyne",
                                      "Gamenya", "Recital", "Yitpi",
                                      "MANITOU", "NEWTON", "MARIS FUNDIN"
                         ),
                         `EXPNO` = c(".", ".", ".", ".", ".", ".",
                                     ".", ".", ".", ".", ".", ".",
                                     ".", ".", "1,14", "1,6", "1,8"
                         ),
                         `ECO#` = c("999991", "999992", "IB0002",
                                    "IB0001", "IB0006", "IB0005",
                                    "IB0002", "IB0003", "IB0003",
                                    "IB0004", "IB0004", "IB0002",
                                    "IB0008", "IB0007", "DFAULT",
                                    "DFAULT", "DFAULT"),
                         `VSEN` = c(0, 4, 1, 1, 4, 4, 1, 1.9, 1.4,
                                    1.5, 1.4, 1.6, 4, 1.5, 0.66,
                                    3.69, 2.46),
                         `PPSEN` = c(1.2, 4.5, 1.2, 1.2, 4.5, 4.5,
                                     2, 1.5, 1.5, 3.5, 1.6, 2, 3.5,
                                     2.9, 4.23, 3.17, 3.51),
                         `P1` = c(380, 530, 400, 400, 400, 400,
                                  400, 400, 400, 400, 400, 400, 380,
                                  400, 330, 520, 530),
                         `P5` = c(200, 700, 600, 600, 640, 640,
                                  600, 700, 660, 740, 680, 700, 580,
                                  680, 277, 457, 472),
                         `PHINT` = c(85, 130, 120, 120, 100, 100,
                                     130, 120, 120, 110, 100, 110,
                                     85, 105, 86, 95, 100),
                         `GRNO` = c(20, 32, 24, 24, 32, 32, 20,
                                    25.5, 24, 24, 22, 22, 32, 22,
                                    30.67, 33.33, 20),
                         `MXFIL` = c(1.6, 2.9, 1.9, 1.9, 2.5, 2.5,
                                     1.6, 2.4, 2.4, 2.1, 1.9, 1.9,
                                     1.9, 1.9, 1.47, 1.91, 2.81),
                         `STMMX` = c(1, 3, 3, 3, 3, 1, 3, 3, 3,
                                     3, 3, 1.5, 3, 3, 1.28, 1.03,
                                     1.64),
                         `SLAP1` = c(200, 400, 300, 400, 280, 280,
                                     300, 300, 300, 300, 300, 280,
                                     280, 300, 280, 280, 300))

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
               info = "read_cul() WHAPS048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() WHAPS048.CUL")


# "read_cul() WHCER048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", P1V = "%6.0f",
                       P1D = "%6.0f", P5 = "%6.0f", G1 = "%6.0f",
                       G2 = "%6.0f", G3 = "%6.1f", PHINT = "%6.0f"
  )

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/WHCER048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() WHCER048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "IB1500", "IB0488", "IB1015",
                                    "AW0071", "CI0001", "KZ0001",
                                    "TX0001", "990015"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULT",
                                        "MANITOU", "NEWTON", "MARIS FUNDIN",
                                        "Yecora_Rojo", "Yecora_Rojo",
                                        "North KAZAK1", "TAMU112",
                                        "Hartog_KY"),
                         `EXP#` = c(".", ".", ".", "1,14", "1,6",
                                    "1,8", "16,33", "1,2", "", ".",
                                    "1,4"),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "CAWH01", "USWH01", "UKWH01",
                                    "AZWH18", "CI0001", "DFAULT",
                                    "TXWH01", "TWKG01"),
                         `P1V` = c(0L, 60L, 5L, 8L, 45L, 30L, 10L,
                                   2L, 10L, 10L, 20L),
                         `P1D` = c(0, 200, 75, 100, 75, 83, 40,
                                   40, 120, 68, 94),
                         `P5` = c(100L, 999L, 450L, 320L, 500L,
                                  515L, 450L, 570L, 670L, 450L, 700L
                         ),
                         `G1` = c(10L, 50L, 30L, 23L, 25L, 15L,
                                  20L, 27L, 16L, 30L, 22L),
                         `G2` = c(10L, 80L, 35L, 23L, 30L, 44L,
                                  60L, 45L, 42L, 30L, 39L),
                         `G3` = c(0.5, 8, 1, 2.5, 2, 3.2, 1.5,
                                  4, 2, 1, 1),
                         `PHINT` = c(30L, 150L, 60L, 86L, 95L,
                                     100L, 95L, 100L, 90L, 30L, 120L
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
               info = "read_cul() WHCER048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() WHCER048.CUL")


# "read_cul() WHCRP048.CUL"

  `v_fmt_expected` = c("VAR#" = "%-7s", "VAR-NAME" = "%-16s",
                       "EXP#" = "%6s", "ECO#" = "%7s", P1 = "%6.0f",
                       P2 = "%6.0f", P3 = "%6.0f", P4 = "%6.0f",
                       P5 = "%6.0f", P6 = "%6.0f", P7 = "%6.0f",
                       P8 = "%6.1f", VREQ = "%6.4f", VBASE = "%6.0f",
                       VEFF = "%6.2f", PPS1 = "%6.0f", PPS2 = "%6.0f",
                       PHINT = "%6.0f", LA1S = "%6.1f", LAFV = "%6.2f",
                       LAFR = "%6.2f", SHWTS = "%6.1f", "G#WTS" = "%6.1f",
                       GWTS = "%6.0f")

  `tier_info_expected` = NULL

  rds_file <- system.file("tinytest/test_data/CUL/WHCRP048_CUL.rds",
                            package = "DSSAT")

  input_file <- file.path(tempdir(), gsub("_([^_]+)\\.rds$", ".\\1", basename(rds_file)))

  write(readRDS(rds_file), input_file)

  actual <- DSSAT::read_cul(input_file)

  file.remove(input_file)

  info_prefix <- "read_cul() WHCRP048.CUL"

    `char_cols` <- c("VAR#", "VAR-NAME", "EXP#", "ECO#")
    expected_vals <- list(`VAR#` = c("999991", "999992", "DFAULT",
                                    "IB1500", "IB0488", "IB1015",
                                    "IB0034", "AW0071", "CI0001"),
                         `VAR-NAME` = c("MINIMA", "MAXIMA", "DEFAULTS",
                                        "MANITOU", "NEWTON", "MARIS FUNDIN",
                                        "AVALON 0.5VEFF", "Yecora_Rojo 2",
                                        "Yecora_Rojo"),
                         `EXP#` = c(".", ".", ".", "1,2", "1,6",
                                    "1,8", "1,6", "1,5", "1,2"),
                         `ECO#` = c("999991", "999992", "DFAULT",
                                    "CA0001", "US0001", "UK0001",
                                    "UK0001", "CI0001", "CI0001"),
                         `P1` = c(100L, 800L, 380L, 400L, 400L,
                                  400L, 296L, 200L, 400L),
                         `P2` = c(60L, 100L, 70L, 65L, 71L, 75L,
                                  75L, 55L, 65L),
                         `P3` = c(100L, 300L, 200L, 193L, 214L,
                                  200L, 225L, 140L, 190L),
                         `P4` = c(50L, 500L, 200L, 172L, 190L,
                                  200L, 200L, 270L, 180L),
                         `P5` = c(50L, 400L, 60L, 50L, 50L, 50L,
                                  100L, 145L, 50L),
                         `P6` = c(10L, 100L, 25L, 20L, 20L, 20L,
                                  20L, 25L, 25L),
                         `P7` = c(50L, 300L, 150L, 130L, 130L,
                                  130L, 130L, 160L, 160L),
                         `P8` = c(100, 800, 500, 220, 370, 370,
                                  450, 517.1, 570),
                         `VREQ` = c(0, 60, 0, 1, 25, 27, 27, 0.0187,
                                    2),
                         `VBASE` = c(0L, 30L, 0L, 0L, 0L, 0L, 0L,
                                     0L, 0L),
                         `VEFF` = c(0, 1, 0, 0.5, 1, 0.45, 0.5,
                                    0.3, 0.3),
                         `PPS1` = c(0, 300, 0, 80, 75, 83, 83,
                                    90, 40),
                         `PPS2` = c(0L, 200L, 0L, 0L, 0L, 0L, 0L,
                                    0L, 0L),
                         `PHINT` = c(40L, 120L, 80L, 86L, 95L,
                                     100L, 115L, 90L, 100L),
                         `LA1S` = c(0.1, 10, 3, 2, 2, 2, 2, 3,
                                    10),
                         `LAFV` = c(0.01, 5, 0.1, 0.25, 0.25, 0.25,
                                    0.1, 0.1, 0.3),
                         `LAFR` = c(0.01, 5, 0.5, 0.3, -0.1, 0.3,
                                    0.3, 0.5, 0.4),
                         `SHWTS` = c(0.5, 5, 2.5, 3, 3.2, 3.2,
                                     3.2, 3, 4),
                         `G#WTS` = c(10, 50, 25, 28, 22, 14, 15,
                                     12.5, 27),
                         `GWTS` = c(10L, 75L, 40L, 23L, 30L, 42L,
                                    44L, 55L, 45L))

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
               info = "read_cul() WHCRP048.CUL")

  expect_equal(attr(actual, "tier_info"), tier_info_expected,
               info = "read_cul() WHCRP048.CUL")


# Code used to create tests (for posterity):
if(FALSE){
  library(tidyverse)

  create_read_cul_test <- function(file_name, expected){

    name_root <- gsub("\\.CUL", "", file_name)

    # expected_name <- gsub("\\.ECO", "_ECO.R", file_name)

    v_fmt <- DSSAT:::create_test_arg("v_fmt_expected",
                                     attr(expected, "v_fmt"))

    tier_info <- DSSAT:::create_test_arg("tier_info_expected",
                                         attr(expected, "tier_info"))

    test_cols_check_call <- DSSAT:::create_call_test_cols_check("actual", expected)

    test_out <- c(paste0("test_that(\"read_cul() ", file_name, "\", {"),
                  "",
                  v_fmt,
                  "",
                  tier_info,
                  "",
                  paste0("  input_file <- system.file(\"tinytest/test_data/CUL/", file_name, "\","),
                  "                            package = \"DSSAT\")",
                  "",
                  "  actual <- DSSAT::read_cul(input_file)",
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

  all_cul <- list.files("inst/tinytest/test_data/CUL/", full.names = TRUE) %>%
    tibble(file_name = .) %>%
    mutate(contents = map(file_name, DSSAT::read_cul))

  # # Create inputs for tests
  # all_cul %>%
  #   pmap(\(file_name, contents, new_file) dput(contents, new_file))
  #
  # Create the test code for each file
  all_cul %>%
    mutate(file_name = basename(file_name)) %>%
    select(file_name, contents) %>%
    pmap(\(file_name, contents)
         create_read_cul_test(file_name, contents)) %>%
    unlist() %>%
    clipr::write_clip()

  # # Create validation files
  # cul_out <- all_cul %>%
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
  #                               \(valid_file, contents) DSSAT::write_cul(contents, valid_file))
  #          )

}

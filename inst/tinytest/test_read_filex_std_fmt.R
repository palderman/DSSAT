# "GENERAL use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*GENERAL",
        "@PEOPLE",
        "First Contributor; Second Contributor  ",
        "@ADDRESS",
        "Agricultural Research Institute  ",
        "@SITE",
        "Somewhere, Someplace  ",
        "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM.........",
        "      2     2     2     2     2  RCBD     1     1   0.5  Clipping",
        "@NOTES",
        "Additional notes ",
        "go on these   ",
        "lines   "),
      test0000_crx
    )

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "GENERAL use_std_fmt"
    actual <- filex$GENERAL
    char_cols <- c("PEOPLE", "ADDRESS", "SITE", "PLAY", "HARM", "NOTES")
    list_cols <- c("NOTES")
    expected_vals <- list(PAREA = 2,
                         PRNO = 2,
                         PLEN = 2,
                         PLDR = 2,
                         PLSP = 2,
                         PLAY = "RCBD",
                         HAREA = 1,
                         HRNO = 1,
                         HLEN = 0.5,
                         HARM = "Clipping",
                         PEOPLE = "First Contributor; Second Contributor",
                         ADDRESS = "Agricultural Research Institute",
                         SITE = "Somewhere, Someplace",
                         NOTES = list(c("Additional notes",
                                        "go on these",
                                        "lines"))
                         )

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

# "TREATMENTS single use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*TREATMENTS                        -------------FACTOR LEVELS------------",
        "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
        " 1 0 0 0 Control - 350 ppm          1  1  0  1  1  1  1  0  1  0  1  0  1"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "TREATMENTS single use_std_fmt"
    actual <- filex$TREATMENTS
    char_cols <- c("TNAME")
    expected_vals <- list(N = 1,
                         R = 0,
                         O = 0,
                         C = 0,
                         TNAME = "Control - 350 ppm",
                         CU = 1,
                         FL = 1,
                         SA = 0,
                         IC = 1,
                         MP = 1,
                         MI = 1,
                         MF = 1,
                         MR = 0,
                         MC = 1,
                         MT = 0,
                         ME = 1,
                         MH = 0,
                         SM = 1)


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

# "TREATMENTS two use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*TREATMENTS                        -------------FACTOR LEVELS------------",
        "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM",
        " 1 0 0 0 Control - 350 ppm          1  1  0  1  1  1  1  0  1  0  1  0  1",
        " 2 0 0 0 CO2 Enrichment - 550 ppm   1  1  0  1  1  1  1  0  1  0  2  0  1"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "TREATMENTS two use_std_fmt"
    actual <- filex$TREATMENTS
    char_cols <- c("TNAME")
    expected_vals <- list(N = 1:2,
                         R = rep(0, 2),
                         O = rep(0, 2),
                         C = rep(0, 2),
                         TNAME = c("Control - 350 ppm",
                                   "CO2 Enrichment - 550 ppm"),
                         CU = rep(1, 2),
                         FL = rep(1, 2),
                         SA = rep(0, 2),
                         IC = rep(1, 2),
                         MP = rep(1, 2),
                         MI = rep(1, 2),
                         MF = rep(1, 2),
                         MR = rep(0, 2),
                         MC = rep(1, 2),
                         MT = rep(0, 2),
                         ME = 1:2,
                         MH = rep(0, 2),
                         SM = rep(1, 2))


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

# "CULTIVARS single use_std_fmt"
  test0000_crx <- tempfile()

    write(
      c("*CULTIVARS",
        "@C CR INGENO CNAME",
        " 1 CO IB0001 Deltapine 77"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "CULTIVARS single use_std_fmt"
    actual <- filex$CULTIVARS
    char_cols <- c("CR", "INGENO", "CNAME")
    expected_vals <- list(C = 1,
                         CR = "CO",
                         INGENO = "IB0001",
                         CNAME = "Deltapine 77"
                         )
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

# "CULTIVARS multiple use_std_fmt"
  test0000_crx <- tempfile()

    write(
      c("*CULTIVARS",
        "@C CR INGENO CNAME",
        " 1 PN IB0002 FLORUNNER, STD",
        " 2 PN IB0031 F81206,LS-RES RU",
        " 3 PN IB0015 SOUTHERN RUNNER",
        " 4 PN IB0032 MA72x94-12,LS-RE"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "CULTIVARS multiple use_std_fmt"
    actual <- filex$CULTIVARS
    char_cols <- c("CR", "INGENO", "CNAME")
    expected_vals <- list(C = 1:4,
                         CR = rep("PN",4),
                         INGENO = c("IB0002", "IB0031",
                                    "IB0015", "IB0032"),
                         CNAME = c("FLORUNNER, STD",
                                   "F81206,LS-RES RU",
                                   "SOUTHERN RUNNER",
                                   "MA72x94-12,LS-RE")
    )


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

# "FIELDS single use_std_fmt"
  test0000_crx <- tempfile()

    write(
      c("*FIELDS",
        "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
        " 1 UFQU0001 UFQU9501   -99     0 DR000     0     0  0000 SL     180  IBTM910017 -99",
        "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
        " 1             -99             -99       -99               -99   -99   -99   -99   -99   -99"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "FIELDS single use_std_fmt"
    actual <- filex$FIELDS
    char_cols <- c("ID_FIELD", "WSTA", "FLSA", "FLDT", "FLST",
                  "SLTX", "ID_SOIL", "FLNAME", "FLHST")
    missing <- c("FLSA", "FLNAME", "XCRD", "YCRD", "ELEV",
                "AREA", "SLEN", "FLWR", "SLAS", "FLHST",
                "FHDUR")
    expected_vals <- list(L = 1,
                         ID_FIELD = "UFQU0001",
                         WSTA = "UFQU9501",
                         FLOB = 0,
                         FLDT = "DR000",
                         FLDD = 0,
                         FLDS = 0,
                         FLST = "0000",
                         SLTX = "SL",
                         SLDP = 180,
                         ID_SOIL = "IBTM910017")


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

# "FIELDS multiple use_std_fmt"
  test0000_crx <- tempfile()

    write(
      c("*FIELDS",
        "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME",
        " 1 UFQU0001 UFQU9501   -99     0 DR000     0     0  0000 SL     180  IBTM910017 -99",
        " 2 UFQU0002 UFQU9501   -99     0 DR000     0     0  0000 SA     180  UFQU950002 -99",
        " 3 UFQU0003 UFQU9501   -99     0 DR000     0     0  0000 SA     180  UFQU950003 -99",
        " 4 UFQU0004 UFQU9501   -99     0 DR000     0     0  0000 SA     180  UFQU950004 -99",
        "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR",
        " 1             -99             -99       -99               -99   -99   -99   -99   -99   -99",
        " 2             -99             -99       -99               -99   -99   -99   -99   -99   -99",
        " 3             -99             -99       -99               -99   -99   -99   -99   -99   -99",
        " 4             -99             -99       -99               -99   -99   -99   -99   -99   -99"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "FIELDS multiple use_std_fmt"
    actual <- filex$FIELDS
    char_cols <- c("ID_FIELD", "WSTA", "FLSA", "FLDT", "FLST",
                  "SLTX", "ID_SOIL", "FLNAME", "FLHST")
    missing <- c("FLSA", "FLNAME", "XCRD", "YCRD", "ELEV",
                "AREA", "SLEN", "FLWR", "SLAS", "FLHST",
                "FHDUR")
    expected_vals <- list(L = 1:4,
                         ID_FIELD = c("UFQU0001", "UFQU0002",
                                      "UFQU0003", "UFQU0004"),
                         WSTA = rep("UFQU9501", 4),
                         FLOB = rep(0, 4),
                         FLDT = rep("DR000", 4),
                         FLDD = rep(0, 4),
                         FLDS = rep(0, 4),
                         FLST = rep("0000", 4),
                         SLTX = c("SL", "SA", "SA", "SA"),
                         SLDP = rep(180, 4),
                         ID_SOIL = c("IBTM910017",
                                     "UFQU950002",
                                     "UFQU950003",
                                     "UFQU950004")
                         )


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

# "SOIL ANALYSIS single use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*SOIL ANALYSIS",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 1 03283   -99 SA002   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 1     5   -99   .48   -99   -99   -99   2.2   -99   .47"
      ),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "SOIL ANALYSIS single use_std_fmt"
    actual <- filex[["SOIL ANALYSIS"]]
    char_cols <- c("SMHB", "SMPX", "SMKE", "SANAME")
    missing <- c("SMHB", "SMKE", "SANAME", "SADM", "SANI",
                "SAPHW", "SAPHB", "SAKE")
    date_cols <- "SADAT"
    expected_vals <- list(A = 1,
                         SADAT = as.POSIXct("03283",
                                            format = "%y%j",
                                            tz = "UTC"),
                         SMPX = "SA002",
                         SABL = 5,
                         SAOC = 0.48,
                         SAPX = 2.2,
                         SASC = 0.47)


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

# "SOIL ANALYSIS single - missing use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*SOIL ANALYSIS",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 1   -99   -99   -99   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 1    15   -99   -99   -99   -99   -99   -99   -99   -99"
      ),
    test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "SOIL ANALYSIS single - missing use_std_fmt"
    actual <- filex[["SOIL ANALYSIS"]]
    char_cols <- c("SMHB", "SMPX", "SMKE", "SANAME")
    missing <- c("SADAT", "SMHB", "SMPX", "SMKE", "SANAME",
                "SADM", "SAOC", "SANI", "SAPHW", "SAPHB",
                "SAPX", "SAKE", "SASC")
    date_cols <- "SADAT"
    expected_vals <- list(A = 1,
                         SABL = 15)


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

# "SOIL ANALYSIS multiple use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*SOIL ANALYSIS",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 1 03283   -99 SA002   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 1     5   -99   .48   -99   -99   -99   2.2   -99   .47",
        " 1    20   -99   .44   -99   -99   -99   2.3   -99   .43",
        " 1    40   -99   .35   -99   -99   -99   2.3   -99   .34",
        " 1    60   -99   .35   -99   -99   -99   2.3   -99   .34",
        " 1    90   -99   .34   -99   -99   -99   2.3   -99   .33",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 2 03283   -99 SA002   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 2     5   -99   .49   -99   -99   -99   6.7   -99   .47",
        " 2    20   -99   .44   -99   -99   -99   3.8   -99   .43",
        " 2    40   -99   .35   -99   -99   -99   2.4   -99   .34",
        " 2    60   -99   .35   -99   -99   -99   2.3   -99   .34",
        " 2    90   -99   .34   -99   -99   -99   2.3   -99   .33",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 3 03283   -99 SA002   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 3     5   -99   .49   -99   -99   -99   7.4   -99   .47",
        " 3    20   -99   .44   -99   -99   -99   4.6   -99   .43",
        " 3    40   -99   .35   -99   -99   -99   2.4   -99   .34",
        " 3    60   -99   .35   -99   -99   -99   2.3   -99   .34",
        " 3    90   -99   .34   -99   -99   -99   2.3   -99   .33",
        "@A SADAT  SMHB  SMPX  SMKE  SANAME",
        " 4 03283   -99 SA002   -99  -99",
        "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC",
        " 4     5   -99   .48   -99   -99   -99   2.3   -99   .47",
        " 4    20   -99   .44   -99   -99   -99   1.9   -99   .43",
        " 4    40   -99   .35   -99   -99   -99   2.4   -99   .34",
        " 4    60   -99   .35   -99   -99   -99   2.3   -99   .34",
        " 4    90   -99   .34   -99   -99   -99   2.3   -99   .33"
      ),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "SOIL ANALYSIS multiple use_std_fmt"
    actual <- filex[["SOIL ANALYSIS"]]
    char_cols <- c("SMHB", "SMPX", "SMKE", "SANAME")
    missing <- c("SMHB", "SMKE", "SANAME", "SADM", "SANI",
                "SAPHW", "SAPHB", "SAKE")
    date_cols <- "SADAT"
    list_cols <- c("SABL", "SADM", "SAOC", "SANI", "SAPHW",
                  "SAPHB", "SAPX", "SAKE", "SASC")
    list_col_groups <- list(c("SABL", "SADM", "SAOC", "SANI",
                             "SAPHW", "SAPHB", "SAPX", "SAKE",
                             "SASC"))
    expected_vals <- list(A = 1:4,
                         SADAT = as.POSIXct(rep("03283", 4),
                                            format = "%y%j",
                                            tz = "UTC"),
                         SMPX = rep("SA002", 4),
                         SABL = list(c(5, 20, 40, 60, 90),
                                     c(5, 20, 40, 60, 90),
                                     c(5, 20, 40, 60, 90),
                                     c(5, 20, 40, 60, 90)),
                         SAOC = list(c(.48, .44, .35, .35, .34),
                                     c(.49, .44, .35, .35, .34),
                                     c(.49, .44, .35, .35, .34),
                                     c(.48, .44, .35, .35, .34)),
                         SAPX = list(c(2.2, 2.3, 2.3, 2.3, 2.3),
                                     c(6.7, 3.8, 2.4, 2.3, 2.3),
                                     c(7.4, 4.6, 2.4, 2.3, 2.3),
                                     c(2.3, 1.9, 2.4, 2.3, 2.3)),
                         SASC = list(c(.47, .43, .34, .34, .33),
                                     c(.47, .43, .34, .34, .33),
                                     c(.47, .43, .34, .34, .33),
                                     c(.47, .43, .34, .34, .33))
                         )


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

# "INITIAL CONDITIONS one level - no missing use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*INITIAL CONDITIONS",
        "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
        " 1    SB 56070  1200     0     1     1    3.  1000    .8     0   100    15 TEST",
        "@C  ICBL  SH2O  SNH4  SNO3",
        " 1    30  .406  1.78  17.8",
        " 1    60  .406   .82   8.2",
        " 1    90  .406   .24   2.4",
        " 1   120  .406   .24   2.4",
        " 1   150  .406   .24   2.4",
        " 1   180  .406   .24   2.4"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "INITIAL CONDITIONS one level - no missing use_std_fmt"
  actual <- filex[["INITIAL CONDITIONS"]]
  char_cols <- c("PCR", "ICNAME")
  list_cols <- c("ICBL","SH2O","SNH4","SNO3")
  date_cols <- "ICDAT"
  list_col_length <- 6
  list_col_groups <- list(c("ICBL","SH2O","SNH4","SNO3"))
  expected_vals <- list(C = 1,
                        PCR = "SB",
                        ICDAT = as.POSIXct("1956070", format = "%Y%j", tz="UTC"),
                        ICRT = 1200,
                        ICND = 0,
                        ICRN = 1,
                        ICRE = 1,
                        ICWD = 3,
                        ICRES = 1000,
                        ICREN = 0.8,
                        ICREP = 0,
                        ICRIP = 100,
                        ICRID = 15,
                        ICNAME = "TEST",
                        ICBL = list(c(30, 60, 90,
                                      120, 150, 180)),
                        SH2O = list(c(0.406, 0.406, 0.406,
                                      0.406, 0.406, 0.406)),
                        SNH4 = list(c(1.78, 0.82, 0.24,
                                      0.24, 0.24, 0.24)),
                        SNO3 = list(c(17.8, 8.2, 2.4,
                                      2.4, 2.4, 2.4)))

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

# "INITIAL CONDITIONS one level - missing use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*INITIAL CONDITIONS",
        "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
        " 1   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99   -99 -99",
        "@C  ICBL  SH2O  SNH4  SNO3",
        " 1    30   -99   -99   -99",
        " 1    60   -99   -99   -99",
        " 1    90   -99   -99   -99",
        " 1   120   -99   -99   -99",
        " 1   150   -99   -99   -99",
        " 1   180   -99   -99   -99"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

  info_prefix <- "INITIAL CONDITIONS one level - missing use_std_fmt"
    actual <- filex[["INITIAL CONDITIONS"]]
    char_cols <- c("PCR", "ICNAME")
    list_cols <- c("ICBL","SH2O","SNH4","SNO3")
    date_cols <- "ICDAT"
    missing <- c("PCR", "ICDAT", "ICRT", "ICND",
                "ICRN", "ICRE", "ICWD", "ICRES",
                "ICREN", "ICREP", "ICRIP", "ICRID",
                "ICNAME", "SH2O", "SNH4", "SNO3")
    list_col_length <- 6
    list_col_groups <- list(c("ICBL","SH2O","SNH4","SNO3"))
    expected_vals <- list(C = 1,
                         ICBL = list(c(30, 60, 90,
                                       120, 150, 180)))
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

file.remove(test0000_crx)

# "Two levels - no missing data use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*INITIAL CONDITIONS",
        "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
        " 1    SB 56070  1200     0     1     1    3.  1000    .8     0   100    15 TEST1",
        "@C  ICBL  SH2O  SNH4  SNO3",
        " 1    30  .406  1.78  17.8",
        " 1    60  .406   .82   8.2",
        " 1    90  .406   .24   2.4",
        " 1   120  .406   .24   2.4",
        " 1   150  .406   .24   2.4",
        " 1   180  .406   .24   2.4",
        "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME",
        " 2    SB 56070  1200     0     1     1    3.  1000    .8     0   100    15 TEST2",
        "@C  ICBL  SH2O  SNH4  SNO3",
        " 2    30  .406  1.78  17.8",
        " 2    60  .406   .82   8.2",
        " 2    90  .406   .24   2.4",
        " 2   120  .406   .24   2.4",
        " 2   150  .406   .24   2.4"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "Two levels - no missing data use_std_fmt"
    actual <- filex[["INITIAL CONDITIONS"]]
    char_cols <- c("PCR", "ICNAME")
    list_cols <- c("ICBL","SH2O","SNH4","SNO3")
    date_cols <- "ICDAT"
    list_col_length <- c(6,5)
    list_col_groups <- list(c("ICBL","SH2O","SNH4","SNO3"))
    expected_vals <- list(C = 1:2,
                         PCR = rep("SB",2),
                         ICDAT = rep(as.POSIXct("1956070", format = "%Y%j", tz="UTC"),2),
                         ICRT = rep(1200,2),
                         ICND = rep(0,2),
                         ICRN = rep(1,2),
                         ICRE = rep(1,2),
                         ICWD = rep(3,2),
                         ICRES = rep(1000,2),
                         ICREN = rep(0.8,2),
                         ICREP = rep(0,2),
                         ICRIP = rep(100,2),
                         ICRID = rep(15,2),
                         ICNAME = c("TEST1","TEST2"),
                         ICBL = list(c(30, 60, 90,
                                       120, 150, 180),
                                     c(30, 60, 90,
                                       120, 150)),
                         SH2O = list(c(0.406, 0.406, 0.406,
                                       0.406, 0.406, 0.406),
                                     c(0.406, 0.406, 0.406,
                                       0.406, 0.406)),
                         SNH4 = list(c(1.78, 0.82, 0.24,
                                       0.24, 0.24, 0.24),
                                     c(1.78, 0.82, 0.24,
                                       0.24, 0.24)),
                         SNO3 = list(c(17.8, 8.2, 2.4,
                                       2.4, 2.4, 2.4),
                                     c(17.8, 8.2, 2.4,
                                       2.4, 2.4)))

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

# "INITIAL CONDITIONS two levels - missing use_std_fmt"

  test0000_crx <- tempfile()

    write(
      c("*INITIAL CONDITIONS",
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
        " 2   150   -99   -99   -99"),
      test0000_crx)

    filex <- DSSAT::read_filex(test0000_crx, use_std_fmt = TRUE)

file.remove(test0000_crx)

  info_prefix <- "INITIAL CONDITIONS two levels - missing use_std_fmt"
    actual <- filex[["INITIAL CONDITIONS"]]
    char_cols <- c("PCR", "ICNAME")
    list_cols <- c("ICBL","SH2O","SNH4","SNO3")
    date_cols <- "ICDAT"
    missing <- c("PCR", "ICDAT", "ICRT", "ICND",
                "ICRN", "ICRE", "ICWD", "ICRES",
                "ICREN", "ICREP", "ICRIP", "ICRID",
                "ICNAME", "SH2O", "SNH4", "SNO3")
    list_col_length <- c(6, 5)
    list_col_groups <- list(c("ICBL","SH2O","SNH4","SNO3"))
    expected_vals <- list(C = 1:2,
                         ICBL = list(c(30, 60, 90,
                                       120, 150, 180),
                                     c(30, 60, 90,
                                       120, 150)))

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

# test_that("PLANTING DETAILS - single use_std_fmt",{
#
#   withr::with_file("TEST0000.CRX",{
#     write(
#       ,
#       "TEST0000.CRX")
#
#     filex <- DSSAT::read_filex("TEST0000.CRX", use_std_fmt = TRUE)
#
#   })
#
# info_prefix <- "GENERAL use_std_fmt"
#  actual <- filex$`PLANTING
#     char_cols = c(),
#     list_cols = c(),
#     date_cols = "",
#     missing = c(),
#     list_col_length = c(6, 5),
#     list_col_groups = list(c()),
#     expected_vals = list(P = ,))
# })


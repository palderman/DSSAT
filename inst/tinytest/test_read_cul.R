library(tinytest)

# "read_cul() ALFRM048.CUL"

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

  input_file <- file.path(tempdir(), "ALFRM048.CUL")

  c("*ALFALFA GENOTYPE COEFFICIENTS: PRFRM048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "!", "! 8/16/19 kjb - set lfmax 0.02 change per MG step from Aragon 1.40",
    "! 9/25/19 kjb - FD3 should be 1.32 (stats equally good), if 0.02 per FD step",
    "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!                                        1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "AL0001 Aragon  FD7            G00001 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.40  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "AL0002 Rugged  FD3            G00002 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.32  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "AL0003 Cisco II  FD6          G00003 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.38  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "AL0004 CUF101  FD10           G00004 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.46  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "AL0005 Aragon RDRMM           G00005 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.40  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "CA0001 CFIA-alfalfa FD4       C00001 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.34  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035   !Experiment at CFIA",
    "CA0002 Apica FD4              C00001 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.34  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035   !Experiment at Fredericton 1994-1996",
    "CA0003 Oneida FD3             C00002 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.32  240.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035   !Experiment at Fredericton 1992,1993",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BACER048.CUL")

  c("$CULTIVARS:BACER048.20200721   Last edit: 2021-05-08 GH",
    "", "! Coefficients used in the Cropsim-Ceres model differ from those used",
    "! in DSSAT Version 3.5 AND 4.0. They can be calculated (approximately) from ",
    "! V3.5 coefficients as follows:", "", "! P1V   = P1V(v3.5)*10 ",
    "! P1D   = P1D(V3.5)*20", "! P5    = P5(V3.5)*20 + 430", "! G1    = G1(V3.5)*5 + 5",
    "! G2    = (G2(V3.5)*0.35+0.65) * P5/20", "! G3    = G3(V3.5)*0.7 ",
    "! PHINT = PHINT(V3.5)", "", "! Converted coefficients,and those listed below,should always be",
    "! tested by using them with real experiments and comparing model ",
    "! outputs with measured values. ", "", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "", "*CULTIVARS:BACER048", "@VAR#  VAR-NAME........  EXP#   ECO#   P1V   P1D    P5    G1    G2    G3 PHINT",
    "!Coeffient #                             1     2     3     4     5     6     7",
    "!Calibration                             P     P     P     G     G     G     N",
    "!                                     Vday %/10h  oC.d   #/g    mg     g  oC.d",
    "999991 MINIMA               . 999991     0     0   100    10    10   0.5    30",
    "999992 MAXIMA               . 999992    60   200   999    50    80   8.0   150",
    "                                                                            ",
    "DFAULT DEFAULT              . DFAULT     5    75   450    30    35   1.0    60",
    "", "IB0101 A.Abiad (2)          . SY0001    10    30   220    16    40   2.7    89 ",
    "IB0102 Beecher (6)          . SY0002    10    30   220    13    40   2.7    92 ",
    "IB0030 Maris Badger         . US0001     0    40   750    20    52   1.5    64 ",
    "                                                                                                                                                                                                             ",
    "! COEFF       DEFINITION", "! ========    ==========", "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.", "! EXP#        Number of experiments used to generate parameters",
    "! ECO#        Ecotype code for this cultivar,points to entry in ECO file",
    "! P1V         Days,optimum vernalizing temperature,required for vernalization",
    "! P1D         Photoperiod response (% reduction in rate/10 h drop in pp)",
    "! P5          Grain filling (excluding lag) phase duration (oC.d)",
    "! G1          Kernel number per unit canopy weight at anthesis (#/g)",
    "! G2          Standard kernel size under optimum conditions (mg)",
    "! G3          Standard,non-stressed mature tiller wt (incl grain) (g dwt)",
    "! PHINT       Interval between successive leaf tip appearances (oC.d)"
  ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BACRP048.CUL")

  c("$CULTIVARS:BACRP048.20200721   Last edit: 2021-05-08 GH",
    "", "! Coefficients used in the Cropsim model differ from those used in",
    "! earlier DSSAT wheat/barley models. They can be calculated",
    "! (approximately) from V3.5 coefficients as follows:", "! VREQ  = P1V(v3.5)*10",
    "! VBASE = 0.0          ", "! VEFF  = MAX(0.0,1.0-P1V(V3.5)*10/50)",
    "! PPS1  = P1D(V3.5)*20", "! PPS2  = 0.0", "! P1    = PHINT(V3.5)*4.2",
    "! P2    = PHINT(V3.5)*3*0.3   (V3.5P2*0.3)", "! P3    = PHINT(V3.5)*3*0.7   (V3.5P2*0.7)",
    "! P4    = PHINT(V3.5)*2       (V3.5P3)", "! P5    = 80", "! P6    = 0",
    "! P7    = 120", "! P8    = P5(V3.5)*20 + 430", "! G#WTS  = G1(V3.5)*5 + 5",
    "! GWTS  = (G2(V3.5)*0.35+0.65) * P5/20", "! SHWTS = G3(V3.5)*0.7",
    "! PHINT = PHINT(V3.5)", "", "! Converted coefficients,and those listed below,should always be",
    "! tested by using them with real experiments and comparing model",
    "! outputs with measured values. Users should also be aware that",
    "! some of the coefficients (eg.PHINT) may vary from region to",
    "! region,and perhaps even from sowing date to sowing date,reflecting",
    "! the current incomplete understanding of the environmental physiology",
    "! of barley and other cereals.", "", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "", "*CULTIVARS:BACRP048", "!                                     --------- PHENOLOGY (PHASE DURATIONS) -------- -------- P.MODIFIERS -------- -- LEAF PRODN.& SIZE -- SHOOT -- GRAIN --             ",
    "@VAR#  VAR-NAME........  EXP#   ECO#    P1    P2    P3    P4    P5    P6    P7    P8  VREQ VBASE  VEFF  PPS1  PPS2 PHINT  LA1S  LAFV  LAFR SHWTS G#WTS  GWTS",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20",
    "!Calibration                             P     P     P     P     P     P     P     P     P     P     P     P     P     P     G     G     G     G     G     G",
    "!                                     oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  Vday  Vday    fr %/10h %/10h  oC.d m2/m2 fr/lf fr/lf     g   #/g    mg      ",
    "999991 MINIMA               . 999991   100    60   100    50    50    10    50   100     0     0     0     0     0    40   0.1  0.01  0.01   0.5    10    10",
    "999992 MAXIMA               . 999992   800   100   300   500   400   100   300   800    60    30   1.0   300   200   120  10.0  5.00  5.00   5.0    50    75",
    "                                                                                                                                                                ",
    "DFAULT DEFAULTS             . DFAULT   380    70   200   200    60    25   150   500     0     0     0     0     0    80   3.0  0.10  0.50   2.5    25    40",
    "", "IB0101 A.Abiad(2row)        . SY0001   390    73   218   196    66    26   171   220    10     0   1.0    20     0    91   4.0   0.1   0.3   3.0    10    40 ",
    "IB0102 Beecher(6row)        . SY0002   411    77   230   206    70    28   181   220    10     0   1.0    20     0    96   5.0   0.1   0.4   3.0     7    40 ",
    "!B0030 Maris Badger         . US0001   356    66   199   178    60    24   156   750     0     0   1.0    00     0    83   4.0   0.1   0.3   1.5    20    52 ",
    "IB0030 Maris Badger         . US0001   400    66   199   178    60    24   156   650     0     0   1.0    00     0    83   4.0   0.1   0.3   2.5    14    50 ",
    "", "! COEFF       DEFINITION", "! ========    ==========", "! ECO#        Ecotype code for this cultivar, points to entry in the ECO file",
    "! EXP#        Number of experiments,treatments used to estimate coefficients",
    "! G#WTS       Standard grain number per unit canopy weight at anthesis (#/g)",
    "! GWTS        Standard grain size,optimum conditions,normal plant density (mg)",
    "! LA1S        Area of standard first leaf (cm2)", "! LAFV        Increase in potential area of leaves,vegetative phase (fr/leaf)",
    "! LAFR        Increase in potential area of leaves,reproductive phase (fr/leaf)",
    "! Pn          Duration of phase n where n is phase number (PVoC.D) BUT P3 and",
    "!             P4 are 'dummy' values inserted to set the total duration of the ",
    "!             P3+P4 phase. The actual balance between P3 and P4 is determined ",
    "!             internally depending on the leaf number at the end of phase 1. ",
    "! PPSn *      Photoperiod sensitivity,phase(n). % drop in rate,10h pp.change.",
    "! PHINT       Interval between successive leaf appearances. (oC.d)",
    "! SHWTS       Standard,non-stressed shoot dry weight (incl.grain),maturity (g)",
    "! SLAS        Specific leaf area,standard (cm2/g)                                                                                   ",
    "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.", "! VREQ        Vernalization required for max.development rate (VDays)",
    "! VBASE       Vernalization requirement before any effect (VDays)",
    "! VEFF        Vernalization effect (Rate reduction when unvernalized (fr)",
    "", "! *  The programme has been written to read sensitivity for all phases so that",
    "!    additional columns for later phases could be added if desired."
  ) |>
  write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BHGRO048.CUL")

  c("*BAHIA CULTIVAR COEFFICIENTS: CRGRO048 Model", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1 2/21/03 lowered to 1.44 to be more in line with reported mean readings and lower leaf PG rate-was 2X that of soybean",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seeds to stop growing as their dry weight",
    "!         increases until the shells are filled in a cohort.",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    14    17    18",
    "!Calibration                             N     N     P     N     P     P     N     G     G     G     N     G     G     G     N     N     N     N",
    "999991 MINIMA               . DFAULT 12.00  0.01  29.0  10.0  12.0 40.00 25.00  0.95  170.  250.  0.01 0.018  15.0  2.05  20.0  78.0  .115  .035",
    "999992 MAXIMA               . DFAULT 23.00  0.20  45.0  10.0  18.0 54.00 75.00  1.50  300.  300.  0.75 0.020  40.0  2.05  20.0  78.0  .153  .035",
    "", "UF0001 PENSACOLA BAHIA      . BH0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.44  285.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035"
  ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BMFRM048.CUL")

  c("*Bermuda Grass CULTIVAR COEFFICIENTS: PRFRM048 MODEL", "!",
    "! COEFF   DEFINITIONS", "! =====   ===========", "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     N     P     P     N     G     G     G     N     G     G     G     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.50 0.001  29.0  10.0  12.0 33.00 25.00  0.95  170.   2.0  0.01  0.02  15.0  2.05  20.0  78.0  .115  .035",
    "999992 MAXIMA               . DFAULT 23.00 0.200  45.0  10.0  18.0 54.00 75.00  1.86  250.   2.0  0.75  0.18  40.0  2.05  20.0  78.0  .115  .035",
    "", "UF0001 TIFTON 85 BERMUD       G00002 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.86  170.   2.0  0.01  0.02  15.0  2.05  20.0  78.0  .115  .035"
  ) |>
    write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BNGRO048.CUL")

  c("*DRYBEAN CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     N     P     P     N     N     G     G     N     G     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.17 0.000  20.0   2.0   6.0 14.00 10.00  0.98  250. 133.0  1.00  0.22  11.0  3.00   4.0  78.0  .235  .030",
    "999992 MAXIMA               . DFAULT 12.17 0.070  35.0   5.0  13.0 29.00 34.00  1.00  350. 180.0  1.00  0.66  22.0  5.00  16.0  78.0  .235  .030",
    "", "990001 Andean Habit 1       . ANDDET 12.17 0.000  22.6   3.0  12.0 18.40 10.00  0.98  305. 133.0  1.00 0.600  15.0  3.50  10.0  78.0  .235  .030",
    "990002 Andean Habit 2       . ANDIND 12.17 0.050  26.0   4.0  11.0 21.00 18.00  0.98  320. 133.0  1.00 0.600  15.0  3.50  10.0  78.0  .235  .030",
    "990003 Andean Habit 3       . ANDIND 12.17 0.050  30.0   4.5   9.5 22.00 22.00  0.98  320. 133.0  1.00 0.600  20.0  4.20  14.0  78.0  .235  .030",
    "990004 Andean Habit 4       . ANDIND 12.17 0.050  34.0   5.0   9.0 25.00 34.00  0.98  320. 133.0  1.00 0.650  22.0  4.70  15.0  78.0  .235  .030",
    "990005 Meso Amer. Hab.1     . MESDET 12.17 0.000  27.0   3.0   9.0 20.00 16.00  1.00  310. 133.0  1.00 0.230  16.0  5.20   5.0  78.0  .235  .030",
    "990006 MesoAm Hab 2 & 3     . MESIND 12.17 0.000  31.0   3.5  10.0 22.00 21.00  1.00  320. 133.0  1.00 0.230  20.0  5.50  10.0  78.0  .235  .030",
    "990007 Mex Highland H 3     . MEXHIL 12.17 0.050  27.0   3.0   9.0 22.00 20.00  1.00  320. 133.0  1.00 0.400  17.0  3.20   5.0  78.0  .235  .030",
    "", "IB0001 Porrillo Sintetico   . MESIND 13.50 0.017  31.5   3.0   8.0 20.50 21.00  1.00  300. 150.0  1.00 0.230  21.0  5.20  11.5  78.0  .235  .030",
    "IB0002 BAT 477              . MESIND 12.17 0.000  30.0   3.0   8.5 21.00 21.00  1.00  300. 140.0  1.00 0.230  21.0  5.50  11.5  78.0  .235  .030",
    "IB0003 Seafarer             . MESDET 12.17 0.000  28.0   4.0  11.0 19.00 18.00  0.95  315. 133.0  1.00 0.220  17.0  5.00  11.0  78.0  .235  .030",
    "IB0004 C-20                 . MESIND 12.17 0.000  33.6   4.5  11.5 21.50 20.00  0.97  310. 133.0  1.00 0.220  17.0  5.20  14.0  78.0  .235  .030",
    "IB0005 BAT 881              . MESIND 12.17 0.000  32.0   3.5  10.8 20.20 20.00  1.01  280. 140.0  1.00 0.220  19.0  5.20  10.0  78.0  .235  .030",
    "IB0006 ICTA-Ostua           . MESIND 12.17 0.000  26.5   3.5   8.5 18.50 18.00  1.00  320. 133.0  1.00 0.200  19.0  5.40  14.0  78.0  .235  .030",
    "IB0007 Rabia de Gato        . MESIND 12.17 0.000  24.0   3.5   8.0 19.20 14.00  1.00  295. 133.0  1.00 0.200  20.5  5.40  13.0  78.0  .235  .030",
    "IB0008 TURBO-III            . MESIND 12.17 0.050  29.0   3.5   8.0 17.00 22.00  1.00  295. 133.0  1.00 0.240  19.0  4.00  10.0  78.0  .235  .030",
    "IB0010 Carioca (G4017)      . MESIND 12.17 0.000  32.5   3.5  10.8 18.20 18.00  1.00  300. 140.0  1.00 0.250  19.0  5.50  11.5  78.0  .235  .030",
    "IB0011 Isabella             . ANDDET 12.17 0.000  26.3   2.5  10.0 21.00 10.00  0.95  300. 140.0  1.00 0.500  19.0  3.50  10.0  78.0  .235  .030",
    "IB0012 Manitou              . ANDDET 12.17 0.015  29.0   4.5  12.0 22.00 10.00  0.93  310. 140.0  1.00 0.500  17.0  3.50  12.0  78.0  .235  .030",
    "IB0013 Redkloud             . ANDDET 12.17 0.000  23.5   3.0   9.8 19.70 10.00  1.00  320. 150.0  1.00 0.550  18.0  3.50  11.0  78.0  .235  .030",
    "IB0014 Canadian Wonder      . ANDDET 12.17 0.020  24.0   3.5  10.0 19.50 10.00  0.96  315. 150.0  1.00 0.550  18.0  3.50  10.0  78.0  .235  .030",
    "IB0016 A 70                 . MESIND 12.17 0.020  31.0   3.5  10.2 18.80 18.00  1.00  285. 140.0  1.00 0.280  19.0  5.20  12.0  78.0  .235  .030",
    "IB0028 Jatu Rong            . ANDDET 12.17 0.040  23.0   2.0   9.5 18.50 10.00  0.99  295. 140.0  1.00 0.350  14.0  4.30   9.0  78.0  .235  .030",
    "IB0029 San Crist. 83        . MESIND 12.17 0.020  31.0   3.0   9.5 18.50 18.00  1.00  310. 150.0  1.00 0.320  19.0  5.00  12.0  78.0  .235  .030",
    "IB0031 A 465                . MESIND 12.17 0.020  29.0   4.0  10.5 20.50 10.00  0.97  270. 133.0  1.00 0.340  19.0  4.00  14.0  78.0  .235  .030",
    "IB0032 A 486                . ANDDET 12.17 0.030  27.0   2.5   9.5 21.50  9.00  0.94  295. 150.0  1.00 0.550  19.0  3.50  11.0  78.0  .235  .030",
    "IB0033 A 193 (hab 2)        . ANDIND 12.17 0.040  30.0   4.0  11.6 18.40 12.00  0.95  285. 140.0  1.00 0.500  19.0  3.50  10.0  78.0  .235  .030",
    "IB0034 A 195                . ANDDET 12.17 0.020  28.0   2.5   9.2 21.50 12.00  0.99  300. 160.0  1.00 0.550  17.5  3.50  11.0  78.0  .235  .030",
    "IB0035 BAT 1393             . ANDDET 12.17 0.020  25.0   3.5  11.0 22.00 12.00  0.99  325. 133.0  1.00 0.400  15.0  3.30  11.0  78.0  .235  .030",
    "IB0036 WAF 9                . ANDDET 12.17 0.040  23.5   2.5  10.5 19.00 10.00  1.00  320. 150.0  1.00 0.500  14.0  3.40   9.0  78.0  .235  .030",
    "IB0037 Brasil 2 Pico        . MESDET 12.17 0.020  29.0   2.5   9.0 17.00 14.00  0.99  290. 150.0  1.00 0.220  15.0  5.00  11.0  78.0  .235  .030",
    "") |>
    write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BRFRM048.CUL")

  c("*BRACHIARIA CULTIVAR COEFFICIENTS: PRFRM048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     N     P     P     N     N     G     G     N     G     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.80  190.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "999992 MAXIMA               . DFAULT 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.80  190.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "", "SP0001 Marandu                G00001 12.50 0.200  99.0  10.0  18.0 33.00 25.00  1.80  190.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035"
  ) |>
    write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BRGRO048.CUL")

  c("*BRACHIARIA DECUMBENS CULTIVAR COEFFICIENTS: CRGRO048 MODEL",
    "!", "! COEFF   DEFINITIONS", "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! Fl-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! Fl-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! Fl-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Trashing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seeds to stop growing as their dry weight",
    "!         increases until the shells are filled in a cohort.",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!                                        1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "CC0001 Brachiaria 1         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "CC0002 Brachiaria 2         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "CN0003 Brachiaria 3         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "CC0004 Brachiaria 4         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "CC0005 Brachiaria 5         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "CN0006 Brachiaria 6         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "SA0001 Brachiaria 7         . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500",
    "BG0001 UF0001               . BR0001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  2.20  225.   2.0  0.01 .0017  18.0  2.05  20.0  78.0  .398  .500"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BSCER048.CUL")

  c("*Sugarbeet CULTIVAR COEFFICIENTS: BSCER048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code of this cultivar, points to the Ecotype in the",
    "!             ECO file (currently not used).", "! P1          Thermal time from seedling emergence to the end of the juvenile",
    "!             phase (expressed in degree days above a base temperature of 3 deg.C)",
    "!             during which the plant is not responsive to changes in",
    "!             photoperiod.", "! P2          Extent to which development (expressed as days) is delayed for",
    "!             each hour increase in photoperiod above the longest photoperiod",
    "!             at which development proceeds at a maximum rate (which is",
    "!             considered to be 12.5 hours).", "! P5          Thermal time from silking to physiological maturity (expressed",
    "!             in degree days above a base temperature of 3 deg.C).",
    "! G2          Potential Leaf growth rate (cm2/cm2).", "! G3          Potential root growth rate (g/m2-day).",
    "! PHINT       Phylochron interval; the interval in thermal time (degree days)",
    "!             between successive leaf tip appearances.", "!",
    "!             Modified from CERES-Maize", "!", "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT",
    "!                                        1     2     3     4     5     6",
    "CR0001 SVRR1142E            . IB0001  940. 0.000 700.0 220.0  37.5 42.00",
    "BU0003 Emma                 . IB0002  969. 0.000 730.0 160.0  25.2 43.40",
    "IH0001 BTS940               . IHSTUT 760.0 0.000 700.0 420.0  27.5 43.00"
    ) |>
  write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CBGRO048.CUL")

  c("*CABBAGE CLTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! Fl-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! Fl-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! Fl-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seeds to stop growing as their dry weight",
    "!         increases until shells are filled in a cohort.", "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     N     P     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.33 0.000  25.0   4.0  11.0 50.00 40.00 1.000  210.  40.0  .550  0.19  23.0  2.20  10.0  10.0  .180  .020",
    "999992 MAXIMA               . DFAULT 12.33 0.000  28.0   6.0  13.0 60.00 60.00 1.100  240.  60.0  .800  0.25  23.0  2.20  40.0  10.0  .180  .020",
    "", "990001 Tastie    4          . CB0401 13.09 0.000  26.0   5.0  11.0 55.00 42.00 1.030  220.  50.0  .600  0.25  23.0  2.20  40.0  10.0  .180  .020",
    "990002 CG        4          . CB0402 13.09 0.000  27.0   6.0  13.0 55.00 40.00 1.030  220.  50.0  .750  0.19  23.0  2.20  10.0  10.0  .180  .020",
    "990003 Kalorama  4          . CB0403 13.09 0.000  26.0   6.0  16.0 82.00 20.00 1.250   80.  20.0  .650  0.19  23.0  2.20  40.0  10.0  .180  .020",
    "                                                                                                                              "
    ) |>
  write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CHGRO048.CUL")

  c("*CHICKPEA CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses WITH daylength effect (for longday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (negative for longday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     N     P     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 11.00 -.143  28.0   6.0  12.5 26.00 34.00 0.900  130.  10.0  0.94 0.150  22.0  1.00  15.0  80.0  .216  .048",
    "999992 MAXIMA               . DFAULT 11.00 -.143  42.0  11.0  16.5 40.00 44.00 1.700  220.  10.0  1.00 0.300  29.0  1.80  18.0  85.0  .216  .048",
    "", "! NOTE from K. Boote. 1-31-22 Annigeri (IB001) and JG74 (IB004) are the only ones that are calibrated with confidence.",
    "! Other cultivars are left there for contrast.  In fact, values for Kabuli and Desi type and the others may no longer be good.",
    "!", "990001 Kabuli Type          . KABULE 11.00 -.143  30.0   8.0  15.0 35.00 42.00 1.000  200.  10.0  0.96 0.181  29.0  1.20  18.0  85.0  .216  .048",
    "990002 Desi Type            . DESI   11.00 -.143  37.0   8.0  15.0 38.00 42.00 1.000  200.  10.0  0.96 0.283  29.0  1.00  18.0  85.0  .216  .048",
    "", "IB0001 ANNIGERI v48calib    . DESI   11.00 -.143  32.0   7.5  18.5 31.00 42.00 0.950  200.  10.0  0.95 0.230  22.0  1.20  17.0  82.0  .216  .048",
    "IB0002 K 850   v48calib     . DFAULT 11.00 -.143  38.5   9.0  13.5 31.00 38.00 1.020  200.  10.0  0.96 0.340  27.0  1.00  17.0  84.0  .216  .048 ",
    "IB0003 G 130   v48calib     . DFAULT 11.00 -.143  39.0  13.5  22.5 28.50 36.00 1.000  200.  10.0  0.96 0.230  28.0  1.20  19.0  84.0  .216  .048",
    "IB0004 JG 74  v48calib      . DESI   11.00 -.143  41.0   7.5  14.5 27.50 34.00 1.040  200.  10.0  0.95 0.225  22.0  1.60  18.0  77.0  .216  .048",
    "IB0005 ICCV 88202 v48calib  . DFAULT 11.00 -.143  29.0   5.5   9.5 28.50 38.00 1.000  200.  10.0  0.96 0.255  29.0  1.30  18.0  85.0  .216  .048",
    "IB0006 ICCC 42    v48calib  . DFAULT 11.00 -.143  35.0   5.0   9.0 29.00 37.00 1.000  155.  10.0  0.96 0.320  29.0  1.20  17.0  85.0  .216  .048",
    "IB0007 ICCV 10    v48calib  . DFAULT 11.00 -.143  35.0   5.0  10.0 28.00 36.00 1.010  200.  10.0  0.96 0.230  29.0  1.30  17.0  85.0  .216  .048",
    "IB0008 ICCV 2     v48calib  . DFAULT 11.00 -.143  26.5   5.0   9.0 27.00 35.00 1.010  200.  10.0  0.96 0.260  29.0  1.00  16.0  85.0  .216  .048",
    "IB0009 ICCC 32    v48calib  . DFAULT 11.00 -.143  40.0   5.0  11.5 29.00 37.00 0.980  150.  10.0  0.96 0.320  29.0  1.10  17.0  85.0  .216  .048",
    "", "", "IB0010 ICCC 37              . DFAULT 11.00 -.143  38.5   6.0  11.0 39.00 46.00 1.000  160.  10.0  0.96 0.220  28.0  1.20  18.0  85.0  .216  .048",
    "IB0012 KAK-2                . KABULE 11.00 -.143  40.0  10.0  15.0 35.00 42.00 1.000  200.  10.0  0.96 0.181  29.0  1.20  18.0  85.0  .216  .048 ",
    "IB0013 JG 218               . JG 218 11.00 -.143  36.0   9.0  12.5 39.00 47.00 1.000  200.  10.0  0.96 0.180  29.0  1.50  18.0  85.0  .216  .048",
    "", "!Global Futures chickpea cultivars (3 life cycle by 2 \"yield levels\")",
    "!                                        1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "", "GF0005 JG11-baseline        . DESI   11.00 -.430  36.5   7.0  14.5 35.00 42.00 1.000  200.  10.0  0.95 0.225  20.0  1.20  18.0  85.0  .216  .048",
    "GF0105 JG11-10%shortcycle   . DESI   11.00 -.430  32.9   6.3  13.1 29.70 35.00 1.000  200.  10.0  0.95 0.225  20.0  1.20  18.0  85.0  .216  .048",
    "GF0205 JG11-10%longercycle  . DESI   11.00 -.430  40.2   7.7  16.0 41.50 49.00 1.000  200.  10.0  0.95 0.225  20.0  1.20  18.0  85.0  .216  .048",
    "", "GF0305 JG11-base+yield      . DESI   11.00 -.430  36.5   7.0  14.5 35.00 42.00 1.100  200.  10.0  1.05 0.225  22.0  1.20  18.0  85.0  .216  .048",
    "GF0405 JG11-10%short+yield  . DESI   11.00 -.430  32.9   6.3  13.1 29.70 35.00 1.100  200.  10.0  1.05 0.225  22.0  1.20  18.0  85.0  .216  .048",
    "GF0505 JG11-10%long+yield   . DESI   11.00 -.430  40.2   7.7  16.0 41.50 49.00 1.100  200.  10.0  1.05 0.225  22.0  1.20  18.0  85.0  .216  .048",
    "", "", "GF0006 RSG888-baseline      . DESI   10.90 -.320  40.8   8.0  13.0 41.00 48.00 1.000  200.  10.0  0.91 0.180  20.0  1.20  18.0  85.0  .216  .048",
    "GF0106 RSG888-10%shortcycl  . DESI   10.90 -.320  35.0   7.2  11.7 30.00 40.00 1.000  200.  10.0  0.91 0.180  20.0  1.20  18.0  85.0  .216  .048",
    "GF0206 RSG888-10%longercycl . DESI   10.90 -.320  47.4   8.8  14.3 54.00 60.00 1.000  200.  10.0  0.91 0.180  20.0  1.20  18.0  85.0  .216  .048",
    "", "GF0306 RSG888-base+yield    . DESI   10.90 -.320  40.8   8.0  13.0 41.00 48.00 1.100  200.  10.0  1.00 0.180  22.0  1.20  18.0  85.0  .216  .048",
    "GF0406 RSG888-10%short+yiel . DESI   10.90 -.320  35.0   7.2  11.7 30.00 40.00 1.100  200.  10.0  1.00 0.180  22.0  1.20  18.0  85.0  .216  .048",
    "GF0506 RSG888-10%long+yiel  . DESI   10.90 -.320  47.4   8.8  14.3 54.00 60.00 1.100  200.  10.0  1.00 0.180  22.0  1.20  18.0  85.0  .216  .048",
    "", "GF0007 Vijay-baseline       . DESI   11.00 -.220  37.2   9.0  13.0 48.00 55.00 1.000  200.  10.0  0.91 0.210  29.0  1.20  18.0  85.0  .216  .048",
    "GF0107 Vijay-10%shortcycle  . DESI   11.00 -.220  33.2   8.1  11.7 38.00 45.00 1.000  200.  10.0  0.91 0.210  29.0  1.20  18.0  85.0  .216  .048",
    "GF0207 Vijay-10%longercycle . DESI   11.00 -.220  41.5   9.9  14.3 58.20 65.00 1.000  200.  10.0  0.91 0.210  29.0  1.20  18.0  85.0  .216  .048",
    "", "GF0307 Vijay-base+yield     . DESI   11.00 -.220  37.2   9.0  13.0 48.00 55.00 1.100  200.  10.0  1.00 0.210  31.9  1.20  18.0  85.0  .216  .048",
    "GF0407 Vijay-10%short+yield . DESI   11.00 -.220  33.2   8.1  11.7 38.00 45.00 1.100  200.  10.0  1.00 0.210  31.9  1.20  18.0  85.0  .216  .048",
    "GF0507 Vijay-10%long+yield  . DESI   11.00 -.220  41.5   9.9  14.3 58.20 65.00 1.100  200.  10.0  1.00 0.210  31.9  1.20  18.0  85.0  .216  .048"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CIGRO048.CUL")

  c("*CHIA CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! =====       ===========", "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL        Critical Short Day Length below which reproductive development",
    "!             progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN       Slope of the relative response of development to photoperiod with time",
    "!             (positive for shortday plants) (1/hour)", "! EM-FL       Time between plant emergence and flower appearance (R1)",
    "!             (photothermal days)", "! FL-SH       Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD       Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM       Time between first seed (R5) and physiological maturity (R7)",
    "!             (photothermal days)", "! FL-LF       Time between first flower (R1) and end of leaf expansion",
    "!             (photothermal days)", "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!             (mg CO2/m2-s)", "! SLAVR       Specific leaf area of cultivar under standard growth conditions",
    "!             (cm2/g)", "! SIZLF       Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT        Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD       Maximum weight per seed (g)", "! SFDUR       Seed filling duration for pod cohort at standard growth conditions",
    "!             (photothermal days)", "! SDPDV       Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR       Time required for cultivar to reach final pod load under optimal",
    "!             conditions (photothermal days)", "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!             at maturity. Causes seeds to stop growing as their dry weight",
    "!             increases until shells are filled in a cohort.",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     N     P     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 14.10 0.001  20.0   4.0  13.0 17.00 28.00 1.500  300.  11.0  0.94 0.001  17.0  2.00  19.0  30.0  .210  .300 ",
    "999992 MAXIMA               . DFAULT 14.10 0.001  30.0   7.0  17.0 20.00 32.00 1.550  375.  17.0  0.98 0.002  21.0  2.50  25.0  45.0  .210  .410  ",
    "", "CI0001 Geotype G8           . CI1111 14.10 0.001  25.0   6.0  14.2 19.20 32.00 1.530  360.  12.6  0.97 0.001  18.0  2.20  25.0  33.6  .210  .410   !kjb, re-calibrated August and 9/3/21"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CNGRO048.CUL")

  c("*CANOLA CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     N     P     P     P     P     P     N     G     G     N     N     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 14.00 -.006  20.0  10.0  15.0 20.00  1.00 1.000  200.  90.0  1.00  .003  18.0  15.0   8.0  81.0  .230  .480",
    "999992 MAXIMA               . DFAULT 24.00 -.006  45.0  16.0  35.0 40.00  10.0 1.000  275. 110.0  1.00  .003  22.0  25.0  12.0  81.0  .230  .480",
    "", "000001 M GROUP  01          . CN0001 24.00 -.030  29.0  15.0  30.5 25.00  3.00 1.030  250. 100.0  1.00  .003  20.0  22.0  10.0  81.0  .230  .480 ",
    "OT0001 KABEL (11)           . CN0001 16.00 -.006  45.0  12.5  18.5 33.50  1.00 1.000  230. 095.0  1.00  .003  20.0  18.0  10.0  81.0  .230  .480 ",
    "CA0001 Invigor5440          . CN0001 16.00 -.011  28.5  13.0  19.0 26.50  3.00 1.280  300. 100.0  1.00  .003  20.0  22.0  10.0  81.0  .230  .480 ",
    "") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "COGRO048.CUL")

  c("*COTTON CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)---from Reddy Adv. Agron. 1997?", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seeds to stop growing as their dry weight",
    "!         increases until the shells are filled in a cohort.",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!Of all these cultivars, only Deltapine 77 (2) and Deltapine 555 (6 to 7) were calibrated with growth analyses data",
    "!Delapine 555 really may be the same cultivar as Deltapine 555 BG/RR, but I don't know the background.",
    "!Rest are rather flimsey calibrations from yield (seed cotton = seed plus lint).  GP 3774 from LAI and RLD only",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     N     P     P     P     P     P     N     G     G     N     N     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 23.00  0.01  34.0   8.0  15.0 40.00 65.00  1.00  170. 250.0  0.55 0.180  24.0 20.00   8.0  70.0  .153  .120",
    "999992 MAXIMA               . DFAULT 23.00  0.01  44.0  12.0  18.0 49.00 75.00  1.10  175. 300.0  0.80 0.180  35.0 27.00  14.0  72.0  .153  .120",
    "", "IB0001 Deltapine 77         2 CO0001 23.00  0.01  34.0   8.0  15.0 49.00 75.00  1.10  170. 280.0  0.80 0.180  35.0 27.00   8.0  70.0  .153  .120  ",
    "IB0002 Deltapine 458        9 CO0003 23.00  0.01  39.0  12.0  15.0 40.00 75.00  1.05  170. 300.0  0.72 0.180  34.0 27.00  14.0  70.0  .153  .120  ",
    "IB0003 Delapine 555 (error) 1 CO0005 23.00  0.01  40.0  12.0  17.0 45.00 75.00  1.10  170. 300.0  0.64 0.180  35.0 27.00  12.0  72.0  .153  .120  ",
    "IB0004 Deltapine 555 BG/RR  6 CO0005 23.00  0.01  38.0  11.0  16.0 43.00 65.00  1.10  170. 300.0  0.76 0.180  35.0 27.00  12.0  70.0  .153  .120",
    "IB0006 Deltapine 1219       1 CO0006 23.00  0.01  48.0   4.0   8.0 40.00 50.00  1.10  170. 300.0  0.80 0.180  35.0 27.00  12.0  70.0  .153  .120                                          ",
    "GA0001 Georgia King        10 CO0005 23.00  0.01  44.0  11.0  16.0 38.00 75.00  1.05  170. 300.0  0.61 0.180  35.0 27.00  12.0  70.0  .153  .120  ",
    "TX0003 GP 3774 (RLD,LAI )   1 CO0021 23.00  0.01  35.0  10.0  18.0 45.00 75.00  1.10  175. 250.0  0.55 0.180  24.0 20.00   8.0  70.0  .153  .120  "
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CPGRO048.CUL")

  c("*COWPEA CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "! THRESH  The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))       ", "!",
    "!             P/G/N:Phenology/Growth/Not used for calbration ",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     P     P     P     N     G     G     N     G     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.50 .0200 22.00  2.50 5.000 23.00 34.00 0.900  200. 170.0  0.50 .0500   5.5   6.0  13.0  74.0  .300  .065 ",
    "999992 MAXIMA               . DFAULT 13.10 .3000 38.00  3.60 8.000 48.00 44.00 1.100  260. 260.0  1.00 .6500   8.5  15.0  30.0  83.0  .300  .065 ",
    "", "CP0001 CAL # 5  MG4       1,2 CP0409 12.80 .2646 23.46  3.80 6.000 24.85  7.00 1.000  250. 260.0  1.00 .1400   8.5   6.4  16.0  83.0  .300  .065",
    "CP0003 TVU3046 - India    1,1 CP0411 12.80 .1096 25.60  3.00 6.000 32.00  9.00 0.900  250. 220.0  0.84 .0405   7.0   9.7  20.0  74.9  .300  .065",
    "CP0004 UCR 368 - Kenya    1,1 CP0412 12.80 .0545 25.60  2.50 5.000 48.00 16.00 0.900  250. 240.0  0.82 .0775   8.0 10.30  31.0  77.7  .300  .065",
    "CP0005 TVU3644 - Nigeria  1,1 CP0413 12.80 .1576 37.00  2.50 6.000 22.00 15.00 1.000  200. 170.0  0.52 .0420   5.5  15.0  14.0  74.6  .300  .065",
    "CP0006 VERDE BRASIL         . CP0410 12.80 .2940 33.20  3.50  7.20 31.00 17.00 1.000 260.0 270.0 0.850 .2200   7.0  6.40  32.0  66.5  .300  .065",
    "CP0012 277                  . CP0414 12.80 .2940 28.57  3.00  6.00 11.52 18.00 1.000 325.0 133.0 1.000 .6000  14.4  3.50   3.5  82.0  .300  .065",
    "CP0014 349                  . CP0414 12.80 .2940 34.14  3.00  6.00 13.17 18.00 1.000 325.0 133.0 1.000 .6500  21.9  5.20   6.0  82.0  .300  .065",
    "", "II0001 Kanannado            . CP0414 12.50 .3000 40.00  3.00  6.00 25.00 18.00 1.000 325.0 150.0 0.500 0.600   8.0   3.5  16.0  82.0  .300  .065",
    "II0002 IT86D-719            . CP0414 12.80 .2940 30.50  2.50  6.00 18.00  5.00 1.000 275.0 150.0 1.000 0.240   7.0   5.2  14.0  82.0  .300  .065",
    "II0003 IT90K-277-2          . CP0414 12.80 .2940 34.14  3.00  6.00 20.00 18.00 1.000 325.0 150.0 0.900 0.600   8.0   3.5  16.0  82.0  .300  .065",
    "II0004 IT96D-748            . CP0414 12.80 .2940 34.14  3.00  6.00 20.00 18.00 1.000 325.0 150.0 0.900 0.600   8.0   3.5  16.0  82.0  .300  .065",
    "II0014 349*                 . CP0414 12.80 .2940 34.14  3.00  6.00 20.00 18.00 1.000 325.0 150.0 0.900 0.600   8.0   3.5  16.0  82.0  .300  .065",
    "                                                                                                                                    ",
    "                                                                                                                                    "
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "CSCAS048.CUL")

  c("$CULTIVARS:CSCAS048.20200721   Last edit: 2021-05-06 GH",
    "!", "! Coefficients used in the Cropsim cassava module differ from those used",
    "! in the earlier DSSAT cassava model. It is best,therefore,not to attempt",
    "! to convert 'old' coefficients, but to calibrate anew using the available",
    "! experiments. And even with a fresh calibration,it is good practice to ",
    "! test any set of coefficients by using them with real experiments that",
    "! were not used for calibration,and then comparing model outputs to ",
    "! measured values. ", "", "! Users should also be aware that some of the coefficients (eg.PHINT) may ",
    "! vary from region to region,and perhaps even from sowing date to sowing ",
    "! date,reflecting not only the current incomplete understanding of the ",
    "! environmental physiology of the crop, but also deficiencies in defining ",
    "! the initial conditions and computing the microbial release of nitrogen ",
    "! and other nutrients.", "!", "! COEFF       DEFINITION", "! ========    ==========",
    "! BxyND       Duration from branch x to branch y (ie.tier x,node number)",
    "! ECO#        Ecotype code for this cultivar,points to entry in the ECO file",
    "! EXP#        Number of experiments used for calibration.",
    "! HMPC        Harvest product moisture content (%)", "! LA1S        Area/leaf (cm2) of the first leaves when growing without stress.",
    "! LAFND       Node # at which the end of cycle area/leaf reached (#)",
    "! LAFS        End of cycle area/leaf (cm2)", "! LAXND       Node # at which maximum potential area/leaf reached (#)",
    "! LAXN2       Node # at which potential area/leaf begins to decline (#)",
    "! LAXS        Area/leaf at maximum area/leaf (cm2)", "! LLIFA       Leaf life,from full expansion to start senescence (Thermal units)",
    "! LPEFR       Leaf petiole fraction (fr of lamina+petiole)",
    "! PHINT       Interval between leaf tip appearances for first leaves (oC.d)",
    "! PPSn        Photoperiod sensitivity for phase n. (% drop for 10h pp.change)",
    "! SLAS        Specific leaf lamina area when crop growing without stress (cm2/g)",
    "! SRFR        Fr.of assimilate designated for tops sent to storage root (#)",
    "! SR#W        Storage root number per unit canopy weight at initiation (#/g)",
    "! STFR        Stem fraction of assimilate destined for canopy growth (#)",
    "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "*CULTIVARS:CSCAS048", "!                                    PPSEN ------------ BRANCHING ------------ - STORAGE ROOTS - ---- LEAF PRODUCTION,SIZES,SP.AREA,LONGEVITY,PETIOLES -----  STEM  ",
    "@VAR#  VAR-NAME........  EXP#   ECO#  PPS1 B01ND B12ND B23ND B34ND B45ND B56ND SR#WT  SRFR  HMPC PHINT  LA1S  LAXS LAXND LAXN2  LAFS LAFND  SLAS LLIFA LPEFR  STFR",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21",
    "!Calibration                             P     P     P     P     P     P     P     G     G     G     G     G     G     G     G     G     G     G     G     G     G",
    "!                                            Nd#   Nd#   Nd#   Nd#   Nd#   Nd#   #/g    fr     %  oC.d   cm2   cm2     #     #   cm2     # cm2/g    Tu    fr    fr         ",
    "999991 MINIMA               . 999991     0  25.0  25.0  25.0  25.0  25.0  25.0  0.20  0.00    40    15   200  1000    80    80    20   100   100   300  0.20  0.25 ",
    "999992 MAXIMA               . 999992     0  35.0  35.0  35.0 300.0  35.0  35.0  0.35  0.35    80    30   400  2000   200   200    50   350   400  1200  0.40  0.45 ",
    "                                                                                                                                                                  ",
    "DFAULT DEFAULT              . DFAULT     0    10    20    20    30   200   200  0.25  0.30    50    24   300  1900   100   100    30   150   200   800  0.33  0.35",
    "                                                                                                                                                                        ",
    "! The following cultivars have not been calibrated well and the coefficiefficients are                                                                            ",
    "! present merely to allow the experiments to be run. A user should spend time calibrating for                                                                    ",
    "! his/her own data.                                                                                                                                               ",
    "                                                                                                                                                                  ",
    "UC0002 MCol-22              . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   120    60    80    70   150   180   900  0.33  0.35",
    "UC0004 MMEX-59              . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   120    60    80    70   150   180   900  0.33  0.35",
    "UC0006 MCol-1684            . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   200    60    80    50   150   180   600  0.33  0.45",
    "UC0007 MVen-77              . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    50   400    60    80    70   150   180   800  0.33  0.35",
    "UC0008 MPtr-26              . 990003     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    50   400    60    80    70   150   180   800  0.33  0.35",
    "UC0009 MCol-638             . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    50   400    60    80    70   150   180   800  0.33  0.35",
    "", "!Thai", "@VAR#  VAR-NAME........  EXP#   ECO#  PPS1 B01ND B12ND B23ND B34ND B45ND B56ND SR#WT  SRFR  HMPC PHINT  LA1S  LAXS LAXND LAXN2  LAFS LAFND  SLAS LLIFA LPEFR  STFR",
    "TH0001 Rayong1 (RY1)        . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    50   400    60    80    70   150   180   800  0.33  0.35  ",
    "TH0002 Rayong90 (RY90)      . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17   400   120    60    80    70   150   180   900  0.33  0.35  ",
    "TH0003 Rayong5 (RY5)        . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   200    60    80    50   150   180   600  0.33  0.45  ",
    "TH0004 KU50 (KU50)          . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   300    60    80   100   150   180   900  0.33  0.45  ",
    "TH0005 Rayong3 (RY3)        . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35  ",
    "TH0006 Rayong72 (RY72)      . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    50   400    60    80    70   150   180   800  0.33  0.35  ",
    "!                                                                                                                                                                       ",
    "TH0002 Rayong90 (RY90)      . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17   400   120    60    80    70   150   180   900  0.33  0.35  ",
    "TH0003 Rayong5 (RY5)        . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   200    60    80    50   150   180   600  0.33  0.45  ",
    "TH0004 KU50 (KU50)          . 990001     0  25.0  25.0  25.0 255.0  25.0  25.0  0.25  0.00    50    17    50   300    60    80   100   150   180   900  0.33  0.45  ",
    "TH0005 Rayong3 (RY3)        . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "TH0006 Rayong3 (RY3)        . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "TH0007 RY11(try)            . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "TH0009 RY9 (try)            . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   600  0.33  0.35 ",
    "!", "TH0051 RY72                 . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "TH0052 RY72                 . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "TH0053 RY72                 . 990001     0  35.0  35.0  35.0  35.0  35.0  35.0  0.25  0.00    50    17    30   200    60    80    70   150   180   800  0.33  0.35 ",
    "", "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "CSYCA048.CUL")

  c("$CULTIVARS:CSYCA048.041621    Last edit: 07/26/2021 LPM",
    "", "", "! Users should be aware that some of the coefficients may ",
    "! vary from region to region,and perhaps even from sowing date to sowing ",
    "! date,reflecting not only the current incomplete understanding of the ",
    "! environmental physiology of the crop, but also deficiencies in defining ",
    "! the initial conditions.", "", "*CULTIVARS:CSYCA048", "! The following cultivars have not been calibrated well and the coefficients are                                                                            ",
    "! present merely to allow the experiments to be run. A user should spend time calibrating for                                                                    ",
    "! his/her own data. ", "", "!                                    ---------------BRANCHING----------------------- -------------- LEAVES ------- ---STEM----",
    "@VAR#  VAR-NAME........  EXP#   ECO# B01ND B12ND B23ND B34ND BR1FX BR2FX BR3FX BR4FX  LAXS  SLAS LLIFA LPEFR LNSLP NODWT NODLT",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15",
    "!Calibration                             P     P     P     P     G     G     G     G     G     G     G     G     G     G     G ",
    "!                                       Tu    Tu    Tu    Tu    F#    F#    F#    F#   cm2 cm2/g    Tu    fr     #     g    cm",
    "999991 MINIMA               . 999991 100.0 100.0 100.0 100.0   1.0   1.0   1.0   1.0   300   150   600  0.20  0.70  3.00   1.0",
    "999992 MAXIMA               . 999992 1800. 1800. 1800. 1800.   4.0   4.0   4.0   4.0   900   280  1800  0.35  1.80 15.00   4.0",
    "", "DFAULT DEFAULT              . DFAULT 200.0 250.0 250.0 250.0   2.2   2.7   2.0   1.5   350   220  1000  0.33  1.20  4.00   2.0",
    "", "UC0002 MCol-22              . 990002 252.2 232.6 200.6 214.0   2.4   2.9   2.2   1.6   325   277   720  0.20  1.20  3.04   2.0",
    "UC0003 CMC 40               . 990014 680.0 300.0 300.0 300.0   3.0   2.0   2.0   2.0   320   200   600  0.33  1.60  8.00   2.0",
    "UC0004 MMEX-59              . 990001 200.0 150.0 150.0 150.0   2.0   2.5   2.3   1.6   650   180   900  0.33  1.10  6.00   2.0",
    "UC0005 Ceiba                . 990013 350.0 350.0 350.0 350.0   3.1   2.7   2.7   2.7   650   200   800  0.33  1.10  6.00   2.0",
    "UC0006 MCol-1684            . 990003 150.0 200.0 200.0 200.0   2.2   3.0   2.0   1.2   300   220   800  0.33  1.10  3.00   2.0",
    "UC0007 MVen-77              . 990005 450.0 150.0 150.0 200.0   3.1   2.7   2.0   1.5   700   200  1200  0.33  1.40 10.00   2.0",
    "UC0008 MPtr-26              . 990004 500.0 200.0 200.0 200.0   3.0   2.6   1.5   1.5   700   180  1019  0.33  1.60  8.00   2.0",
    "UC0009 MCol-638             . 990006 700.0 450.0 450.0 450.0   3.0   3.0   3.0   3.0   900   180  1060  0.33  1.10  8.00   2.0",
    "UC0010 TMS 30572            . 990015 350.0 120.0 120.0 120.0   3.0   3.0   2.5   1.5   600   180  1200  0.33  1.10  8.00   2.0",
    "UC0011 MCol-113             . 990008 300.0 380.0 380.0 380.0   4.0   4.0   4.0   4.0   430   200   957  0.33  1.20  6.30   2.0",
    "UC0012 CM 523-7             . 990007 696.0 1206. 1206. 1206.   3.1   2.7   2.7   2.7   400   253  1000  0.33  1.80  5.00   2.0",
    "UC0013 MCol-72              . 990002 1500. 700.0 700.0 700.0   3.0   2.0   2.0   2.0   430   200   957  0.33  1.40  6.30   2.0",
    "UC0014 CM 507-37            . 990007 750.0 500.0 500.0 500.0   3.1   2.7   2.7   2.7   600   220   600  0.33  1.80  5.00   2.0",
    "UC0015 MMex-11              . 990002 696.0 1206. 1206. 1206.   3.0   2.0   2.0   2.0   600   220   700  0.33  0.80  5.60   2.0",
    "UC0016 MCol-113 3Br         . 990009 300.0 380.0 380.0 380.0   3.0   3.0   3.0   3.0   430   200   957  0.33  1.20  6.30   2.0",
    "UC0017 MCol-113 2Br         . 990010 300.0 380.0 380.0 380.0   2.0   2.0   2.0   2.0   430   200   957  0.33  1.20  6.30   2.0",
    "UC0018 MCol-113 1Br         . 990011 300.0 260.0 260.0 260.0   1.0   1.0   1.0   1.0   430   200   957  0.33  1.20  6.30   2.0",
    "UC0019 MCol-113 1-4Br       . 990012 300.0 380.0 380.0 380.0   1.0   1.0   4.0   4.0   430   200   957  0.33  1.20  6.30   2.0",
    "", "! COEFF       DEFINITION", "! ========    ==========", "! BxyND       Duration (thermal time) from branch x to branch y",
    "! BRxFX       Branch number per fork at fork x (#)", "! EXP#        Number of experiments used for calibration.",
    "! ECO#        Ecotype code for this cultivar,points to entry in the ECO file",
    "! LAXS        Maximum area/leaf when crop growing without stress(cm2)",
    "! LLIFA       Leaf life,from full expansion to start senescence (Thermal units)",
    "! LNSLP       Slope for leaf production (0.8 low rate, 1.0 medium rate, 1.2 high rate)",
    "! LPEFR       Leaf petiole fraction (fr of lamina+petiole)",
    "! NODLT       Mean internode length (cm) for the first stem of the shoot before branching when is lignified ",
    "! NODWT       Node weight for the first stem of the shoot before branching at 3400 ˚Cd",
    "! SLAS        Specific leaf lamina area when crop growing without stress (cm2/g)",
    "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "FBGRO048.CUL")

  c("*FABA BEAN CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! Fl-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! Fl-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! Fl-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     N     N     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 24.00 -.031  16.0   9.0  20.0 28.00 45.00  0.90  260. 100.0  1.00 0.900  21.0  2.40  18.0  77.0  .315  .020",
    "999992 MAXIMA               . DFAULT 24.00 -.031  22.0  12.0  28.0 36.00 45.00  1.10  340. 150.0  1.00 1.300  21.0  2.40  18.0  77.0  .315  .020",
    "", "CORD01 ALAME LD170 1.2g     . FABLON 24.00 -.031  18.0  10.9  24.0 34.50 45.00  1.00  285. 110.0  1.00 1.100  21.0  2.40  18.0  77.0  .315  .020",
    "CORD02 BROCA LD170 1.2G     . FABLN2 24.00 -.031  18.0  10.5  23.5 32.80 45.00  1.00  300. 110.0  1.00 1.100  21.0  2.40  18.0  77.0  .315  .020",
    "\032") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "G0GRO048.CUL")

  c("*BAHIA GENOTYPE COEFFICIENTS: CRGRO048 Model", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1 2/21/03 lowered to 1.44 to be more in line with reported mean readings and lower leaf PG rate-was 2X that of soybean",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15",
    "!Calibration                             P     P     P     P     P     P     P     G     G     G     G     G     G     G     G",
    "", "999991 MINIMA               . DFAULT 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.44  285.   2.0  0.01 0.020  15.0  2.05  20.0",
    "999992 MAXIMA               . DFAULT 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.44  285.   2.0  0.01 0.020  15.0  2.05  20.0",
    "", "UF0001 PENSACOLA BAHIA        G00001 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.44  285.   2.0  0.01 0.020  15.0  2.05  20.0"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "GBGRO048.CUL")

  c("*GREENBEAN CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     N     P     P     N     G     G     G     N     G     G     G     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 11.78 0.000   9.0   2.8  11.0 12.00 18.00  0.85  220. 124.0  1.00 0.250  12.0  4.00   6.0  77.0  .255  .030",
    "999992 MAXIMA               . DFAULT 14.60 0.385  28.9  10.0  15.0 16.00 18.00  1.20  300. 140.0  1.00 0.340  16.0  6.00  10.0  77.0  .255  .030",
    "", "!recalibrated 1/28/22 by KJB", "GB0001 Bronco Habit 1       . SNAPBN 12.17 0.000  21.0   2.8  12.0 15.00 12.00  1.00  250. 133.0  0.97 0.290  14.0  5.40   6.0  77.0  .255  .030 !1/29/22 kjb",
    "!GB0001 Bronco Habit 1       . SNAPBN 12.17 0.000  21.0   2.8  13.0 14.00 12.00  1.00  250. 133.0  1.00 0.290  14.0  5.40   6.0  77.0  .255  .030 !v4.7"
    ) |>
  write(input_file)

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
                       "ECO#" = "%7s", CSDL = "%6.1f", PPSEN = "%6.3f",
                       "EM-FL" = "%6.0f", "FL-SH" = "%6.0f",
                       "FL-SD" = "%6.0f", "SD-PM" = "%6.0f",
                       "FL-LF" = "%6.0f", LFMAX = "%6.2f", SLAVR = "%6.0f",
                       SIZLF = "%6.0f", XFRT = "%6.2f", WTPSD = "%6.2f",
                       SFDUR = "%6.0f", SDPDV = "%6.2f", PODUR = "%6.0f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "GGFRM048.CUL")

  c("*GUINEAGRASS GENOTYPE COEFFICIENTS                                                                                                                                                                            ",
    "! Guineagrass - Panicum maximum                                                                         ",
    "!                                                                                                                                                                                                                 ",
    "! COEFF   DEFINITIONS                                                                                                                                                                                   ",
    "! =====   ===========                                                                                                                                                                                   ",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)                                                                                                                          ",
    "! CSDL    Critical Short Day Length below which reproductive development                                                                                                                                ",
    "!         progresses with no daylength effect (for shortday plants) (hour)                                                                                                                              ",
    "! PPSEN   Slope of the relative response of development to photoperiod with time                                                                                                                        ",
    "!         (positive for shortday plants) (1/hour)                                                                                                                                                       ",
    "! EM-FL   Time between plant emergence and flower appearance (R1)                                                                                                                                       ",
    "!         (photothermal days)                                                                                                                                                                           ",
    "! FL-SH   Time between first flower and first pod (R3) (photothermal days)                                                                                                                              ",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)                                                                                                                             ",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)                                                                                                                                  ",
    "!         (photothermal days)                                                                                                                                                                           ",
    "! FL-LF   Time between first flower (R1) and end of leaf expansion                                                                                                                                      ",
    "!         (photothermal days)                                                                                                                                                                           ",
    "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light                                                                                                                         ",
    "!         (mg CO2/m2-s) default was 1.98 - set to 1.76=40 umol m-2 s-1 yielding Boote et al.'s 35.5 umol m-2s-1 @ 2000 umol photons m-2s-1 2/21/03 low                                                  ",
    "! SLAVR   Specific leaf area of cultivar under standard growth conditions                                                                                                                               ",
    "!         (cm2/g)                                                                                                                                                                                       ",
    "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)                                                                                                                                              ",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell                                                                                                                          ",
    "! WTPSD   Maximum weight per seed (g)                                                                                                                                                                   ",
    "! SFDUR   Seed filling duration for pod cohort at standard growth conditions                                                                                                                            ",
    "!         (photothermal days)                                                                                                                                                                           ",
    "! SDPDV   Average seed per pod under standard growing conditions (#/pod)                                                                                                                                ",
    "! PODUR   Time required for cultivar to reach final pod load under optimal                                                                                                                              ",
    "!         conditions (photothermal days)                                                                                                                                                                ",
    "!                                                                                                                                                                                                       ",
    "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ",
    "!                                        1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "SP0009 Mombaca                GG0009 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.91  180.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "SP0009 Tanzania               GG0009 12.00 0.200  99.0  10.0  18.0 33.00 25.00  1.91  180.   2.0  0.01 0.020  15.0  2.05  20.0  78.0  .115  .035",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MLCER048.CUL")

  c("*MILLET CULTIVAR COEFFICIENTS: MLCER048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! =========   ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code for this cultivar, points to the Ecotype in the",
    "!             ECO file (currently not used).", "! P1          Thermal time from seedling emergence to the end of the juvenile",
    "!             phase (expressed in degree days above a base temperature of 10\xf8C)",
    "!             during which the plant is not responsive to changes in",
    "!             photoperiod.", "! P2O         Critical photoperiod or the longest day length (in hours) at",
    "!             which development occurs at a maximum rate. At values greater",
    "!             than P2O, the rate of development is reduced.",
    "! P2R         Extent to which phasic development leading to panicle",
    "!             initiation (expressed in degree days) is delayed for each hour",
    "!             increase in photoperiod above P2O.", "! P5          Thermal time (degree days above a base temperature of 10\xf8C)",
    "!             from beginning of grain filling (3-4 days after flowering)",
    "!             to physiological maturity.", "! G1          Scaler for relative leaf size.",
    "! G4          Scaler for partitioning of assimilates to the panicle (head).",
    "! PHINT       Phylochron interval; the interval in thermal time (degree days)",
    "!             between successive leaf tip appearances.", "! GT          Tillering coefficient, equivalent to G1, but on tillers",
    "! G5          Potential grain size, mg", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2O   P2R    P5    G1    G4 PHINT    GT    G5",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9",
    "!Calibration                             P     P     P     P     G     G     N     G     G",
    "", "999991 MINIMA               . DFAULT 100.0 10.00  50.0 100.0  0.10  0.50 43.00  1.00  10.0",
    "999992 MAXIMA               . DFAULT 400.0 15.00 900.0 700.0  3.00 20.00 43.00  1.50  11.0",
    "!", "! The sample 3 varieties were estimated to give increasing days to maturity",
    "! moving from north to south", "!", "990001 NORTH VARIETY        . IB0001 120.0 12.00 125.0 360.0  2.00  0.50 43.00  1.00  11.0",
    "990002 MIDDLE VARIETY       . IB0001 140.0 12.00 150.0 500.0  2.00  0.50 43.00  1.00  11.0",
    "990003 SOUTH VARIETY        . IB0001 180.0 12.00 150.0 600.0  2.00  0.50 43.00  1.00  11.0",
    "!", "IB0033 BJ104                . IB0001 120.0 13.40 145.0 340.0  0.60  1.00 43.00  1.50  10.0",
    "IB0034 CZH-859              . IB0001 170.0 12.10 138.0 420.0  2.13  0.50 43.00  1.00  11.0",
    "IB0035 CZP-87               . IB0001 136.0 12.40 130.0 370.0  2.10  0.50 43.00  1.00  11.0",
    "IB0036 CZMP-2               . IB0001 135.0 12.60 140.0 370.0  2.00  0.50 43.00  1.00  11.0",
    "IB0037 MBH-110              . IB0001 140.0 12.50 148.0 365.0  2.12  0.50 43.00  1.00  11.0",
    "IB0038 RCB-2                . IB0001 136.0 12.10 135.0 365.0  2.14  0.50 43.00  1.00  11.0",
    "IB0039 CZP-78               . IB0001 136.0 12.10 125.0 362.0  2.00  0.50 43.00  1.00  11.0",
    "IB0040 CZP-85               . IB0001 142.0 12.30 130.0 380.0  2.15  0.50 43.00  1.00  11.0",
    "IB0041 WCC-75               . IB0001 160.0 12.00 142.0 422.0  2.10  0.50 43.00  1.00  11.0",
    "IB0042 CZP-84               . IB0001 138.0 12.20 128.0 360.0  2.30  0.50 43.00  1.00  11.0",
    "IB0043 CZH-83-J1            . IB0001 136.0 12.60 130.0 300.0  2.30  0.50 43.00  1.00  11.0",
    "IB0044 CIVT                 . IB0001 100.0 12.00 142.0 390.0  0.60  0.60 43.00  1.20  11.0",
    "IB0045 59022A X 89-083      . IB0001 100.0 12.00  18.0 200.0  0.0  19.00 43.00  1.00  11.0  !CTS",
    "IB0046 1011A X 086R         . IB0001 100.0 12.00  35.0 120.0  0.0  17.00 43.00  1.00  11.0  !CTS",
    "IB0047 1361M X 6Rm          . IB0001 100.0 12.00  55.0 105.0  0.0  11.00 43.00  1.00  11.0  !CTS",
    "IB0048 Heini Kirey          . IB0001 396.0 12.00 470.0 140.0  0.50 11.80 43.00  1.00  11.0  !CTS",
    "IB0049 Zatib                . IB0001 309.0 12.00 410.0 108.0  0.50 13.00 43.00  1.00  11.0  !CTS",
    "IB0050 3/4HK                . IB0001 270.0 12.00 390.0 108.0  0.50 18.00 43.00  1.00  11.0  !CTS",
    "IB0149 Sadore-Local         . IB0001 170.0 12.00 150.0 450.0  1.00  0.55 43.00  1.00  11.0  !JWJ",
    "IM0015 SaniobaB             . IB0001 413.0 12.80 999.9 640.0   3.0   6.5 65.00  1.00  11.0  ! Jawoo",
    "IM0016 SaniobaB             . IB0001 413.0 12.80 999.9 640.0   3.0   6.5 65.00  1.00  11.0  ! Jawoo ",
    "", "! The genetic coeff of the following cultivars were based on phenology and end-of-season data only (ICAR multi-site expts)",
    "IB0052 PUSA 23              . IB0001 120.0 12.90 110.0 350.0  1.00  0.70 43.00  1.50  11.0",
    "IB0054 GHB 558              . IB0001 145.0 12.70  15.0 360.0  1.00  1.00 43.00  1.50  11.0",
    "", "! Calibrated by Piara Singh (paper 2017)", "IB0051 ICMH356-baseline     . IB0001 120.0 12.70  86.0 340.0  1.00  1.00 43.00  1.50  11.0",
    "IB0053 Sharda-baseline      . IB0001 120.0 12.00  15.0 360.0  1.00  1.00 43.00  1.50  11.0",
    "! Based on Akponike's Ph. D thesis work (2008), modified by P. Singh",
    "IB0072 CIVT-baseline        . IB0001 365.0 12.00 260.0 285.0  0.60  0.73 43.00  1.20  11.0",
    "", "! The genetic coeff of the following cultivars were based on ICRISAT watershed expts data",
    "IB0060 ICTP 8203            . IB0201 120.0 12.80  10.0 310.0  0.90  0.90 43.00  1.20  11.0",
    "IB0061 ICMV 221             . IB0001 120.0 12.00 125.0 360.0  0.50  0.57 43.00  1.20  11.0",
    "", "! The genetic coeff of the following cultivars were based on ICRISAT data (Van Oostrom et al data)",
    "IB0062 ERajPop              . IB0201 110.0 13.90 440.0 230.0  0.70  0.90 43.00  1.00  11.0",
    "IB0063 NokhaLocal           . IB0201 110.0 13.90 440.0 230.0  0.70  0.78 43.00  1.00  11.0",
    "IB0064 WRajPop              . IB0201 110.0 13.90 440.0 390.0  0.70  0.63 43.00  1.00  11.0",
    "IB0065 RCBIC 911            . IB0201 120.0 13.40  15.0 340.0  0.70  1.00 43.00  1.00  11.0",
    "IB0066 CZIC 922             . IB0201 110.0 13.40  15.0 360.0  0.70  0.69 43.00  1.00  11.0",
    "IB0067 Landrace             . IB0201 110.0 13.40  15.0 250.0  0.70  0.83 43.00  1.00  11.0",
    "IB0068 Non-landrace         . IB0201 120.0 12.20  15.0 300.0  0.70  1.00 43.00  1.00  11.0",
    "IB0069 WCC-75               . IB0201 120.0 13.50 142.0 230.0  0.70  1.00 43.00  1.00  11.0",
    "", "IB0070 BK 560               . IB0001 100.0 13.40  15.0 230.0  0.70  1.00 43.00  1.20  11.0",
    "IB0071 ICMH 451             . IB0001 120.0 12.00 110.0 360.0  0.90  0.80 43.00  1.50  11.0",
    "", "! Based on Crafurd and Bidinger (1988) papers", "IB0073 81A X Souna B        . IB0201 120.0 13.40  95.0 265.0  0.80  1.05 43.00  1.50  11.0",
    "IB0074 841A X J104          . IB0301 120.0 13.20 100.0 250.0  0.70  1.00 43.00  1.50  11.0",
    "", "! Based on Akponike's Ph. D thesis work (2008)", "IB0075 Heini Kirey          . IB0001 396.0 12.00 410.0 285.0  0.60  0.80 43.00  1.20  11.0 ",
    "IB0076 Zatib                . IB0001 340.0 12.00 260.0 285.0  0.45  0.90 43.00  1.00  11.0  ",
    "IB0077 3/4HK                . IB0001 270.0 12.00 390.0 108.0  0.40 18.00 43.00  1.00  11.0",
    "", "! Provided by Gerrit Hoogenboom (Nebraska study), but GCs were further changed by Piara Singh",
    "IB0078 59022A X 89-083      . IB0001 100.0 12.50   3.0 280.0  0.9   1.00 43.00  1.00  11.0  ",
    "IB0079 1011A X 086R         . IB0001 100.0 12.50   3.0 280.0  0.9   0.90 43.00  1.00  11.0  ",
    "IB0080 1361M X 6Rm          . IB0001 100.0 12.50   8.0 330.0  0.4   0.53 43.00  1.00  11.0  ",
    "", "! Developed by DR Alagarswamy based on old ICRISAT data",
    "IB0082 BJ104                . IB0001 120.0 13.40 145.0 340.0  0.60  1.00 43.00  1.50  10.0",
    "", "! Based on Akponike's Ph. D thesis work (2008)", "IB0083 ICMVIS 89305         . IB0001 365.0 12.00 210.0 285.0  0.60  1.00 43.00  1.20  11.0  ",
    "", "! Suppled by Dr Hoogenboom from his student work- coefficients for DSSAT4.5 - March 2010                             ",
    "IB0045 59022A X 89-083      . IB0001 100.0 12.00  18.0 200.0  0.0  19.00 43.00  1.00  11.0  ",
    "IB0046 1011A X 086R         . IB0001 100.0 12.00  35.0 120.0  0.0  17.00 43.00  1.00  11.0  ",
    "IB0047 1361M X 6Rm          . IB0001 100.0 12.00  55.0 105.0  0.0  11.00 43.00  1.00  11.0  ",
    "IB0048 Heini Kirey          . IB0001 396.0 12.00 470.0 140.0  0.50 11.80 43.00  1.00  11.0  ",
    "IB0049 Zatib                . IB0001 309.0 12.00 410.0 108.0  0.50 13.00 43.00  1.00  11.0  ",
    "IB0050 3/4HK                . IB0001 270.0 12.00 390.0 108.0  0.50 18.00 43.00  1.00  11.0  ",
    "", "IB0087 BJ104                . IB0001 120.0 13.40 145.0 340.0  0.50  1.00 43.00  1.50  10.0",
    "IB0088 81A X Souna B        . IB0201 120.0 13.40  95.0 265.0  0.50  1.60 43.00  1.50  11.0",
    "IB0089 841A X J104          . IB0301 120.0 13.20 100.0 250.0  0.50  1.00 43.00  1.50  11.0",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MZCER048.CUL")

  c("*MAIZE CULTIVAR COEFFICIENTS: MZCER048 MODEL", "!", "!The P1 values for the varieties used in experiments IBWA8301 and",
    "!UFGA8201 were recalibrated to obtain a better fit for version 3",
    "!of the model. After converting from 2.1 to 3.0 the varieties",
    "!IB0035, IB0060, and IB0063 showed an earlier simulated flowering",
    "!date. To correct this, the P1 values were recalibrated.", "!The reason for this is that there was an error in PHASEI in",
    "!version 2.1 that had TLNO=IFIX(CUMDTT/21.+6.) rather than",
    "!TLNO=IFIX(SUMDTT/21.+6.); see p. 74 of Jones & Kiniry.", "!-Walter Bowen, 22 DEC 1994.",
    "!", "!All G2 values were increased by a factor of 1.1 for Ritchie's",
    "!change to RUE -Walter, 28 DEC 1994", "!", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code of this cultivar, points to the Ecotype in the",
    "!             ECO file (currently not used).", "! P1          Thermal time from seedling emergence to the end of the juvenile",
    "!             phase (expressed in degree days above a base temperature of 8 deg.C)",
    "!             during which the plant is not responsive to changes in",
    "!             photoperiod.", "! P2          Extent to which development (expressed as days) is delayed for",
    "!             each hour increase in photoperiod above the longest photoperiod",
    "!             at which development proceeds at a maximum rate (which is",
    "!             considered to be 12.5 hours).", "! P5          Thermal time from silking to physiological maturity (expressed",
    "!             in degree days above a base temperature of 8 deg.C).",
    "! G2          Maximum possible number of kernels per plant.",
    "! G3          Kernel filling rate during the linear grain filling stage and",
    "!             under optimum conditions (mg/day).", "! PHINT       Phylochron interval; the interval in thermal time (degree days)",
    "!             between successive leaf tip appearances.", "!",
    "! PIO         Pioneer", "! AS          Asgrow (Monsanto)", "! DK          Dekalb (Monsanto)",
    "! LH          Holden (Monsanto)", "! C/LOL       Land of Lakes",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT",
    "!Coeffient #                             1     2     3     4     5     6",
    "!Calibration                             P     P     P     G     G     N",
    "", "999991 MINIMA               . DFAULT   5.0 0.000 580.0 248.0  5.00 38.00",
    "999992 MAXIMA               . DFAULT 450.0 2.000 999.0 990.0 16.50 75.00",
    "", "PC0001 2500-2600 GDD        . IB0001 160.0 0.750 780.0 750.0  8.50 49.00",
    "PC0002 2600-2650 GDD        . IB0001 185.0 0.750 850.0 800.0  8.50 49.00",
    "PC0003 2650-2700 GDD        . IB0001 212.0 0.750 850.0 800.0  8.50 49.00",
    "PC0004 2700-2750 GDD        . IB0001 240.0 0.750 850.0 800.0  8.50 49.00",
    "PC0005 2750-2800 GDD        . IB0001 260.0 0.750 850.0 800.0  8.50 49.00",
    "", "990001 LONG SEASON          . IB0001 320.0 0.520 940.0 620.0  6.00 38.90",
    "990002 MEDIUM SEASON        . IB0001 200.0 0.300 800.0 700.0  8.50 38.90",
    "990003 SHORT SEASON         . IB0001 110.0 0.300 680.0 820.4  6.60 38.90",
    "990004 V.SHORT SEASON       . IB0001   5.0 0.300 680.0 820.4  6.60 38.90",
    "IB0001 CORNL281             . IB0001 110.0 0.300 685.0 907.9  6.60 38.90",
    "IB0002 CP170                . IB0001 120.0 0.000 685.0 907.9 10.00 38.90",
    "IB0003 LG11                 . IB0001 125.0 0.000 685.0 907.9 10.00 38.90",
    "IB0004 F7 X F2              . IB0001 125.0 0.000 685.0 907.9 10.00 38.90",
    "IB0005 PIO 3995             . IB0001 130.0 0.300 685.0 907.9  8.60 38.90",
    "IB0006 INRA                 . IB0001 135.0 0.000 685.0 907.9 10.00 38.90",
    "IB0007 EDO                  . IB0001 135.0 0.300 685.0 907.9 10.40 38.90",
    "IB0008 A654 X F2            . IB0001 135.0 0.000 685.0 907.9 10.00 38.90",
    "IB0009 DEKALB XL71          . IB0001 140.0 0.300 685.0 907.9 10.50 38.90",
    "IB0010 F478 X W705A         . IB0001 140.0 0.000 685.0 907.9 10.00 38.90",
    "IB0011 DEKALBXL45           . IB0001 150.0 0.400 685.0 907.9 10.15 38.90",
    "IB0012 PIO 3382             . IB0001 160.0 0.700 950.0 845.0  8.40 38.90  ",
    "IB0013 B59*OH43             . IB0001 162.0 0.800 685.0 862.4  6.90 38.90",
    "IB0014 F16 X F19            . IB0001 165.0 0.000 685.0 907.9 10.00 38.90",
    "IB0015 WASHINGTON           . IB0001 165.0 0.400 715.0 825.0 11.00 38.90",
    "IB0016 B14XOH43             . IB0001 172.0 0.300 685.0 907.9  8.50 38.90",
    "IB0017 R1*(N32*B14)         . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0018 B60*R71              . IB0001 172.0 0.800 685.0 781.4  7.70 38.90",
    "IB0019 WF9*B37              . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0020 B59*C103             . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0021 Garst 8702           . IB0001 175.0 0.200 960.0 855.8  6.00 38.90",
    "IB0022 B14*C103             . IB0001 180.0 0.500 685.0 907.9 10.15 38.90",
    "IB0023 B14*C131A            . IB0001 180.0 0.500 685.0 907.9 10.15 38.90",
    "IB0024 PIO 3720             . IB0001 180.0 0.800 685.0 907.9 10.00 38.90",
    "IB0025 WASH/GRAIN-1         . IB0001 185.0 0.400 775.0 836.0 12.00 38.90",
    "IB0026 A632 X W117          . IB0001 187.0 0.000 685.0 907.9 10.00 38.90",
    "IB0027 Garst 8750           . IB0001 190.0 0.200 930.0 891.0  6.30 38.90",
    "IB0028 TAINAN-11            . IB0001 200.0 0.800 670.0 803.0  6.80 38.90",
    "IB0029 PIO 3541             . IB0001 200.0 0.300 800.0 770.0  8.50 38.90",
    "IB0030 PIO 3707             . IB0001 200.0 0.700 800.0 649.0  6.30 38.90",
    "IB0031 PIO 3475*            . IB0001 200.0 0.700 800.0 797.5  8.60 38.90",
    "IB0032 PIO 3382*            . IB0001 200.0 0.700 800.0 715.0  8.50 38.90",
    "IB0033 PIO 3780             . IB0001 200.0 0.760 685.0 660.0  9.60 38.90",
    "IB0034 PIO 3780*            . IB0001 200.0 0.760 685.0 797.5  9.60 38.90",
    "IB0035 McCurdy 84aa         . IB0001 265.0 0.300 920.0 920.0  8.00 43.00  ",
    "IB0036 C281                 . IB0001 202.0 0.300 685.0 907.9  5.80 38.90",
    "IB0037 SWEET CORN           . IB0001 210.0 0.520 625.0 907.5 10.00 38.90",
    "IB0038 Garst 8555           . IB0001 215.0 0.400 890.0 880.0  9.00 38.90",
    "IB0039 PIO 3901             . IB0001 215.0 0.760 600.0 616.0  9.00 38.90",
    "IB0040 B8*153R              . IB0001 218.0 0.300 760.0 632.5  8.80 38.90",
    "IB0041 Garst 8808           . IB0001 220.0 0.400 780.0 858.0  8.50 38.90",
    "IB0042 B73 X MO17           . IB0001 220.0 0.520 880.0 803.0 10.00 38.90",
    "IB0043 PIO 511A             . IB0001 220.0 0.300 685.0 709.5 10.50 38.90",
    "IB0044 W69A X F546          . IB0001 240.0 0.300 685.0 907.9 10.00 38.90",
    "IB0045 A632 X VA26          . IB0001 240.0 0.300 685.0 907.9 10.00 38.90",
    "IB0046 W64A X W117          . IB0001 245.0 0.000 685.0 907.9  8.00 38.90",
    "IB0047 PIO 3147             . IB0001 255.0 0.760 685.0 917.4 10.00 38.90",
    "IB0048 WF9*B37              . IB0001 260.0 0.800 710.0 907.9  6.50 38.90",
    "IB0049 NEB 611              . IB0001 260.0 0.300 720.0 907.5  9.00 38.90",
    "IB0050 PV82S                . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0051 PV76S                . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0052 PIO 3183             . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0053 CESDA-28             . IB0001 260.0 0.500 669.0 858.0  7.10 38.90",
    "IB0054 B14*OH43             . IB0001 265.0 0.800 665.0 858.0  6.90 38.90",
    "IB0055 MCCURDY 6714         . IB0001 265.0 0.300 825.0 907.9  9.80 38.90",
    "IB0056 FM 6                 . IB0001 276.0 0.520 867.0 677.6 10.70 38.90",
    "IB0057 TOCORON-3            . IB0001 276.0 0.520 867.0 660.0  8.12 38.90",
    "IB0058 NC+59                . IB0001 280.0 0.300 750.0 907.5 10.00 38.90",
    "IB0059 H6                   . IB0001 310.0 0.300 685.0 907.9 10.00 38.90",
    "IB0060 H610(UH)             . IB0001 365.0 0.520 850.0 680.0  6.50 38.90  ",
    "IB0061 PB 8                 . IB0001 300.0 0.520 990.0 440.0  7.00 38.90",
    "IB0062 B56*C131A            . IB0001 318.0 0.500 700.0 885.5  6.40 38.90",
    "IB0063 PIO X 304C           . IB0001 365.0 0.520 920.0 780.0  5.70 38.90  ",
    "IB0064 H.OBREGON            . IB0001 360.0 0.800 685.0 907.9 10.15 38.90",
    "IB0065 SUWAN-1              . IB0001 380.0 0.600 780.0 825.0  7.00 38.90",
    "IB0066 PIO 3165             . IB0001 320.0 0.520 940.0 625.0  6.00 38.90",
    "IB0067 PIO 3324             . IB0001 320.0 0.520 940.0 625.0  6.00 38.90",
    "IB0068 PIO 3475             . IB0001 200.0 0.700 750.0 907.0  9.00 38.90  ",
    "IB0168 PIO 3475 orig        . IB0001 220.0 0.700 850.0 907.0  9.90 38.90",
    "IB0069 PIO 3790             . IB0001 212.4 0.520 792.8 625.0  6.00 38.90",
    "IB0070 CARGILL 111S         . IB0001 290.0 0.500 1035. 580.0  5.50 47.00  ",
    "IB0071 PIO 31G98            . IB0003 165.0 0.750 680.0 820.4  6.60 48.00  ",
    "IB0089 GL 582               . IB0001 200.0 0.700 750.0 750.0  8.60 38.90",
    "IB0090 GL 482               . IB0001 240.0 0.700 990.0 907.0  8.80 38.90",
    "IB0091 GL 450               . IB0001 200.0 0.700 850.0 700.0  7.00 38.90",
    "IB0092 LAURENT 3733         . IB0001 200.0 0.700 680.0 725.0  9.00 38.90  ",
    "IB0093 GL 582 MOD KBS       . IB0001 180.0 0.700 750.0 750.0  8.60 38.90",
    "IB0099 AGETI76              . IB0001 325.0 2.000 625.0 580.0  7.30 50.00",
    "IB0100 PARTAP1              . IB0001 450.0 2.000 580.0 600.0 16.50 50.00",
    "", "IB1051 AS 740               . IB0001 215.0 0.750 850.0 700.0  5.00 48.00",
    "IB1052 DK 611               . IB0001 260.0 0.100 800.0 980.0  5.70 48.00    ",
    "IB1053 LH198XLH185          . IB0001 205.0 0.750 850.0 731.0  5.00 48.00",
    "IB0154 PIO 3192             . IB0001 215.0 0.300 990.0 660.0  8.50 48.00   ",
    "IB0155 DEA                  . IB0001 165.0 0.100 476.0 442.0  5.35 40.00   ",
    "", "!Brazil cultivars:", "IB0171 AG9010               . IB0001 196.0 0.500 758.0 830.0  5.10 40.00   ",
    "IB0172 DAS CO32             . IB0001 220.0 0.500 747.8 1100.  5.40 45.00   ",
    "IB0173 DKB 333B             . IB0001 250.0 0.500 842.0 920.0  4.80 45.00   ",
    "IB0174 EXCELER              . IB0001 210.0 0.500 770.0 1170.  5.80 45.00   ",
    "", "IB0185 JACKSON HYBRI        . IB0001 200.0 0.300 950.0 980.0  7.15 43.00  ",
    "", "IB1065 PIO 33Y09            . IB0001 245.0 0.500 905.0 780.0  6.00 48.00",
    "IB1066 PIO 3489             . IB0001 225.0 0.600 895.0 875.0  8.80 48.00",
    "IB1067 PIO 3394             . IB0001 240.0 0.500 900.0 820.0  8.50 48.00",
    "IB1069 PIO 3563             . IB0001 216.0 0.600 830.0 860.0  8.80 48.00",
    "IB1072 DEKALB 485           . IB0001 215.0 0.600 785.0 750.0  8.70 45.00",
    "IB1068 DEKALB 521           . IB0001 215.0 0.400 795.0 890.0  8.00 48.00",
    "IB1168 DEKALB 591           . IB0001 225.0 0.400 895.0 880.0  8.00 48.00",
    "", "LL0499 C/LOL 499            . IB0001 182.0 0.500 650.0 750.0  8.70 46.00",
    "LL0564 C/LOL 564            . IB0001 210.0 0.500 670.0 880.0 11.25 46.00",
    "LL0581 C/LOL 581            . IB0001 200.0 0.500 668.0 850.0  8.80 45.00",
    "LL0599 C/LOL 599            . IB0001 200.0 0.500 670.0 850.0  8.80 45.00",
    "LL0542 C/LOL 542            . IB0001 185.0 0.500 700.0 835.0  8.70 46.00",
    "LL0661 C/LOL 661            . IB0001 200.0 0.500 670.0 850.0  9.00 45.00",
    "LL0674 C/LOL 674            . IB0001 200.0 0.500 670.0 800.0  8.90 45.00",
    "", "ZA0001 Prisma (FAO 700)     . IB0001 280.0 0.400 850.0 750.0  6.80 38.90",
    "ZA0002 Prisma GC Avg        . IB0001 280.0 0.300 789.0 700.0  6.05 48.00",
    "", "IF0001 OBA SUPER 2          . IB0001 270.0 0.600 780.0 840.0  7.80 45.00",
    "IF0002 EV8728-SR            . IB0001 265.0 0.600 800.0 900.0  7.20 45.00",
    "IF0003 Mokwa 87TZPB-SR      . IB0001 305.0 0.600 765.0 810.0  8.00 45.00",
    "IF0004 SPL (semi-prol)      . IB0001 270.0 0.600 740.0 920.0  7.40 41.00",
    "IF0005 TZB-SR (open p)      . IB0001 290.0 0.600 775.0 990.0  6.80 45.00",
    "IF0006 EV 8449-SR           . IB0001 385.0 0.600 860.0 700.0  8.00 50.00",
    "IF0007 EV 8449-SRx          . IB0001 385.0 0.600 860.0 945.4  7.20 50.00",
    "IF0008 AG-KADUNA            . IB0001 220.0 0.600 780.0 845.0  8.00 40.00",
    "IF0009 OBA S2 Benin         . IB0001 170.0 0.600 760.0 800.0  8.00 50.00",
    "IF0010 EV-8449_TG           . IB0001 260.0 0.600 630.0 900.0  9.00 45.00",
    "IF0011 EV-8443_TG           . IB0001 300.0 0.600 850.0 850.0  8.80 45.00",
    "", "AC0001 TOHONO O'odham       . IB0001 200.0 0.100 610.0 248.0  9.80 38.90 !Michael Pool, Austin Comm College",
    "", "! Vietnam sequencing", "VI0001 LVN 10               . IB0001 350.0 1.000 980.0 760.0  9.20 38.90",
    "", "!Coefficients calibrated by Jones and Boote in Mali", "IM0001 SOTUBAKA             . IB0001 300.0 0.520 930.0 500.0  6.00 38.90",
    "IM0002 NIELENI              . IB0001 232.0 0.300 688.0 540.0  8.80 38.90",
    "IM0003 APPOLO               . IB0001 216.0 0.300 530.0 455.0 11.00 38.90",
    "", "!Coefficients calibrated by Dzotsi and Singh in Togo, 2002.",
    "IF0018 TZE C0MP4C2          . IB0001 210.0 0.100 660.0 850.0  9.70 55.00",
    "IF0019 TZESRW X GUA 314     . IB0001 170.0 0.100 660.0 780.0  8.00 55.00",
    "IF0020 AB-11-TG             . IB0001 250.0 0.100 620.0 920.0  8.50 55.00",
    "IF0021 TZEEY-SRBC5          . IB0001 130.0 0.100 600.0 850.0  8.00 55.00",
    "IF0022 IKENNE               . IB0001 280.0 0.600 630.0 900.0  8.80 45.00",
    "", "!Alagarswamy", "IB0067 TEST                 . IB0001 130.0 0.500 720.0 380.0  7.50 75.00",
    "KA0001 H625                 . IB0001 130.0 0.500 720.0 380.0  7.50 75.00",
    "EM0001 H512                 . IB0001 130.0 0.500 720.0 550.0  7.50 75.00",
    "KY0001 H622                 . IB0001 358.5 0.500 616.1 550.0  7.20 75.00",
    "KY0002 H511                 . IB0001 317.6 0.500 530.4 550.0  7.50 75.00",
    "KY0003 CCOMP                . IB0001 366.2 1.235 611.3 600.0  6.50 75.00",
    "KY0004 MAKUCOMP             . IB0001 183.6 0.500 611.0 380.0 10.00 75.00",
    "KY0005 H625                 . IB0001 341.1 0.500 612.0 700.0  8.50 75.00",
    "KY0006 KCB                  . IB0001 125.0 0.500 500.3 450.0 10.50 75.00",
    "KY0007 PWANI                . IB0001 182.4 0.500 616.0 720.0 10.50 75.00",
    "KY0008 H613                 . IB0001 182.4 0.500 616.0 825.0 10.15 75.00",
    "KY0009 CUZCO                . IB0001 182.4 0.500 616.0 380.0  7.50 75.00",
    "KY0010 H512                 . IB0001 332.9 0.500 601.6 550.0  7.50 75.00",
    "KY0011 H614                 . IB0001 396.9 0.500 623.6 825.0 10.15 75.00",
    "KY0012 H5012                . IB0001 351.7 0.500 859.0 550.0  7.50 75.00",
    "KY0013 H626                 . IB0001 458.0 0.500 429.0 450.0 10.50 75.00",
    "KY0014 KATUMANICOMPI        . IB0001 238.6 0.500 654.0 450.0 10.50 75.00",
    "KY0015 PH 1                 . IB0001 234.5 0.500 429.0 720.0 10.50 75.00",
    "KY0016 HAC                  . IB0001 245.0 0.500 825.0 750.0 10.50 75.00 ",
    "KY0017 H612                 . IB0001 130.0 0.500 390.0 825.0 10.15 75.00",
    "KY0018 KATUMANICOMP-II      . IB0001 125.0 0.500 660.0 450.0 10.50 75.00",
    "", "!J.B.Naab data 2003-2006, re-calibrated by kjb 1/2/12",
    "GH0010 OBATANPA             . IB0001 280.0 0.000 750.0 540.0  7.50 40.00",
    "", "!Four Global Futures maize cultivars (3 life cycle by 2 \"yield levels\")",
    "!Composite: same maturity as Garst 8808 and WH403), but G2 and G3 mid-way.",
    "!Those cultivars seemed most realistic compared with 5 other cultivars calibrated",
    "!in DSSAT, not too early (Pio3382 too early), not too late (Pio 304C is late),",
    "!not too high in yield(McCurdy 84aa not realistic), DK611 strange, and",
    "!Obatanpa is low yielding (fertility constraints, or OPV)",
    "!Yield \"trait\" is 5% higher RUE, 5% higher G2, 5% higher G3",
    "", "GF0001 Base Garst808-wh403  . IB0001 250.0 0.500 730.0 800.0  7.80 38.90",
    "GF0101 Baseline 10%shorter  . IB0001 215.0 0.500 650.0 800.0  7.80 38.90",
    "GF0201 Baseline 10%longer   . IB0001 285.0 0.500 810.0 800.0  7.80 38.90",
    "GF0301 Yield norm cycle     . IB0004 250.0 0.500 730.0 840.0  8.19 38.90",
    "GF0401 Yield 10%shorter     . IB0004 215.0 0.500 650.0 840.0  8.19 38.90",
    "GF0501 Yield 10%longer      . IB0004 285.0 0.500 810.0 840.0  8.19 38.90",
    "", "CYMA01 wh403                . IB0001 265.0 0.760 685.0 760.0  7.60 38.90   ",
    "", "! Added by Camilo Andrade from Embrapa Maize and Sorghum",
    "EBSL06 BRS1030-SL2009       . IB0001 263.8 0.500 1034  700.0  5.20 44.22 !Single-cross hybrid from Embrapa",
    "", "!Kingaroy sequence", "IB0200 32P55                . IB0004 215.0 0.500 650.0 740.0  8.19 45.90",
    "", "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MZIXM048.CUL")

  c("*MAIZE CULTIVAR COEFFICIENTS: MZIXM048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code or this cultivar, points to the Ecotype in the",
    "!             ECO file.", "! P1          Thermal time from seedling emergence to the end of the juvenile",
    "!             phase (expressed in degree days above a base temperature of 8 deg.C)",
    "!             during which the plant is not responsive to changes in",
    "!             photoperiod.", "! P2          Extent to which development (expressed as days) is delayed for",
    "!             each hour increase in photoperiod above the longest photoperiod",
    "!             at which development proceeds at a maximum rate (which is",
    "!             considered to be 12.5 hours).", "! P5          Thermal time from silking to physiological maturity (expressed",
    "!             in degree days above a base temperature of 8 deg.C).",
    "! G2          Maximum possible number of kernels on topmost ear.",
    "! G3          Kernel filling rate during the linear grain filling stage and",
    "!             under optimum conditions (mg/day).", "! PHINT       Phylochron interval; the interval in thermal time (degree days)",
    "!             between successive leaf tip appearances.", "! AX          Leaf surface area (cm2/leaf) of largest leaf.",
    "! ALL         Leaf longevity (degree days) of the most longevous leaf.",
    "!", "! PIO         Pioneer", "! AS          Asgrow (Monsanto)",
    "! DK          Dekalb (Monsanto)", "! LH          Holden (Monsanto)",
    "! C/LOL       Land of Lakes", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "! ", "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT    AX   ALL",
    "!Coeffient #                             1     2     3     4     5     6     7     8",
    "!Calibration                             P     P     P     G     G     P     G     G",
    "", "999991 MINIMA               . DFAULT   5.0 0.100 500.0 400.0   4.0 38.00 200.0 600.0",
    "999992 MAXIMA               . DFAULT 450.0 0.800 1100. 1100.  20.0 55.00 850.0 900.0",
    "", "PC0001 2500-2600 GDD        . IB0001 160.0 0.750 780.0 750.0  8.50 49.00",
    "PC0002 2600-2650 GDD        . IB0001 185.0 0.750 850.0 800.0  8.50 49.00",
    "PC0003 2650-2700 GDD        . IB0001 212.0 0.750 850.0 800.0  8.50 49.00",
    "PC0004 2700-2750 GDD        . IB0001 240.0 0.750 850.0 800.0  8.50 49.00",
    "PC0005 2750-2800 GDD        . IB0001 260.0 0.750 850.0 800.0  8.50 49.00",
    "", "990001 LONG SEASON          . IB0001 320.0 0.520 940.0 620.0  6.00 38.90",
    "990002 MEDIUM SEASON        . IB0001 200.0 0.300 800.0 700.0  8.50 38.90",
    "990003 SHORT SEASON         . IB0001 110.0 0.300 680.0 820.4  6.60 38.90",
    "990004 V.SHORT SEASON       . IB0001   5.0 0.300 680.0 820.4  6.60 38.90",
    "!", "IB0001 CORNL281             . IB0001 110.0 0.300 685.0 907.9  6.60 38.90",
    "IB0002 CP170                . IB0001 120.0 0.000 685.0 907.9 10.00 38.90",
    "IB0003 LG11                 . IB0001 125.0 0.000 685.0 907.9 10.00 38.90",
    "IB0004 F7 X F2              . IB0001 125.0 0.000 685.0 907.9 10.00 38.90",
    "IB0005 PIO 3995             . IB0001 130.0 0.300 685.0 907.9  8.60 38.90",
    "IB0006 INRA                 . IB0001 135.0 0.000 685.0 907.9 10.00 38.90",
    "IB0007 EDO                  . IB0001 135.0 0.300 685.0 907.9 10.40 38.90",
    "IB0008 A654 X F2            . IB0001 135.0 0.000 685.0 907.9 10.00 38.90",
    "IB0009 DEKALB XL71          . IB0001 140.0 0.300 685.0 907.9 10.50 38.90",
    "IB0010 F478 X W705A         . IB0001 140.0 0.000 685.0 907.9 10.00 38.90",
    "IB0011 DEKALBXL45           . IB0001 150.0 0.400 685.0 907.9 10.15 38.90",
    "IB0012 PIO 3382             . IB0001 150.0 0.300 1000. 560.0  8.50 40.00  850.  900.    ",
    "IB0013 B59*OH43             . IB0001 162.0 0.800 685.0 862.4  6.90 38.90",
    "IB0014 F16 X F19            . IB0001 165.0 0.000 685.0 907.9 10.00 38.90",
    "IB0015 WASHINGTON           . IB0001 165.0 0.400 715.0 825.0 11.00 38.90",
    "IB0016 B14XOH43             . IB0001 172.0 0.300 685.0 907.9  8.50 38.90",
    "IB0017 R1*(N32*B14)         . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0018 B60*R71              . IB0001 172.0 0.800 685.0 781.4  7.70 38.90",
    "IB0019 WF9*B37              . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0020 B59*C103             . IB0001 172.0 0.800 685.0 907.9 10.15 38.90",
    "IB0021 Garst 8702           . IB0001 175.0 0.200 960.0 855.8  6.00 38.90",
    "IB0022 B14*C103             . IB0001 180.0 0.500 685.0 907.9 10.15 38.90",
    "IB0023 B14*C131A            . IB0001 180.0 0.500 685.0 907.9 10.15 38.90",
    "IB0024 PIO 3720             . IB0001 180.0 0.800 685.0 907.9 10.00 38.90",
    "IB0025 WASH/GRAIN-1         . IB0001 185.0 0.400 775.0 836.0 12.00 38.90",
    "IB0026 A632 X W117          . IB0001 187.0 0.000 685.0 907.9 10.00 38.90",
    "IB0027 Garst 8750           . IB0001 190.0 0.200 930.0 891.0  6.30 38.90",
    "IB0028 TAINAN-11            . IB0001 200.0 0.800 670.0 803.0  6.80 38.90",
    "IB0029 PIO 3541             . IB0001 200.0 0.300 800.0 770.0  8.50 38.90",
    "IB0030 PIO 3707             . IB0001 200.0 0.700 800.0 649.0  6.30 38.90",
    "IB0031 PIO 3475             . IB0001 200.0 0.700 800.0 797.5  8.60 38.90",
    "IB0032 PIO 3382             . IB0001 200.0 0.700 800.0 715.0  8.50 38.90",
    "IB0033 PIO 3780             . IB0001 200.0 0.760 685.0 660.0  9.60 38.90",
    "IB0034 PIO 3780*            . IB0001 200.0 0.760 685.0 797.5  9.60 38.90",
    "", "! DSSAT 4.5 IXIM ", "IB0035 McCurdy 84aa         . IB0001 260.0 0.300 955.0 700.0  8.50 43.00  770.  930.    ",
    "IB0155 DEA                  . IB0001 168.0 0.000 476.0 442.0  5.35 39.00  680.  650.    ",
    "", "IB0036 C281                 . IB0001 202.0 0.300 685.0 907.9  5.80 38.90",
    "IB0037 SWEET CORN           . IB0001 210.0 0.520 625.0 907.5 10.00 38.90",
    "IB0038 Garst 8555           . IB0001 215.0 0.400 890.0 880.0  9.00 38.90",
    "IB0039 PIO 3901             . IB0001 215.0 0.760 600.0 616.0  9.00 38.90",
    "IB0040 B8*153R              . IB0001 218.0 0.300 760.0 632.5  8.80 38.90",
    "IB0041 Garst 8808           . IB0001 220.0 0.400 780.0 858.0  8.50 38.90",
    "IB0042 B73 X MO17           . IB0001 220.0 0.520 880.0 803.0 10.00 38.90",
    "IB0043 PIO 511A             . IB0001 220.0 0.300 685.0 709.5 10.50 38.90",
    "IB0044 W69A X F546          . IB0001 240.0 0.300 685.0 907.9 10.00 38.90",
    "IB0045 A632 X VA26          . IB0001 240.0 0.300 685.0 907.9 10.00 38.90",
    "IB0046 W64A X W117          . IB0001 245.0 0.000 685.0 907.9  8.00 38.90",
    "IB0047 PIO 3147             . IB0001 255.0 0.760 685.0 917.4 10.00 38.90",
    "IB0048 WF9*B37              . IB0001 260.0 0.800 710.0 907.9  6.50 38.90",
    "IB0049 NEB 611              . IB0001 260.0 0.300 720.0 907.5  9.00 38.90",
    "IB0050 PV82S                . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0051 PV76S                . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0052 PIO 3183             . IB0001 260.0 0.500 750.0 660.0  8.50 38.90",
    "IB0053 CESDA-28             . IB0001 260.0 0.500 669.0 858.0  7.10 38.90",
    "IB0054 B14*OH43             . IB0001 265.0 0.800 665.0 858.0  6.90 38.90",
    "IB0055 MCCURDY 6714         . IB0001 265.0 0.300 825.0 907.9  9.80 38.90",
    "IB0056 FM 6                 . IB0001 276.0 0.520 867.0 677.6 10.70 38.90",
    "IB0057 TOCORON-3            . IB0001 276.0 0.520 867.0 660.0  8.12 38.90",
    "IB0058 NC+59                . IB0001 280.0 0.300 750.0 907.5 10.00 38.90",
    "IB0059 H6                   . IB0001 310.0 0.300 685.0 907.9 10.00 38.90",
    "IB0060 H610(UH)             . IB0002 355.0 0.300 870.0 550.0  5.80 45.00  850.  850.    ",
    "IB0061 PB 8                 . IB0001 300.0 0.520 990.0 440.0  7.00 38.90",
    "IB0062 B56*C131A            . IB0001 318.0 0.500 700.0 885.5  6.40 38.90",
    "IB0063 PIO X 304C           . IB0002 340.0 0.520 990.0 670.0  5.40 45.00  780.  800.    ",
    "IB0064 H.OBREGON            . IB0001 360.0 0.800 685.0 907.9 10.15 38.90",
    "IB0065 SUWAN-1              . IB0001 380.0 0.600 780.0 825.0  7.00 38.90",
    "IB0066 PIO 3165             . IB0001 320.0 0.520 940.0 625.0  6.00 38.90",
    "IB0067 PIO 3324             . IB0001 250.0 0.520 940.0 625.0  6.00 38.90",
    "IB0068 PIO 3475             . IB0001 200.0 0.700 750.0 907.0  9.00 38.90                ",
    "IB0168 PIO 3475 orig        . IB0001 220.0 0.700 850.0 907.0  9.90 38.90  ",
    "IB0069 PIO 3790             . IB0001 212.4 0.520 792.8 625.0  6.00 38.90",
    "IB0070 CARGILL 111S         . IB0001 290.0 0.500 1040. 500.0  4.50 48.00  650.  800.    ",
    "IB0071 PIO 31G98            . IB0003 165.0 0.500 500.0 820.4  6.60 48.00  250.  650.    ",
    "IB0089 GL 582               . IB0001 200.0 0.700 750.0 750.0  8.60 38.90  ",
    "IB0090 GL 482               . IB0001 240.0 0.700 990.0 907.0  8.80 38.90  ",
    "IB0091 GL 450               . IB0001 200.0 0.700 850.0 700.0  7.00 38.90  ",
    "IB0092 LAURENT 3733         . IB0001 200.0 0.700 680.0 725.0  9.00 38.90                ",
    "IB0099 AGETI76              . IB0001 325.0 2.000 625.0 580.0  7.30 50.00",
    "IB0100 PARTAP1              . IB0001 450.0 2.000 580.0 600.0 16.50 50.00",
    "", "IB0171 AG9010               . IB0001 196.0 0.500 745.0 800.0  5.00 43.00  775.  750.     ",
    "IB0172 DAS CO32             . IB0001 235.0 0.500 740.8 580.0  4.50 43.00  825.  850.     ",
    "IB0173 DKB 333B             . IB0001 250.0 0.500 855.0 560.0  4.40 40.00  880.  760.     ",
    "IB0174 EXCELER              . IB0001 220.0 0.500 770.0 600.0  4.40 43.00  720.  800.     ",
    "", "IB1051 AS 740               . IB0001 260.0 0.100 700.0 700.0  5.00 45.00  750.  900.     ",
    "IB1052 DK 611               . IB0002 275.0 0.100 800.0 750.0  5.00 43.00  650.  850.     ",
    "IB1053 LH198XLH185          . IB0001 250.0 0.100 770.0 731.0  5.00 44.00  770.  900.     ",
    "", "IB0154 PIO 3192             . IB0001 215.0 0.300 990.0 660.0  8.50 48.00                ",
    "", "IB1065 PIO 33Y09            . IB0001 245.0 0.500 905.0 780.0  6.00 48.00",
    "IB1066 PIO 3489             . IB0001 225.0 0.600 895.0 875.0  8.80 48.00",
    "IB1067 PIO 3394             . IB0001 240.0 0.500 900.0 820.0  8.50 48.00",
    "IB1069 PIO 3563             . IB0001 216.0 0.600 830.0 860.0  8.80 48.00",
    "IB1072 DEKALB 485           . IB0001 215.0 0.600 785.0 750.0  8.70 45.00",
    "IB1068 DEKALB 521           . IB0001 215.0 0.400 795.0 890.0  8.00 48.00",
    "IB1168 DEKALB 591           . IB0001 225.0 0.400 895.0 880.0  8.00 48.00",
    "", "LL0499 C/LOL 499            . IB0001 182.0 0.500 650.0 750.0  8.70 46.00",
    "LL0564 C/LOL 564            . IB0001 210.0 0.500 670.0 880.0 11.25 46.00",
    "LL0581 C/LOL 581            . IB0001 200.0 0.500 668.0 850.0  8.80 45.00",
    "LL0599 C/LOL 599            . IB0001 200.0 0.500 670.0 850.0  8.80 45.00",
    "LL0542 C/LOL 542            . IB0001 185.0 0.500 700.0 835.0  8.70 46.00",
    "LL0661 C/LOL 661            . IB0001 200.0 0.500 670.0 850.0  9.00 45.00",
    "LL0674 C/LOL 674            . IB0001 200.0 0.500 670.0 800.0  8.90 45.00",
    "", "ZA0001 Prisma (FAO 700)     . IB0001 280.0 0.400 850.0 750.0  6.80 38.90",
    "ZA0002 Prisma GC Avg        . IB0001 312.0 0.100 795.0 760.0  6.03 45.00  750.  850.     ",
    "", "IF0001 OBA SUPER 2          . IB0001 270.0 0.600 780.0 840.0  7.80 45.00",
    "IF0002 EV8728-SR            . IB0001 265.0 0.600 800.0 900.0  7.20 45.00",
    "IF0003 Mokwa 87TZPB-SR      . IB0001 305.0 0.600 765.0 810.0  8.00 45.00",
    "IF0004 SPL (semi-prol)      . IB0001 270.0 0.600 740.0 920.0  7.40 41.00",
    "IF0005 TZB-SR (open p)      . IB0001 290.0 0.600 775.0 990.0  6.80 45.00",
    "IF0006 EV 8449-SR           . IB0001 385.0 0.600 860.0 700.0  8.00 50.00",
    "IF0007 EV 8449-SRx          . IB0001 385.0 0.600 860.0 945.4  7.20 50.00",
    "IF0008 AG-KADUNA            . IB0001 220.0 0.600 780.0 845.0  8.00 40.00",
    "IF0009 OBA S2 Benin         . IB0001 170.0 0.600 760.0 800.0  8.00 50.00",
    "IF0010 EV-8449_TG           . IB0001 260.0 0.600 630.0 900.0  9.00 45.00",
    "IF0011 EV-8443_TG           . IB0001 300.0 0.600 850.0 850.0  8.80 45.00",
    "", "AC0001 TOHONO O'odham       . IB0001 200.0 0.100 610.0 248.0  9.80 38.90                ",
    "", "! Vietnam sequencing", "VI0001 LVN 10               . IB0001 350.0 1.000 980.0 760.0  9.20 38.90",
    "", "!Coefficients calibrated by Jones and Boote in Mali", "IM0001 SOTUBAKA             . IB0001 300.0 0.520 930.0 500.0  6.00 38.90",
    "IM0002 NIELENI              . IB0001 232.0 0.300 688.0 540.0  8.80 38.90",
    "IM0003 APPOLO               . IB0001 216.0 0.300 530.0 455.0 11.00 38.90",
    "!", "!chp test for cold hardy ecotype", "IB9999 DK 611-mod1          . IB0099 260.0 0.100 800.0 850.0  6.00 48.00",
    "IB9998 DK 611-mod2          . IB0098 260.0 0.100 800.0 850.0  6.00 48.00",
    "", "!IFDC Togo, U. Singh, K. Dzotsi", "IF0018 TZE C0MP4C2          . IB0001 210.0 0.100 660.0 850.0  9.70 55.00   ",
    "!Jesse Naab", "GH0004 OBATAMPA             . IB0001 300.0 0.000 700.0 907.0  5.30 38.90    ",
    "", "  ") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "PIALO048.CUL")

  c("*PINEAPPLE CULTIVAR COEFFICIENTS: PIALO48 MODEL", "!", "!P1 Growing degree days from white root tips to first leaf emerged",
    "!P2 Growing degree days from first leaf emerged to Foliar C1",
    "!P3 Growing degree days from Foliar C1 to Foliar C2", "!P4 Growing degree days from Foliar C2 to Foliar C3",
    "!P5 Growing degree days from forcing to Open Heart                          ",
    "!P6 Growing degree days from Open Heart to EarlyAnthe                    ",
    "!P7 Cumulative growing degree days from EarlyAnthe to LastAnthe            ",
    "!P8 Growing degree days from LastAnthe to Phmaturity                     ",
    "!TC Growing degree days from planting to white root tips                  ",
    "!G1 Growing degree days from Phmaturity to fruit harvest", "! G2 Potential eye number                                                       ",
    "! G3 Potential eye growth rate                                                  ",
    "! PHINT Phylochron interval; the interval in thermal time (degree days) between successive leaf tip appearances.",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!                                               ", "@VAR#  VAR-NAME........ EXPNO   ECO#    TC    P1    P2    P3    P4    P5    P6    P7    P8    G1    G2    G3 PHINT    ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13 ",
    "!Calibration                             P     P     P     P     P     P     P     P     P     G     G     G     P",
    "", "999991 MINIMA               . DFAULT  60.0    60    60    35    65   520   260   300   400   200   190  12.0  35.0",
    "999992 MAXIMA               . DFAULT 130.0    60   900    35    65   700   400  2640  2000   215   220  24.0  83.0",
    "", "IB0066 SC-F153                IB0001  60.0    60    60    35    65   629   381  2640   400   200   200  14.0  40.0  ",
    "IB0068 HB-MD2CR               IB0002  60.0    60   530    35    65   520   260   300  1910   215   200  14.0  40.0  ",
    "IB0069 HB-MD2CRp              IB0003 127.0    60   812    35    65   520   260   300  1910   215   200  14.0  83.0  ",
    "", "") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PNGRO048.CUL")

  c("*PEANUT CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "! For typical cultivars, use TAMNUT for typical Spanish, FLORUNNER for typical",
    "! runner virginia type, and FLORIGIANT for large-seeded Virginia runner type,",
    "! EARLY BUNCH for early Virginia bunch type, and CHICO for earliest Spanish.",
    "! These cultivars have been subjected to other calibration data sets.",
    "! Of the above cultivars, Marc I and Southern Runner are also well tested.",
    "! Those with \"v tamn\" or \"v flor\" or \"v Ma\" are presumed to be like TAMNUT",
    "! or FLORUNNER or MARC I, with no testing done. NC7 and GK3 not tested.",
    "! Cultivars 19-38 tested somewhat with Australian and India data, & 31-35",
    "! also tested with some data at Gainesville.", "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP  ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     G     G     G     G     G     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 11.84  0.00  15.0   5.0  13.0 50.00 70.00  1.00  230.  13.0  0.63 0.360  23.0  1.40  10.0  78.0  .270  .510 ",
    "999992 MAXIMA               . DFAULT 11.84  0.00  25.0  12.0  24.0 85.00 90.00  1.50  290.  21.0  1.00 1.200  46.0  2.00  34.0  80.0  .270  .510",
    " ", "990001 Spanish type         . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 70.00  1.28  245.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "990002 Runner Type          . PN0001 11.84  0.00  21.2   8.0  17.8 75.30 88.00  1.40  260.  18.0  0.94 0.660  40.0  1.65  25.0  80.0  .270  .510",
    "IB0001 STARR, v tamnut      . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 70.00  1.28  245.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "IB0002 FLORUNNER           18 PN0001 11.84  0.00  21.2   9.2  18.8 74.30 88.00  1.40  260.  18.0  0.92 0.690  40.0  1.65  24.0  80.0  .270  .510",
    "IB0003 FLORIGIANT           1 PN0008 11.84  0.00  21.2   8.5  20.3 73.00 88.00  1.38  250.  18.0  0.86 0.990  37.0  1.65  25.0  74.0  .270  .510",
    "IB0004 VALENCIA, v tamn     . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 70.00  1.28  245.  16.0  0.84 0.360  29.0  2.50  15.0  78.0  .270  .510",
    "IB0005 TAMNUT               1 PN0007 11.84  0.00  17.4   7.0  17.0 62.00 70.00  1.28  245.  16.0  0.83 0.380  29.0  1.65  16.0  78.0  .270  .510",
    "IB0006 PRONTO, v tamnu      . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 70.00  1.28  245.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "IB0007 MARC I               2 PN0009 11.84  0.00  20.0   7.0  17.0 74.00 80.00  1.42  270.  18.0  0.93 0.690  40.0  1.65  23.0  80.0  .270  .510",
    "IB0008 CHICO                1 PN0006 11.84  0.00  16.4   7.0  15.0 58.00 66.00  1.04  285.  16.0  0.90 0.310  22.0  1.75  13.0  77.0  .270  .510",
    "IB0009 AGRITEC-127,v Ma     . PN0009 11.84  0.00  20.0   7.0  17.0 74.00 80.00  1.40  275.  18.0  0.95 0.660  40.0  1.65  23.0  80.0  .270  .510",
    "IB0011 EARLY RUNNER         1 PN0002 11.84  0.00  21.6   8.5  17.8 80.00 87.00  1.28  265.  18.0  0.85 0.570  36.0  1.65  27.0  79.0  .270  .510",
    "IB0013 SUNRUNNER,v flor     . PN0001 11.84  0.00  21.2   8.0  17.8 75.30 88.00  1.40  260.  18.0  0.94 0.650  40.0  1.65  25.0  80.0  .270  .510",
    "IB0015 SOUTHERN RUNNER      4 PN0002 11.84  0.00  22.9   9.2  18.2 82.60 91.00  1.30  265.  17.0  0.85 0.630  40.0  1.65  30.0  79.0  .270  .510",
    "IB0016 EARLY BUNCH          2 PN0004 11.84  0.00  21.9   7.6  16.5 72.40 80.00  1.34  265.  20.0  0.93 1.100  44.0  1.65  21.0  75.0  .270  .510",
    "IB0017 NC7, VIRGINIA        . PN0004 11.84  0.00  21.0   8.0  20.3 73.00 88.00  1.36  270.  20.0  0.94 1.000  38.0  1.65  30.0  75.0  .270  .510",
    "IB0018 GK3, VIRGINIA        . PN0001 11.84  0.00  21.0   8.0  20.3 73.00 88.00  1.36  270.  18.0  0.94 1.000  38.0  1.65  30.0  80.0  .270  .510",
    "IB0019 SHULAMIT, VA BUN     . PN0005 11.84  0.00  20.8   7.8  17.5 76.10 83.00  1.35  220.  19.0  0.93 0.980  40.0  1.65  25.0  74.0  .270  .510",
    "IB0020 TIFTON-8,FLORIG      . PN0011 11.84  0.00  21.9   8.2  19.7 74.50 83.00  1.37  205.  19.0  0.73 0.910  38.0  1.65  28.0  74.0  .270  .510",
    "IB0021 Q18801,earlybun      . PN0010 11.84  0.00  21.9   8.0  17.8 74.60 78.00  1.37  240.  19.0  0.87 1.180  44.0  1.65  24.0  75.0  .270  .510",
    "IB0022 VIRG BUN, MODIF      . PN0013 11.84  0.00  21.9   8.5  20.3 74.50 90.00  1.33  275.  19.0  0.76 0.880  38.0  1.65  27.0  74.0  .270  .510",
    "IB0023 MCCUBBIN, m TAMN     . PN0007 11.84  0.00  20.0   7.5  17.5 70.00 78.00  1.32  230.  17.0  0.82 0.520  32.0  1.65  19.0  78.0  .270  .510",
    "IB0024 TMV2, mod tamnu      . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 78.00  1.31  270.  16.0  0.80 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "IB0025 TAPIR, mod tamn      . PN0007 11.84  0.00  17.4   7.0  17.5 62.00 78.00  1.32  265.  16.0  0.80 0.360  29.0  1.65  13.0  78.0  .270  .510",
    "IB0026 ROBUT-33,uf v35      . PN0015 11.84  0.00  19.0   7.0  17.5 70.00 78.00  1.28  260.  16.0  0.84 0.500  29.0  1.65  15.0  78.0  .270  .510",
    "IB0027 TMV-2,uf v 24        . PN0007 11.84  0.00  19.0   7.0  17.5 62.00 72.00  1.28  270.  16.0  0.80 0.370  29.0  1.65  15.0  78.0  .270  .510",
    "IB0031 F81206,LS-RES        2 PN0014 11.84  0.00  23.0   8.0  19.5 77.00 91.00  1.27  265.  18.0  0.85 0.720  38.0  1.65  29.0  77.0  .270  .510",
    "IB0032 MA72*94-12,LS-Rs     2 PN0014 11.84  0.00 27.30  11.0 24.50 68.50 91.00  1.25  250.  18.0  0.59 0.720  38.0  1.65  30.0  77.0  .270  .510",
    "IB0033 861 VIRGINIA BUN     . PN0004 11.84  0.00  21.0   8.0  20.0 78.00 85.00  1.30  275.  20.0  0.76 0.550  38.0  1.65  30.0  75.0  .270  .510",
    "IB0034 897 VIRGINIA BUN     . PN0004 11.84  0.00  21.0   8.0  20.0 78.00 85.00  1.30  275.  20.0  0.76 0.960  38.0  1.65  30.0  75.0  .270  .510",
    "IB0035 ROBUT 33-1 v 5       . PN0015 11.84  0.00  17.4   7.0  17.5 65.00 77.00  1.23  260.  16.0  0.84 0.500  29.0  1.65  15.0  78.0  .270  .510",
    "IB0036 CIANJUR #5 TAM       . PN0007 11.84  0.00  17.4   7.0  17.5 65.00 77.00  1.23  250.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "IB0037 RANGKASBITUNG 5      . PN0007 11.84  0.00  17.4   7.0  17.5 65.00 77.00  1.23  250.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "IB0038 PIDIE  #5 TAMN       . PN0007 11.84  0.00  17.4   7.0  17.5 65.00 77.00  1.23  250.  16.0  0.84 0.360  29.0  1.65  15.0  78.0  .270  .510",
    "GA0001 Georgia Green        . RUNNER 11.84  0.00  21.2   9.2  18.8 77.30 85.00  1.45  270.  18.0  0.95 0.690  42.0  1.65  28.0  80.0  .270  .510",
    "IB0082 Non-Nodulated        1 PN0001 11.84  0.00  21.2   9.2  18.8 77.30 85.00  1.30  260.  18.0  0.56 0.455  40.0  1.65  26.0  72.0  .190  .510",
    "! next is 1997-1998/paper, also 2002-2003 P experiment", "GH0001 CHINESE TMV2 TAM     7 PN0019 11.84  0.00  17.0   7.0  17.5 53.00 73.00  1.20  270.  20.0  0.72 0.360  29.0  1.65  15.0  74.5  .270  .510",
    "! next is 1997-1998/paper", "GH0002 F_MIX3,short bun     7 PN0020 11.84  0.00  19.0   8.8  19.0 69.00 80.00  1.24  265.  19.0  0.77 0.450  36.0  1.65  26.0  74.0  .270  .510",
    "", "! next cultivar created 4/18/95 as a hypothetical perennial, A. glabrata , tried again 9/97, needs its own SPECIES",
    "IB0040 FLORIGRAZE PEREN PN0015 11.84  0.00  70.0   7.5  18.5 155.0 155.0  1.00  200.  18.0  0.01 0.150  36.0  1.65  30.0"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PPGRO048.CUL")

  c("*PIGEONPEA CULTIVAR COEFFICIENTS: CRGRO048 MODEL       ",
    "!", "! COEFF       DEFINITIONS", "! =====       ===========",
    "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL        Critical Short Day Length below which reproductive development",
    "!             progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN       Slope of the relative response of development to photoperiod with time",
    "!             (positive for shortday plants) (1/hour)", "! EM-FL       Time between plant emergence and flower appearance (R1)",
    "!             (photothermal days)", "! FL-SH       Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD       Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM       Time between first seed (R5) and physiological maturity (R7)",
    "!             (photothermal days)", "! FL-LF       Time between first flower (R1) and end of leaf expansion",
    "!             (photothermal days)", "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!             (mg CO2/m2-s)", "! SLAVR       Specific leaf area of cultivar under standard growth conditions",
    "!             (cm2/g)", "! SIZLF       Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT        Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD       Maximum weight per seed (g)", "! SFDUR       Seed filling duration for pod cohort at standard growth conditions",
    "!             (photothermal days)", "! SDPDV       Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR       Time required for cultivar to reach final pod load under optimal",
    "!             conditions (photothermal days)", "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!             at maturity. Causes seeds to stop growing as their dry weight",
    "!             increases until shells are filled in a cohort.",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))", "!",
    "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     P     P     P     N     G     G     N     P     G     N     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 11.50  0.20  20.0   9.0  20.0 25.00 23.00  0.90  300. 171.4  0.70  0.10  23.0  1.80  11.0  74.0 0.223  .015",
    "999992 MAXIMA               . DFAULT 13.00  0.80  75.0  18.0  30.0 40.00 30.00  1.10  350. 171.4  1.00  0.30  70.0  4.00  20.0  76.0 0.223  .015",
    "", "PP0001 76W est              . PP0001 12.94  0.71  32.7  17.4  24.1 37.72 28.87  1.10  320. 171.4  0.95  0.18  24.6  3.89  17.3  74.0 0.224  .015",
    "I88039 ICRISAT ICPL88039    . PP0002 11.60  0.74  29.3   9.1  25.8 29.01 23.23  1.06  320. 171.4  0.68  0.10  23.4  1.81  18.0  75.0 0.223  .015",
    "GH0001 KPATINGA             . PP0002 12.89  0.26  73.7  13.8  29.9 30.22 23.23  0.90  320. 171.4  0.81  0.26  63.2  1.82  11.3  74.0 0.223  .015"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PRGRO048.CUL")

  c("*BELL PEPPER CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!",
    "! PARAM   DEFINITIONS", "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses WITH daylength effect (for longday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (negative for longday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! TRESH   Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seeds to stop growing as their dry weight",
    "!         increases until shells are filled in a cohort.", "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     P     P     P     N     G     G     N     P     G     N     N     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.33  0.00  20.0   9.0  15.0  85.0 200.0  0.98  250. 225.0  0.60 .0070  25.0 150.0  42.0   6.5  .300  .050",
    "999992 MAXIMA               . DFAULT 12.33  0.00  42.0  11.0  18.0 110.0 200.0  1.10  300. 325.0  0.85 .0070  25.0 150.0  42.0   6.5  .300  .050",
    " ", "PR0001 CAPISTRANO           . PR0001 12.33  0.00  37.0  10.0  15.0 100.0 200.0  0.98  275. 250.0  0.85 .0070  25.0 150.0  42.0   6.5  .300  .050",
    "PRX001 CAPISTRANO           . PR0001 12.33  0.00  35.0  10.0  15.0 100.0 200.0  0.98  275. 250.0  0.85 .0070  25.0 150.0  42.0   6.5  .300  .050",
    "PR0002 BISCAYNE             . PR0002 12.33  0.00  22.0  11.0  15.0 100.0 200.0  1.10  250. 300.0  0.75 .0070  25.0 150.0  42.0   6.5  .300  .050",
    "PR0003 BISCAYNE-JJ          . PR0003 12.33  0.00  30.0  30.0  35.0  65.0 100.0  1.05  400.  50.0  0.70 .0027  25.0 100.0  84.0   6.5  .300  .050",
    "PR0011 CAPISTRANO-GL        . PR0001 12.33 0.000 21.74 10.85 15.15 92.20 200.0 1.054 294.7 250.0 0.750 0.007 25.00 150.0 42.00 6.500 0.300 0.050",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "PTSUB048.CUL")

  c("*POTATO CULTIVAR COEFFICIENTS: PTSUB048 MODEL", "", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code or this cultivar, points to the Ecotype in the",
    "!             ECO file (currently not used).", "! G2          Leaf area expansion rate after tuber initiation (cm2/m2 d)",
    "! G3          Potential tuber growth rate (g/m2 d)", "! PD          Index that supresses tuber growth during the period",
    "!             that immediately follows tuber induction", "! P2          Tuber initiation sensitivity to long photoperiods",
    "! TC          Upper critical temperature for tuber initiation (C)",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    G2    G3    PD    P2    TC",
    "!Coeffient #                             1     2     3     4     5",
    "!Calibration                             G     G     G     P     P",
    "", "999991 MINIMA               . DFAULT  900.  21.0   0.5   0.3  15.0",
    "999992 MAXIMA               . DFAULT 2100.  26.0   1.0   0.9  22.0",
    "", "IB0001 MAJESTIC             . IB0001 2000.  22.5   0.8   0.6  17.0   ",
    "IB0002 SEBAGO               . IB0001 1100.  22.5   0.9   0.0  19.0   ",
    "IB0003 Russet Burbank       . IB0001 1100.  26.0   0.9   0.2  17.0 ",
    "IB0004 KATHADIN             . IB0001 2000.  25.0   0.5   0.7  20.0   ",
    "IB0005 ATLANTIC             . IB0001 1000.  30.0   0.8   0.1  21.0",
    "CI0001 CLON7316             . IB0001 1100.  25.0   0.2   0.8  21.0",
    "CI0002 CLON7716             . IB0001 1100.  25.0   0.2   0.8  21.0",
    "AR0003 ACHIRANA             . IB0001 1100.  26.0   0.9   0.2  21.0 ",
    "DM0004 KAPTAH               . IB0001 1500.  24.0   0.6   0.4  18.0 ",
    "IB0006 MARIS PIPER          . IB0001 2000.  25.0   0.8   0.4  17.0   ",
    "IB0007 KING EDWARD          . IB0001 2000.  22.5   1.0   0.6  17.0   ",
    "IB0008 DESIREE              . IB0001 2000.  25.0   0.9   0.6  16.0   ",
    "IB0009 LT-1                 . IB0001 2000.  25.0   0.9   0.8  17.0   ",
    "IB0010 C14-343              . IB0001 2000.  25.0   0.9   0.4  21.0   ",
    "IB0011 NORCHIP              . IB0001 2000.  25.0   1.0   0.4  17.0   ",
    "IB0012 SHEPODY              . IB0001 2000.  25.0   0.7   0.6  19.0  ",
    "IB0018 Hilite Russet        . IB0001 1000.  27.0   0.2   0.1  20.0   ",
    "UF0001 RED LASODA           . IB0001 2000.  22.0   0.7   0.4  19.0   ",
    "", "  ", "") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "QUGRO048.CUL")

  c("*QUINOA CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! =====       ===========", "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL        Critical Short Day Length below which reproductive development",
    "!             progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN       Slope of the relative response of development to photoperiod with time",
    "!             (positive for shortday plants) (1/hour)", "! EM-FL       Time between plant emergence and flower appearance (R1)",
    "!             (photothermal days)", "! FL-SH       Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD       Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM       Time between first seed (R5) and physiological maturity (R7)",
    "!             (photothermal days)", "! FL-LF       Time between first flower (R1) and end of leaf expansion",
    "!             (photothermal days)", "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!             (mg CO2/m2-s)", "! SLAVR       Specific leaf area of cultivar under standard growth conditions",
    "!             (cm2/g)", "! SIZLF       Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT        Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD       Maximum weight per seed (g)", "! SFDUR       Seed filling duration for pod cohort at standard growth conditions",
    "!             (photothermal days)", "! SDPDV       Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR       Time required for cultivar to reach final pod load under optimal",
    "!             conditions (photothermal days)", "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!             at maturity. Causes seeds to stop growing as their dry weight",
    "!             increases until shells are filled in a cohort.",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))", "!",
    "!Species and cul re-calibrated 9/13/2021 KJB, because LAI protect is gone, SLWREF decreased 0.0034 to 0.0031, SIZREF increased 30 to 36",
    "!Note:  DO NOT TRY TO set for small seed size.  If you do, it will wipe out LAI and productivity because of small LA per seed",
    "!In future, if real LA vs V-stage available, try to set WTPSD TO 0.003, re-do LA vs V-stg, re-do SIZREF and SIZLF, re-do SLWREF",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!                                        1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             N     N     P     N     P     P     N     N     G     G     N     G     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT 14.25 0.006   8.0   1.0   6.0 25.00 20.00  0.75  225.   6.0  0.97 0.050  20.0  2.00  14.0  70.0  .130  .050",
    "999992 MAXIMA               . DFAULT 14.45 0.010  15.0   5.0  12.0 35.00 35.00  1.75  275.   8.0  1.00 0.065  25.0  2.50  17.0  80.0  .160  .080",
    "", "UH0001 Zeno (00)            . QU0001 14.35 0.008  11.2   2.9   8.6 33.80 26.00 1.730  250.   7.0  0.99 0.060  22.0  2.20  15.6  77.0  .135  .060 !kjb 9/13/21",
    "UH0002 Jessie (00)          . QU0002 14.35 0.008  11.2   3.0   9.1 30.40 26.00 1.700  255.   6.5  0.97 0.060  22.5  2.20  14.8  76.0  .155  .070 !kjb 9/13/21"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "RICER048.CUL")

  c("*RICE CULTIVAR COEFFICIENTS: RICER048 MODEL", "!", "! COEFF    DEFINITIONS",
    "! ======== ===========", "! VAR#     Identification code or number for a specific cultivar.",
    "! VAR-NAME Name of cultivar.", "! EXPNO    Number of experiments used to estimate cultivar parameters",
    "! ECO#     Ecotype code for this cultivar points to the Ecotype in the ECO",
    "!          file (currently not used).", "", "! P1       Time period (expressed as growing degree days [GDD] in oC-d above a",
    "!          base temperature of 9oC) from seedling emergence during which the",
    "!          rice plant is not responsive to changes in photoperiod. This period",
    "!          is also referred to as the basic vegetative phase of the plant.",
    "!          Range: 150-800 oC-d. ", "!          Calibration: flexible, compare with observed panicle initiation ",
    "!          and flowering dates.", "", "! P2O      Critical photoperiod or the longest day length (in hours) at",
    "!          which the development occurs at a maximum rate. At values higher",
    "!          than P2O developmental rate is slowed, hence there is delay due",
    "!          to longer day lengths. ", "!          Range 11-13 h. Default 12 h. ",
    "!          Calibration: Do not go below 11 unless data are available. ",
    "", "! P2R      Extent to which phasic development leading to panicle initiation",
    "!          is delayed (expressed as GDD in oC-d) for each hour increase in",
    "!          photoperiod above P2O. ", "!          Range 5-300 oC-d. ",
    "!          Calibration: Modern rice varieties will have values in ",
    "!          the lower range.", "", "! P5       Time period in GDD oC-d) from beginning of grain filling (3 to",
    "!          4 days after flowering) to physiological maturity with a base",
    "!          temperature of 9oC. ", "!          Range 150-850 oC-d. ",
    "!          Calibration: Ensure P1, P2O and P2R are correctly calibrated for ",
    "!          anthesis data. Then calibrate P5 for observed maturity date.",
    "", "! G1       Potential spikelet number coefficient as estimated from the",
    "!          number of spikelets per g of main culm dry weight (less leaf",
    "!          blades and sheaths plus spikes) at anthesis. ", "!          Range 50-75 #/g. A typical value is 55 #/g.",
    "", "! G2       Single grain weight (g) under ideal growing conditions, i.e.",
    "!          nonlimiting light, water, nutrients, and absence of pests",
    "!          and diseases.", "!          Range 0.015-0.030 g. Default 0.025 g.",
    "!          Calibration: Very low flexibility. ", "", "! G3       Tillering coefficient (scalar value) relative to IR64 cultivar",
    "!          under ideal conditions. ", "!          Range 0.7-1.3.",
    "!          Calibration: A higher tillering cultivar would have a coefficient ",
    "!          greater than 1.0.", "", "! PHINT    Phyllochron Interval (oC-d). Time interval in degree-days for each ",
    "!          leaf-tip to appear under non-stressed conditions.  ",
    "!          Range 55-90 oC-d. Default 83 oC-d.", "!          Calibration: Recommend to not change unless field data on leaf ",
    "!          numbers are available.", "", "! THOT     Temperature (oC) above which spikelet sterility is affected by ",
    "!          high temperature.  ", "!          Range 25-34 oC. Default 28oC. ",
    "!          Calibration: recommended to not change unless hot environment",
    "!          data are available. Convert old cultivars THOT = 28./G4.",
    "", "! TCLDP    Temperature (oC) below which panicle initiation is further delayed ",
    "!          (other than P1, P2O and P2R) by low temperature.",
    "!          Range 12-18 oC. Default 15oC. ", "!          Calibration: recommended to not change unless cold environment",
    "!          data are available. Convert old cultivars TCLDP = 15.*G5.",
    "", "! TCLDF    Temperature (oC) below which spikelet sterility is affected by ",
    "!          low temperature.", "!          Range 10-20 oC. Default 15oC. ",
    "!          Calibration: recommended to not change unless cold environment",
    "!          data are available. Convert old cultivars TCLDF = 15.*G5.",
    "!", "! The cultivar coefficient G5 was added to DSSAT Version 4.7.5",
    "! The cultivar coefficients G4 and G5 were removed - DSSAT Version 4.8",
    "! The cultivar coefficients THOT, TCLDP, and TCLDF were added to DSSAT Version 4.8",
    "!", "!          P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2R    P5   P2O    G1    G2    G3 PHINT  THOT TCLDP TCLDF  ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11  ",
    "!Calibration                             P     P     P     P     G     G     G     N     G     N     N",
    "", "999991 MINIMA               . DFAULT 150.0   5.0 150.0  11.0  50.0 .0150  0.70  55.0  25.0  12.0  10.0",
    "999992 MAXIMA               . DFAULT 800.0 300.0 850.0  13.0  70.0 .0300  1.30  90.0  34.0  18.0  20.0",
    "", "990001 IRRI ORIGINALS       . IB0001 880.0  52.0 550.0  12.0  65.0 .0280  1.00  83.0  28.0  15.0  15.0  ",
    "990002 IRRI RECENT          . IB0001 450.0 149.0 350.0  11.7  68.0 .0230  1.00  83.0  28.0  15.0  15.0  ",
    "990003 JAPANESE             . IB0001 220.0  35.0 510.0  12.0  55.0 .0250  1.00  83.0  28.0  15.0  15.0  ",
    "990004 N.AMERICAN           . IB0001 318.0 189.0 550.0  12.8  65.0 .0280  1.00  83.0  28.0  15.0  15.0  ",
    "", "IB0003 IR 36                . IB0001 556.8 53.88 373.4 12.87 68.00 0.023  1.00 83.00  31.3  15.0  15.0  ",
    "IB0012 IR 58                . IB0001 254.8 96.44 378.4 10.63 77.03 0.020  1.00 83.00  33.9  15.0  15.0  ",
    "IB0020 RD 23                . IB0001 528.6 156.5 387.4 12.64 52.65 0.022  1.00 83.00  29.0  15.0  15.0  ",
    "IB0050 PR114                . IB0001 662.5 184.4 503.0 12.38 62.86 0.023  1.00 83.00  25.7  15.0  15.0  ",
    "IB0055 Basmati 385          . IB0001 498.3 130.1 420.0 12.90 74.76 0.022  0.53 83.00  30.9  15.0  15.0  ",
    "IB0118 IR 72                . IB0001 437.1 61.02 371.8 11.58 77.80 0.026  1.00 83.00  30.4  15.0  15.0  ",
    " ", "IB0001 IR 8                 . IB0001 880.0  52.0 550.0  12.1  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0002 IR 20                . IB0001 500.0 166.0 500.0  11.2  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0004 IR 43                . IB0001 720.0 120.0 580.0  10.5  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0005 LABELLE              . IB0001 318.0 189.0 550.0  12.8  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0006 MARS                 . IB0001 698.0 134.0 550.0  13.0  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0007 NOVA 66              . IB0001 389.0 155.0 550.0  11.0  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0008 PETA                 . IB0001 420.0 240.0 550.0  11.3  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0009 STARBONNETT          . IB0001 880.0 164.0 550.0  13.0  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0010 UPLRI5               . IB0001 620.0 160.0 380.0  11.5  50.0 .0220  0.60  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0011 UPLRI7               . IB0001 760.0 150.0 450.0  11.7  65.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0013 SenTaNi (???)        . IB0001 320.0  50.0 550.0  10.0  70.0 .0300  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0014 IR 54                . IB0001 350.0 125.0 520.0  11.5  60.0 .0280  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0015 IR 64                . IB0001 500.0 160.0 450.0  12.0  60.0 .0250  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0016 IR 60(Est)           . IB0001 490.0 100.0 320.0  11.5  75.0 .0275  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0017 IR 66                . IB0001 500.0  50.0 490.0  12.5  62.0 .0265  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0018 IR 72x               . IB0001 400.0 100.0 580.0  12.0  76.0 .0230  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0019 RD 7 (cal.)          . IB0001 603.3 150.0 452.5  11.2  65.0 .0230  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0021 CICA8                . IB0001 700.0 120.0 360.0  11.7  60.0 .0270  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0022 LOW TEMP.SEN         . IB0001 400.0 120.0 420.0  12.0  60.0 .0250  1.00  83.0  35.0  15.0  15.0  !  0.80   1.0",
    "IB0023 LOW TEMP.TOL         . IB0001 400.0 120.0 420.0  12.0  60.0 .0250  1.00  83.0  22.4  15.0  15.0  !  1.25   1.0",
    "IB0024 17 BR11,T.AMAN       . IB0001 740.0 180.0 400.0  10.5  55.0 .0250  1.00  83.0  31.1  15.0  15.0  !  0.90   1.0",
    "IB0025 18 BR22,T.AMAN       . IB0001 650.0 110.0 400.0  12.0  60.0 .0250  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0026 19 BR 3,T.AMAN       . IB0001 650.0 110.0 420.0  12.0  65.0 .0250  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0027 20 BR 3,BORO         . IB0001 650.0  90.0 400.0  13.0  65.0 .0250  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0029 CPIC8                . IB0001 380.0 150.0 300.0  12.8  38.0 .0210  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0030 LEMONT               . IB0001 500.0  50.0 300.0  12.8  60.0 .0207  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0031 RN12                 . IB0001 380.0  50.0 300.0  12.8  40.0 .0199  1.00  83.0  24.3  15.0  15.0  !  1.15   1.0",
    "IB0032 TW                   . IB0001 360.0  50.0 290.0  12.8  55.0 .0210  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0115 IR 64*               . IB0001 540.0 160.0 490.0  12.0  50.0 .0250  1.10  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0116 HEAT SENSITIVE       . IB0001 460.0   5.0 390.0  13.5  62.0 .0250  1.00  83.0  24.3  15.0  15.0  !  1.15   1.0",
    "IB0117 BR14                 . IB0001 560.0 200.0 500.0  11.5  45.0 .0260  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0119 BR11                 . IB0001 825.0 300.0 390.0  11.5  52.0 .0240  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0120 PANT-4               . IB0001 830.0 160.0 300.0  11.4  45.0 .0300  1.00  83.0  35.0  15.0  15.0  !  0.80   1.0",
    "IB0121 JAYA                 . IB0001 830.0 100.0 200.0  11.4  40.0 .0300  1.00  83.0  35.0  15.0  15.0  !  0.80   1.0",
    "IB0122 BPRI10               . IB0001 740.0 200.0 225.0  13.5  40.0 .0230  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "IB0151 ZHENG DAO 9380       . IB0001 400.0 120.0 420.0  13.0  60.0 .0270  1.00  83.0  24.3  15.0  15.0  !  1.15   1.0",
    "IB0200 CL-448               . IB0001 100.0 120.0 250.0  12.0  40.0 .0250  1.00  83.0  22.4  15.0  15.0  !  1.25   1.0",
    "IB0051 KS-282 CRice         . IB0001 290.0  17.0 490.0  13.0  55.0 .0500  1.00  83.0  40.0  15.0  15.0  !  0.70   1.0",
    "IB0052 Basmati-515 FRice    . IB0001 460.0 120.0 512.0  11.0  37.0 .0210  1.00  75.0  28.0  15.0  15.0  !  1.00   1.0",
    "", "MC0020 RD 23                . IB0001 310.3 140.0 370.0  11.2  53.0 .0230  0.30  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "TR0001 KDML105              . IB0001 502.3 123.3 386.5  12.7  45.7 .0270  1.00  83.0  29.5  15.0  15.0  !  0.95   1.0",
    "TR0002 NIEW SANPATONG       . IB0001 495.8 128.3 364.2  12.7  40.7 .0277  0.70  83.0  32.9  15.0  15.0  !  0.85   1.0",
    "TR0003 SUPANBURI 60         . IB0001 540.0 154.7 497.0  11.9  77.7 .0280  1.00  83.0  27.2  15.0  15.0  !  1.03   1.0",
    "TR0004 CHAINAT 1            . IB0001 570.0 122.8 334.8  11.9  63.1 .0278  1.00  83.0  28.0  15.0  15.0  !  1.00   1.0",
    "TR0005 DOA 1                . IB0001 388.5  20.0 381.8  12.0  73.8 .0275  1.10  83.0  24.3  15.0  15.0  !  1.15   1.0",
    "") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SBGRO048.CUL")

  c("*SOYBEAN CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! =====       ===========", "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL        Critical Short Day Length below which reproductive development",
    "!             progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN       Slope of the relative response of development to photoperiod with time",
    "!             (positive for shortday plants) (1/hour)", "! EM-FL       Time between plant emergence and flower appearance (R1)",
    "!             (photothermal days)", "! FL-SH       Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD       Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM       Time between first seed (R5) and physiological maturity (R7)",
    "!             (photothermal days)", "! FL-LF       Time between first flower (R1) and end of leaf expansion",
    "!             (photothermal days)", "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!             (mg CO2/m2-s)", "! SLAVR       Specific leaf area of cultivar under standard growth conditions",
    "!             (cm2/g)", "! SIZLF       Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT        Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD       Maximum weight per seed (g)", "! SFDUR       Seed filling duration for pod cohort at standard growth conditions",
    "!             (photothermal days)", "! SDPDV       Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR       Time required for cultivar to reach final pod load under optimal",
    "!             conditions (photothermal days)", "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!             at maturity. Causes seeds to stop growing as their dry weight",
    "!             increases until shells are filled in a cohort.",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))", "!",
    "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     N     P     P     N     G     G     G     N     G     G     G     N     N     N     N",
    "", "999991 MINIMA               . DFAULT 11.78 0.129   9.0   5.0  11.0 22.00 18.00 1.000  300. 137.0  1.00  0.15  17.0  1.70  10.0  77.0  .400  .200",
    "999992 MAXIMA               . DFAULT 14.60 0.385  28.9  10.0  22.0 37.70 26.00 1.400  400. 230.0  1.00  0.19  25.5  2.44  10.0  78.0  .405  .205",
    "", "990011 M GROUP 000          . SB0001 14.60 0.129  15.5   5.0  12.0 29.50 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990012 M GROUP  00          . SB0001 14.35 0.148  16.0   5.0  12.0 30.00 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990013 M GROUP   0          . SB0001 14.10 0.171  16.8   6.0  13.0 30.80 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990001 M GROUP   1          . SB0101 13.84 0.203  17.0   6.0  13.0 31.60 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990002 M GROUP   2          . SB0201 13.59 0.249  17.4   6.0  13.5 32.40 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990003 M GROUP   3          . SB0301 13.40 0.285  19.0   6.0  14.0 33.20 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990004 M GROUP   4          . SB0401 13.09 0.294  19.4   7.0  15.0 34.00 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "990005 M GROUP   5          . SB0501 12.83 0.303  19.8   8.0  15.5 34.80 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "990006 M GROUP   6          . SB0601 12.58 0.311  20.2   9.0  16.0 35.60 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "990007 M GROUP   7          . SB0701 12.33 0.320  20.8  10.0  16.0 36.40 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "990008 M GROUP   8          . SB0801 12.07 0.330  21.5  10.0  16.0 37.20 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "990009 M GROUP   9          . SB0901 11.88 0.340  23.0  10.0  16.0 37.40 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "990010 M GROUP  10          . SB1001 11.78 0.349  23.5  10.0  16.0 37.40 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "!", "990015 M GROUP Savoy        . SB0304 14.33 0.110 20.77   6.0 11.70 35.2 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  76.0  .405  .205",
    "990016 M GROUP Vinton       . SB0305 14.16 0.173 22.57   6.0 12.08 34.2 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  76.0  .405  .205",
    "", "", "! KJB I DON'T KNOW ABOUT RELIABILITY OF UC CULTIVAR COEFFICIENTS, NEVER SAW ANY DATA.",
    "! VALUES FOR SD-PM FOR THESE 3 MG 00 CULTIVARS ARE HIGH, ALSO CONSISTENT WITH LAI DECLINING TO ZERO",
    "! LONG BEFORE THE SIMULATION.  I SUSPECT THAT THE MATURITY DATE REPORTED IN FILE A, IS FOR R8, NOT R7 PHYSIOL. MATURITY",
    "! REST OF CULTIVARS, I HAVE SOME EXPERIENCE WITH. KJB", "UC0001 ALTONA (00)          . SB0001 14.30 0.155  17.0   7.2  13.4 32.50 26.00 1.020  385. 190.0  1.00  0.19  19.0  2.20  11.5  77.0  .405  .205",
    "UC0002 MAPLE ARROW (00)     . SB0001 14.30 0.155  17.0   6.9  12.8 33.40 26.00 1.040  385. 190.0  1.00  0.19  19.0  2.20  10.5  77.0  .405  .205",
    "UC0003 MCCALL (00)          . SB0001 14.30 0.155  16.5   5.5  12.0 34.30 26.00 1.090  385. 200.0  1.00  0.19  21.0  2.20  10.5  77.0  .405  .205",
    "IB0011 EVANS (0)            . SB0001 14.10 0.171  16.8   7.8  13.8 30.00 26.00 1.020  400. 180.0  1.00  0.18  24.0  2.20  11.5  77.0  .405  .205",
    "IB0037 ELGIN-87 (2)         . SB0201 13.59 0.249  17.0   8.9  13.0 35.80 30.00 1.090  395. 180.0  1.00 0.175  24.5  2.20  11.5  77.0  .405  .205",
    "IB0003 WAYNE (3)            . SB0301 13.45 0.255  19.5   8.0  14.7 26.70 28.00 1.000  375. 180.0  1.00 0.180  23.0  2.20  12.0  77.0  .405  .205",
    "IB0010 WILLIAMS-82 (3)      . SB0301 13.40 0.285  19.0   8.3  14.2 32.20 28.00  0.97  385. 180.0  1.00 0.180  26.0  2.40  12.0  77.0  .405  .205",
    "IB0001 BRAGG                . SB0701 12.33 0.320  19.5  10.0  15.2 37.60 19.00 1.000  355. 170.0  1.00 0.170  24.0  2.00  10.0  78.0  .400  .200",
    "IB0101 BRAGG (7)            . SB0701 12.33 0.320  19.5  10.0  15.2 37.60 19.00 1.000  355. 170.0  1.00 0.170  25.0  2.00  10.0  78.0  .400  .200",
    "IB0002 COBB (8)             . SB0801 12.25 0.330  21.0   9.4  16.0 37.20 19.00 1.030  370. 190.0  1.00 0.155  23.5  1.90  10.0  78.0  .400  .200",
    "IB0014 CENTENNIAL(6)        . SB0601 12.48 0.311  20.0   9.0  15.5 34.50 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "IB0015 ESSEX (5)            . SB0501 12.83 0.303  19.8   8.5  15.5 35.00 18.00 1.030  375. 180.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200",
    "IB0008 FORREST (5)          . SB0501 12.82 0.303  21.1   8.8  15.2 35.20 18.00 1.030  355. 140.0  1.00  0.18  23.0  2.05   9.0  78.0  .400  .200",
    "IB0006 RANSOM (7)           . SB0702 12.38 0.320  18.4   9.0  14.2 33.50 18.00 1.030  355. 170.0  1.00 0.170  22.5  2.05  10.0  78.0  .420  .200",
    "IB0013 LEFLORE (6)          . SB0601 12.55 0.312  19.6   8.4  16.0 37.30 18.00 1.030  375. 180.0  1.00  .175  23.0  2.05  10.5  78.0  .400  .200",
    "IB0044 COKER 6847 (7)       . SB0701 12.35 0.319  20.1   9.0  14.8 36.50 18.00 1.030  345. 180.0  1.00  .170  23.0  2.05  10.0  78.0  .400  .200",
    "! CLARK, PAPILLON, JUPITER, PK-472 ARE CARRY-OVERS FROM STUDIES NOT SHOWN HERE, NOT MODIFIED OR TESTED FOR V4.0.",
    "IB0012 JUPITER (10)         . SB0901 11.88 0.340  28.9   7.0  13.5 31.50 15.00 1.030  375. 180.0  1.00  0.18  22.0  2.05  10.0  78.0  .400  .200",
    "IB0043 CLARK (4)            . SB0501 12.83 0.303  18.0   9.0  15.0 32.00 26.00 1.030  390. 200.0  1.00  0.19  20.0  2.10  12.0  78.0  .400  .200",
    "IB0033 PAPILLON (9)         . SB0901 11.88 0.340  28.0   6.0  11.0 30.00 15.00 1.030  375. 180.0  1.00  0.18  22.0  2.05  10.0  78.0  .400  .200",
    "IB0051 PK-472 (8)           . SB0801 12.07 0.330  21.5   8.0  16.0 36.00 18.00 1.030  300. 180.0  1.00  0.18  23.0  2.05   8.0  78.0  .400  .200",
    "IB0055 Hutcheson            . SB0501 12.58 0.311  22.0   8.0  15.5 35.00 18.00 1.050  400. 230.0  1.00  0.18  23.0  2.05  10.0  78.0  .400  .200 ",
    "! Envirotron/2002 Experiment; coefficients based on Georgia variety trials",
    "!LUGO, SPAIN FROM F. SAU STUDY", "LU0003 CHAND. 0             . SB0000 13.70 0.171  18.6  6.60  12.3 33.00 30.00 1.050  387. 200.0  1.00 .185  25.0  2.01  11.50  77.0  .405  .205",
    "LU0004 LABR.  00            . SB0100 14.00 .1480 16.60  7.00 13.20 36.80 34.80 1.080 397.0 200.0 1.000 .1530 25.00 2.030 11.20  77.0  .405  .205",
    "LU0005 MAJ. 000             . SB1000 14.20 .1290 17.00  6.20  11.0 34.60 32.00 1.050 395.0 200.0 1.000 .1780 25.00 1.970 12.00  77.0  .405  .205",
    "! FROM IOWA YIELDS PROJECT STUDY", "ST3660 STIN3660  MG 3.6     . SB0301 13.44 0.284  18.8   7.0  11.0 37.60 26.00 1.070  370. 180.0  1.00 0.165  25.0  2.20   8.0  77.0  .405  .205",
    "KR2828 KRUG2828  MG 2.7     . SB0201 13.50 0.258  17.4   7.0  12.0 37.70 26.00 1.080  370. 180.0  1.00 0.165  24.5  2.20   8.0  77.0  .405  .205",
    "! KBS-LTER Experiment. So far no experimental data for verification.",
    "MS0077 PIO9272 (00)         . SB0001 13.40 0.280  20.0   9.0  16.0 30.00 30.00 1.030  390. 200.0  1.00  0.18  22.0  2.05  10.0  77.0  .405  .205",
    "MS0078 PIO9202 (00)         . SB0001 14.35 0.148  16.0   5.0  15.0 30.00 30.00 1.022  350. 180.0  1.00  0.18  22.0  2.05  10.0  77.0  .405  .205",
    "MS0079 MS MAT GROUP 2       . SB0201 13.59 0.249  17.4   6.0  13.5 32.40 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "", "ISU113 KENWOOD TEMPPAP      . SB0201 13.59 0.249  17.0   6.5  13.5 33.50 26.00 1.050  375. 180.0  1.00  0.19  22.0  2.44  10.0  77.0  .405  .205",
    "", "!Vietnam", "IB0057 AK 06                . SB0801 12.15 0.200  21.0   6.0  12.0 26.00 20.00 1.030  385  137.0  1.00 0.155  22.0  2.20  13.0  78.0  .400  .200",
    "IB0058 SAMRAT               . SB0801 12.20 0.220  16.5   7.0  12.5 25.00 18.00 1.030  400  150.0  1.00 0.155  23.0  1.70   7.5  78.0  .400  .200",
    "IB0059 MAUS 47              . SB0801 12.20 0.385  17.0   6.0  12.5 25.00 18.00 1.030  400  180.0  1.00 0.155  23.0  1.70   7.5  78.0  .400  .200",
    "", "CCCA01 SAMIRA 1             . SB0401 13.09 0.294  19.4   7.0  15.0 34.50 26.00 1.030  375. 180.0  1.00 0.190  23.0  2.20  10.0  77.0  .405  .205",
    "", "!90004 M GROUP   4          . SB0401 13.09 0.294  19.4   7.0  15.0 34.00 26.00 1.030  375. 180.0  1.00  0.19  23.0  2.20  10.0  77.0  .405  .205",
    "! Next two cultivars calibrated by K. Boote, Feb 17, 2007, with modified species file using",
    "! Tb from 8 to 6C for Ps, Tmin 0/19 to -2/17C effect on Ps, and Tb for podset changed from 14 to 10C.",
    "IB0045 DON MARIO (4)        . SB0501 12.95 0.294  15.0   9.7  19.4 35.10 26.00 1.200  390. 200.0  1.00  0.19  21.0  2.10  16.0  78.0  .400  .200",
    "IB0056 ASGROW (4)           . SB0401 13.20 0.294  12.5   8.5  15.0 28.00 26.00 1.250  400. 200.0  1.00  0.19  21.0  2.10  12.0  77.0  .405  .205",
    "", "RB0002 MG77PA (13)          . SB0777 11.80 0.325  25.0   5.0  10.5 27.50 22.00 1.200  365. 230.0  1.00 0.150  18.2  2.00   10.  76.0  .400  .200",
    "RB0003 MG88PA (11)          . SB0888 11.50 0.340  24.5   8.2  12.0 25.00 18.00 1.175  388. 216.0  1.00 0.160  25.0  2.06   10.  78.0  .400  .200",
    " ") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SCCAN048.CUL")

  c("*SUGARCANE CULTIVAR COEFFICIENTS: SCCAN048 MODEL", "!", "!  SUGARCANE model cultivar file",
    "!  ::::::::::::::::::::::::::::::::::::::::::::::", "!  Matthew Jones, May 2018, Mt Edgecombe, South Africa.",
    "!  ::::::::::::::::::::::::::::::::::::::::::::::", "!  Cultivar file for the CANEGRO Sugarcane Plant Module",
    "!  ------------------------------------------------------------------------------",
    "!  It is recommended that for any new cultivars that need to be set up, the ",
    "!  Nco376 cultivar be copied and modified.  Please ensure that values entered ",
    "!  in this file are right-aligned to correct column heading.",
    "!", "!  Please see DSSAT-Canegro documentation for guidance on parameter",
    "!  determination.", "!  Detailed model description and model performance is available here: ",
    "!  Jones MR and Singels A (2018).  Refining the Canegro model for ",
    "!    improved simulation of climate change impacts on sugarcane.  ",
    "!    Eur. J. Agron.  https://doi.org/10.1016/j.eja.2017.12.009.",
    "!  Note: Varieties # CP1743, CP1762, CP2086, and CP2143  have the same parameters than",
    "!         IB0001 and need to be calibrated.", "!  --------------------------------------------------------------------------------",
    "!", "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! Name         |Values | Category            | Description                                                                     |Reference                                                                       |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! MaxPARCE     |   5-7 | Biomass accumulatio | Maximum (no stress) radiation conversion efficiency expressed as assimilate     |Singels et al., 2005b                                                           |",
    "!              |       |                     | produced before respiration, per unit PAR. (g/MJ).                              |                                                                                |",
    "! APFMX        |  0.88 | Biomass partitionin | Maximum fraction of dry mass increments that can be allocated to aerial         | 'ADMPFmax' in Singels & Bezuidenhout, 2002                                     |",
    "!              |       |                     | dry mass (t/t)                                                                  |                                                                                |",
    "! STKPFMAX     |0.6-0.8| Biomass partitionin | Fraction of daily aerial dry mass increments partitioned to stalk at high       |Singels, A., Donaldson, R.A. & Smit, M.A., 2005 derived from Liu and Bull (2001)|",
    "!              |       |                     | temperatures in a mature crop (t/t on a dry mass basis)                         |                                                                                |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! SUCA         |  0.5- | Sucrose accumulatio | Sucrose partitioning parameter: Maximum sucrose contents in the base of         | 'Scmax' in Singels & Bezuidenhout, 2002                                        |",
    "!              |    0.7|                     | stalk (t/t)",
    "! TBFT         |    25 | Sucrose accumulatio | Sucrose partitioning:  Temperature at which partitioning of unstressed          |\"T50\" in Singels & Bezuidenhout, 2002                                           |",
    "!              |       |                     | stalk mass increments to sucrose is 50% of the maximum value                    |                                                                                |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! LFMAX        |    12 | Canopy - leaves     | Maximum number of green leaves a healthy, adequately-watered plant will         |                                                                                |",
    "!              |       |                     | have after it is old enough to lose some leaves.                                |                                                                                |",
    "! MXLFAREA     |   360 | Canopy - leaves     | Max leaf area assigned to all leaves above leaf number MXLFARNO (cm2)           |Inman-Bamber (1991)                                                             |",
    "! MXLFARNO     |    14 | Canopy - leaves     | Leaf number above which leaf area is limited to MXLFAREA                        |Inman-Bamber (1991)                                                             |",
    "! LER0         |0.2-0.4| Canopy - leaves     | Max. leaf elongation rate, per \xb0Cd",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! PI1          |    69 | Leaf phenology      | Phyllocron interval 1 (for leaf numbers below Pswitch,  oC.d (base TTBASELFEX)) |Inman-Bamber (1991)                                                             |                                                                                 ",
    "! PI2          |   169 | Leaf phenology      | Phyllocron interval 2 (for leaf numbers above Pswitch,  oC.d (base TTBASELFEX)) |Inman-Bamber (1991)                                                             |",
    "! PSWITCH      |    18 | Leaf phenology      | Leaf number at which the phyllocron changes.                                    |Inman-Bamber (1991)                                                             |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! TDELAY       | 0-70  | Tiller phenology    | Delay between primary shoot appearance and appearance of first secondary shoot  | ",
    "! TAR0         |0.02-0.03Tiller phenology    | Maximum tiller appearance rate, per primary shoot, per \xb0Cd                      |                                                                                |",
    "! POPTT16      |  13.3 | Tiller phenology    | Stalk population at/after 1600 degree days (/m2)                                |                                                                                |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! TTPLNTEM     | 50-150| Phenology           | Thermal time to emergence for a plant crop                                      |                                                                                |",
    "! TTRATNEM     |  0-100| Phenology           | Thermal time to emergence for a ratoon crop                                     |                                                                                |",
    "! CHUPIBASE    |700-1200 Phenology           | Thermal time from emergence to start of stalk growth                            | 'TTskp' in Singels & Bezuidenhout, 2002                                        |",
    "! SER0         |0.1-0.4|                     | Max. stalk elongation rate, per \xb0Cd                                             | ",
    "! TT_POPGROWTH |500-700| Phenology           | Thermal time to peak tiller population                                          |                                                                                |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+                                                                                                                                                  ",
    "! LG_AMBASE    |   220 | Lodging             | Aerial mass (fresh mass of stalks, leaves, and water attached to them) at       |                                                                                |",
    "!              |       |                     | which lodging starts; t/ha                                                      |                                                                                |",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+ ",
    "! AQP_UP5      |0.5-0.7| Water uptake        | NOT USED YET.  Available soil water depletion fraction at which photosynthesis  |",
    "!                                            |   water stress starts.                                                          | ",
    "! -------------+-------+---------------------+---------------------------------------------------------------------------------+--------------------------------------------------------------------------------+ ",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#       MaxPARCE          APFMX       STKPFMAX           SUCA           TBFT          LFMAX       MXLFAREA       MXLFARNO            PI1            PI2        PSWITCH       TTPLNTEM       TTRATNEM      CHUPIBASE   TT_POPGROWTH        POPTT16           TAR0         TDELAY           LER0           SER0      LG_AMBASE        AQP_UP5",
    "!Coeffient #                                      1              2              3              4              5              6              7              8              9             10             11             12             13             14             15             16             17             18             19             20             21             22",
    "!Calibration                                      G              G              G              G              N              N              G              N              P              P              P              N              N              N              P              P              N              N              N              N              N",
    "", "999991 MINIMA               . DFAULT         5.0000         0.8800         0.6000         0.5000        25.0000        10.0000       360.0000        15.0000        50.0000       107.0000        12.0000       150.0000        30.0000      1000.0000       500.0000        10.0000         0.0100        20.0000         0.2000         0.1400       220.0000         0.5000",
    "999992 MAXIMA               . DFAULT         7.0000         0.8800         0.8000         0.7000        25.0000        13.0000       600.0000        23.0000        90.0000       170.0000        18.0000       150.0000        50.0000      1500.0000       700.0000        13.5000         0.0450        50.0000         0.3000         0.3000       220.0000         0.7000",
    "", "IB0001 NCo376               . SC0013         5.7000         0.8800         0.7000         0.5800        25.0000        12.0000       360.0000        15.0000        69.0000       169.0000        18.0000        80.0000        30.0000      1050.0000       600.0000        13.3000         0.0200        50.0000         0.2500         0.1400       220.0000         0.4500",
    "HYP_HS High-sucrose         . SC0013         5.8000         0.8800         0.6500         0.6300        25.0000        11.0000       400.0000        17.0000        50.0000       146.0000        12.0000       150.0000        50.0000      1000.0000       600.0000        10.0000         0.0150        50.0000         0.2500         0.2500       220.0000         0.4500",
    "HYP_HF High-fibre           . SC0014         6.9000         0.8800         0.6000         0.3000        25.0000        13.0000       382.0000        23.0000        59.0000       117.0000        12.0000       150.0000        50.0000      1000.0000       600.0000        10.0000         0.0200        50.0000         0.3000         0.3000       220.0000         0.6500",
    "RB7515 RB867515             . SC0016        14.6900         0.6020         0.5900         0.5800        25.0000        10.0000       594.0000        18.0000        89.0000       107.0000        18.0000       150.0000        30.0000      1478.9500      1010.0000        11.5000         0.0450        20.0000         0.2500         0.2500       220.0000         0.4500 ",
    "CP1743 CP 80-1743           . SC0013         5.7000         0.8800         0.7000         0.5800        25.0000        12.0000       360.0000        15.0000        69.0000       169.0000        18.0000        80.0000        30.0000      1050.0000       600.0000        13.3000         0.0200        50.0000         0.2500         0.1400       220.0000         0.4500",
    "CP1762 CP 88-1762           . SC0013         5.7000         0.8800         0.7000         0.5800        25.0000        12.0000       360.0000        15.0000        69.0000       169.0000        18.0000        80.0000        30.0000      1050.0000       600.0000        13.3000         0.0200        50.0000         0.2500         0.1400       220.0000         0.4500",
    "CP2086 CP 72-2086           . SC0013         5.7000         0.8800         0.7000         0.5800        25.0000        12.0000       360.0000        15.0000        69.0000       169.0000        18.0000        80.0000        30.0000      1050.0000       600.0000        13.3000         0.0200        50.0000         0.2500         0.1400       220.0000         0.4500",
    "CP2143 CP 89-2143           . SC0013         5.7000         0.8800         0.7000         0.5800        25.0000        12.0000       360.0000        15.0000        69.0000       169.0000        18.0000        80.0000        30.0000      1050.0000       600.0000        13.3000         0.0200        50.0000         0.2500         0.1400       220.0000         0.4500"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SCCSP048.CUL")

  c("*SUGARCANE CULTIVAR COEFFICIENTS: SCCSP048 MODEL ", "!  ::::::::::::::::::::::::::::::::::::::::::::::",
    "!  Fred Royce, Oct 2010, Gainesville, Florida.", "!  ::::::::::::::::::::::::::::::::::::::::::::::",
    "!  Cultivar file for the CASUPRO Sugarcane Plant Module", "!  ------------------------------------------------------------------------------",
    "!  Instructions for setting up new cultivars", "!  ------------------------------------------------------------------------------",
    "!  Notes: Varieties # IB0001, HYP_HS, HYP_HF and RB7515 have the same parameters than",
    "!         CP1743 and need to be calibrated.", "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! Name         | Range       | Category              | Units       | Description                                                      | Reference                                                                      |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! VAR#         | - - -       | Identification        | - - -       | Identification code or number for a specific cultivar used by    |                                                                                |",
    "!              |             |                       |             |    DSSAT program                                                 |                                                                                |",
    "! VAR-NAME     | - - -       | Identification        | - - -       | Name of cultivar as recognized commercially or within industry   |                                                                                |",
    "! EXPNO        | - - -       | Identification        | - - -       | Number of experiments used to estimate cultivar parameters       |                                                                                |",
    "! ECO#         | - - -       | Identification        | - - -       | Ecotype code of this cultivar in the ECO input file              |                                                                                |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! LFMAX        | 0.8 - 1.2   | Biomass accumulation  |mg CO2/m2-s  | Maximum leaf photosynthesis rate, 30 C, 350 ppm CO2 and high     | McCormick-Cramer-Watt_2008                                                     |",
    "!              | (not yet used, but needs a number)  |             |    light (used in leaf-level ET routine - Not yet in CASUPRO).   |                                                                                |",
    "! PHTMAX       | 200 - 284   | Biomass accumulation  |g[CH2O]/m2-d | Maximum amount of CH20 which can be produced if PAR is very high |                                                                                |",
    "! StkH2OFac    | 3.607       | Biomass accumulation  |    none     | Factor adjusts fresh cane weight according to dry matter by stalk| Martines SASTA 2001, following CaneGro:                                        |",
    "! SuH2OFac     | 2.078       | Biomass accumulation  |    none     | Factor adjusts fresh cane weight according to sucrose by stalk   | Stk_H2O = (3.607 * STKWT) - (2.078 * SUWT)                                     |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! PLF1         | 0.35 - 0.55 | Biomass partitioning  | proportion  | Maximum proportion of available CH2O prioritized to leaves,      |                                                                                |",
    "!              |             |                       |             |    under source (CH2O) limited conditions, phyllocron interval 1 |                                                                                |",
    "! PLF2         | 0.35 - 0.55 | Biomass partitioning  | proportion  | Maximum proportion of available CH2O prioritized to leaves,      |                                                                                |",
    "!              |             |                       |             |    under source (CH2O) limited conditions ,phyllocron interval 2 |                                                                                |",
    "! Gamma        | 0.38 - 0.65 | Biomass partitioning  | proportion  | Fraction of excess CH2O (sink limited conditions) destined for   |                                                                                |",
    "!              |             |                       |             |    stalk growth (1-GAMMA goes to sucrose)                        |                                                                                |",
    "! StkB         | 0.50 - 1.20 | Biomass partitioning  |             | Constant used in calculating the rate of increase of .           |                                                                                |",
    "!              |             |                       |             |    each stalk's weight                                           |                                                                                |",
    "! StkM         | 0.30 - 1.11 | Biomass partitioning  |             | Coefficient used in calculating the rate of increase of          |                                                                                |",
    "!              |             |                       |             |    each stalk's weight                                           |                                                                                |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! SIZLF        | 350 - 600   | Canopy   (unused)     | cm2         | Maximum size of largest leaf. To be used to adjust values        | Compare cultivar measurements to paired leaf # (XLFNUM) and leaf area (YLFSZ)  |",
    "!              |             |                       |             |    generated by the TABEX pair XLFNUM-YLFSZ in the ECO file      | in the SCCSP045.ECO input file.  Note: SIZLF is already in some CUL related    |",
    "! LIsun        |0.65 - 0.80  | Canopy                | proportion  | PAR intercepted by direct-sun (uppermost) canopy zone            | subroutines: IPVAR.for, OPTEMPY2K.for, but is not yet used in CASUPRO.         |",
    "!              |             |                       |             |                                                                  |                                                                                |",
    "! LIshd        |0.85 - 0.95  | Canopy                | proportion  | PAR intercepted by direct-sun plus mid-level canopy zone         |                                                                                |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! TB_1         |     9       | Leaf phenology        | \xb0C          | Base temperature for leaf appearance and primary stalk emergence |                                                                                |",
    "! TO1_1        |    27       | Leaf phenology        | \xb0C          | Lower optimum temperature, leaf development                      |                                                                                |",
    "! TO2_1        |    32       | Leaf phenology        | \xb0C          | Upper optimum temperature, leaf development                      |                                                                                |",
    "! TM_1         |    45       | Leaf phenology        | \xb0C          | Maximum temperature, leaf development                            |                                                                                |",
    "! PI1          | 85 - 120    | Leaf phenology        | \xb0C-day      | Phyllocron interval 1                                            |                                                                                |",
    "! PI2          | 85 - 170    | Leaf phenology        | \xb0C-day      | Phyllocron interval 2                                            |                                                                                |",
    "! DTPI         | 900 - 1600  | Leaf phenology        | \xb0C-day      | Thermal time threshold at which phyllocron interval changes      |                                                                                |",
    "!              |             |                       |             |    from Ph1 to Ph2                                               |                                                                                |",
    "! LSFAC        | 0.50 - 0.70 | Leaf phenology        | Ratio       | Ratio of leaf sheath DM to leaf blade DM                         | Clements (1980) pp 111-112                                                     |",
    "!              |             |                       |             |                                                                  |                                                                                |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+",
    "! LI1          |.035 - 0.15  | Tiller phenology      | proportion  | Light Interception below which there is little competition for   | Bezuidenhout et al 2003 pp 592-3                                               |",
    "!              |             |                       |             |    light among tillers                                           |                                                                                |",
    "! TELOM        | 130 - 300   | Tiller phenology      | \xb0C-day      | Threshold to tiller emergence (telomechron interval) during early| Concept from Bezuidenhout et al 2003 p 592 (values not based on same paper)    |",
    "!              |             |                       |             |    growth prior to light competition among tillers. [TB(2)]      |                                                                                |",
    "! TB_2         |    16       | Tiller phenology      | \xb0C          | Base temperature for tiller appearance                           |                                                                                |",
    "! TO1_2        |    27       | Tiller phenology      | \xb0C          | Lower optimum temperature, tiller development                    |                                                                                |",
    "! TO2_2        |    32       | Tiller phenology      | \xb0C          | Upper optimum temperature, tiller development                    |                                                                                |",
    "! TM_2         |    45       | Tiller phenology      | \xb0C          | Maximum temperature, tiller development                          |                                                                                |",
    "! Ph1P         | 168- 348    | Tiller phenology      | \xb0C-day      | threshold to sprouting, plant cane    [TB(1)]                    | Robertson et al. 1998 Pg 822 (8 deg base temp)                                 |",
    "! Ph1R         |  90 - 110   | Tiller phenology      | \xb0C-day      | threshold to sprouting, ratoon cane                              |                                                                                |",
    "! Ph2          | 0.7 - 1.5   | Tiller phenology      | mm/\xb0C-day   | Growth rate of primary stalk (rate of emergence for plant cane)  | Robertson et al. 1998 Pg 823                                                   |",
    "! Ph3          | 1200-1300   | Tiller phenology      | \xb0C-day      | Threshold for growth of primary stalk and first tillers          |                                                                                |",
    "!              |             |                       |             |    and first leaves above the ground surface                     |                                                                                |",
    "! Ph4          | 6000-6600   | Tiller phenology      | \xb0C-day      | Threshold  for tillering and establishment of the foliage        |                                                                                |",
    "!              |             |                       |             |    (currently continuation of Phase 3)                           |                                                                                |",
    "! StHrv        |             | Tiller phenology      | tillers     | Number of mature stalks per stool at most recent harvest         |   (will be removed to experimental file)                                       |",
    "! RTNFC        |             | Tiller phenology      | tillers     | Number of primary shoots to develop from each mature stalk cut   |                                                                                |",
    "!              |             |                       |             |   during the previous harvest (ratoon growth only)               |                                                                                |",
    "! MinGr        |  40 - 100   | Tiller phenology      | kg/tiller   | Weight below which a tiller having more than CAB X 2 nodes       |   CAB - number of leaves in spindle cluster at top of stalk (\"cabbage\").       |",
    "!              |             |                       |             |    senesces (g)                                                  |         Defined in ecotype file.                                               |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+                                                                                                                                                  ",
    "! RE30C        | 0.21 - 0.4  | Respiration/Senescence| g CH2O used | Respiration coefficient that depends on stalk & root mass        | Singels et al 2005 pg 295 (lower value)                                        |",
    "!              |             |                       | /kg DW/hr   |    at 30C (related in CASUPRO to shade-induced senescence)       | from MZIXM045  RES30C = 0.000158                                               |",
    "!              |             |                       |             |                                                                  |                                                                                |",
    "! RL30C        | 0.6 - 0.7   | Respiration/Senescence| g CH2O used | Respiration coefficient that depends on leaf mass                |                                                                                |",
    "!              |             |                       | /kg DW/hr   |    at 30C (related in CASUPRO to shade-induced senescence)       | Singels et al 2005 pg 295 (mid-value)                                          |",
    "!              |             |                       |             |                                                                  |                                                                                |",
    "! R30C2        | 3.5 - 4.5   | Respiration/Senescence| g CH2O used | Respiration coefficient that depends on gross photosynthesis     | from MZIXM045  R30C2 = 0.0026                                                  |",
    "!              |             |                       | /kg[CH2O]   |    at 30C                                                        |                                                                                |",
    "!              |             |                       | fixed / hr  |                                                                  |                                                                                |",
    "! -------------+-------------+-----------------------+-------------+------------------------------------------------------------------+--------------------------------------------------------------------------------+ ",
    "!", "!<------- Identification --------->|<----Biomass accumulation--->|<-------Biomass partitioning------>|<--------Canopy------->|<--------------------Leaf phenology----------------->|<--------------------------------------Tiller phenology--------------------------------->|<--Respiration/Senescence--->|",
    "!                                  |                             |                                   |                       |                                                     |                                                                                         |                             |",
    "!                                  |  NA        |Stk_H2O_Fac|    |                                   |  NA                   |                                                     |                                                                 StkHrNO                 |      RLF30C                 |",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO# LFMAX PHTMX Stalk Sucro Null1  PLF1  PLF2 Gamma  StkB  StkM Null3 SIZLF LIsun LIshd Null4  TB_1 TO1_1 TO2_1  TM_1   PI1   PI2  DTPI LSFAC Null5   LI1 TELOM  TB_2 TO1_2 TO2_2  TM_2  Ph1P  Ph1R   Ph2   Ph3   Ph4 StHrv RTNFC MinGr Null7 RE30C RL30C R30C2            ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36    37    38    39    40    41    42",
    "!Calibration                             G     G     G     G     G     G     G     G     G     G     G     G     G     G     N     N     N     N     N     G     G     G     N     N     G     G     N     N     N     N     G     N     N    G     N      N     N     G     N     G     G     G",
    "", "999991 MINIMA               . DFAULT 0.800 200.0 3.400 1.195     0 0.382 0.202 0.423 0.515 0.301     0     0 0.552 0.880     0 9.500 27.00 32.00 45.00 97.51 98.00 999.0 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 175.5 100.0 1.440 1275. 6300. 8.000 1.620 50.00     0 0.230 1.250 3.602",
    "999992 MAXIMA               . DFAULT 1.200 284.0 4.700 1.830     0 0.422 0.379 0.562 0.800 0.367     0     0 0.683 0.919     0 9.500 27.00 32.00 45.00 101.0 103.0 1100. 0.500     0 0.276 174.5 16.00 27.00 32.00 45.00 185.5 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.605 4.120",
    "", "CP1743 CP 80-1743           . CA0001 1.000 211.2 3.547 1.195     0 0.382 0.202 0.562 0.799 0.367     0     0 0.552 0.907     0 9.500 27.00 32.00 45.00 97.51 102.6 1051. 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 178.4 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.521 4.096           ",
    "CP1762 CP 88-1762           . CA0001 1.000 202.3 4.629 1.830     0 0.395 0.379 0.423 0.628 0.301     0     0 0.683 0.884     0 9.500 27.00 32.00 45.00 97.62 98.04 1005. 0.500     0 0.271 171.5 16.00 27.00 32.00 45.00 177.5 100.0 1.440 1275. 6300. 8.000 1.620 51.52     0 0.230 1.250 4.120           ",
    "CP2086 CP 72-2086           . CA0002 1.000 212.6 3.458 1.289     0 0.422 0.255 0.436 0.515 0.304     0     0 0.650 0.900     0 9.500 27.00 32.00 45.00 101.0 101.0 999.8 0.500     0 0.257 174.5 16.00 27.00 32.00 45.00 185.5 100.0 1.440 1275. 6300. 8.000 1.620 60.00     0 0.245 1.605 3.602            ",
    "CP2143 CP 89-2143           . CA0003 1.000 191.9 4.296 1.219     0 0.386 0.247 0.450 0.638 0.302     0     0 0.584 0.919     0 9.500 27.00 32.00 45.00 101.0 101.0 1091. 0.500     0 0.276 170.3 16.00 27.00 32.00 45.00 175.5 100.0 1.440 1275. 6300. 8.000 1.620 60.00     0 0.255 1.600 4.071            ",
    "IB0001 NCo376               . CA0001 1.000 211.2 3.547 1.195     0 0.382 0.202 0.562 0.799 0.367     0     0 0.552 0.907     0 9.500 27.00 32.00 45.00 97.51 102.6 1051. 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 178.4 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.521 4.096",
    "HYP_HS High-sucrose         . CA0001 1.000 211.2 3.547 1.195     0 0.382 0.202 0.562 0.799 0.367     0     0 0.552 0.907     0 9.500 27.00 32.00 45.00 97.51 102.6 1051. 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 178.4 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.521 4.096",
    "HYP_HF High-fibre           . CA0001 1.000 211.2 3.547 1.195     0 0.382 0.202 0.562 0.799 0.367     0     0 0.552 0.907     0 9.500 27.00 32.00 45.00 97.51 102.6 1051. 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 178.4 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.521 4.096",
    "RB7515 RB867515             . CA0001 1.000 211.2 3.547 1.195     0 0.382 0.202 0.562 0.799 0.367     0     0 0.552 0.907     0 9.500 27.00 32.00 45.00 97.51 102.6 1051. 0.500     0 0.165 169.3 16.00 27.00 32.00 45.00 178.4 100.0 1.440 1475. 6300. 8.000 1.620 70.71     0 0.270 1.521 4.096"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SCSAM048.CUL")

  c("*SUGARCANE CULTIVAR COEFFICIENTS: SCSAM048 MODEL", "!", "! Crop Coefficients for the SAMUCA (Sugarcane) model",
    "! Scientific documentation in Appendix A of Vianna et al (2020): ",
    "! https://doi.org/10.1016/j.compag.2020.105361", "!", "! COEFF             DEFINITIONS",
    "! =====            ===========", "! MAXGL             Maximum number of green leaf a tiller can hold (#/tiller)",
    "! N_LF_STK_EM       Number of leaves appeared before stalks emerges at soil ",
    "!                     surface (#/tiller)", "! N_LF_IT_FORM      Number of leaves appeared before internode formation ",
    "!                     (#/tiller)", "! MAXDGL            Maximum number of developed (dewlap formed) green leaf ",
    "!                     a tiller can hold (#/tiller)", "! AMAX              Assimilation rate at light saturation point (μmol/m2/s)",
    "! EFF               Carboxylation efficiency", "!                     (μmol[CO2]/m2/s (μmol[PPFD]/m2/s)-1)",
    "! CHUSTK            TT for stalk emergence (°Cdays)", "! CHUPEAK           TT for tillering peak (only used when competition for light ",
    "!                     is switched-off, method_pop = 1) (°Cdays)",
    "! CHUDEC            TT for tillering senescence (°Cdays)",
    "! CHUMAT            TT for population stabilization (°Cdays)",
    "! POPMAT            Tiller population at tillering stabilization (tillers/m2)",
    "! POPPEAK           Number of tillers at peak of population (tillers/m2, only ",
    "!                     used if competition for light is switched-off,method_pop=1)",
    "! TILLOCHRON        Thermal time required for the emergence of one new ",
    "!                     tiller (°Cdays/tiller)", "! PHYLLOCHRON       Thermal time required for the appearance of one new ",
    "!                     leaf (°Cdays/leaf)", "! SLA               Specific Leaf Area (cm2/g)",
    "! MLA               Maximum leaf area (cm2)", "! PLASTOCHRON       Thermal time required for the appearance of one new ",
    "!                     phytomer (°Cdays/phytomer)", "! INIT_LF_AREA      Initial leaf area of first appeared leaf (cm2)",
    "! MAX_INI_LA        Initial leaf area of leaves appeared after top parts ",
    "!                     formation (n_lf_max_ini_la) (cm2)", "! MAX_IT_DW         Maximum Dry Biomass of Internodes (g)",
    "! MID_TT_IT_GRO     Thermal time where internodes can achieve half of its ",
    "!                     maximum biomass (°Cdays)", "! END_TT_IT_GRO     Thermal time for completion of internode growth (°Cdays)",
    "! MID_TT_LF_GRO     Thermal time where leaves can achieve half of its maximum ",
    "!                     biomass (°Cdays)", "! END_TT_LF_GRO     Thermal time for completion of leaf growth (°Cdays)",
    "!", "! Notes: ", "! (i) Values are being read with a precision of 4 decimals",
    "! (ii)Varieties # IB0001, HYP_HS, HYP_HF, CP1743, CP1762, CP2086, and CP2143  ",
    "! have the same parameters than RB7515 and need to be calibrated. ",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#          MAXGL    N_LF_STK_EM   N_LF_IT_FORM         MAXDGL           AMAX            EFF         CHUSTK        CHUPEAK         CHUDEC         CHUMAT         POPMAT        POPPEAK     TILLOCHRON    PHYLLOCHRON            SLA            MLA    PLASTOCHRON   INIT_LF_AREA     MAX_INI_LA      MAX_IT_DW  MID_TT_IT_GRO  END_TT_IT_GRO  MID_TT_LF_GRO  END_TT_LF_GRO",
    "!Coeff #                                          1              2              3              4              5              6              7              8              9             10             11             12             13             14             15             16             17             18             19             20             21             22             23             24 ",
    "!Calibration                                      G              P              P              P              G              G              P              P              P              P              P              P              P              P              G              G              P              G              G              G              P              P              P              P ",
    "999991 MINIMA               . DFAULT           10.0            3.0            3.0            6.0           41.3          0.000          404.0          400.0         1200.0         1500.0            6.0           17.0           48.1          107.0           56.0          450.0          107.0           10.0           80.0           18.0          380.0          600.0          400.0         1100.0",
    "999992 MAXIMA               . DFAULT           12.0            8.0            8.0           12.0           60.7          0.100         1050.0         1950.0         1800.0         3900.0           18.0           30.0          134.8          200.0          158.0          800.0          200.0           30.0          180.0           35.0          700.0         1400.0          800.0         1500.0",
    "", "RB7515 RB867515             . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "IB0001 NCo376               . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "HYP_HS High-sucrose         . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "HYP_HF High-fibre           . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "CP1743 CP 80-1743           . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "CP1762 CP 88-1762           . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "CP2086 CP 72-2086           . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0",
    "CP2143 CP 89-2143           . SC0001           12.0            4.0            3.0            6.0           44.9          0.069          650.0         1400.0         1600.0         3200.0            9.5           22.0           69.0          132.0          120.0          600.0          132.0           15.0          120.0           28.0          400.0         1200.0          700.0         1300.0"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SFGRO048.CUL")

  c("*SAFFLOWER CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! =====       ===========", "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL        Critical Short Day Length below which reproductive development",
    "!             progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN       Slope of the relative response of development to photoperiod with time",
    "!             (positive for shortday plants) (1/hour)", "! EM-FL       Time between plant emergence and flower appearance (R1)",
    "!             (photothermal days)", "! FL-SH       Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD       Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM       Time between first seed (R5) and physiological maturity (R7)",
    "!             (photothermal days)", "! FL-LF       Time between first flower (R1) and end of leaf expansion",
    "!             (photothermal days)", "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!             (mg CO2/m2-s)", "! SLAVR       Specific leaf area of cultivar under standard growth conditions",
    "!             (cm2/g)", "! SIZLF       Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT        Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD       Maximum weight per seed (g)", "! SFDUR       Seed filling duration for pod cohort at standard growth conditions",
    "!             (photothermal days)", "! SDPDV       Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR       Time required for cultivar to reach final pod load under optimal",
    "!             conditions (photothermal days)", "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!             at maturity. Causes seeds to stop growing as their dry weight",
    "!             increases until shells are filled in a cohort.",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))", "!",
    "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "! SSingh CREATED A LONG DAY TYPE, BUT PPSEN should be NEGATIVE, SO MAY NOT WORK.  ",
    "! 2nd and 3rd cultivars were evaluated, but were not calibrated to be different, and data not shown.",
    "!", "! 2/4/2019, Modifications made by K. Boote, and K. Steberl during January 2019, to go along with modified Spe and Eco files.",
    "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P      P    P     P     P     G     G     G     G     G     G     G     G     G     G     G",
    "", "999991 MINIMA               . DFAULT 23.00 0.001  10.3   4.0  13.0 28.50 18.00  1.55  250. 115.0  0.66 0.052  29.0 18.00  17.0  46.0  .140  .330",
    "999992 MAXIMA               . DFAULT 23.00 0.001  16.5   4.5  13.5 30.50 20.25  1.80  275. 115.0  0.76 0.064  30.0 22.25  19.0  61.0  .140  .330",
    "", "IB0001 PI8311               . SF0401 23.00 0.001  16.5   3.2  14.7 30.50 20.25  1.40  250. 115.0  0.64 0.052  29.0 18.00  18.0  46.5  .140  .330",
    "IB0002 99OL                 . SF0401 23.00 0.001  16.5   3.2  14.7 30.50 20.25  1.40  250. 115.0  0.64 0.052  29.0 18.00  18.0  46.5  .140  .330",
    "IB0003 Nutrisaff            . SF0401 23.00 0.001  16.5   3.2  14.7 30.50 20.25  1.40  250. 115.0  0.64 0.052  29.0 18.00  18.0  46.5  .140  .330",
    "", "! following are two cultivars from Kathrin Steberl, grown at Stuttgart, Germany",
    "UH0001 Goldschopf           . BW0001 23.00 0.001  10.3   4.5  13.0 28.50 18.00  1.55  250. 115.0  0.67 0.064  30.0 22.25  19.0  55.0  .140  .330",
    "UH0002 Thornless Safflower  . BW0002 23.00 0.001  10.3   4.5  13.0 28.50 18.00  1.80  260. 115.0  0.76 0.052  30.0 22.25  17.0  61.0  .140  .330"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SGCER048.CUL")

  c("*SORGHUM CULTIVAR COEFFICIENTS: SGCER048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar.",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code for this cultivar, points to the Ecotype in",
    "!             the ecotype file", "! P1          Thermal time from seedling emergence to the end of the",
    "!             juvenile phase (expressed in degree days above TBASE",
    "!             during which the plant is not responsive to changes",
    "!             in photoperiod", "! P2          Thermal time from the end of the juvenile stage to tassel initiation",
    "!             under short days (degree days above TBASE)", "! P2O         Critical photoperiod or the longest day length (in hours) at",
    "!             which development occurs at a maximum rate. At values higher",
    "!             than P2O, the rate of development is reduced",
    "! P2R         Extent to which phasic development leading to panicle",
    "!             initiation (expressed in degree days) is delayed for each hour",
    "!             increase in photoperiod above P2O", "! PANTH       Thermal time from the end of tassel initiation to anthesis (degree days",
    "!             above TBASE)", "! P3          Thermal time from to end of flag leaf expansion to anthesis (degree days",
    "!             above TBASE)", "! P4          Thermal time from anthesis to beginning grain filling (degree",
    "!             days above TBASE)", "! P5          Thermal time from beginning of grain filling to physiological",
    "!             maturity (degree days above TBASE)", "! PHINT       Phylochron interval; the interval in thermal time between",
    "!             successive leaf tip appearances (degree days)",
    "! G1          Scaler for relative leaf size", "! G2          Scaler for partitioning of assimilates to the panicle (head).",
    "! PSAT        Critical photoperiod below which development is not delayed (optional)",
    "! PBASE       Ceiling photoperiod above which development is delayed indefinitely (optional)",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!                                                                                                     |-optional-|",
    "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P2   P2O   P2R PANTH    P3    P4    P5 PHINT    G1    G2 PBASE  PSAT",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13",
    "!Calibration                             P     P     P     P     N     N     N     P     N     G     G     P     P",
    "", "999991 MINIMA               . DFAULT 200.0 102.0 11.00   1.0 617.5 152.5  81.5 300.0 49.00    .0   2.0",
    "999992 MAXIMA               . DFAULT 500.0 300.0 17.00 300.0 617.5 152.5  81.5 700.0 49.00  22.0   6.0",
    "", "990001 N.AMERICAN           . IB0001 360.0 102.0 12.50  30.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "990002 INDIAN               . IB0001 410.0 102.0 13.60  40.0 617.5 152.5  81.5 540.0 49.00   3.0   5.5",
    "990003 AUSTRALIAN           . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "990004 W.AFRICAN            . IB0001 413.0 102.0 13.60  40.0 617.5 152.5  81.5 640.0 49.00   3.0   6.5",
    "", "IB0001 RIO                  . IB0001 430.0 102.0 11.60  24.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0002 9188                 . IB0001 393.0 102.0 13.00  23.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0003 BRANDES              . IB0001 374.0 102.0 11.00 116.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0004 MN1500               . IB0001 495.0 102.0 11.80 139.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0005 HEGARI               . IB0001 273.0 102.0 11.50 136.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0006 100M                 . IB0001 291.0 102.0 11.00 127.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0007 80M                  . IB0001 337.0 102.0 12.60 262.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0008 60M                  . IB0001 337.0 102.0 12.80 290.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0009 SM100                . IB0001 365.0 102.0 13.00  45.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0010 SM80                 . IB0001 356.0 102.0 12.00  74.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0011 SM60                 . IB0001 365.0 102.0 12.20  74.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0012 REDLON               . IB0001 393.0 102.0 12.50  30.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0013 CAPROCK              . IB0001 393.0 102.0 12.80  84.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0014 ATx378XRTx7000       . IB0001 384.0 102.0 11.30  24.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0015 ATx623               . IB0001 380.0 102.0 13.00  35.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0016 RTx430               . IB0001 400.0 102.0 13.00 123.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0017 ATx623XRTx430        . IB0001 390.0 102.0 13.00  35.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0018 BTx3197              . IB0001 411.0 102.0 13.00 108.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0019 RTx7078              . IB0001 421.0 102.0 14.40 221.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0020 TX 610               . IB0001 180.0 102.0 16.50   1.0 617.5 152.5  81.5 580.0 49.00  22.0   6.0",
    "IB0021 WHEATLAND            . IB0001 365.0 102.0 12.50  30.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0022 ATx399XRTx430        . IB0001 393.0 102.0 12.80  40.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0023 ATx378XRTx430        . IB0001 411.0 102.0 12.50  20.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0024 ATx623XRTx7000       . IB0001 374.0 102.0 13.00  14.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0025 38M                  . IB0001 291.0 102.0 13.00  12.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0026 CSH-1                . IB0001 410.0 102.0 13.60  40.0 617.5 152.5  81.5 640.0 49.00   3.0   6.5",
    "IB0027 DE KALB 46           . IB0001 325.0 102.0 15.50  30.0 617.5 152.5  81.5 540.0 49.00   9.0   6.0",
    "IB0028 PIONEER 8333         . IB0001 325.0 102.0 15.50  30.0 617.5 152.5  81.5 540.0 49.00  11.0   6.0",
    "IB0029 DK                   . IB0001 200.0 102.0 15.50  12.0 617.5 152.5  81.5 540.0 49.00    .0   6.0",
    "IB0030 PIONEER 8515         . IB0001 275.0 102.0 15.50  30.0 617.5 152.5  81.5 500.0 49.00    .0   6.0",
    "IB0031 RS 626               . IB0001 300.0 102.0 15.50  30.0 617.5 152.5  81.5 400.0 49.00    .0   6.0",
    "IB0032 DK- E57              . IB0001 325.0 102.0 15.50  30.0 617.5 152.5  81.5 450.0 49.00  13.0   6.0",
    "IB0040 RS610                . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "IB0041 NK212                . IB0001 420.0 102.0 15.50  30.0 617.5 152.5  81.5 500.0 49.00  13.0   6.0",
    "IB0042 PIONEER 846          . IB0001 480.0 102.0 12.50 190.0 617.5 152.5  81.5 650.0 49.00   5.0   5.0",
    "IB0043 CSH-6                . IB0001 410.0 102.0 13.60  40.0 617.5 152.5  81.5 510.0 49.00   7.0   4.5",
    "IB0044 CSH-6*               . IB0001 320.0 102.0 13.50 180.0 617.5 152.5  81.5 540.0 49.00   7.0   5.5",
    "IB0046 M-35-1               . IB0001 320.0 102.0 14.00  45.6 617.5 152.5  81.5 556.0 49.00  15.0   4.5",
    "IB0047 SPV-504              . IB0001 310.0 102.0 13.00  35.0 617.5 152.5  81.5 554.0 49.00  15.0   4.5",
    "IB0048 CSH-5                . IB0001 255.0 102.0 13.50  40.5 617.5 152.5  81.5 490.0 49.00  10.0   5.5",
    "IB0049 CSH-9                . IB0001 225.0 102.0 13.50  45.1 617.5 152.5  81.5 573.0 49.00  10.0   5.5",
    "IB0050 SPH-388              . IB0001 232.0 102.0 12.50  43.7 617.5 152.5  81.5 590.0 49.00  10.0   4.5",
    "IB0051 CARGIL_1090          . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "IB0052 CARGIL DR.1125       . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "IB0053 CARGIL 837           . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "IB0054 ORGO-G-EXTRA         . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "IB0055 PIONEER 850          . IB0001 460.0 102.0 12.50  90.0 617.5 152.5  81.5 600.0 49.00   5.0   6.0",
    "", "!calibration Myriam (data SMK 2014 +P/-P)", "IB0056 CSM335               . IB0002 400.0 252.0 12.80 1000. 617.5 252.5  81.5 400.0 60.00  10.0   3.0  ",
    "IB0057 CSM63E               . IB0002 300.0 102.0 12.80 100.0 647.5 142.5  61.5 450.0 55.00  16.0   3.0 ",
    "IB0058 Fadda                . IB0002 300.0 252.0 12.80 1000. 617.5 152.5  81.5 350.0 49.00  10.0   6.0 ",
    "IB0059 IS15401              . IB0002 500.0 300.0 12.80 1800. 640.5 300.5  81.5 350.0 55.00   0.5   2.0",
    "", "") |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VAR-NAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SUGRO048.CUL")

  c("*SUNFLOWER CULTIVAR COEFFICIENTS: CRGRO048 MODEL                                                                                                                                                          ",
    "!                                                                                                                                                          ",
    "! COEFF       DEFINITIONS                                                                                                                                                                               ",
    "! =====       ===========                                                                                                                                                                               ",
    "! VAR#        Identification code or number for a specific cultivar.                                                                                                                                    ",
    "! VAR-NAME    Name of cultivar                                                                                                                                                                          ",
    "! EXPNO       Number of experiments used to estimate cultivar parameters                                                                                                                                ",
    "! ECO#        Code for the ecotype to which this cultivar belongs (see *.eco file)                                                                                                                      ",
    "! CSDL        Critical Long Day Length above which reproductive development                                                                                                                            ",
    "!             progresses with no daylength effect (for long day plants) (hour)                                                                                                                          ",
    "! PPSEN       Slope of the relative response of development to photoperiod with time                                                                                                                    ",
    "!             (negative for long day plants) (1/hour) - slower at daylength less than CSDL                                                                                                                                                   ",
    "! EM-FL       Time between plant emergence and flower appearance (R1)                                                                                                                                   ",
    "!             (photothermal days)                                                                                                                                                                       ",
    "! FL-SH       Time between starburst and begin thalamus (R3) (photothermal days)                                                                                                                          ",
    "! FL-SD       Time between starburst to anthesis/begin seed (R5) (photothermal days)                                                                                                                         ",
    "! SD-PM       Time between anthesis/begin seed (R5) and physiological maturity (R7)                                                                                                                              ",
    "!             (photothermal days)                                                                                                                                                                       ",
    "! FL-LF       Time between starburst (R1) and end of leaf expansion                                                                                                                                  ",
    "!             (photothermal days).  Duration should be relatively close to FL-SD, affects SLA                                                                                                                                                                       ",
    "! LFMAX       Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light                                                                                                                     ",
    "!             (mg CO2/m2-s)                                                                                                                                                                             ",
    "! SLAVR       Specific leaf area of cultivar under standard growth conditions                                                                                                                           ",
    "!             (cm2/g)                                                                                                                                                                                   ",
    "! SIZLF       Maximum size of full leaf (cm2)                                                                                                                                          ",
    "! XFRT        Maximum fraction of daily growth that is partitioned to thalamus,achen,+seed                                                                                                                      ",
    "! WTPSD       Maximum weight per seed (g)                                                                                                                                                               ",
    "! SFDUR       Seed filling duration for pod cohort at standard growth conditions                                                                                                                        ",
    "!             (photothermal days)                                                                                                                                                                       ",
    "! SDPDV       Average seed per pod under standard growing conditions (#/pod) Ignore this one.                                                                                                                           ",
    "! PODUR       Time required for cultivar to reach final pod load under optimal                                                                                                                          ",
    "!             conditions (photothermal days).  Must be short for sunflower.                                                                                                                                                            ",
    "! THRSH       Threshing percentage. The maximum ratio of (seed/(seed+shell))                                                                                                                            ",
    "!             at maturity. Causes seeds to stop growing as their dry weight                                                                                                                             ",
    "!             increases until shells are filled in a cohort. Sunflower, achene as % of thalamus                                                                                                                                          ",
    "! SDPRO       Fraction protein in seeds (g(protein)/g(seed))                                                                                                                                            ",
    "! SDLIP       Fraction oil in seeds (g(oil)/g(seed))     ",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration                                                                                                                                               ",
    "!                                                                                                                                                                                                       ",
    "@VAR#  VAR-NAME........ EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP                                                        ",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     N     P     P     N     G     G     G     N     G     G     G     N     N     N     N                                                    ",
    "", "999991 MINIMA               . DFAULT 15.00 -.085  15.0   5.0  10.0 24.00 14.00  1.80  220. 180.0  0.70  0.05  22.0  1.80   4.5  65.0  .140  .420",
    "999992 MAXIMA               . DFAULT 15.00 -.090  21.0   7.5  13.0 31.00 14.50  2.20  280. 220.0  0.85  0.12  26.0  2.20   4.5  75.0  .140  .490",
    "", "!These 8 cultivars calibrated by KJB, 8/11/2017, again 8/14/2021.  Increased SLAVR from 240 to 260, and decreased XFRT by 0.02 (all)",
    "!Species re-calibrated by decreasing SLWREF from 0.0026 to 0.0022 and increasing SLAMIN from 240 to 320 (both to increase productivity and LAI,",
    "!to offset the effect of removing the LAI protection). Also, modified partitioning (more to leaf early and less to leaf late to improve pattern.",
    "!Code needs parameter on NRATIO, to reduce the excessive root growth (4000 kg) that occurs under N stress, and N effect on SLA.  Like in PFM model.",
    "!                                                                                                                                                                                                         ",
    "IB0009 E-353                . SU0702 15.00 -.086  18.6   6.5  12.2 25.00 14.00  1.90  260. 200.0  0.80  0.11  24.0  2.00   4.5  73.0  .140  .450",
    "IB0013 SUNGRO-385           . SU0702 15.00 -.086  20.6   7.0  12.2 29.00 14.50  2.10  260. 200.0  0.74  0.07  24.0  2.00   4.5  69.0  .140  .480                                                        ",
    "IB0014 SW-101               . SU0702 15.00 -.086  17.6   5.5  10.2 30.00 14.00  1.90  260. 200.0  0.72  0.09  24.0  2.00   4.5  68.0  .140  .430",
    "IB0015 S-530                . SU0702 15.00 -.086  22.0   6.5  12.5 29.00 15.00  2.10  260. 200.0  0.74  0.07  24.0  2.00   4.5  69.0  .140  .450",
    "IB0019 Sungold              . SU0702 15.00 -.086  17.6   5.5  10.2 28.40 14.00  1.90  260. 200.0  0.74  0.06  24.0  2.00   4.2  68.0  .140  .480",
    "", "IB0018 Hysun-33             . SU0702 15.00 -.190  20.4   6.0  11.3 27.50 14.00  1.90  260. 200.0  0.70  0.07  24.0  2.00   4.5  68.0  .140  .450",
    "IB0029 Hysun-38             . SU0702 15.00 -.190  20.2   6.0  11.7 29.00 14.00  1.90  260. 200.0  0.69  0.07  24.0  2.00   4.5  68.0  .140  .450",
    "IB0020 Pioneer 64A93        . SU0702 15.00 -.190  20.2   6.5  12.2 27.60 14.00  1.90  260. 200.0  0.70  0.07  24.0  2.00   4.5  68.0  .140  .450",
    "", "IB0021 Heliasol RM          . SU0702 15.00 -.086  17.6   5.5  10.2 28.40 14.00  1.90  240. 200.0  0.76  0.06  24.0  2.00   4.2  68.0  .140  .480",
    "IB0022 Melody               . SU0702 15.00 -.086  17.6   5.5  10.2 28.40 14.00  1.90  240. 200.0  0.76  0.06  24.0  2.00   4.2  68.0  .140  .480"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SUOIL048.CUL")

  c("*SUNFLOWER GENOTYPE COEFFICIENTS - SUOIL048 MODEL", "!", "! Development Aspects                          Range of Values",
    "!", "! Juvenile phase coefficient           P1             250-450",
    "! Photoperiodism coefficient           P2             0.5-14",
    "! Grain filling duration coefficient   P5             550-750",
    "!", "! Yield aspects", "!", "! Grain number coefficient             G2            1500-3000",
    "! Kernel growth rate                   G3             1.2-2.9",
    "! Kernel oil content                   O1              55-85",
    "!", "! P1: Duration of juvenile phase (in degree C.days with a",
    "!     base temperature of 4 C)", "! P2: Amount (in days/hour) that development is slowed when crop is grown in",
    "!     photoperiod shorter than the optimum (which is considered to be 15 hours)",
    "! P5: Duration of the first anthesis-physiological maturity stage (in degree",
    "!     days above a base of 4C)", "! G2: Maximum possible number of grains per head (measured in plants grown",
    "!     under optimum conditions and low plant population density)",
    "! G3: Potential kernel growth rate during the linear kernel filling phase",
    "!     (in mg day-1, measured in plants grown under optimum conditions and",
    "!     low plant population density).", "! O1: Maximum kernel oil content (%)",
    "", "", "!             P/G/N:Phenology/Growth/Not used for calibration ",
    "", "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3    O1",
    "!Coeffient #                             1     2     3     4     5     6",
    "!Calibration                             P     P     P     G     G     N",
    "", "999991 MINIMA               . DFAULT 100.0  0.00 300.0  500.  1.50 60.00",
    "999992 MAXIMA               . DFAULT 450.0 15.00 950.0 4000.  3.50 87.00",
    "IB0003 894                  . DFAULT 274.0  9.33 600.0 2800.  1.80 65.00",
    "IB0005 SUNGRO-380           . DFAULT 295.0 12.32 600.0 2800.  1.80 65.00",
    "IB0008 SH-3000              . DFAULT 250.0  2.45 600.0 2800.  1.70 65.00",
    "IB0009 E-353                . DFAULT 245.0  3.74 600.0 1500.  3.35 85.00",
    "IB0011 FLORASOL             . DFAULT 360.0  1.60 600.0 2800.  1.80 65.00",
    "IB0013 SUNGRO-385           . DFAULT 325.0 12.32 600.0 2800.  1.80 65.00",
    "IB0014 SW-101               . DFAULT 210.0  3.74 660.0  520.  2.69 65.00 ",
    "IB0015 S-530                . DFAULT 335.0 12.32 600.0 3700.  2.00 65.00",
    "IB0016 G-100                . DFAULT 309.0  2.99 732.0 2800.  1.80 65.00",
    "IB0017 CONTIFLOR-3          . DFAULT 325.5  0.14 712.0 2900.  1.67 65.00",
    "IB0019 Sungold              . DFAULT 320.0  3.74 600.0 3000.  3.30 65.00",
    "IB0021 Heliasol_RM          . DFAULT 285.0  3.74 850.0 1108.  1.65 65.00",
    "IB0022 Melody               . DFAULT 290.0  3.74 850.0 1500.  3.40 65.00",
    "IB0018 Hysun-33             . DFAULT 435.0  1.00 585.0 1193.  2.33 54.00",
    "IB0029 Hysun-38             . DFAULT 438.0  1.00 570.0 1276.  2.33 56.00",
    "IB0020 Pioneer 64A93        . DFAULT 444.0  1.00 560.0 1260.  2.44 65.00",
    "IB0030 E-353 long           . DFAULT 300.0  3.74 600.0 1500.  3.35 85.00"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SWCER048.CUL")

  c("*SWEET CORN CULTIVAR COEFFICIENTS: SWCER048 MODEL", "!", "! COEFF       DEFINITIONS",
    "! ========    ===========", "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code or this cultivar, points to the Ecotype in the",
    "!             ECO file (currently not used).", "! P1          Thermal time from seedling emergence to the end of the juvenile",
    "!             phase (expressed in degree days above a base temperature of 8\xf8C)",
    "!             during which the plant is not responsive to changes in",
    "!             photoperiod.", "! P2          Extent to which development (expressed as days) is delayed for",
    "!             each hour increase in photoperiod above the longest photoperiod",
    "!             at which development proceeds at a maximum rate (which is",
    "!             considered to be 12.5 hours).", "! P5          Thermal time from silking to physiological maturity (expressed",
    "!             in degree days above a base temperature of 8\xf8C).",
    "! G2          Maximum possible number of kernels per plant.",
    "! G3          Kernel filling rate during the linear grain filling stage and",
    "!             under optimum conditions (mg/day).", "! PHINT       Phylochron interval; the interval in thermal time (degree days)",
    "!             between successive leaf tip appearances.", "!",
    "! su1          Sugary genotypes (earlier cultivars of sweet corn)",
    "! se1          Sugary-enhancer genotypes (increases the sugar level in homozygous su1 germplasm)",
    "! sh2          Shrunken genotypes ('super sweet' cultivars)",
    "!", "!              P/G/N:Phenology/Growth/Not used for calbration",
    "! ", "@VAR#  VRNAME.......... EXPNO   ECO#    P1    P2    P5    G2    G3 PHINT",
    "!Coeffient #                             1     2     3     4     5     6",
    "!Calibration                             P     P     P     G     G     P",
    "", "999991 MINIMA               . DFAULT 150.0 0.300 680.0 600.0  5.50 35.00",
    "999992 MAXIMA               . DFAULT 180.0 0.300 738.0 850.0 15.00 50.00",
    "", "SW0001 GSS0966 sh2          . IB0001 150.0 0.300 680.0 600.0  5.50 43.00",
    "SW0002 Saturn sh2           . IB0001 180.0 0.300 738.0 850.0 15.00 35.00",
    "SW0003 BSS0977 sh2          . IB0001 175.0 0.300 700.0 500.0  5.00 50.00"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "TFAPS048.CUL")

  c("*TEFF CULTIVAR COEFFICIENTS: TFAPS048 MODEL", "!", "!********** NWheat transition Cultivar Coefficient File ***************",
    "!", "! COEFF       DEFINITIONS", "! ========    ===========",
    "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code of this cultivar, points to the Ecotype in the",
    "!", "! VSEN\t      sensitivity to vernalisation", "! PPSEN       sensitivity to photoperiod (keep <= 19.0 for prevent LAI from spiking)",
    "! P1\t        Thermal time from seedling emergence to the end of the juvenile phase",
    "! P5\t        Thermal time (base 0oC) from beginning of grainfill to maturity: range 500 to 700",
    "! PHINT       Phyllochron interval", "! GRNO        Coefficient of 100 kernels per stem weight at the beginning of grain filling [100 kernels (g stem)-1] ",
    "! MXFIL       Potential kernel growth rate [mg kernel-1 day-1]:  Values between 1.0 and 3.0",
    "! STMMX       Potential final dry weight of a single tiller (excluding grain) (g stem-1) values 1.0 - 3.0",
    "! SLAP1       ratio of leaf area to mass at emergence (cm2/g)",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  VSEN PPSEN    P1    P5 PHINT  GRNO MXFIL STMMX SLAP1",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9",
    "!Calibration                             P     P     P     P     P     G     G     G     N",
    "", "999991 MINIMA               . DFAULT  1.00  14.0 100.0 100.0  70.0  16.0  1.00  1.00 400.0",
    "999992 MAXIMA               . DFAULT  1.00  19.0 100.0 700.0 120.0  36.0  1.80  3.00 400.0",
    "", "IB0135 Keyh (local)         . IB0004  1.00  18.0 100.0 600.0 110.0  16.0  1.00  3.00 400.0",
    "IB0136 DZ-974 & Keyh        . IB0004  1.00  18.0 100.0 500.0 105.0  16.0  1.00  1.00 400.0",
    "IB0157 DZ-Cr-387            . IB0004  1.00  18.0 100.0 100.0 120.0  32.0  1.30  3.00 400.0",
    "IB0161 DZ-01-354            . IB0004  1.00  18.0 100.0 550.0 100.0  16.0  1.00  3.00 400.0",
    "IB0221 UK Brown             . IB0004  1.00  16.5 100.0 450.0 100.0  16.0  1.00  1.00 400.0",
    "IB0244 PI 193508            . IB0004  1.00  19.0 100.0 200.0 100.0  28.0  1.10  1.00 400.0",
    "IB0245 PI 193514            . IB0004  1.00  19.0 100.0 200.0 105.0  16.0  1.00  1.00 400.0",
    "IB0246 PI 557457            . IB0004  1.00  17.0 100.0 600.0  75.0  16.0  1.00  1.00 400.0",
    "IB0247 PI 494366            . IB0004  1.00  14.0 100.0 700.0  70.0  16.0  1.00  1.00 400.0",
    "IB0248 UK White             . IB0004  1.00  18.0 100.0 450.0  85.0  16.0  1.00  1.00 400.0",
    "IB0249 PI 494465            . IB0004  1.00  19.0 100.0 140.0 120.0  16.0  1.00  1.00 400.0",
    "IB0250 PI 273889            . IB0004  1.00  19.0 100.0 190.0 105.0  27.0  1.00  1.00 400.0",
    "IB0251 Dessie               . IB0004  1.00  16.5 100.0 500.0  80.0  32.0  1.20  1.00 400.0",
    "IB0252 PI 347632            . IB0004  1.00  19.0 100.0 190.0 105.0  32.0  1.80  1.00 400.0",
    "IB0253 PI 494432            . IB0004  1.00  15.5 100.0 500.0 100.0  26.0  1.00  1.00 400.0",
    "", "IB0254 PI 195932            . IB0004  1.00  19.0 100.0 200.0 105.0  16.0  1.00  1.00 400.0",
    "IB0255 PI 329680            . IB0004  1.00  19.0 100.0 200.0 105.0  16.0  1.00  1.00 400.0",
    "IB0256 PI 494479            . IB0004  1.00  19.0 100.0 200.0 105.0  16.0  1.00  1.00 400.0",
    "IB0257 PI 494433            . IB0004  1.00  19.0 100.0 140.0 120.0  16.0  1.00  1.00 400.0",
    "", "IB0304 Wajera (local)       . IB0004  1.00  18.0 100.0 200.0 80.00  36.0  1.00  3.00 400.0"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "TFCER048.CUL")

  c("*TEFF GENOTYPE COEFFICIENTS: TFCER048 MODEL", "!", "! COEFF    DEFINITIONS",
    "! ======== ===========", "! VAR#     Identification code or number for a specific cultivar.",
    "! VAR-NAME Name of cultivar.", "! EXPNO    Number of experiments used to estimate cultivar parameters",
    "! ECO#     Ecotype code for this cultivar points to the Ecotype in the ECO",
    "!          file (currently not used).", "", "! P1       Time period (expressed as growing degree days [GDD] in oC-d above a",
    "!          base temperature of 9oC) from seedling emergence during which the",
    "!          teff plant is not responsive to changes in photoperiod. This period",
    "!          is also referred to as the basic vegetative phase of the plant.",
    "!          Range: 150-800 oC-d. ", "!          Calibration: flexible, compare with observed panicle initiation ",
    "!          and flowering dates.", "", "! P2O      Critical photoperiod or the longest day length (in hours) at",
    "!          which the development occurs at a maximum rate. At values higher",
    "!          than P2O developmental rate is slowed, hence there is delay due",
    "!          to longer day lengths. ", "!          Range 11-13 h. Default 12 h. ",
    "!          Calibration: Do not go below 11 unless data are available. ",
    "", "! P2R      Extent to which phasic development leading to panicle initiation",
    "!          is delayed (expressed as GDD in oC-d) for each hour increase in",
    "!          photoperiod above P2O. ", "!          Range 5-300 oC-d. ",
    "!          Calibration: Modern teff varieties will have values in ",
    "!          the lower range.", "", "! P5       Time period in GDD oC-d) from beginning of grain filling (3 to",
    "!          4 days after flowering) to physiological maturity with a base",
    "!          temperature of 9oC. ", "!          Range 150-850 oC-d. ",
    "!          Calibration: Ensure P1, P2O and P2R are correctly calibrated for ",
    "!          anthesis data. Then calibrate P5 for observed maturity date.",
    "", "! G1       Potential spikelet number coefficient as estimated from the",
    "!          number of spikelets per g of main culm dry weight (less leaf",
    "!          blades and sheaths plus spikes) at anthesis. ", "!          Range 50-75 #/g. A typical value is 55 #/g.",
    "", "! G2       Single grain weight (g) under ideal growing conditions, i.e.",
    "!          nonlimiting light, water, nutrients, and absence of pests",
    "!          and diseases.", "!          Range 0.015-0.030 g. Default 0.025 g.",
    "!          Calibration: Very low flexibility. ", "", "! G3       Tillering coefficient (scalar value) relative to IR64 cultivar",
    "!          under ideal conditions. ", "!          Range 0.7-1.3.",
    "!          Calibration: A higher tillering cultivar would have a coefficient ",
    "!          greater than 1.0.", "", "! PHINT    Phyllochron Interval (oC-d). Time interval in degree-days for each ",
    "!          leaf-tip to appear under non-stressed conditions.  ",
    "!          Range 55-90 oC-d. Default 83 oC-d.", "!          Calibration: Recommend to not change unless field data on leaf ",
    "!          numbers are available.", "", "! THOT     Temperature (oC) above which spikelet sterility is affected by ",
    "!          high temperature.  ", "!          Range 25-34 oC. Default 28oC. ",
    "!          Calibration: recommended to not change unless hot environment",
    "!          data are available. Convert old cultivars THOT = 28./G4.",
    "", "! TCLDP    Temperature (oC) below which panicle initiation is further delayed ",
    "!          (other than P1, P2O and P2R) by low temperature.",
    "!          Range 12-18 oC. Default 15oC. ", "!          Calibration: recommended to not change unless cold environment",
    "!          data are available. Convert old cultivars TCLDP = 15.*G5.",
    "", "! TCLDF    Temperature (oC) below which spikelet sterility is affected by ",
    "!          low temperature.", "!          Range 10-20 oC. Default 15oC. ",
    "!          Calibration: recommended to not change unless cold environment",
    "!          data are available. Convert old cultivars TCLDF = 15.*G5.",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    P1   P2R    P5   P2O    G1    G2    G3 PHINT  THOT TCLDP TCLDF  !    previous",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11  !    G4    G5  ",
    "!Calibration                             P     P     P     P     G     G     G     N     G     N     N",
    "", "999991 MINIMA               . DFAULT 100.0   5.0 150.0  11.0  50.0 .0002  0.70  50.0  25.0   9.0   9.0",
    "999992 MAXIMA               . DFAULT 880.0 300.0 850.0  14.0 9999. .0300  1.50  90.0  34.0  18.0  20.0",
    "", "IB0304 Wajera(local)        . IB0001 135.0  50.0 265.0  13.0  9800 .0003  1.30  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0306 Buseye               . IB0001 135.0  50.0 255.0  13.0  9800 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0135 Keyh (local)         . IB0001 140.0  50.0 260.0  13.0  9500 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0136 DZ-974 & Keyh        . IB0001 140.0  50.0 260.0  13.0  9500 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0156 DZ-Cr-387            . IB0001 140.0  50.0 285.0  12.0  9500 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0157 DZ-Cr-387            . IB0001 140.0  50.0 260.0  13.0  9500 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0158 DZ-Cr-387            . IB0001 190.0  50.0 250.0  13.0  9500 .0003  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0161 DZ-01-354            . IB0001 120.0  50.0 250.0  14.0  9990 .0003  1.30  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0162 DZ-01-354            . IB0001 105.0  50.0 270.0  13.0  9990 .0003  1.10  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0163 DZ-Cr-37             . IB0001 165.0  50.0 240.0  13.0  9990 .0003  1.10  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0164 DZ-Cr-3186           . IB0001 145.0  50.0 250.0  13.0  9990 .0003  1.10  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0221 UK Brown             . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0244 PI 193508            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0245 PI 193514            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0246 PI 557457            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0247 PI 494366            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0248 UK White             . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0249 PI 494465            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0250 PI 273889            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0251 Dessie               . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0252 PI 347632            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0253 PI 494432            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0254 PI 195932            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0255 PI 329680            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0256 PI 494479            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0257 PI 494433            . IB0001 140.0  50.0 260.0  13.0  9500 .0030  1.00  50.0  28.0  10.0  10.0  !  1.00   1.0",
    "IB0166 DZ-01-354            . IB0001 281.5 237.2 211.0 12.57 7561. 0.001 0.824 50.00 27.51 10.00 10.00  !  1.00   1.0",
    "IB0167 DZ-01-354            . IB0001 115.6 37.79 614.5 11.62 8720. 0.022 1.295 50.00 25.49 10.00 10.00  !  1.00   1.0"
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "TMGRO048.CUL")

  c("*TOMATO CULTIVAR COEFFICIENTS: CRGRO08 MODEL", "!", "! PARAM   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! FL-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! FL-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! FL-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Threshing percentage. The maximum ratio of (seed/(seed+shell))",
    "!         at maturity. Causes seed to stop growing as their dry weight",
    "!         increases until the shells are filled in a cohort.",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     P     P     P     P     N     N     N     G     G     P     G     P     N     N     N",
    "", "999991 MINIMA               . DFAULT 12.33  0.00  24.4   2.2  19.0 45.00 47.00  1.36  300. 300.0  0.73 .0040  26.0 300.0  54.0   8.5  .300  .050",
    "999992 MAXIMA               . DFAULT 12.33  0.00  31.0   4.6  21.0 47.00 52.00  1.36  300. 300.0  0.78 .0040  27.0 300.0  58.0   8.5  .300  .050",
    "", "TM0001 Florida 47 2010 Cal  . TM0001 12.33  0.00  24.4   2.2  19.0 45.20 52.00  1.36  300. 300.0  0.78 .0040  26.0 300.0  55.0   8.5  .300  .050",
    "TM0002 Solarset 2010 Cal    . TM0001 12.33  0.00  31.0   4.6  21.0 47.00 47.00  1.36  300. 300.0  0.78 .0040  27.0 300.0  56.0   8.5  .300  .050",
    "TM0005 Agriset 761 10' Cal  . TM0001 12.33  0.00  24.4   2.2  19.0 45.20 52.00  1.36  300. 300.0  0.78 .0040  26.0 300.0  54.0   8.5  .300  .050",
    "TM0007 Sunny S-D 2010 Cal   . TM0001 12.33  0.00  24.4   3.0  19.0 45.20 52.00  1.36  300. 300.0  0.73 .0040  26.0 300.0  58.0   8.5  .300  .050"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "TNARO048.CUL")

  c("*TANIER GENOTYPE COEFFICIENTS: TRARO048 MODEL", "!", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT PCGRD",
    "!Coeffient #                             1     2     3     4     5     5     6     7     8     9",
    "!Calibration                             P     P     P     P     P     P     N     N     G     G",
    "", "999991 MINIMA               . DFAULT  1400  1200   400   600  1.00  1.00  1.00 150.0 122.0  0.00",
    "999992 MAXIMA               . DFAULT  1600  3000  1000  1850  1.00  1.50  1.00 150.0 150.0  2.03",
    "", "IB0005 KELLY                .    -99  1500  1200   400   600  1.00  1.50  1.00 150.0 150.0  0.00",
    "IB0006 BLANCA               .    -99  1540  1500   900  1850  1.00  1.00  1.00 150.0 122.0  1.75",
    "IB0007 MORANDA              .    -99  1440  3000  1000  1000  1.00  1.00  1.00 150.0 120.0  2.03",
    "", "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "TRARO048.CUL")

  c("*TARO CULTIVAR COEFFICIENTS: TRARO048 MODEL", "!", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VAR-NAME........ EXPNO   ECO#    P1    P3    P4    P5    G2    G3    G4 PHINT PCINT  PCGRD",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10",
    "!Calibration                             P     P     P     P     G     G     G     N     N     N",
    "", "999991 MINIMA               . DFAULT   700   900   600   700  1.00  1.00  1.00 150.0 120.0  1.00",
    "999992 MAXIMA               . DFAULT  1200  1500  1600  1000  2.00  1.30  1.50 150.0 120.0  1.00",
    "", "IB0001 LEHUA                . IB0001   800  1130   940   980  1.00  1.00  1.00 150.0 120.0  1.00",
    "IB0002 BUN LONG             . IB0001   700   900  1600   800  1.00  1.30  1.50 150.0 120.0  1.00",
    "IB0003 SAMOA HYBRID         . IB0001  1200  1000   900   700  1.00  1.00  1.00 150.0 120.0  1.00",
    "IB0004 TAUSALA-SAMOA        . IB0001  1200  1000   900   700  1.00  1.00  1.00 150.0 120.0  1.00",
    "IB0008 BLANCA               . IB0001  1200  1500   600   900  1.00  0.85  1.00 150.0 120.0  1.00",
    "IB0009 LILA                 . IB0001  1200   900  1300  1000  1.00  1.30  1.00 150.0 120.0  1.00",
    "IB0010 LEHUA-MAUI           . IB0001  1150  1200  1050   900  2.50  0.65  1.10 150.0 120.0  1.00",
    "                                                                     "
    ) |>
  write(input_file)

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

  `v_fmt_expected` = c("VAR#" = "%-7s", `VRNAME` = "%-16s", EXPNO = "%6s",
                       "ECO#" = "%7s", CSDL = "%6.2f", PPSEN = "%6.4f",
                       "EM-FL" = "%6.2f", "FL-SH" = "%6.2f",
                       "FL-SD" = "%6.2f", "SD-PM" = "%6.2f",
                       "FL-LF" = "%6.2f", LFMAX = "%6.3f", SLAVR = "%6.1f",
                       SIZLF = "%6.2f", XFRT = "%6.2f", WTPSD = "%6.4f",
                       SFDUR = "%6.2f", SDPDV = "%6.2f", PODUR = "%6.1f",
                       THRSH = "%6.1f", SDPRO = "%6.3f", SDLIP = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "VBGRO048.CUL")

  c("*VELVETBEAN CULTIVAR COEFFICIENTS: CRGRO048 MODEL", "!", "! COEFF   DEFINITIONS",
    "! =====   ===========", "! EXPNO   Number of experiments used to estimate cultivar parameters",
    "! ECO#    Code for the ecotype to which this cultivar belongs (see *.eco file)",
    "! CSDL    Critical Short Day Length below which reproductive development",
    "!         progresses with no daylength effect (for shortday plants) (hour)",
    "! PPSEN   Slope of the relative response of development to photoperiod with time",
    "!         (positive for shortday plants) (1/hour)", "! EM-FL   Time between plant emergence and flower appearance (R1)",
    "!         (photothermal days)", "! Fl-SH   Time between first flower and first pod (R3) (photothermal days)",
    "! Fl-SD   Time between first flower and first seed (R5) (photothermal days)",
    "! SD-PM   Time between first seed (R5) and physiological maturity (R7)",
    "!         (photothermal days)", "! Fl-LF   Time between first flower (R1) and end of leaf expansion",
    "!         (photothermal days)", "! LFMAX   Maximum leaf photosynthesis rate at 30 C, 350 vpm CO2, and high light",
    "!         (mg CO2/m2-s)", "! SLAVR   Specific leaf area of cultivar under standard growth conditions",
    "!         (cm2/g)", "! SIZLF   Maximum size of full leaf (three leaflets) (cm2)",
    "! XFRT    Maximum fraction of daily growth that is partitioned to seed + shell",
    "! WTPSD   Maximum weight per seed (g)", "! SFDUR   Seed filling duration for pod cohort at standard growth conditions",
    "!         (photothermal days)", "! SDPDV   Average seed per pod under standard growing conditions (#/pod)",
    "! PODUR   Time required for cultivar to reach final pod load under optimal",
    "!         conditions (photothermal days)", "! THRSH   Threshing percentage. The maximum ratio of (seed/(seed+shell))at",
    "!         maturity. Causes seed to stop growing as their dry weight",
    "!         increases until shells are filled in a cohort.", "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "@VAR#  VRNAME.......... EXPNO   ECO#  CSDL PPSEN EM-FL FL-SH FL-SD SD-PM FL-LF LFMAX SLAVR SIZLF  XFRT WTPSD SFDUR SDPDV PODUR THRSH SDPRO SDLIP",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "!Calibration                             P     P     P     P     P     P     P     G     G     G     N     G     P     G     P     G     G     G",
    "", "999991 MINIMA               . 999991 12.00 .6000 30.00 5.000 10.00 40.00 15.00 1.030 400.0 200.0 1.000 .7000 20.00 4.500 20.00  70.0  .265  .043",
    "999992 MAXIMA               . 999992 12.00 .6000 90.00 6.000 15.00 80.00 15.00 1.030 500.0 500.0 1.000 1.100 22.00 5.000 20.00  70.0  .265  .043",
    "", "CC0001 Georgia              . VB0002 12.00 .6000 30.00 5.000 10.00 60.00 15.00 1.030 400.0 235.0 1.000 .7000 20.00 5.000 20.00  70.0  .265  .043",
    "CC0002 Rayada               . VB0001 12.00 .6000 60.00 6.000 13.00 70.00 15.00 1.030 400.0 325.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CC0003 Tlaltizapan        2,3 VB0001 12.00 .3864 59.07 6.000 13.00 44.95 15.00 1.030 450.0 500.0 1.000 .9000 22.00 4.800 20.00  70.0  .265  .043",
    "CC0004 Honduras             . VB0001 12.00 .6000 85.00 6.000 13.00 70.00 15.00 1.030 450.0 400.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CC0005 Ghana                . VB0001 12.00 .6000 85.00 6.000 13.00 70.00 15.00 1.030 400.0 485.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CC0006 Br.IITABenin         . VB0001 12.00 .6000 85.00 6.000 13.00 70.00 15.00 1.030 400.0 400.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CC0007 Litoral Atlant       . VB0001 12.00 .6000 85.00 6.000 13.00 70.00 15.00 1.030 400.0 400.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CC0008 CIAT 9394            . VB0001 12.00 .6000 85.00 6.000 13.00 70.00 15.00 1.030 400.0 400.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "", "", "!Cc0003 Tlaltizapan originates from CIMMYTExp.StationTlaltizapan but data first came from CIAT trial so cc in stead of ci",
    "", "CI0003 Veracruz Mottle      . VB0001 12.00 .6000 62.00 6.000 13.00 70.00 15.00 1.000 455.0 540.0 1.000 .9000 22.00 4.800 20.00  70.0  .265  .043",
    "CI0004 Veracruz Black     2,4 VB0001 12.00 .6595 57.92 6.000 15.00 55.49 15.00 1.000 500.0 400.0 1.000 1.100 22.00 4.500 20.00  70.0  .265  .043",
    "CI0005 Veracruz White     2,3 VB0001 12.00 .6241 55.77 6.000 13.00 60.00 15.00 1.000 500.0 500.0 1.000 1.100 22.00 4.800 20.00  70.0  .265  .043",
    "", "CI0006 Malawi Black         . VB0002 12.00 .6000 30.00 5.000 10.00 65.00 15.00 1.030 270.0 400.0 1.000 .9000 20.00 5.000 20.00  70.0  .265  .043",
    "CI0007 Zim.BlackMottle      . VB0002 12.00 .6000 45.00 6.000 13.00 65.15 15.00 1.030 400.0 400.0 1.000 .9000 20.00 5.000 20.00  70.0  .265  .043",
    "", "CI0008 Tamulte              . VB0001 12.00 .6000 62.00 6.000 13.00 80.00 15.00 1.030 455.0 545.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CI0009 Frailesca            . VB0001 12.00 .6000 60.00 6.000 13.00 80.00 15.00 1.030 455.0 400.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CI0010 Braziljaspeada       . VB0001 12.00 .6000 58.00 6.000 13.00 80.00 15.00 1.030 455.0 500.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CI0011 Brazil               . VB0001 12.00 .6000 58.00 6.000 13.00 80.00 15.00 1.030 455.0 500.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CI0012 Cochinensis          . VB0001 12.00 .6000 58.00 6.000 13.00 80.00 15.00 1.030 455.0 500.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "CI0013 Africa Utilis        . VB0001 12.00 .6000 58.00 6.000 13.00 80.00 15.00 1.030 455.0 500.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043",
    "!all oblong", "IT0002 IRZ                  . VB0001 12.00 .6000 58.00 6.000 13.00 80.00 15.00 1.030 455.0 500.0 1.000 .9000 22.00 4.500 20.00  70.0  .265  .043"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "WHAPS048.CUL")

  c("*WHEAT CULTIVAR COEFFICIENTS: WHAPS048 MODEL", "!", "!********** NWheat transition Cultivar Coefficient File ***************",
    "!", "!(Comments Here)", "!", "! COEFF       DEFINITIONS", "! ========    ===========",
    "! VAR#        Identification code or number for a specific cultivar",
    "! VAR-NAME    Name of cultivar", "! EXPNO       Number of experiments used to estimate cultivar parameters",
    "! ECO#        Ecotype code of this cultivar, points to the Ecotype in the ECO file.",
    "!", "! VSEN\t      sensitivity to vernalisation", "! PPSEN       sensitivity to photoperiod",
    "! P1\t        Thermal time from seedling emergence to the end of the juvenile phase",
    "! P5\t        Thermal time (base 0oC) from beginning of grainfill to maturity: range 500 to 700",
    "! PHINT       Phyllochron interval", "! GRNO        Coefficient of kernel number per stem weight at the beginning of grain filling [kernels (g stem)-1] ",
    "! MXFIL       Potential kernel growth rate [mg kernel-1 day-1]:  Values between 1.0 and 3.0",
    "! STMMX       Potential final dry weight of a single tiller (excluding grain) (g stem-1) values 1.0 - 3.0",
    "! SLAP1       ratio of leaf area to mass at emergence (cm2/g)",
    "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t   *\t *     *\t\t\t\t   *     *                                                                                                                  ",
    "@VAR#  VRNAME.......... EXPNO   ECO#  VSEN PPSEN    P1    P5 PHINT  GRNO MXFIL STMMX SLAP1",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9",
    "!Calibration                             P     P     P     P     P     G     G     G     G",
    "", "999991 MINIMA               . 999991  0.00  1.20 380.0 200.0  85.0  20.0  1.60  1.00 200.0",
    "999992 MAXIMA               . 999992  4.00  4.50 530.0 700.0 130.0  32.0  2.90  3.00 400.0",
    "", "AW0071 YECORA ROJO          . IB0002  1.00  1.20 400.0 600.0 120.0  24.0  1.90  3.00 300.0",
    "IB0001 YECORA               . IB0001  1.00  1.20 400.0 600.0 120.0  24.0  1.90  3.00 400.0",
    "IB0002 ARMINDA              . IB0006  4.00  4.50 400.0 640.0 100.0  32.0  2.50  3.00 280.0",
    "IB0003 Lely                 . IB0005  4.00  4.50 400.0 640.0 100.0  32.0  2.50  1.00 280.0",
    "IB0004 RONGOTEA             . IB0002  1.00  2.00 400.0 600.0 130.0  20.0  1.60  3.00 300.0",
    "AW0005 Bacanora 88          . IB0003  1.90  1.50 400.0 700.0 120.0  25.5  2.40  3.00 300.0",
    "AW0006 Nesser               . IB0003  1.40  1.50 400.0 660.0 120.0  24.0  2.40  3.00 300.0",
    "SP0007 Spear                . IB0004  1.50  3.50 400.0 740.0 110.0  24.0  2.10  3.00 300.0",
    "WI0008 Wilgoyne             . IB0004  1.40  1.60 400.0 680.0 100.0  22.0  1.90  3.00 300.0",
    "IB0010 Gamenya              . IB0002  1.60  2.00 400.0 700.0 110.0  22.0  1.90  1.50 280.0",
    "IB0012 Recital              . IB0008  4.00  3.50 380.0 580.0  85.0  32.0  1.90  3.00 280.0",
    "IB0013 Yitpi                . IB0007  1.50  2.90 400.0 680.0 105.0  22.0  1.90  3.00 300.0",
    "", "!Three cultivars existing in CERES-Wheat added to NWheat by Yujing 05/05/2017",
    "IB1500 MANITOU           1,14 DFAULT  0.66  4.23 330.0 277.0  86.0 30.67  1.47  1.28 280.0",
    "IB0488 NEWTON             1,6 DFAULT  3.69  3.17 520.0 457.0  95.0 33.33  1.91  1.03 280.0",
    "IB1015 MARIS FUNDIN       1,8 DFAULT  2.46  3.51 530.0 472.0 100.0  20.0  2.81  1.64 300.0"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "WHCER048.CUL")

  c("$CULTIVARS:WHCER048.20200721   Last edit: 20210-05-06 GH",
    "", "! Coefficients used in the Cropsim-Ceres model differ from those used",
    "! in DSSAT Versions 3.5 and 4.0. They can be calculated (approximately) from ",
    "! V3.5 coefficients as follows:", "", "! P1V   = P1V(v3.5)*10 ",
    "! P1D   = P1D(V3.5)*20", "! P5    = P5(V3.5)*20 + 430", "! G1    = G1(V3.5)*5 + 5",
    "! G2    = (G2(V3.5)*0.35+0.65) * P5/20", "! G3    = G3(V3.5)*0.7 ",
    "! PHINT = PHINT(V3.5)", "", "! Converted coefficients,and those listed below,should always be",
    "! tested by using them with real experiments and comparing model ",
    "! outputs with measured values. ", "!", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "*CULTIVARS:WHCER048", "@VAR#  VAR-NAME........  EXP#   ECO#   P1V   P1D    P5    G1    G2    G3 PHINT",
    "!Coeffient #                             1     2     3     4     5     6     7",
    "!Calibration                             P     P     P     G     G     G     N",
    "!                                     Vday %/10h  oC.d   #/g    mg     g  oC.d",
    "999991 MINIMA               . 999991     0     0   100    10    10   0.5    30",
    "999992 MAXIMA               . 999992    60   200   999    50    80   8.0   150",
    "                                                                            ",
    "DFAULT DEFAULT              . DFAULT     5    75   450    30    35   1.0    60",
    "", "IB1500 MANITOU           1,14 CAWH01     8   100   320    23    23   2.5    86 ",
    "IB0488 NEWTON             1,6 USWH01    45    75   500    25    30   2.0    95  ",
    "IB1015 MARIS FUNDIN       1,8 UKWH01    30    83   515    15    44   3.2   100",
    "", "AW0071 Yecora_Rojo      16,33 AZWH18    10  40.0   450    20    60  1.50    95",
    "CI0001 Yecora_Rojo        1,2 CI0001    02    40   570    27    45   4.0   100 ",
    "", "KZ0001 North KAZAK1           DFAULT    10   120   670    16    42   2.0    90",
    "", "TX0001 TAMU112              . TXWH01    10  68.0   450    30    30   1.0    30",
    "990015 Hartog_KY          1,4 TWKG01    20    94   700    22    39   1.0   120",
    "                                                                                                                                                                                                             ",
    "! COEFF       DEFINITION", "! ========    ==========", "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.", "! EXP#        Number of experiments used to generate parameters",
    "! ECO#        Ecotype code for this cultivar,points to entry in ECO file",
    "! P1V         Days,optimum vernalizing temperature,required for vernalization",
    "! P1D         Photoperiod response (% reduction in rate/10 h drop in pp)",
    "! P5          Grain filling (excluding lag) phase duration (oC.d)",
    "! G1          Kernel number per unit canopy weight at anthesis (#/g)",
    "! G2          Standard kernel size under optimum conditions (mg)",
    "! G3          Standard,non-stressed mature tiller wt (incl grain) (g dwt)",
    "! PHINT       Interval between successive leaf tip appearances (oC.d)",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "WHCRP048.CUL")

  c("$CULTIVARS:WHCRP048.20200721   Last edit: 2021-05-06 GH",
    "", "! Coefficients used in the Cropsim model differ from those used in",
    "! earlier DSSAT wheat/barley models. They can be calculated",
    "! (approximately) from V3.5 coefficients as follows:", "! VREQ  = P1V(v3.5)*10",
    "! VBASE = 0.0          ", "! VEFF  = MAX(0.0,1.0-P1V(V3.5)*10/50)",
    "! PPS1  = P1D(V3.5)*20", "! PPS2  = 0.0", "! P1    = PHINT(V3.5)*4.2",
    "! P2    = PHINT(V3.5)*3*0.3   (V3.5P2*0.3)", "! P3    = PHINT(V3.5)*3*0.7   (V3.5P2*0.7)",
    "! P4    = PHINT(V3.5)*2       (V3.5P3)", "! P5    = 80", "! P6    = 0",
    "! P7    = 120", "! P8    = P5(V3.5)*20 + 430", "! G#WTS  = G1(V3.5)*5 + 5",
    "! GWTS  = (G2(V3.5)*0.35+0.65) * P5/20", "! SHWTS = G3(V3.5)*0.7",
    "! PHINT = PHINT(V3.5)", "", "! Converted coefficients,and those listed below,should always be",
    "! tested by using them with real experiments and comparing model",
    "! outputs with measured values. Users should also be aware that",
    "! some of the coefficients (eg.PHINT) may vary from region to",
    "! region,and perhaps even from sowing date to sowing date,reflecting",
    "! the current incomplete understanding of the environmental physiology",
    "! of wheat and other cereals.", "", "!             P/G/N:Phenology/Growth/Not used for calbration",
    "!", "", "*CULTIVARS:WHCRP048", "!                                     --------- PHENOLOGY (PHASE DURATIONS) -------- -------- P.MODIFIERS -------- -- LEAF PRODN.& SIZE -- SHOOT -- GRAIN --             ",
    "@VAR#  VAR-NAME........  EXP#   ECO#    P1    P2    P3    P4    P5    P6    P7    P8  VREQ VBASE  VEFF  PPS1  PPS2 PHINT  LA1S  LAFV  LAFR SHWTS G#WTS  GWTS",
    "!Coeffient #                             1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20",
    "!Calibration                             P     P     P     P     P     P     P     P     P     P     P     P     P     P     G     G     G     G     G     G",
    "!                                     oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  oC.d  Vday  Vday    fr %/10h %/10h  oC.d m2/m2 fr/lf fr/lf     g   #/g    mg      ",
    "999991 MINIMA               . 999991   100    60   100    50    50    10    50   100     0     0     0     0     0    40   0.1  0.01  0.01   0.5    10    10",
    "999992 MAXIMA               . 999992   800   100   300   500   400   100   300   800    60    30   1.0   300   200   120  10.0  5.00  5.00   5.0    50    75",
    "                                                                                                                                                                ",
    "DFAULT DEFAULTS             . DFAULT   380    70   200   200    60    25   150   500     0     0     0     0     0    80   3.0  0.10  0.50   2.5    25    40",
    "                                                                                                                                                            ",
    "IB1500 MANITOU            1,2 CA0001   400    65   193   172    50    20   130   220     1     0   0.5    80     0    86   2.0  0.25  0.30   3.0    28    23",
    "IB0488 NEWTON             1,6 US0001   400    71   214   190    50    20   130   370    25     0   1.0    75     0    95   2.0  0.25 -0.10   3.2    22    30",
    "IB1015 MARIS FUNDIN       1,8 UK0001   400    75   200   200    50    20   130   370    27     0  0.45    83     0   100   2.0  0.25  0.30   3.2    14    42",
    "IB0034 AVALON 0.5VEFF     1,6 UK0001   296    75   225   200   100    20   130   450    27     0   0.5    83     0   115   2.0  0.10  0.30   3.2    15    44",
    "AW0071 Yecora_Rojo 2      1,5 CI0001   200    55   140   270   145    25   160 517.1 .0187     0   0.3  90.0     0    90   3.0  0.10  0.50   3.0  12.5    55",
    "                                                                                                                                                            ",
    "CI0001 Yecora_Rojo        1,2 CI0001   400    65   190   180    50    25   160   570    02     0   0.3    40     0   100  10.0  0.30  0.40   4.0    27    45",
    "", "! COEFF       DEFINITION", "! ========    ==========", "! ECO#        Ecotype code for this cultivar, points to entry in the ECO file",
    "! EXP#        Number of experiments,treatments used to estimate coefficients",
    "! G#WTS       Standard grain number per unit canopy weight at anthesis (#/g)",
    "! GWTS        Standard grain size,optimum conditions,normal plant density (mg)",
    "! LA1S        Area of standard first leaf (cm2)", "! LAFV        Increase in potential area of leaves,vegetative phase (fr/leaf)",
    "! LAFR        Increase in potential area of leaves,reproductive phase (fr/leaf)",
    "! Pn          Duration of phase n where n is phase number (PVoC.D) BUT P3 and",
    "!             P4 are 'dummy' values inserted to set the total duration of the ",
    "!             P3+P4 phase. The actual balance between P3 and P4 is determined ",
    "!             internally depending on the leaf number at the end of phase 1. ",
    "! PPSn *      Photoperiod sensitivity,phase(n). % drop in rate,10h pp.change.",
    "! PHINT       Interval between successive leaf appearances. (oC.d)",
    "! SHWTS       Standard,non-stressed shoot dry weight (incl.grain),maturity (g)",
    "! SLAS        Specific leaf area,standard (cm2/g)                                                                                   ",
    "! VAR#        Identification code or number for the specific cultivar.",
    "! VAR-NAME    Name of cultivar.", "! VREQ        Vernalization required for max.development rate (VDays)",
    "! VBASE       Vernalization requirement before any effect (VDays)",
    "! VEFF        Vernalization effect (Rate reduction when unvernalized (fr)",
    "", "! *  The programme has been written to read sensitivity for all phases so that",
    "!    additional columns for later phases could be added if desired.",
    "") |>
  write(input_file)

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
# if(FALSE){
  # library(tidyverse)
  #
  # create_read_cul_test <- function(file_name, expected){
  #
  #   name_root <- gsub("\\.CUL", "", file_name)
  #
  #   # expected_name <- gsub("\\.ECO", "_ECO.R", file_name)
  #
  #   v_fmt <- DSSAT:::create_test_arg("v_fmt_expected",
  #                                    attr(expected, "v_fmt"))
  #
  #   tier_info <- DSSAT:::create_test_arg("tier_info_expected",
  #                                        attr(expected, "tier_info"))
  #
  #   test_cols_check_call <- DSSAT:::create_call_test_cols_check("actual", expected)
  #
  #   test_out <- c(paste0("test_that(\"read_cul() ", file_name, "\", {"),
  #                 "",
  #                 v_fmt,
  #                 "",
  #                 tier_info,
  #                 "",
  #                 paste0("  input_file <- system.file(\"tinytest/test_data/CUL/", file_name, "\","),
  #                 "                            package = \"DSSAT\")",
  #                 "",
  #                 "  actual <- DSSAT::read_cul(input_file)",
  #                 "",
  #                 paste0("  ", test_cols_check_call),
  #                 "",
  #                 "  expect_equal(attr(actual, \"v_fmt\"), v_fmt_expected)",
  #                 "",
  #                 "  expect_equal(attr(actual, \"tier_info\"), tier_info_expected)",
  #                 "",
  #                 "})",
  #                 "")
  #
  #   return(test_out)
  # }

  # all_cul <- list.files("inst/tinytest/test_data/CUL/", full.names = TRUE) %>%
  #   tibble(file_name = .) %>%
  #   mutate(contents = map(file_name, DSSAT::read_cul))

  # # Create inputs for tests
  # all_cul %>%
  #   pmap(\(file_name, contents, new_file) dput(contents, new_file))
  #
  # Create the test code for each file
  # all_cul %>%
  #   mutate(file_name = basename(file_name)) %>%
  #   select(file_name, contents) %>%
  #   pmap(\(file_name, contents)
  #        create_read_cul_test(file_name, contents)) %>%
  #   unlist() %>%
  #   clipr::write_clip()

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

# }

library(tinytest)

compare <- function(x,y){
  df <- cbind(x, y) |>
    `colnames<-`(c("x", "y")) |>
    as.data.frame()
  with(df, df[x != y,]) |>
    `colnames<-`(c("actual", "expected"))
}

# "read_eco() ALFRM048.ECO"

  `v_fmt_expected` = c("ECO#" = "%-7s", ECONAME = "%-18s",
                       MG = "%2.0f", TM = "%3.0f", THVAR = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "ALFRM048.ECO")

  c("*ALFALFA ECOTYPE COEFFICIENTS: PRFRM048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "! RDRMT  Relative dormancy sensitivity of this cultivar to daylength - partitioning (0-1)",
    "! RDRMG  Relative dormancy sensitivity of this cultivar to daylength - photosynthesis (0-1)",
    "! RDRMM  Relative dormancy sensitivity of this cultivar to daylength - mobilization (0-1)",
    "! RCHDP  Relative cold hardening potential (0-1)",
    "!",
    "! KJB 5/16 SET TRIFL FROM .15 TO 0.20, possibly drive TRIFOL with small change per FD, because CUF101 goes faster on node number?",
    "! KJB 8/22/19 to 9/27/19 set RDRMT to increment by 60 units per FD class calibrated Rugged, Cisco, CUF101 on 8/22, Apica and Oneida on 9/27",
    "! Note:  with this idea, CUF101 should really go from 140 to 080 (may be fine), and Aragon should be 260 (not sure that will work, already predicts high)",
    "! Note:  Apica FD4 should have RDRMT=.440, but model fails (not really from this function, but related to zero leaf in winter and 16% N in leaf in winter",
    "! so I kept RDRMT = 0.421)",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    17    18    19    20    21    22    23",
    "G00001 Aragon FD7        00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.25   1.0   1.0  .000   0.0  .000 0.421 1.000 0.850 1.000",
    "G00002 Rugged FD3        00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.21   1.0   1.0  .000   0.0  .000 0.500 1.000 0.850 1.000",
    "G00003 Cisco II FD6      00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.24   1.0   1.0  .000   0.0  .000 0.320 1.000 0.850 1.000",
    "G00004 CUF101 FD9        00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.27   1.0   1.0  .000   0.0  .000 0.140 1.000 0.850 1.000",
    "G00005 Aragon            00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.25   1.0   1.0  .000   0.0  .000 0.421 1.000 0.650 1.000",
    "C00001 Apica FD4         00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.21   1.0   1.0  .000   0.0  .000 0.421 1.000 0.950 1.000",
    "C00002 Oneida  FD3       00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.22   1.0   1.0  .000   0.0  .000 0.500 1.000 0.950 1.000"
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() ALFRM048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
  expected_vals <- list(`ECO#` = c("G00001", "G00002", "G00003",
                                    "G00004", "G00005", "C00001",
                                    "C00002"),
                         `ECONAME` = c("Aragon FD7", "Rugged FD3",
                                       "Cisco II FD6", "CUF101 FD9",
                                       "Aragon", "Apica FD4", "Oneida  FD3"
                         ),
                         `MG` = c(0, 0, 0, 0, 0,
                                  0, 0),
                         `TM` = c(1, 1, 1, 1, 1,
                                  1, 1),
                         `THVAR` = c(1, 1, 1, 1, 1, 1, 1),
                         `PL-EM` = rep(0.0, 7),
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
                         `TRIFL` = c(0.25, 0.21, 0.24, 0.27, 0.25, 0.21, 0.22),
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

  input_file <- file.path(tempdir(), "BACER048.ECO")

  c("$ECOTYPES:BACER048.20200721   Last edit: 2020-07-21 CHP",
    "!",
    "! COEFF   DEFINITION",
    "! =====   ==========",
    "! AWNS    Awn score (0-10;10=very long)",
    "! ECO#    Code for the ecotype (code)", "! GN%MN   Minimum grain N (%)",
    "! GN%S    Standard grain N (%)", "! HTSTD   Standard canopy height (cm)",
    "! KCAN    PAR extinction coefficient (#)", "! LA1S    Area of standard first leaf (cm2)",
    "! LAFR    Increase in potential area of leaves,reproductive phase (fr/leaf)",
    "! LAFV    Increase in potential area of leaves,vegetative phase (fr/leaf)",
    "! LARS    Area of standard reproductive phase leaf (cm2)", "! LAVS    Area of standard vegetative phase leaf (cm2)",
    "! LLIFE   Life of leaves during vegetative phase (phyllochrons)",
    "! LSPHE   Final leaf senescence ends (GrowhStage)", "! LSPHS   Final leaf senescence starts (GrowhStage)",
    "! P1      Duration of phase end juvenile to terminal spikelet (PVTU)",
    "! P2      Duration of phase terminal spikelet to end leaf growth (TU)",
    "! P2FR1   Duration of phase terminal spikelet to jointing (fr P2)",
    "! P3      Duration of phase end leaf growth to end spike growth (TU)",
    "! P4      Duration of phase end spike growth to end grain fill lag (TU)",
    "! P4FR1   Duration of phase end spike growth to anthesis (fr P4)",
    "! P4FR2   Duration of phase anthesis start to anthesis end (fr P4)",
    "! PARU2   PAR conversion to dm ratio,after last leaf (g/MJ) (If -99,set to PARUE)",
    "! PARUE   PAR conversion to dm ratio,before last leaf stage (g/MJ)",
    "! PHFn    Factor by which PHINTS is multiplied -> PHINT for phase (#)",
    "! PHLn    Leaf # produced during phyllochron phase (#) ", "! PPFPE   Daylength factor,pre emergence (#,0-1)",
    "! RDGS    Root depth growth rate,early phase (cm/standard d)",
    "! RS%S    Reserves part of assimilates going to stem (%)", "! SLAS    Specific leaf area,standard first leaf (cm2/g)",
    "! TDFAC   Tiller death factor (%/st.day when tiller wt 2xstandard wt)",
    "! TDPHE   Tiller death ending stage (GrowthStage)", "! TDPHS   Tiller death start stage (GrowthStage)",
    "! TIFAC   Tiller initiation (rate) factor (fr of phyllochron based) (#)",
    "! TIL#S   Tiller production starts (leaf #)", "! TIPHE   Tillering phase end stage (GrowthStage)",
    "! TKFH    Temperature at which killed when fully hardened (oC)",
    "! VEFF    Vernalization effect (Rate reduction when unvernalized (fr)",
    "! WFGU    Water stress factor,growth,upper (fr)", "! WFPU    Water stress factor,photosynthesis,upper (fr)",
    "!", "! Coefficients presented here differ from those used in DSSAT ",
    "! Version 3.5. They have been developed from 'parameters'",
    "! embedded in the code of the Ceres model,from the Cropsim model,",
    "! and from the literature. They are likely to change as more",
    "! experience is gained, and should not yet be taken as fixed.",
    "", "! In Ceres3.5, P1=400 for PHINT=95; P2=phint*3; P3=phint*2; P4=200,",
    "! with anthesis occurring in P4 after 80 units.", "", "*ECOTYPE:BACER047",
    "!         ------PHENOLOGY(PHASE_DURATIONS)------ P.MOD --MAX_RUE--  LEAF PRODN  ------LEAF_SIZES------ LEAF_SENESC TILLER_PRODUCTION ---TILLER_DEATH-- ROOTS -----CANOPY------  ---COMPOSITION--  KILL                 ",
    "@ECO#     P1 P2FR1    P2    P3 P4FR1 P4FR2    P4  VEFF PARUE PARU2  PHL2  PHF3  LA1S  LAFV  LAFR  SLAS LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  RDGS HTSTD  AWNS  KCAN  RS%S  GN%S GN%MN  TKFH",
    "!          1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32",
    "!       oC.d    fr  oC.d  oC.d    fr    fr  oC.d    fr  g/MJ  g/MJ   Lf#   Fac   cm2 fr/lf fr/lf cm2/g GrStg GrStg   Lf# GrStg   Fac GrStg GrStg.  Fac  cm/d    cm Score   Exp     %     %     %    oC",
    "999991   100     0   100   100  0.15  0.05   100   0.0   1.0   1.0   4.0   1.0   1.0  0.01  0.10   100   4.0   5.5   2.5   2.0   0.5   1.5   2.0   0.0   1.0    60   0.0   .65    10   1.0   0.0   -10",
    "999992   500   .60   500   500  0.35  0.25   500   1.0   6.0   6.0   200   1.6  20.0  0.80  3.00   600   5.7   6.5   7.0   4.0   2.0   4.0   6.0  20.0   5.0   150  10.0   .95    60   3.5   6.0   -25",
    "                                                                                                                                                                                                      ",
    "DFAULT   200   .25   200   200  0.25  0.10   200   0.6   2.7   2.7    15   1.3   5.0  0.10  0.50   400   5.5   6.3   3.5   2.5   1.0   2.5   6.0   4.0   3.0   100   0.0   .85    30   3.0   0.0   -10",
    "",
    "SY0001   381   .25   285   191   .25   .10   258  0.30   2.0   2.0    13   1.0   4.0  0.10  0.30   300   4.2   6.0   5.0   2.5   1.0   2.5   5.0   1.0   3.0   100   0.0   .85    30  3.00   0.0   -10",
    "SY0002   394   .25   294   198   .25   .10   267  0.30   2.0   2.0    13   1.0   4.0  0.10  0.30   300   4.2   6.0   5.0   2.5   1.0   2.5   5.0   1.0   3.0   100   0.0   .85    30  3.00   0.0   -10",
    "US0001   356   .25   265   179   .25   .10   241  1.00   2.6   2.6    13   1.0   4.8  0.05  0.13   400   5.3   6.5   4.5   2.0   1.0   2.0   4.0   0.1   3.0   100   5.0   .85    30  2.00   0.0   -20"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BACRP048.ECO")

  c("$ECOTYPES:BACRP048.20200721   Last edit: 2020-07-21 CHP",
    "",
    "! Coefficients presented here differ from those used in previous",
    "! model versions. They have been developed by taking into account",
    "! the characteristics of a limited number of groups of cultivars.",
    "! The groupings are likely to change as more experience is gained,",
    "! and they should should not be taken as 'fixed'.",
    "",
    "! Users should be aware that some of the coefficients are likely",
    "! to vary from region to region,reflecting either an incomplete",
    "! understanding of the environmental physiology of wheat,or an",
    "! inadequate incorporation of aspects of current understanding.",
    "! For example,PARUE may vary from region to region,possibly",
    "! because of variation in the proportion of diffuse radiation",
    "! in the incoming solar and sky components,or because of ",
    "! differences in the contribution of photosynthetic surfaces ",
    "! not accounted for in the model (eg.awns,peduncles),or even",
    "! because of differences in disease intensities.",
    "",
    "*ECOTYPE:BACRP047",
    "!                        --MAX_RUE--  LEAF_APPEARANCE,AREA/WT,SENESCENCE TILLER_PRODUCTION ------TILLER_DEATH----- ROOTS -----CANOPY------  ------COMPOSITION-----  KILL STEM_SENECE ----GRAIN_WT,#--- ----N_UPTAKE-----",
    "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE GWTAF GWTAT  G#RF RTNUP NUPNF NUPWF",
    "!                            1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32",
    "!                         g/MJ  g/MJ   Lf#   Fac cm2/g   %/d GrStg GrStg   Lf# GrStg   Fac GrStg GrStg   Fac   Fac  cm/d    cm Score   Exp     %     %     %     %    oC GrStg GrStg    fr     g   Fac mg/cm   Fac   Fac",
    "999991 MINIMA              1.0   1.0   4.0   1.0   100    .1   5.0   5.0   2.0   2.0   0.1   1.5   4.5   0.1  0.00   1.0    50     0  0.65     5   1.0   0.5   0.0   -10   5.0   6.0   0.0  1000   0.0 0.001  0.10   0.0                                         ",
    "999992 MAXIMA              4.0   4.0   200   1.6   400   2.5   8.5   9.5   5.0   5.0   1.0   3.5   8.0  15.0  1.00   5.0   150  10.0  0.95    30   3.0   2.5  25.0   -30   8.5   9.5   0.7  7000  0.05 0.010  2.00   2.0  ",
    "                                                                                                                                                                                       ",
    "DFAULT DEFAULT             2.3   2.3    12   1.3   400   1.5   8.0   9.2   4.0   3.0   1.0   3.0   7.0   5.0  1.00   3.0   100   5.0  0.85    15   2.0   1.5  15.0   -15   8.0   9.3   0.3  4000   0.0 0.006  1.00   1.0                                 ",
    "                                                                                                                                                                                       ",
    "SY0001 SYRIA               2.0   2.0   200   1.0   300   1.0   8.7   9.3   5.0   3.0   0.5   3.0   8.0   3.0   0.0   3.0   100   5.0   .85    30   2.0   1.0  15.0   -10   8.7   9.3   0.3  4000  0.03 0.006  0.40   1.0                                 ",
    "SY0002 SYRIA               2.0   2.0   200   1.0   300   1.0   8.7   9.3   5.0   3.0   0.5   3.0   8.0   5.0   0.0   3.0   100   5.0   .85    30   2.0   1.0  15.0   -10   8.7   9.3   0.3  4000  0.03 0.006  0.40   1.0",
    "US0001 USA                 2.0   2.0   200   1.0   400   0.6   8.7   9.3   4.5   3.0   1.0   3.0   8.0   5.0   0.0   3.0   100   5.0   .85    30   2.0   1.0  15.0   -20   8.7   9.3   0.3  4000  0.03 0.006  1.00   1.0",
    "                                                                                                                                                                                       ",
    "                                                                                                                                                      ",
    "! COEFF   DEFINITION                                                                                                                                  ",
    "! =====   ==========                                                                                                                                  ",
    "! AWNS    Awn score (0-10;10=very long)                                                                                                               ",
    "! ECO#    Ecotype code (text)                                                                                                                         ",
    "! G#RF    Grain number radiation factor (fr increase/(MJ/m2.d) radiation in phase 5)",
    "! GM%H    Grain moisture percentage at harvest (%)", "! GN%MN   Minimum grain nitrogen (%)",
    "! GN%S    Standard grain nitrogen concentration (%)", "! GWTAF   Grain weight adjustment factor (fr/10000kg/ha canopy wt>threshold)",
    "! GWTAT   Grain weight adjustment threshold (kg/ha canopy weight at anthesis)",
    "! HTSTD   Standard canopy height (cm)                                                                                                                 ",
    "! KCAN    PAR extinction coefficient (#)", "! LSENI   Leaf senescence,intermediate phases (%/standard day)               ",
    "! LSPHE   Leaf senescence (final) phase end stage (GrowthStage)                                                                                             ",
    "! LSPHS   Leaf senescence (final) phase start stage (GrowthStage)                                                                                             ",
    "! NUPNF   NO3 uptake vs conc exponent adjustment factor (0-2;0=no uptake,1=standard)",
    "! NUPWF   Soil water effect on N uptake adjustment factor (0-2;1.0=no effect,1=standard)",
    "! PARU2   PAR conversion factor,after change (g dry matter/MJ)                                                                                        ",
    "! PARUE   PAR conversion factor,standard (g dry matter/MJ)                                                                                            ",
    "! PHFn    Factor by which PHINTS multiplied -> PHINT for particular phase (#)",
    "! PHLn    Leaf # at end of phyllochron phase (ie,at which PHINT changes) (#) ",
    "! RDGS    Root depth growth rate,standard (cm/standard day)",
    "! RS%A    Reserves concentration in tops at start of anthesis (%)           ",
    "! RTNUP   NO3 uptake/root length  (mg N/cm.day)", "! SLAS    Specific leaf area,standard (cm2/g)                                                                                   ",
    "! SSPHE   Stem senescence (final) phase end stage (GrowthStage)                                                                                             ",
    "! SSPHS   Stem senescence (final) phase start stage (GrowthStage)                                                                                             ",
    "! TDFAC   Tiller death factor (%/st.day when tiller wt 2xstandard wt)",
    "! TDPHE   Tiller death phase end stage (GrowthStage)", "! TDPHS   Tiller death phase start stage (GrowthStage)",
    "! TDSF    Tiller death stress factor (#;0,2->no,full stress acceleration)",
    "! TIFAC   Tiller initiation (rate) factor (fr of phyllochron based) (#)",
    "! TIL#S   Tillering phase (production) start stage (leaf #)",
    "! TIPHE   Tillering phase (production) end (GrowthStage)",
    "! TKFH    Cold tolerance when fully hardened (oC)"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BHGRO048.ECO")

  c("*BAHIA ECOTYPE COEFFICIENTS: CRGRO048 Model ",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per ",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "BH0001 PENSACOLA BAHIA   00 01  1.00   0.0   0.0 9999. 9999.   0.0  0.75  10.0 9999. 9999.  0.15   1.0   1.0  .000   0.0  .000"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BMFRM048.ECO")

  c("*Bermuda Grass ECOTYPE COEFFICIENTS: PRFRM048 MODEL",
    "! Tifton 85 - Diego Pequeno  ",
    "!", "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "! RDRMT  Relative dormancy sensitivity of this cultivar to daylength - partitioning (0-1)",
    "! RDRMG  Relative dormancy sensitivity of this cultivar to daylength - photosynthesis (0-1)",
    "! RDRMM  Relative dormancy sensitivity of this cultivar to daylength - mobilization (0-1)",
    "! RCHDP  Relative cold hardening potential (0-1)", "!", "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    17    18    19    20    21    22    23",
    "G00002 TIFTON 85 BERMUDA 00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.15   1.0   1.0  .000   0.0  .000 0.538 1.000 0.867 1.000"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BNGRO048.ECO")

  c("*DRYBEAN ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "MESIND MESO AMER T 2-4   01 01  0.00   2.4   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.34   1.0   1.0  .000   0.0  .000",
    "MESDET MESO AMER TYPE 1  01 01  0.00   2.4   3.0   0.0   5.0   0.0  0.55   8.0   7.0  0.00  0.34   1.0   1.0  .000   0.0  .000",
    "ANDIND ANDEAN TYPE 2-4   02 02  0.00   3.4   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.34   1.0   1.0  .000   0.0  .000",
    "ANDDET ANDEAN TYPE 1     02 02  0.00   3.4   3.0   0.0   5.0   0.0  0.55   8.0   7.0  0.00  0.34   1.0   1.0  .000   0.0  .000",
    "MEXHIL Mex Highland Ind  01 01  0.00   2.9   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.34   1.0   1.0  .000   0.0  .000",
    "EMBRAP EMBRAPA           01 01  0.00   2.4   5.0   0.0   5.0   0.0  0.75   8.0  10.0 13.00  0.34   1.0   1.0  .000   0.0  .000",
    "DFAULT DEFAULT ECOTYPE   01 01  1.00   3.4   5.0   0.0   5.0   0.0  0.50   8.0  10.0 13.00  0.34   1.0   1.0  .000   0.0  .000",
    "!MESIND MESO AMER T 2-4   01 01  0.00   3.0   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.35   1.0   1.0  .000   0.0  .000",
    "!MESDET MESO AMER TYPE 1  01 01  0.00   3.0   3.0   0.0   5.0   0.0  0.55   8.0   7.0  0.00  0.35   1.0   1.0  .000   0.0  .000",
    "!ANDIND ANDEAN TYPE 2-4   02 02  0.00   4.0   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.35   1.0   1.0  .000   0.0  .000",
    "!ANDDET ANDEAN TYPE 1     02 02  0.00   4.0   3.0   0.0   5.0   0.0  0.55   8.0   7.0  0.00  0.35   1.0   1.0  .000   0.0  .000",
    "!MEXHIL Mex Highland Ind  01 01  0.00   3.5   3.0   0.0   5.0   0.0  0.55   8.0   9.0 11.00  0.35   1.0   1.0  .000   0.0  .000",
    "!EMBRAP EMBRAPA           01 01  0.00   3.0   5.0   0.0   5.0   0.0  0.75   8.0  10.0 13.00  0.35   1.0   1.0  .000   0.0  .000",
    "!DFAULT DEFAULT ECOTYPE   01 01  1.00   4.0   5.0   0.0   5.0   0.0  0.50   8.0  10.0 13.00  0.35   1.0   1.0  .000   0.0  .000"
    ) |>
  write(input_file)

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
                         `PL-EM` = c(2.4, 2.4, 3.4, 3.4, 2.9, 2.4, 3.4),
                         `EM-V1` = c(3, 3, 3, 3, 3, 5, 5),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(5, 5, 5, 5, 5, 5, 5),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.55, 0.55, 0.55, 0.55, 0.55,
                                    0.75, 0.5),
                         `LNGSH` = c(8, 8, 8, 8, 8, 8, 8),
                         `R7-R8` = c(9, 7, 9, 7, 9, 10, 10),
                         `FL-VS` = c(11, 0, 11, 0, 11, 13, 13),
                         `TRIFL` = rep(0.34, 7),
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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BRFRM048.ECO")

  c("*BRACHIARIA ECOTYPE COEFFICIENTS: PRFRM048 MODEL",
    "! Marandu - Diego Pequeno  ",
    "!", "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "! RDRMT  Relative dormancy sensitivity of this cultivar to daylength - partitioning (0-1)",
    "! RDRMG  Relative dormancy sensitivity of this cultivar to daylength - photosynthesis (0-1)",
    "! RDRMM  Relative dormancy sensitivity of this cultivar to daylength - mobilization (0-1)",
    "! RCHDP  Relative cold hardening potential (0-1)", "!", "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    17    18    19    20    21    22    23",
    "G00001 Brachiaria        00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.15   1.0   1.0  .000   0.0  .000 0.475 1.000 0.850 1.000"
    ) |>
  write(input_file)

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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "BRGRO048.ECO")

  c("*BRACHIARIA DECUMBENS ECOTYPE COEFFICIENTS: CRGRO08 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "BR0001 DEFAULT BRACHI    00 01  1.00   3.0   6.0 9999. 9999.   0.0  0.75  10.0 9999. 9999.  0.10   1.0   1.0  .000   0.0  .000",
    "DFAULT DEFAULT ECOTYPE   00 01  1.00   0.0   0.0 9999. 9999.   0.0  0.75  10.0 9999. 9999.  0.10   1.0   1.0  .000   0.0  .000"
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "BSCER048.ECO")

  c("*Sugarbeet ECOTYPE COEFFICIENTS: BSCER048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! TBASE   Base temperature below which no development occurs, C",
    "! TOPT    Temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT    Temperature at which maximum development rate occurs for reproductive stages, C",
    "! P2O     Daylength below which daylength does not affect development rate, hours",
    "! DJTI    Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "!\t         is not photoperiod sensitive, days", "! GDDE    Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT   GDD from silking to effective grain filling period, C",
    "! RUE     Radiation use efficiency, g plant dry matter/MJ PAR",
    "! KCAN    Canopy light extinction coefficient for daily PAR.",
    "! TSEN    Critical temperature below which leaf damage occurs (default 6\xb0C)",
    "! CDAY    Number of cold days parameter (default 15.0 )", "",
    "@ECO   ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
    "!                            1     2    3     4     5     6     7     8      9    10    11",
    "IB0001 GENERIC 1           3.0 27.0  27.0  12.5   4.0   6.0   170.  3.7   0.75",
    "IB0002 GENERIC 2           3.0 27.0  27.0  12.5   4.0   5.9   170.  3.0   0.75",
    "DFAULT DEFAULT             3.0 32.0  27.0  12.5   4.0   6.0   180.  3.8   0.85",
    "IHSTUT Betaseed, Germany   3.0 27.0  27.0  12.5   4.0   6.0   170.  3.8   0.70 ",
    " ", " ", " ") |>
  write(input_file)

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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CBGRO048.ECO")

  c("*CABBAGE ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "!", "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "CB0401 CABBAGE TYPE 1    04 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  25.0  12.0 35.00  0.38   1.0   1.0  .000  20.0  .035",
    "CB0402 CABBAGE TYPE 2    04 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  25.0  12.0 39.00  0.38   1.0   1.0  .000  20.0  .035",
    "CB0403 Kalorama          04 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  25.0  12.0 23.00  0.45   1.8   1.2  .000  20.0  .035",
    "DFAULT DEFAULT TYPE      04 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  25.0  12.0 39.00  0.38   1.0   1.0  .000  20.0  .035"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CHGRO048.ECO")

  c("*CHICKPEA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "!", "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "", "DESI   DESI TYPE         01 01   0.0   2.0   1.5   0.0  05.0   0.0  0.20   7.0   8.0 19.00  0.60   1.0   1.0  .000   0.0  .000",
    "KABULI KABULI TYPE       01 01   0.0   2.0   1.5   0.0  05.0   0.0  0.20   7.0   8.0 19.00  0.60   1.0   1.0  .000   0.0  .000",
    "DFAULT DEFAULT           01 01   0.0   2.0   1.5   0.0  05.0   0.0  0.20   7.0   8.0 19.00  0.60   1.0   1.0  .000   0.0  .000"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CIGRO048.ECO")

  c("*CHIA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "",
    "CI1111 MATURITY GROUP 0  00 01   0.0   1.7   3.0   0.0  05.0   0.0  0.35  13.0  12.0  0.50  0.72   1.0   1.0  .000  18.0  .028",
    "!CI1111 MATURITY GROUP 0  00 01   0.0   3.0   3.0   0.0  05.0   0.0  0.35  13.0  12.0  0.50  0.72   1.0   1.0  .000  18.0  .028",
    "DFAULT DEFAULT        0  00 01   0.0   3.0   3.0   0.0  05.0   0.0  0.35  13.0  12.0  0.50  0.72   1.0   1.0  .000  18.0  .028",
    "", "!") |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() CIGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
  expected_vals <- list(`ECO#` = c("CI1111", "DFAULT"
    ),
    `ECONAME` = c("MATURITY GROUP 0", "DEFAULT        0"),
    `MG` = c(0, 0),
    `TM` = c(1, 1),
    `THVAR` = c(0, 0),
    `PL-EM` = c(1.7, 3),
    `EM-V1` = c(3, 3),
    `V1-JU` = c(0, 0),
    `JU-R0` = c(5.0, 5.0),
    `PM06` = c(0, 0),
    `PM09` = c(0.35, 0.35),
    `LNGSH` = c(13, 13),
    `R7-R8` = c(12, 12),
    `FL-VS` = c(0.5, 0.5),
    `TRIFL` = c(0.72, 0.72),
    `RWDTH` = c(1, 1),
    `RHGHT` = c(1, 1),
    `R1PPO` = c(0, 0),
    `OPTBI` = c(18, 18),
    `SLOBI` = c(0.028, 0.028))

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CNGRO048.ECO")

  c("*CANOLA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.", "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))", "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "",
    "CN0001 MATURITY GROUP 01 01 01   0.0   2.2   6.0   0.0  05.0   0.0  0.45  10.0  03.0  0.00  0.35   1.0   1.6  .000  00.0  .000",
    "!CN0001 MATURITY GROUP 01 01 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  10.0  03.0  0.00  0.35   1.0   1.5  .000  00.0  .000",
    "DFAULT DEFAULT TYPE      01 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35  10.0  12.0  0.00  0.32   1.0   0.9  .504  20.0  .035",
    "!") |>
  write(input_file)

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
                         `PL-EM` = c(2.2, 3.6),
                         `EM-V1` = c(6, 6),
                         `V1-JU` = c(0, 0),
                         `JU-R0` = c(5.0, 5.0),
                         `PM06` = c(0, 0),
                         `PM09` = c(0.45, 0.35),
                         `LNGSH` = c(10, 10),
                         `R7-R8` = c(3.0, 12.0),
                         `FL-VS` = c(0, 0),
                         `TRIFL` = c(0.35, 0.32),
                         `RWDTH` = c(1, 1),
                         `RHGHT` = c(1.6, 0.9),
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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "COGRO048.ECO")

  c("*COTTON ECOTYPE COEFFICIENTS - CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8    9     10    11    12    13    14    15    16",
    "",
    "CO0001 DP 77             02 01   0.0   4.0   4.0   0.0   0.0  0.00  0.90  10.0  10.0 75.00  0.20  0.80  0.85  .001  20.0  .001",
    "CO0003 DP 458            02 01   0.0   4.0   4.0   0.0   0.0  0.00  0.90  12.0  10.0 65.00  0.25  1.00  0.90  .001  20.0  .001",
    "CO0004 DP 555            02 01   0.0   2.5   4.0   0.0   0.0  0.00  0.90   9.0  10.0 70.00  0.33  0.65  0.65  .001  20.0  .001",
    "CO0005 DP 555            02 01   0.0   3.0   4.0   0.0   0.0  0.00  0.90   9.0  10.0 70.00  0.33  0.65  0.65  .001  20.0  .001",
    "CO0006 DP 555 BG/RR      02 01  0.00   4.0   3.0   0.0   0.0  0.00  0.90   8.0  20.0 12.00  0.33  1.00  0.65 0.001  20.0 0.001",
    "CO0007 DP 5690           02 01  0.00   5.0   4.0   0.0   0.0  0.00  0.90   6.0  10.0 75.00  0.25  1.00  0.80 0.001  20.0 0.001",
    "CO0008 DP 77             02 01  0.00   4.0   4.0   0.0   0.0  0.00  0.90   9.0  20.0 24.00  0.33  0.65  0.65 0.001  20.0 0.001",
    "CO0009 Arizona           02 01   0.0   6.0   4.0   0.0   0.0  0.00  0.90  10.0  10.0 30.00  0.20  0.90  0.99  .001  20.0  .001",
    "CO0010 GP 3774           02 01  0.00   4.0   4.0   0.0   0.0  0.00  0.90   8.0  10.0 75.00  0.30  0.85  0.80 0.001  20.0 0.001",
    "CO0011 DP 1219           02 01   0.0   4.0   4.0   0.0   0.0  0.00  0.90   8.0  10.0 40.00  0.20  1.00  0.90  .001  20.0  .001",
    "CO0012 Arizona           02 01   0.0   9.0   4.0   0.0   0.0  0.00  0.90  10.0  10.0 40.00  0.20  0.90  0.95  .001  20.0  .001",
    "CO0013 Arizona           02 01   0.0  12.0   4.0   0.0   0.0  0.00  0.90  10.0  10.0 33.00  0.20  0.90  0.66  .001  20.0  .001",
    "CO0021 GP 3774           02 01   0.0   3.0   4.0   0.0   0.0  0.00  0.90   8.0  10.0 75.00  0.20  0.85  0.95  .001  20.0  .001",
    "CO0027 Deltapine 0912    02 01  0.00   3.0   4.0   0.0   0.0  0.00  0.90  14.0  10.0 75.00  0.28  0.70  0.70 0.001  20.0 0.001",
    "CO0028 Fibermax 9680B2RF 02 01  0.00   2.0   4.0   0.0   0.0  0.00  0.90   8.0  10.0 75.00  0.32  0.60  0.60 0.001  20.0 0.001",
    "CO0032 Phytogen 333      02 01  0.00   3.0   5.0   0.0   0.0  0.00  0.90  17.0  15.0 12.00  0.32  0.82  0.82 0.001  20.0 0.001",
    "CO0033 DP 90b            02 01  0.00   4.0   5.0   0.0   0.0  0.00  0.90   7.0  10.0 34.00  0.36  0.55  0.49 0.001  20.0 0.001",
    "CO0034 DP 458 BG/RR      02 01  0.00   3.0   3.0   0.0   0.0  0.00  0.90  10.0  10.0 26.00  0.32  0.67  0.45 0.001  20.0 0.001",
    "CO0035 Phytogen 339      02 01  0.00   3.5   4.0   0.0   0.0  0.00  0.90  18.0  38.0 14.00  0.27  1.00  0.90 0.001  20.0 0.001",
    "CO0036 Deltapine 1219    02 01  0.00   3.0   4.0   0.0   0.0  0.00  0.90   8.0  10.0 40.00  0.33  0.60  0.60 0.001  20.0 0.001",
    "CO0037 Phytogen 499      02 01  0.00   3.0   5.0   0.0   0.0  0.00  0.90  18.0  15.0 14.00  0.33  0.77  0.77 0.001  20.0 0.001",
    "CO0038 FM 1944 GLB2      02 01  0.00   3.5   5.0   0.0   0.0  0.00  0.90  12.0  10.0 17.00  0.31  0.65  0.75 0.001  20.0 0.001"
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() COGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
  expected_vals <- list(
    "ECO#" = c("CO0001", "CO0003", "CO0004", "CO0005",
               "CO0006", "CO0007", "CO0008", "CO0009", "CO0010", "CO0011", "CO0012",
               "CO0013", "CO0021", "CO0027", "CO0028", "CO0032", "CO0033", "CO0034",
               "CO0035", "CO0036", "CO0037", "CO0038"),
    ECONAME = c("DP 77",
                "DP 458", "DP 555", "DP 555", "DP 555 BG/RR", "DP 5690", "DP 77",
                "Arizona", "GP 3774", "DP 1219", "Arizona", "Arizona", "GP 3774",
                "Deltapine 0912", "Fibermax 9680B2RF", "Phytogen 333", "DP 90b",
                "DP 458 BG/RR", "Phytogen 339", "Deltapine 1219", "Phytogen 499",
                "FM 1944 GLB2"),
    MG = c(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
           2, 2, 2, 2, 2, 2, 2, 2, 2),
    TM = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
           1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
    THVAR = c(0, 0, 0, 0,
              0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    "PL-EM" = c(4,
                4, 2.5, 3, 4, 5, 4, 6, 4, 4, 9, 12, 3, 3, 2, 3, 4, 3, 3.5, 3,
                3, 3.5),
    "EM-V1" = c(4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 4,
                4, 5, 5, 3, 4, 4, 5, 5),
    "V1-JU" = c(0, 0, 0, 0, 0, 0, 0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    "JU-R0" = c(0, 0,
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    PM06 = c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
             0, 0, 0, 0, 0, 0),
    PM09 = c(0.9, 0.9, 0.9, 0.9, 0.9, 0.9,
             0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9, 0.9,
             0.9, 0.9, 0.9, 0.9),
    LNGSH = c(10, 12, 9, 9, 8, 6, 9, 10,
              8, 8, 10, 10, 8, 14, 8, 17, 7, 10, 18, 8, 18, 12),
    "R7-R8" = c(10,
                10, 10, 10, 20, 10, 20, 10, 10, 10, 10, 10, 10, 10, 10, 15,
                10, 10, 38, 10, 15, 10),
    "FL-VS" = c(75, 65, 70, 70, 12,
                75, 24, 30, 75, 40, 40, 33, 75, 75, 75, 12, 34, 26, 14, 40,
                14, 17),
    TRIFL = c(0.2, 0.25, 0.33, 0.33, 0.33, 0.25, 0.33,
              0.2, 0.3, 0.2, 0.2, 0.2, 0.2, 0.28, 0.32, 0.32, 0.36, 0.32,
              0.27, 0.33, 0.33, 0.31),
    RWDTH = c(0.8, 1, 0.65, 0.65, 1,
              1, 0.65, 0.9, 0.85, 1, 0.9, 0.9, 0.85, 0.7, 0.6, 0.82, 0.55,
              0.67, 1, 0.6, 0.77, 0.65),
    RHGHT = c(0.85, 0.9, 0.65, 0.65,
              0.65, 0.8, 0.65, 0.99, 0.8, 0.9, 0.95, 0.66, 0.95, 0.7, 0.6,
              0.82, 0.49, 0.45, 0.9, 0.6, 0.77, 0.75),
    R1PPO = c(0.001,
              0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001,
              0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001,
              0.001, 0.001, 0.001),
    OPTBI = c(20, 20, 20, 20, 20, 20, 20,
              20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20),
    SLOBI = c(0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001,
              0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001, 0.001,
              0.001, 0.001, 0.001, 0.001, 0.001, 0.001))

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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "CPGRO048.ECO")

  c("*COWPEA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "! PM09 is 1.35 for CP0410.  Not good.  Parameter cannot exceed 1.00",
    "!",
    "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "DFAULT DEFAULT TYPE      07 01   0.0   3.5   6.0   0.0  05.0   0.0  0.35   9.0   8.0  9.00  0.40   1.0   1.0  .369  17.0  .000",
    "CP0409 MG 4 USA          04 01   0.0   3.4   6.0   0.0  05.0   0.0  0.35   6.5   7.0 08.00  0.45   1.0   1.0  .369  17.0  .000",
    "CP0410 MG 4 Colombia     04 01   0.0   3.4   6.0   0.0  05.0   0.0  1.35   6.5   7.0 26.00  0.40   1.0   1.0  .369  17.0  .000",
    "CP0411 MG 4 India        04 01   0.0   3.4   6.0   0.0  05.0   0.0  0.35   6.5   7.0 10.00  0.40   1.0   1.0  .369  17.0  .000",
    "CP0412 MG 4 Kenya        04 01   0.0   3.4   6.0   0.0  05.0   0.0  0.35   6.5   7.0 26.00  0.40   1.0   1.0  .369  17.0  .000",
    "CP0413 MG 4 Nigeria      04 01   0.0   3.4   6.0   0.0  10.0   0.0  0.35   6.5   7.0 10.00  0.40   1.0   1.0  .369  17.0  .000",
    "CP0414 MG 4 Africa       04 01   0.0   3.4   6.0   0.0  05.0   0.0  0.35   6.5   7.0 10.00  0.45   1.0   1.0  .369  17.0  .000",
    "!CP0409 MG 4 USA          04 01   0.0   3.6   6.0   0.0  05.0   0.0  0.35   6.5   7.0 08.00  0.45   1.0   1.0  .369  17.0  .000",
    "!CP0410 MG 4 Colombia     04 01   0.0   3.5   6.0   0.0  05.0   0.0  0.75   6.5   7.0 26.00  0.40   1.0   1.0  .369  17.0  .000",
    "!CP0411 MG 4 India        04 01   0.0   3.5   6.0   0.0  05.0   0.0  0.35   6.5   7.0 10.00  0.40   1.0   1.0  .369  17.0  .000",
    "!CP0412 MG 4 Kenya        04 01   0.0   3.5   6.0   0.0  05.0   0.0  0.35   6.5   7.0 26.00  0.40   1.0   1.0  .369  17.0  .000",
    "!CP0413 MG 4 Nigeria      04 01   0.0   3.5   6.0   0.0  10.0   0.0  0.35   6.5   7.0 10.00  0.40   1.0   1.0  .369  17.0  .000",
    "!CP0414 MG 4 Africa       04 01   0.0   3.5   6.0   0.0  05.0   0.0  0.35   6.5   7.0 10.00  0.45   1.0   1.0  .369  17.0  .000"
    ) |>
  write(input_file)

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
                         `PL-EM` = c(3.5, rep(3.4, 6)),
                         `EM-V1` = c(6, 6, 6, 6, 6, 6, 6),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0,
                                     5.0, 10.0, 5.0),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.35, 0.35, 1.35, 0.35, 0.35,
                                    0.35, 0.35),
                         `LNHSH` = c(9.0, rep(6.5, 6)),
                         `R7-R8` = c(8, 7, 7, 7, 7, 7, 7),
                         `FL-VS` = c(9.00, 8.00, 26.00,
                                     10.00, 26.00, 10.00, 10.00
                         ),
                         `TRIFL` = c(0.4, 0.45, 0.4, 0.4, 0.4,
                                     0.4, 0.45),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1),
                         `RHGHT` = c(1, 1, 1, 1, 1, 1, 1),
                         `R1PPO` = rep(0.369, 7),
                         `OPTBI` = c(17, 17, 17, 17, 17, 17, 17),
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

  input_file <- file.path(tempdir(), "CSCAS048.ECO")

  c("$ECOTYPES:CSCAS048.20200721   Last edit: 2020-07-21 CHP",
    "",
    "! Coefficients presented here have no direct equivalents in the",
    "! previous Dssat cassava model, which did not have a set of",
    "! ecotype coefficients. Some of those present have been generated",
    "! from coefficients present in the cultivar file of the previous",
    "! Dssat model. Others have been developed by taking into account",
    "! the characteristics of a limited number of groups of cultivars.",
    "! The groupings are likely to change as more experience is gained,",
    "! and they should should not be taken as 'fixed'.",
    "",
    "! Users should also be aware that some of the coefficients are likely",
    "! to vary from region to region, reflecting either an incomplete",
    "! understanding of the environmental physiology of cassava, or an",
    "! inadequate incorporation of aspects of current understanding.",
    "! For example,PARUE may vary from region to region,possibly",
    "! because of variation in the proportion of diffuse radiation",
    "! in the incoming solar and sky components.",
    "",
    "*ECOTYPE:CSCAS047",
    "@ECO#  ECONAME.......... PARUE HTSTD DUSRI SRN%S BR1FX BR2FX BR3FX BR4FX BR5FX BR6FX",
    "!                            1     2     3     4     5     6     7     8     9    10",
    "!                         g/MJ    cm  oC.d     %    F#    F#    F#    F#    F#    F#",
    "999991 MINIMA             2.00   100   300   .25     1     1     1     1     1     1",
    "999992 MAXIMA             3.20   400  2000  1.00     4     4     4     4     4     4",
    "                                                                                    ",
    "DFAULT DEFAULT            2.80   200   600   .65     3     3     3     3     3     3",
    "                                                ", "990001 STANDARD1          2.10   200   600   .65     3     3     3     3     3     3",
    "990002 STANDARD2          2.30   200   600   .65     3     3     3     3     3     3",
    "990003 STANDARD3          2.30   200   600   .65     3     3     3     3     3     3",
    "990004 STANDARD4          2.30   200  1400   .65     3     3     3     3     3     3",
    "",
    "! COEFF   DEFINITION",
    "! =====   ==========",
    "! BRxFX   Branch number per fork at fork x,maximum  (#)",
    "! ECO#    Ecotype code (text)",
    "! ECONAME Ecotype name (text)",
    "! PARUE   PAR conversion factor,standard (g dry matter/MJ)",
    "! DUSRI   Degree days at which storage root number determined (oC.d)",
    "! SRN%S   Storage root standard N concentration (% dm)",
    "! HTSTD   Standard canopy height (cm)",
    "",
    "! Variables that not used but for which coding is present in the program.",
    "! SWFRX   Stem fraction,maximum (fr)",
    "! SWFRN   Stem fraction,minimum (fr)",
    "! SFMNL   Leaf number below which stem fraction at minimum (#)",
    "! SFMXL   Leaf number above which stem fraction at maximum (#)",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "CSYCA048.ECO")

  c("$ECOTYPES:CSYCA048.041621    Last edit: 05/05/2023 LPM",
    "",
    "",
    "! Users should be aware that some of the coefficients are likely",
    "! to vary from region to region, reflecting either an incomplete",
    "! understanding of the environmental physiology of cassava, or an",
    "! inadequate incorporation of aspects of current understanding.",
    "! For example,PARUE may vary from region to region,possibly",
    "! because of variation in the proportion of diffuse radiation",
    "! in the incoming solar and sky components.",
    "",
    "*ECOTYPE:CSYCA048",
    "@ECO#  ECONAME.......... PARUE TBLSZ SRN%S  KCAN PGERM  PPS1  PPS2  PPS3  PHTV  PHSV  RDGS  RLWR  WFSU RSUSE  HMPC",
    "!                            1     2     3     4     5     6     7     8     9    10    11    12    13    14    15",
    "!                         g/MJ    ˚C     %     #    Tu                     kPa fr/kPa cm/d   m/g     #    fr     %",
    "999991 MINIMA             2.00  12.0   .25  0.65   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "999992 MAXIMA             3.20  12.0  1.00  0.65   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "                                                                                                            ",
    "DFAULT DEFAULT            2.80  12.0   .65  0.65   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "                                                                                                            ",
    "990001 STANDARD1          1.50  12.0   .65  0.60   150     0     0     0   0.8  0.23   2.2    50  0.50  0.00    30",
    "990002 STANDARD2          1.30  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.00  0.05    30",
    "990003 STANDARD3          1.50  12.0   .65  0.85   120     0     0     0   0.8  0.23   2.2    50  0.40  0.05    30",
    "990004 STANDARD4          1.50  12.0   .65  0.86   240     0     0     0   0.8  0.23   2.2    50  0.50  0.10    30",
    "990005 STANDARD5          1.50  12.0   .65  0.72   120     0     0     0   0.8  0.23   2.2    50  0.50  0.10    30",
    "990006 STANDARD6          1.50  12.0   .65  0.61   310     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990007 STANDARD7          2.00  12.0   .65  0.72   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990008 STANDARD8          1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990009 STANDARD9          1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990010 STANDARD10         1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990011 STANDARD11         1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990012 STANDARD12         1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990013 STANDARD13         2.40  12.0   .65  0.72   120     0     0     0   0.8  0.23   2.2    50  0.30  0.05    30",
    "990014 STANDARD14         1.90  14.0   .65  0.88   120     0     0     0   0.8  0.23   2.2    50  0.30  0.10    30",
    "990015 STANDARD15         3.80  14.0   .65  0.50   120     0     0     0   0.8  0.23   2.2    50  0.00  0.00    30",
    "",
    "! COEFF   DEFINITION",
    "! =====   ==========",
    "! ECO#    Ecotype code (text)",
    "! ECONAME Ecotype name (text)",
    "! HMPC    Harvest product dry matter content (%)",
    "! KCAN    PAR extinction coefficient (#)",
    "! PARUE   PAR conversion factor,standard (g dry matter/MJ)",
    "! PGERM   Germination duration (Tu)",
    "! PHSV    Photosynthesis and transpiration,sensitivity to VPD (fraction/kPa) (hourly effect, MEPHO = V)",
    "! PHTV    Photosynthesis and transpiration,threshold VPD for reduction in rate (kPa) (hourly effect, MEPHO = V)",
    "! PPSn    Photoperiod sensitivity that delays branching n in short days (h-1)",
    "! RDGS    Root depth growth rate,standard (cm/standard day)",
    "! RLWR    Root length/weight ratio (m/g)",
    "! RSUSE   Reserves remobilization fraction (storage roots for top growth) (fr)",
    "! TBLSZ   Base temperature for leaf development (˚C)",
    "! SRN%S   Storage root standard N concentration (% dm)",
    "! WFSU    Water stress factor for leaf senescence (0-1)",
    ""
    ) |>
  write(input_file)

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
                         `PARUE` = c(2, 3.2, 2.8, 1.5, 1.3, 1.5,
                                     1.5, 1.5, 1.5, 2, 1.9, 1.9, 1.9,
                                     1.9, 1.9, 2.4, 1.9, 3.8),
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
                         `PGERM` = c(120, 120, 120, 150, 120, 120,
                                     240, 120, 310, 120, 120, 120,
                                     120, 120, 120, 120, 120, 120),
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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "FBGRO048.ECO")

  c("*FABA BEAN ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)", "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)", "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)", "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI", "!", "! 4/11/23 reduced PL-EM from 6.0 to 4.0 to recover time to emergence, V1, and anthesis.  ",
    "!         Exe has soil temp fix.  Soil temp 2-3C cooler now",
    "",
    "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "FABSHO 120d seas .40g/s  02 02  0.00   3.6   2.8   0.0   3.5   0.0  0.58  12.0  12.0 28.00  0.35   1.0   0.8  .000   0.0  .000",
    "FABMED 142d seas .65g/s  02 02  0.00   3.8   4.0   0.0   5.0   0.0  0.58  14.0  12.0 33.00  0.35   1.0   1.0  .000   0.0  .000",
    "FABLON 170d seas 1.2g/s  02 02  0.00   4.0   4.0   0.0   5.0   0.0  0.58  17.5  12.0 44.00  0.35   1.0   1.1  .000   0.0  .000",
    "FABLN2 170d seas 1.2g/s  02 02  0.00   4.0   4.0   0.0   5.0   0.0  0.58  17.5  12.0 44.00  0.35  1.10  1.16  .000   0.0  .000",
    "DFAULT DEFAULT           02 02  0.00   4.0   4.0   0.0   5.0   0.0  0.58  14.0  12.0 33.00  0.35   1.0   1.0  .000   0.0  .000"
    ) |>
  write(input_file)

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
                         `PL-EM` = c(3.6, 3.8, 4, 4, 4),
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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       THRSH = "%6.0f", SDPRO = "%6.3f", SDLIP = "%6.3f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "G0GRO048.ECO")

  c("*BAHIA ECOTYPE COEFFICIENTS: CRGRO048 Model ",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean", "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature", "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days", "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days", "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days", "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)", "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)", "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)", "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per ",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)", "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.",
    "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT THRSH SDPRO SDLIP R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19",
    "G00001 PENSACOLA BAHIA   00 01  1.00   0.0   0.0 9999. 9999.   0.0  0.75  10.0 9999. 9999.  0.15   1.0   1.0  78.0  .115  .035  .000   0.0  .000"
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f",
                       XMAGE = "%6.1f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "GBGRO048.ECO")

  c("*GREENBEAN ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "! XMAGE   Photothermal time required for Multi-harvest",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI XMAGE",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17",
    "SNAPBN X-ANDEAN TYPE     02 02  0.00   2.0   3.0   0.0   5.0   0.0  0.55   8.0   7.0  1.00  0.33   1.1   1.0  .000   0.0  .000  15.0"
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() GBGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM")
  expected_vals <- list(`ECO#` = "SNAPBN",
                         `ECONAME` = "X-ANDEAN TYPE",
                         `MG` = 2,
                         `TM` = 2,
                         `THVAR` = 0,
                         `PL-EM` = 2,
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
                         `SLOBI` = 0,
                          XMAGE = 15)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.0f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.0f",
                       PM06 = "%6.0f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.0f", "FL-VS" = "%6.0f",
                       TRIFL = "%6.2f", RWDTH = "%6.0f", RHGHT = "%6.0f",
                       R1PPO = "%6.0f", OPTBI = "%6.0f", SLOBI = "%6.0f",
                       RDRMT = "%6.3f", RDRMG = "%6.0f", RDRMM = "%6.3f",
                       RCHDP = "%6.0f")

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "GGFRM048.ECO")

  c("*GUINEAGRASS ECOTYPE COEFFICIENTS (27)                                                                                                                                                                        ",
    "!Guineagrass - Panicum maximum                                                                        ",
    "!                                                                                                                                                                                                       ",
    "! COEFF   DEFINITIONS                                                                                                                                                                                   ",
    "! =====   ===========                                                                                                                                                                                   ",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul                                                                                                                                   ",
    "!         file)                                                                                                                                                                                         ",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file                                                                                                                                      ",
    "! MG      Maturity group number for this ecotype, such as maturity                                                                                                                                      ",
    "!         group in soybean                                                                                                                                                                              ",
    "! TM      Indicator of temperature adaptation                                                                                                                                                           ",
    "! THVAR   Minimum rate of reproductive development under short days                                                                                                                                     ",
    "!         and optimal temperature                                                                                                                                                                       ",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)                                                                                                                                       ",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal                                                                                                                                 ",
    "!         days                                                                                                                                                                                          ",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,                                                                                                                                  ",
    "!         thermal days                                                                                                                                                                                  ",
    "! JU-R0   Time required for floral induction, equal to the minimum                                                                                                                                      ",
    "!         number of days for floral induction under optimal temperature and                                                                                                                             ",
    "!         daylengths, photothermal days                                                                                                                                                                 ",
    "! PM06    Proportion of time between first flower and first pod for                                                                                                                                     ",
    "!         first peg (peanut only)                                                                                                                                                                       ",
    "! PM09    Proportion of time between first seed and physiological                                                                                                                                       ",
    "!         maturity that the last seed can be formed                                                                                                                                                     ",
    "! LNGSH   Time required for growth of individual shells (photothermal                                                                                                                                   ",
    "!         days)                                                                                                                                                                                         ",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)                                                                                                                              ",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal                                                                                                                                ",
    "!         days)                                                                                                                                                                                         ",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per                                                                                                                                      ",
    "!         thermal day) default was 0.10, not getting enough leaves, changed to 0.15 2/21/03                                                                                                             ",
    "! RWDTH   Relative width of this ecotype in comparison to the standard                                                                                                                                  ",
    "!         width per node (YVSWH) defined in the species file (*.SPE)                                                                                                                                    ",
    "! RHGHT   Relative height of this ecotype in comparison to the                                                                                                                                          ",
    "!         standard height per node (YVSHT) defined in the species file                                                                                                                                  ",
    "!         (*.SPE)                                                                                                                                                                                       ",
    "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.                                                                                                                                         ",
    "!         Causes seed to stop growing as their dry weights                                                                                                                                              ",
    "!         increase until shells are filled in a cohort.                                                                                                                                                 ",
    "!         (Threshing percentage).                                                                                                                                                                       ",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))                                                                                                                                                ",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))                                                                                                                                                        ",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR                                                                                                                                 ",
    "!         both decrease with the same amount) (h)                                                                                                                                                       ",
    "! OPTBI   Minimum daily temperature above which there is no effect on                                                                                                                                   ",
    "!         slowing normal development toward flowering (oC)                                                                                                                                              ",
    "! SLOBI   Slope of relationship reducing progress toward flowering if                                                                                                                                   ",
    "!         TMIN for the day is less than OPTBI                                                                                                                                                           ",
    "! RDRMT  Relative dormancy sensitivity of this cultivar to daylength - partitioning (0-1)                                                                                                               ",
    "! RDRMG  Relative dormancy sensitivity of this cultivar to daylength - photosynthesis (0-1)                                                                                                             ",
    "! RDRMM  Relative dormancy sensitivity of this cultivar to daylength - mobilization (0-1)                                                                                                               ",
    "! RCHDP  Relative cold hardening potential (0-1)                                                                                                                                                        ",
    "!                                                                                                                                                                                                       ",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI RDRMT RDRMG RDRMM RCHDP                                ",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    17    18    19    20    21    22    23                                ",
    "GG0009 Panicum           00 01  1.00   0.0   0.0   0.0 9999.   0.0  0.75  10.0 9999. 9999.  0.15   1.0   1.0  .000   0.0  .000 0.350 1.000 0.574 1.000  ",
    ""
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MLCER048.ECO")

  c("*MILLET ECOTYPE COEFFICIENTS: MLCER048 MODEL",
    "",
    "@ECO#  ECONAME.........  TBASE TOPT  ROPT  DJTI  GDDE   RUE  KCAN",
    "!                            1    2     3     4     5     6     7",
    "! all KCAN were 0.85. Does not affect LIFAC, only affects KEP, so use it that way? (Yes, KJB)",
    "IB0001 GENERIC            10.0 34.0  34.0  68.0   6.0   4.0  0.85",
    "DFAULT DEFAULT            10.0 34.0  34.0  68.0   6.0   4.0  0.85",
    "",
    "!For Global Futures project, RUE increased by 10%",
    "IB0101 GENERIC            10.0 34.0  34.0  68.0   6.0   4.4  0.85",
    "",
    "!For Peter Craufurd's daylength experiment, RUE as per his publication",
    "IB0201 GENERIC            10.0 34.0  34.0  68.0   6.0  4.80  0.85",
    "IB0301 GENERIC            10.0 34.0  34.0  68.0   6.0  4.50  0.85",
    "",
    "!TBASE - base temperature below which no development occurs, C",
    "!TOPT - temperature at which maximum development rate occurs during vegetative stages, C",
    "!ROPT - temperature at which maximum development rate occurs for reproductive stages, C",
    "!DJTI - Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "!\t       is not photoperiod sensitive, days",
    "!GDDE - Growing degree days per cm seed depth required for emergence, GDD/cm",
    "!RUE - Radiation use efficiency, g plant dry matter/MJ PAR",
    "!KCAN - Canopy light extinction coefficient for daily PAR.") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MZCER048.ECO")

  c("*MAIZE ECOTYPE COEFFICIENTS: MZCER048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! TBASE   Base temperature below which no development occurs, C",
    "! TOPT    Temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT    Temperature at which maximum development rate occurs for reproductive stages, C",
    "! P2O     Day length below which day length does not affect development rate, hours",
    "! DJTI    Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "!\t         is not photoperiod sensitive, days", "! GDDE    Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT   GDD from silking to effective grain filling period, C",
    "! RUE     Radiation use efficiency, g plant dry matter/MJ PAR",
    "! KCAN    Canopy light extinction coefficient for daily PAR.",
    "! TSEN    Critical temperature below which leaf damage occurs (default 6°C)",
    "! CDAY    Number of cold days parameter (default 15.0 )", "!",
    "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
    "!                            1     2    3     4     5     6     7     8      9    10    11",
    "IB0001 GENERIC MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
    "IB0002 GENERIC MIDWEST2    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.5   0.85",
    "IB0003 GENERIC MIDWEST3    8.0 34.0  34.0  12.5   4.0   6.0   170.  2.0   0.85",
    "IB0004 +5% RUE MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.4   0.85",
    "DFAULT DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
    ""
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "MZIXM048.ECO")

  c("*MAIZE ECOTYPE COEFFICIENTS: MZIXM048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! TBASE   Base temperature below which no development occurs, C",
    "! TOPT    Temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT    Temperature at which maximum development rate occurs for reproductive stages, C",
    "! P2O     Daylength below which daylength does not affect development rate, hours",
    "! DJTI    Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "! \t       is not photoperiod sensitive, days",
    "! GDDE    Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT   GDD from silking to effective grain filling period, C",
    "! RUE     Radiation use efficiency, g plant dry matter/MJ PAR",
    "! KCAN    Canopy light extinction coefficient for daily PAR.",
    "! PSTM    Parameter controlling stem C partitioning during ISTAGES 3, 4 (0-1) ",
    "!          Higher PSTM, more DM into stem, less into leaves",
    "! PEAR    Parameter controlling ear C partitioning during ear growth ",
    "!         (250 GDD before flowering-end ISTAGE 4)", "! TSEN    Critical temperature below which leaf damage occurs (default 6°C)",
    "! CDAY    Number of cold days parameter (default 15.0 )",
    "!",
    "@ECO#  ECONAME.........  TBASE TOPT  ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  PSTM  PEAR  TSEN  CDAY",
    "!                            1    2     3     4     5     6     7     8      9    10    11    12    13",
    "IB0001 HEAVY STEMS         8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85  0.75  0.15      ",
    "IB0002 LIGHT STEMS         8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85  0.10  0.15",
    "IB0003 MEDIUM STEMS        8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85  0.50  0.15",
    "IB0004 DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85  0.40  0.15",
    ""
    ) |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PNGRO048.ECO")

  c("*PEANUT ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! THRSH   The maximum ratio of (seed/(seed+shell)) at maturity.",
    "!         Causes seed to stop growing as their dry weights",
    "!         increase until shells are filled in a cohort.",
    "!         (Threshing percentage).",
    "! SDPRO   Fraction protein in seeds (g(protein)/g(seed))",
    "! SDLIP   Fraction oil in seeds (g(oil)/g(seed))",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "! reduced all PL-EM by 1.5 ptd, because of \"fix\" to soil temperature, and now cooler soil temperature",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8    9     10    11    12    13    14    15    16",
    "RUNNER RUNNER TYPE       02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.35   1.0   1.0  .010  20.0  .001",
    "VIRGIN VIRGINIA TYPE     01 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.35   1.0   1.0  .010  20.0  .001",
    "SPANIS SPANISH TYPE      02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.85  0.95  .010  20.0  .001",
    "PN0001 FLORUNNER VARS    02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.35   1.0   1.0  .010  20.0  .001",
    "PN0002 SLOW RUNNER       02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.34  0.90  0.95  .010  20.0  .001",
    "PN0003 MEDIUM RUNNER     02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.35  0.95   1.0  .010  20.0  .001",
    "PN0004 FAST BUNCH, VA    02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.37  0.90   1.0  .010  20.0  .001",
    "PN0005 SLOW BUNCH, VA    02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.35  0.90   1.0  .010  20.0  .001",
    "PN0006 SHORT SPANISH     02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.70  0.85  .010  20.0  .001",
    "PN0007 MEDIUM SPANISH    02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.85  0.95  .010  20.0  .001",
    "PN0008 FAST VIRGINIA     02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.36   1.0   1.0  .010  20.0  .001",
    "PN0009 FAST   RUNNER     02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.37  1.00   1.0  .010  20.0  .001",
    "PN0010 FAST VA BUN,Q188  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.37  0.95   1.0  .010  20.0  .001",
    "PN0011 FAST VIRG, TIF-8  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.36  0.92   1.0  .010  20.0  .001",
    "PN0012 SHORT SPANISH     02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.75  0.85  .010  20.0  .001",
    "PN0013 SLOW BUNCH, VA    02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.35  0.86   1.0  .010  20.0  .001",
    "PN0014 SLOW,RUN,loshel%  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  17.0   0.0 68.00  0.34  0.90  0.95  .010  20.0  .001",
    "PN0015 SMALL RUNNER      02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.36  0.88  0.95  .010  20.0  .001",
    "PN0016 SLOW,SHORT VA BU  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.34  0.75  0.60  .010  20.0  .001",
    "PN0017 MEDIUM SPAN chin  02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.80  0.85  .010  20.0  .001",
    "PN0018 SLOW,SHORT 97-98  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.34  0.75  0.60  .010  20.0  .001",
    "PN0019 MEDIUM SPAN97-98  02 01   0.0   3.1   3.1   0.0  15.1  0.40  1.00  15.0   0.0 68.00  0.35  0.80  0.85  .010  20.0  .001",
    "PN0020 SLOW,SHORT 97-98  02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  18.0   0.0 68.00  0.34  0.75  0.60  .010  20.0  .001",
    "",
    "",
    "DFAULT DEFAULT ECOTYPE   02 01   0.0   3.5   3.3   0.0  17.7  0.40  1.00  16.0   0.0 68.00  0.35   1.0   1.0  .010  20.0  .001",
    ""
    ) |>
  write(input_file)

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
                                    "PN0019", "PN0020", "DFAULT"),
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
                                       "SLOW,SHORT 97-98", "DEFAULT ECOTYPE"),
                         `MG` = c(2, 1, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2, 2, 2, 2, 2, 2,
                                  2),
                         `TM` = c(1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1),
                         `THVAR` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0),
                         `PL-EM` = c(3.5, 3.5, 3.1, 3.5, 3.5, 3.5,
                                     3.5, 3.5, 3.1, 3.1, 3.5, 3.5,
                                     3.5, 3.5, 3.1, 3.5, 3.5, 3.1,
                                     3.5, 3.1, 3.5, 3.1, 3.5, 3.5),
                         `EM-V1` = c(3.3, 3.3, 3.1, 3.3, 3.3, 3.3,
                                     3.3, 3.3, 3.1, 3.1, 3.3, 3.3,
                                     3.3, 3.3, 3.1, 3.3, 3.3, 3.1,
                                     3.3, 3.1, 3.3, 3.1, 3.3, 3.3),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0),
                         `JU-R0` = c(17.7, 17.7, 15.1, 17.7, 17.7,
                                     17.7, 17.7, 17.7, 15.1, 15.1,
                                     17.7, 17.7, 17.7, 17.7, 15.1,
                                     17.7, 17.7, 15.1, 17.7, 15.1,
                                     17.7, 15.1, 17.7, 17.7),
                         `PM06` = c(0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4,
                                    0.4, 0.4, 0.4, 0.4, 0.4, 0.4),
                         `PM09` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                    1, 1, 1, 1, 1),
                         `LNGSH` = c(16, 18, 15, 16, 16, 16, 18,
                                     18, 15, 15, 18, 16, 18, 18,
                                     15, 18, 17, 15, 18, 15, 18,
                                     15, 18, 16),
                         `R7-R8` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0),
                         `FL-VS` = c(68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68, 68, 68, 68, 68,
                                     68, 68, 68),
                         `TRIFL` = c(0.35, 0.35, 0.35, 0.35, 0.34,
                                     0.35, 0.37, 0.35, 0.35, 0.35,
                                     0.36, 0.37, 0.37, 0.36, 0.35,
                                     0.35, 0.34, 0.36, 0.34, 0.35,
                                     0.34, 0.35, 0.34, 0.35),
                         `RWDTH` = c(1, 1, 0.85, 1, 0.9, 0.95,
                                     0.9, 0.9, 0.7, 0.85, 1, 1, 0.95,
                                     0.92, 0.75, 0.86, 0.9, 0.88,
                                     0.75, 0.8, 0.75, 0.8, 0.75,
                                     1),
                         `RHGHT` = c(1, 1, 0.95, 1, 0.95, 1, 1,
                                     1, 0.85, 0.95, 1, 1, 1, 1, 0.85,
                                     1, 0.95, 0.95, 0.6, 0.85, 0.6,
                                     0.85, 0.6, 1),
                         `R1PPO` = c(0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01, 0.01,
                                     0.01, 0.01, 0.01, 0.01),
                         `OPTBI` = c(20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 20, 20,
                                     20, 20, 20),
                         `SLOBI` = c(0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001,
                                     0.001, 0.001, 0.001, 0.001))

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PPGRO048.ECO")

  c("*PIGEONPEA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                         1  2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18",
    "DFAULT PIGEONPEA         03 01   0.0  5.02   6.0   0.0  05.0   0.0  0.35  10.0  8.43 11.26  0.80   1.0   1.0 0.435  18.0  .028",
    "PP0001 DEFAULT PIGEONPEA 03 01   0.0  4.50   5.8   0.0  05.0   0.0  0.35  10.0  8.43 11.26  0.80   1.0   1.0 0.435  18.0  .028",
    "PP0002 INDIA ICPL88039   03 01   0.0  4.50   5.8   0.0  05.0   0.0  0.35  10.0 22.51 12.03  0.80   1.0   1.0 0.350  18.0  .028",
    "!PP0001 DEFAULT PIGEONPEA 03 01   0.0  5.02   6.0   0.0  05.0   0.0  0.35  10.0  8.43 11.26  0.80   1.0   1.0 0.435  18.0  .028",
    "!PP0002 INDIA ICPL88039   03 01   0.0  4.88   6.0   0.0  05.0   0.0  0.35  10.0 22.51 12.03  0.80   1.0   1.0 0.350  18.0  .028",
    ""
    ) |>
  write(input_file)

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
    `PL-EM` = c(5.02, 4.5, 4.5),
    `EM-V1` = c(6, 5.8, 5.8),
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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f",
                       XMAGE = "%6.1f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "PRGRO048.ECO")

  c("*PEPPER ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "",
    "! PARAM   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "! XMAGE   Photothermal time required for Multi-harvest",
    "!", "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI XMAGE",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17",
    "PR0001 CAPISTRANO        01 01   0.0   5.0  10.0  24.0  05.0   0.0  0.75  35.0   0.0 53.00  0.35   1.0   1.0  .000  00.0  .000  25.0",
    "PR0002 BISCAYNE          01 01   0.0   5.0  10.0  24.0  05.0   0.0  0.75  35.0   0.0 53.00  0.35   1.0   1.0  .000  00.0  .000  25.0",
    "PR0003 BISCAYNE-JJ       01 01   0.0   5.0  10.0   0.0  05.0   0.0  0.75  35.0  15.0 53.00  0.35   1.0   1.0  .000  00.0  .000  25.0",
    "DFAULT DEFAULT TYPE      01 01   0.0   5.0  20.0   0.0  05.0   0.0  0.75  35.0   0.0 18.00  0.52   1.0   1.0  .000  00.0  .000  25.0",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "PTSUB048.ECO")

  c("*POTATO ECOTYPE COEFFICIENTS: PTSUB048 MODEL",
    "!",
    "! COEFF       DEFINITIONS",
    "! ========    ===========",
    "! RUE1 - Radiation use efficiency, ISTAGE=1, g plant dry matter/MJ PAR",
    "! RUE2 - Radiation use efficiency, ISTAGE>1, g plant dry matter/MJ PAR",
    "!",
    "@ECO#  ECONAME..........  RUE1  RUE2",
    "!                            1     2",
    "IB0001 GENERIC POTATO      3.5   4.0",
    "IB0002 GENERIC POTATO+10%  3.8   4.4",
    "DFAULT DEFAULT             3.5   4.0",
    "") |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "QUGRO048.ECO")

  c("*QUINOA ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)", "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "QU0001 MATURITY GROUP 0  00 01   0.0   2.0   2.0   0.0  05.0   0.0  0.35  10.0  12.0 20.00  0.90   1.0   1.0  .189  18.0  .028",
    "QU0002 MATURITY GROUP 0  00 01   0.0   2.0   2.0   0.0  05.0   0.0  0.35  10.0  12.0 20.00  1.20  0.80  0.80  .189  18.0  .028",
    "DFAULT DEFAULT  GROUP 0  00 01   0.0   2.0   2.0   0.0  05.0   0.0  0.35  10.0  12.0 20.00  1.20  0.80  0.80  .189  18.0  .028",
    ""
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() QUGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
  expected_vals <- list(`ECO#` = c("QU0001", "QU0002", "DFAULT"
    ),
    `ECONAME` = c("MATURITY GROUP 0", "MATURITY GROUP 0",
                  "DEFAULT  GROUP 0"),
    `MG` = c(0, 0, 0),
    `TM` = c(1, 1, 1),
    `THVAR` = c(0, 0, 0),
    `PL-EM` = rep(2.0, 3),
    `EM-V1` = c(2, 2, 2),
    `V1-JU` = c(0, 0, 0),
    `JU-R0` = c(5.0, 5.0, 5.0),
    `PM06` = c(0, 0, 0),
    `PM09` = c(0.35, 0.35, 0.35),
    `LNGSH` = c(10, 10, 10),
    `R7-R8` = c(12, 12, 12),
    `FL-VS` = c(20, 20, 20),
    `TRIFL` = c(0.9, 1.2, 1.2),
    `RWDTH` = c(1, 0.8, 0.8),
    `RHGHT` = c(1, 0.8, 0.8),
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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SBGRO048.ECO")

  c("*SOYBEAN ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed", "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "! changed PL-EM from 3.6 to 2.2 for all ecotypes because of the new soil temp simulations are 2-3 C cooler",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "DETERM DETERMINATE TYPE  07 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .504  20.0  .035",
    "INDETE INDETERMINATE     03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .324  18.0  .028",
    "SB1000 MATURITY GP  000  00 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 25.00  0.32   1.0   1.0  .189  18.0  .028",
    "SB0100 MATURITY GP   00  00 02   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 29.00  0.32   1.0   1.0  .189  18.0  .028",
    "SB0000 MATURITY GROUP 0  00 03   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 29.00  0.32   1.0   1.0  .189  18.0  .028",
    "SB0001 MATURITY GROUP 0  00 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .189  18.0  .028",
    "SB0101 MATURITY GROUP 1  01 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .234  18.0  .028",
    "SB0113 MATURITY GROUP 1  01 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .234  18.0  .028",
    "SB0115 MATURITY GROUP 1  01 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .234  18.0  .028",
    "SB0116 MATURITY GROUP 1  01 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .234  18.0  .028",
    "SB0201 MATURITY GROUP 2  02 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .279  18.0  .028",
    "SB0211 MATURITY GROUP 2  02 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .279  18.0  .028",
    "SB0212 MATURITY GROUP 2  02 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .279  18.0  .028",
    "SB0214 MATURITY GROUP 2  02 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .279  18.0  .028",
    "SB0301 MATURITY GROUP 3  03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .324  18.0  .028",
    "SB0302 MATURITY GROUP 3  03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 24.00  0.33   1.0   1.0  .324  18.0  .028",
    "SB0303 MATURITY GROUP 3  03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.33   1.0   1.0  .324  18.0  .028",
    "SB0401 MATURITY GROUP 4  04 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .369  20.0  .035",
    "SB0501 MATURITY GROUP 5  05 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .414  20.0  .035",
    "SB0601 MATURITY GROUP 6  06 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .459  20.0  .035",
    "SB0701 MATURITY GROUP 7  07 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .504  20.0  .035",
    "SB0702 MATURITY GROUP 7  07 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .504  20.0  .035",
    "SB0801 MATURITY GROUP 8  08 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .549  20.0  .035",
    "SB0901 MATURITY GROUP 9  09 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .549  20.0  .035",
    "SB1001 MATURITY GROUP 10 10 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .549  20.0  .035",
    "DFAULT DEFAULT TYPE      07 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0  9.00  0.32   1.0   0.9  .504  20.0  .035",
    "SB0304 MATURITY GROUP 3  03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .100  18.0  .028",
    "SB0305 MATURITY GROUP 3  03 01   0.0   2.2   6.0   0.0  05.0   0.0  0.35  10.0  12.0 26.00  0.32   1.0   1.0  .166  18.0  .028",
    ""
    ) |>
  write(input_file)

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
                                    "SB0305"),
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
                                       "MATURITY GROUP 3", "MATURITY GROUP 3"
                         ),
                         `MG` = c(7, 3, 0, 0, 0,
                                  0, 1, 1, 1, 1, 2,
                                  2, 2, 2, 3, 3, 3,
                                  4, 5, 6, 7, 7, 8,
                                  9, 10, 7, 3, 3),
                         `TM` = c(1, 1, 1, 2, 3,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1, 1,
                                  1, 1, 1, 1, 1),
                         `THVAR` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `PL-EM` = rep(2.2, 28),
                         `EM-V1` = c(6, 6, 6, 6, 6, 6, 6, 6, 6,
                                     6, 6, 6, 6, 6, 6, 6, 6, 6, 6,
                                     6, 6, 6, 6, 6, 6, 6, 6, 6),
                         `V1-JU` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                     0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0,
                                     5.0, 5.0, 5.0, 5.0),
                         `PM06` = c(0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0),
                         `PM09` = c(0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35, 0.35, 0.35,
                                    0.35, 0.35, 0.35),
                         `LNGSH` = c(10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10,
                                     10, 10, 10, 10, 10, 10, 10),
                         `R7-R8` = c(12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12,
                                     12, 12, 12, 12, 12, 12, 12),
                         `FL-VS` = c(9, 26, 25, 29, 29, 26, 26,
                                     26, 26, 26, 26, 26, 26, 26,
                                     26, 24, 26, 26, 9, 9, 9, 9,
                                     9, 9, 9, 9, 26, 26),
                         `TRIFL` = c(0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.33, 0.33, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32, 0.32, 0.32,
                                     0.32, 0.32, 0.32
                         ),
                         `RWDTH` = c(1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1),
                         `RHGHT` = c(0.9, 1, 1, 1, 1, 1, 1, 1,
                                     1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                                     0.9, 0.9, 0.9, 0.9, 0.9, 0.9,
                                     0.9, 0.9, 1, 1),
                         `R1PPO` = c(0.504, 0.324, 0.189, 0.189,
                                     0.189, 0.189, 0.234, 0.234,
                                     0.234, 0.234, 0.279, 0.279,
                                     0.279, 0.279, 0.324, 0.324,
                                     0.324, 0.369, 0.414, 0.459,
                                     0.504, 0.504, 0.549, 0.549,
                                     0.549, 0.504, 0.1, 0.166),
                         `OPTBI` = c(20, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 18, 18, 18, 18,
                                     18, 18, 18, 20, 20, 20, 20,
                                     20, 20, 20, 20, 20, 18, 18),
                         `SLOBI` = c(0.035, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.028, 0.028, 0.028,
                                     0.028, 0.035, 0.035, 0.035,
                                     0.035, 0.035, 0.035, 0.035,
                                     0.035, 0.035, 0.028, 0.028))

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

  input_file <- file.path(tempdir(), "SCCAN048.ECO")

  c("*SUGARCANE GENOTYPE COEFFICIENTS - SCCAN048 MODEL",
    "",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! DELTTMAX     |  0.07   | Sucrose accumulation | Max. change in sucrose content per unit change in stalk mass in the unripenened section |  'DELTAMAX' in Singels & Bezuidenhout, 2002  ",
    "!              |         |                      |                                                                                         |  Range between .06 and 0.08.  High sucrose ",
    "!              |         |                      |                                                                                         |  varieties will have high value.  Calibrate ",
    "!              |         |                      |                                                                                         |  against irrigated seasonal sucrose curve",
    "!              |         |                      +---------------------------------------------------------------------------------------- +----------------------------------------------",
    "! SWDF2AMP     |   0.5   | Sucrose accumulation | Sucrose partitioning sensitivity to water stress parameter                              |  'FWCON' in Singels & Bezuidenhout, 2002     ",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! CS_CNREDUC   |   0.3   | Canopy - CANESIM     | Canopy reduction due to water stress                                                    |                                              ",
    "! CS_CNPERIOD  |   21    | Canopy - CANESIM     | Canopy water stress period (days)                                                       |                                              ",
    "! Tthalfa�     |   125   | Canopy - CANESIM     | Half canopy thermal time adjustment for row width                                       |                                              ",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! DPERdT       |  0.176  | Canopy - height      | Change in plant extension rate (mm/h) per unit change in temperature (oC)               | Originally from Inman-Bamber (1991), since adjusted",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! EXTCFN       |  0.84   | Canopy - light extin | Maximum canopy light extinction coefficient                                             | Inman-Bamber (1991)                          ",
    "! EXTCFST      |  0.58   | Canopy - light extin | Minimum canopy light extinction coefficient                                             | Inman-Bamber (1991)                          ",
    "! LFNMXEXT     |   20    | Canopy - light extin | Leaf number (including dead leaves still attached) at which maximum light extinction occurs                                            ",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! AREAMX_CF(1) |    0    | Canopy - leaves      | Cultivar parameter for quadratic equation defining maximum leaf area                    | Inman-Bamber (1991) Regress quadratic ",
    "!              |         |                      |                                                                                         | equation to leaf area (cm2) vs leaf no data: ",
    "!              |         |                      |                                                                                         | y = cf1+cf2*x+cf3*x^2 ",
    "!              |         |                      |                                                                                         +::::::::::::::::::::::::::::::::::::::::::::::",
    "! AREAMX_CF(2) |  27.2   | Canopy - leaves      | Cultivar parameter for quadratic equation defining maximum leaf area                    | Inman-Bamber (1991)",
    "! AREAMX_CF(3) |  -20.8  | Canopy - leaves      | Cultivar parameter for quadratic equation defining maximum leaf area                    | Inman-Bamber (1991)                  ",
    "! WIDCOR       |    1    | Canopy - leaves      | Parameter affecting the width of leaves                                                 | Inman-Bamber (1991) Used to determine area of expanding leaves ",
    "! WMAX_CF(1)   | -0.0345 | Canopy - leaves      | Cultivar parameter for quadratic equation defining leaf width                           | Inman-Bamber (1991) Used to determine area of expanding leaves",
    "! WMAX_CF(2)   |  2.243  | Canopy - leaves      | Cultivar parameter for quadratic equation defining leaf width                           | Inman-Bamber (1991) Used to determine area of expanding leaves",
    "! WMAX_CF(3)   |  7.75   | Canopy - leaves      | Cultivar parameter for quadratic equation defining leaf width                           | Inman-Bamber (1991) Used to determine area of expanding leaves",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! POPCF(1)     |  1.826  | Tiller population    | Stalk population coefficient, in ideal conditions (no stresses), as function of th.time |",
    "! POPCF(2)     | -0.002  | Tiller population    | Stalk population coefficient, in ideal conditions (no stresses), as function of th.time |",
    "! POPDECAY     |  0.004  | Tiller population    | Tiller senescence rate expressed as the fraction of tillers above the future mature til-| ",
    "!              |         |                      | ler population (at a thermal time of 1600 oC Adjust by comparing simulated and observed |",
    "!              |         |                      | tiller population.  Varies from 3.0 to 5.0                                              |",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! TTBASEEM     |   10    | Phenology            | Base temperature for emergence (oC)                                                     |",
    "! TTBASELFEX   |   10    | Phenology            | Base temperature for leaf phenology (oC)                                                | ",
    "! TTBASEPOP    |   16    | Phenology            | Base temperature for stalk phenology (oC)                                               | ",
    "! TBASEPER     |  10.57  | Phenology            | Base temperature for plant extension (oC)                                               | ",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "! LG_AMRANGE   |   30    | Lodging              | Range in aerial mass from the start to the end of lodging (t/ha)                        | ",
    "! LG_GP_REDUC  |  0.28   | Lodging              | Reduction in gross photosynthesis due to full lodging, as a fraction (Singh, et al.)    | Singh et al, (1999)",
    "! LG_FI_REDUC  |   0.1   | Lodging              | Reduction in fractional interception by the canopy due to full lodging                  | ",
    "! -------------+---------+----------------------+-----------------------------------------------------------------------------------------+----------------------------------------------",
    "",
    "",
    "!                        | Biomass      | Biomass      | Canopy - light extinction ---------------->| Canopy - leaves --------------------------|s -------------------------------------------------------->e Tillering/population -------|          ----------------------------------------------------------->|------------------------------------------->|----------------------------------------------- Canopy - leaves      ---->",
    "!                        | partitioning | partitioning |                                            |                                           |                                                                                         |                                                                      |                                            |                                                                          |<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|",
    "!                        |<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|<------------>|              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |              |",
    "@ECO#  ECO-NAME.........        DELTTMAX       SWDF2AMP         EXTCFN        EXTCFST       LFNMXEXT   AREAMX_CF(2)   AREAMX_CF(3)         WIDCOR     WMAX_CF(1)     WMAX_CF(2)     WMAX_CF(3)       POPDECAY       TTBASEEM     TTBASELFEX     LG_AMRANGE    LG_GP_REDUC   LDG_FI_REDUC     LMAX_CF(1)     LMAX_CF(2)     LMAX_CF(3)    MAXLFLENGTH     MAXLFWIDTH    TBASE_GE_EM    TOPT_GE_EM      TFin_GE_EM     TBASE_LFEM      TOPT_LFEM      TFin_LFEM    TBASE_TLREM     TOPT_TLREM     TFin_TLREM    TBASE_LFSEN     TOPT_LFSEN     TFin_LFSEN    TBASE_STKEX     TOPT_STKEX     TFin_STKEX     TBASE_LFEX      TOPT_LFEX      TFin_LFEX      TBASE_REX       TOPT_REX       TFin_REX      TOPT_PHOT      TOPT_PHO2      TFin_PHOT     TBASE_RESP      TOPT_RESP      TFin_RESP ",
    "DFAULT DEFAULT                      0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75          0.004            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           16.0          28.0            41.0           10.0           30.0           43.0          16.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00 ",
    "",
    "SC0001 SOUTH AFRICAN  1             0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75          0.004            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           16.0          28.0            41.0           10.0           30.0           43.0          16.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00 ",
    "SC0013 SOUTH AFRICAN 13             0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75          0.004            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           16.0          28.0            41.0           10.0           30.0           43.0          16.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00 ",
    "SC0014 SOUTH AFRICAN 14             0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75          0.004            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           16.0          28.0            41.0           10.0           30.0           43.0          16.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00 ",
    "SC0015 SOUTH AFRICAN 15             0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75          0.004            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           16.0          28.0            41.0           10.0           30.0           43.0          16.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00                                                               ",
    "SC0016 CENTR. BRAZIL 16             0.07            0.5           0.84           0.58            20.           27.2          -20.8             1.        -0.0345          2.243           7.75         0.0010            10.            10.            30.           0.28            0.1         -0.376           12.2           21.8           100.            3.5           12.0          28.0            41.0           10.0           30.0           43.0          12.00          35.00          48.00          10.00          30.00          43.00          16.00          35.00          48.00          10.00          30.00          43.00           10.0           30.0          43.00          20.00          40.00          47.00           0.00          40.00          47.00                                                               ",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SCCSP048.ECO")

  c("*SUGARCANE ECOTYPE COEFFICIENTS - SCCSP048 MODEL",
    "",
    "DFAULT  (MINIMA,MAXIMA)",
    "!-------------------",
    "  KCAN_ECO      0.80    Superseeds KCAN from .SPE file",
    "  SMAX            20    Maximum number of stalks a variety can yield per stubble or plant (limit 41)",
    "!-------------------",
    "  CAB              8    Number of leaves in spindle cluster at top of stalk (\"cabbage\").  In CASUPRO, stalk dry matter begins to accumulate only after CAB leaves have emerged. ",
    "  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-populated light interception zones full.",
    "  LfShdFac      0.35    Proportion of a stalk\x92s new leaf area that shades (displaces to the next lower zone) leaves on other stalks.",
    "  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of ground area in plant shadow) during early growth.(0.01-0.20)",
    "!-------------------",
    "  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ratio (TotalDEF(Stalk) / STKWT(DAS-1,Stalk) at which stalk death occurs. ",
    "  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on a single day as a function of severe water stress 4 days earlier.  ",
    "!-------------------------------------------------",
    "  XDAY(6)          1    65    77    90   182   273     Days after planting corresponding to observed YSLA.    ",
    "  YSLA(6)        250   230   130    80    67    60     SLA measured at XDAY days after planting  (cm2/g)   ",
    "!----------------------------------------------------------------",
    "  XLI(6)         0.0    0.200    0.350     0.45     0.50     0.60        Light Interception fraction that controls tillering rate   ",
    "  YVTR(6)    0.01800  0.00870  0.00670  0.00350   0.0010   0.0000        Tillering Rate (Stalk / \xb0C-day) (Bezuidenhout et al 2003)",
    "!-------------------------------------------------------------------------  ",
    "  XVSHT(10)        0     7    11    14    17    20    24    28    31    50     Node (v-stage or VS) number, reference stalk    ",
    "  YVSHT(10)     0.65   4.0  12.1  14.4  15.0  14.5  12.5   6.0   1.5   0.7     Mature internode length, reference stalk (cm) ",
    "  ZVSDI(10)     3.60  3.50  3.30  3.10  2.90  2.70  2.30  1.70  1.20  0.70     Mature internode diameter, reference stalk (cm)",
    "  YVSWH(10)     0.34  0.52  3.04  5.57  6.90  4.07  3.14  2.23  0.34  0.07     Canopy width per node, reference stalk (cm)",
    "!-------------------------------------------------", "  XLFNUM(6)        0    13    16    24    29    36      Leaf number for calculation of potential leaf area",
    "  YLFSZ(6)         0   315   493   580   560   482      Area corresponding to leaf number for primary stalk (cm2)",
    "!------------------------------------------------------", "  XStkNum(8)       1    3    5   10   13   20   30   50     Tiller Number for calculation of potential leaf area ",
    "  YLfFac(8)      1.0  1.4  1.8  2.5  2.8  2.8  2.8  2.8     Factor for calculating tiller leaf sizes based on primary or other reference leaf sizes",
    "!-------------------------------------   ", "  XFRSU(4)      10.0  14.0  25.0  50.0    Node # for sugar deposition TABEX function            ",
    "  YFRSU(4)      .000  .005  .130  .650    Max sucrose accumulation as proportion of stalk dry weight, per stalk per day according to node #.              ",
    "!-------------------------------------   ", "  XSENMX(4)      3.0   5.0  10.0  45.0    Leaf number determining SENMAX",
    "  SENMAX(4)     .100  .020  .006  .002    Maximum proportion of total leaf weight as a function of LeafNum (XSENMX(I)) which can be senesced due to water stress. ",
    "  XShdMX(4)      0.0   5.0  45.0  50.0    Leaf number determining ShdMAX",
    "  ShdMAX(4)     .000  .010  .015  .017    Maximum proportion of total leaf weight as a function of LeafNum (XShdMX(I)) which can be senesced due to low-light stress.   ",
    "  XSTAGE(4)      0.0   5.0  12.0  45.0    Leaf number determining SENPOR",
    "  SENPOR(4)      0.0   0.0 .0080  .008    (not enabled) Proportion of leaf weight grown which will have been senesced by a given LeafNun (XSTAGE(I)) if no water stress has occurred prior to this LeafNum (XSTAGE(I)) -- normal vegetative senescence does not occur if prior water stress has already reduced leaf 0.0   0.0 .0080  .008",
    "  XTMIN(4)      -9.0  -7.0  -5.0   0.0    Minimum temperature (Deg C) ",
    "  YLOSS(4)      1.00  0.50  0.30  0.10    Proportion of live leaf weight senesced each day that minimum temp reaches corresponding XTMIN value.   ",
    "",
    "CA0001  (CP 80-1743; CP 88-1762)",
    "!-------------------",
    "  KCAN_ECO      0.80    Superseeds KCAN from .SPE file",
    "  SMAX            20    Maximum number of stalks a variety can yield per stubble or plant (limit 41)",
    "!-------------------",
    "  CAB              8    Number of leaves in spindle cluster at top of stalk (\"cabbage\").  In CASUPRO, stalk dry matter begins to accumulate only after CAB leaves have emerged. ",
    "  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-populated light interception zones full.",
    "  LfShdFac      0.35    Proportion of a stalk\x92s new leaf area that shades (displaces to the next lower zone) leaves on other stalks.",
    "  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of ground area in plant shadow) during early growth.(0.01-0.20)",
    "!-------------------",
    "  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ratio (TotalDEF(Stalk) / STKWT(DAS-1,Stalk) at which stalk death occurs. ",
    "  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on a single day as a function of severe water stress 4 days earlier.  ",
    "!-------------------------------------------------",
    "  XDAY(6)          1    65    77    90   182   273     Days after planting corresponding to observed YSLA.    ",
    "  YSLA(6)        250   230   130    80    67    60     SLA measured at XDAY days after planting  (cm2/g)   ",
    "!----------------------------------------------------------------",
    "  XLI(6)         0.0    0.200    0.350     0.45     0.50     0.60        Light Interception fraction that controls tillering rate   ",
    "  YVTR(6)    0.01800  0.00870  0.00670  0.00350   0.0010   0.0000        Tillering Rate (Stalk / \xb0C-day) (Bezuidenhout et al 2003)",
    "!-------------------------------------------------------------------------  ",
    "  XVSHT(10)        0     7    11    14    17    20    24    28    31    50     Node (v-stage or VS) number, reference stalk    ",
    "  YVSHT(10)     0.65   4.0  12.1  14.4  15.0  14.5  12.5   6.0   1.5   0.7     Mature internode length, reference stalk (cm) ",
    "  ZVSDI(10)     3.60  3.50  3.30  3.10  2.90  2.70  2.30  1.70  1.20  0.70     Mature internode diameter, reference stalk (cm)",
    "  YVSWH(10)     0.34  0.52  3.04  5.57  6.90  4.07  3.14  2.23  0.34  0.07     Canopy width per node, reference stalk (cm)",
    "!-------------------------------------------------",
    "  XLFNUM(6)        0    13    16    24    29    36      Leaf number for calculation of potential leaf area",
    "  YLFSZ(6)         0   315   493   580   560   482      Area corresponding to leaf number for primary stalk (cm2)",
    "!------------------------------------------------------",
    "  XStkNum(8)       1    3    5   10   13   20   30   50     Tiller Number for calculation of potential leaf area ",
    "  YLfFac(8)      1.0  1.4  1.8  2.5  2.8  2.8  2.8  2.8     Factor for calculating tiller leaf sizes based on primary or other reference leaf sizes",
    "!-------------------------------------   ",
    "  XFRSU(4)      10.0  14.0  25.0  50.0    Node # for sugar deposition TABEX function            ",
    "  YFRSU(4)      .000  .005  .130  .650    Max sucrose accumulation as proportion of stalk dry weight, per stalk per day according to node #.              ",
    "!-------------------------------------   ",
    "  XSENMX(4)      3.0   5.0  10.0  45.0    Leaf number determining SENMAX",
    "  SENMAX(4)     .100  .020  .006  .002    Maximum proportion of total leaf weight as a function of LeafNum (XSENMX(I)) which can be senesced due to water stress. ",
    "  XShdMX(4)      0.0   5.0  45.0  50.0    Leaf number determining ShdMAX",
    "  ShdMAX(4)     .000  .010  .015  .017    Maximum proportion of total leaf weight as a function of LeafNum (XShdMX(I)) which can be senesced due to low-light stress.   ",
    "  XSTAGE(4)      0.0   5.0  12.0  45.0    Leaf number determining SENPOR",
    "  SENPOR(4)      0.0   0.0 .0080  .008    (not enabled) Proportion of leaf weight grown which will have been senesced by a given LeafNun (XSTAGE(I)) if no water stress has occurred prior to this LeafNum (XSTAGE(I)) -- normal vegetative senescence does not occur if prior water stress has already reduced leaf 0.0   0.0 .0080  .008",
    "  XTMIN(4)      -9.0  -7.0  -5.0   0.0    Minimum temperature (Deg C) ",
    "  YLOSS(4)      1.00  0.50  0.30  0.10    Proportion of live leaf weight senesced each day that minimum temp reaches corresponding XTMIN value.   ",
    "", "CA0002   (CP 72-2086)",
    "!-------------------",
    "  KCAN_ECO      0.70    Superseeds KCAN from .SPE file",
    "  SMAX            25    Maximum number of stalks a variety can yield per stubble or plant (limit 41)",
    "!-------------------",
    "  CAB              8    Number of leaves in spindle cluster at top of stalk (\"cabbage\").  In CASUPRO, stalk dry matter begins to accumulate only after CAB leaves have emerged. ",
    "  CanLmtFac    0.013    Proportion of stalk leaf area moved up each day to keep de-populated light interception zones full.",
    "  LfShdFac      0.35    Proportion of a stalk\x92s new leaf area that shades (displaces to the next lower zone) leaves on other stalks.",
    "  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of ground area in plant shadow) during early growth.(0.01-0.20)",
    "!-------------------",
    "  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ratio (TotalDEF(Stalk) / STKWT(DAS-1,Stalk) at which stalk death occurs. ",
    "  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on a single day as a function of severe water stress 4 days earlier. ",
    "!-------------------------------------------------",
    "  XDAY(6)          1    65    77    90   182   273     Days after planting corresponding to observed YSLA.    ",
    "  YSLA(6)        250   230   130    80    67    60     SLA measured at XDAY days after planting  (cm2/g)   ",
    "!----------------------------------------------------------------",
    "  XLI(6)         0.0    0.200    0.350     0.45     0.50     0.60        Light Interception fraction that controls tillering rate",
    "  YVTR(6)    0.01800  0.00870  0.00670  0.00350   0.0000   0.0000        Tillering Rate (Stalk / \xb0C-day) (Bezuidenhout et al 2003)",
    "!-------------------------------------------------------------------------   ",
    "  XVSHT(10)        0     6    10    13    16    20    24    27    32    50     Node (v-stage or VS) number, reference stalk    ",
    "  YVSHT(10)     0.65   4.4   8.3  11.4  13.5  13.8  11.4   4.6   2.0   0.5     Mature internode length, reference stalk (cm) ",
    "  ZVSDI(10)     3.20  3.20  3.20  3.10  2.94  2.70  2.40  1.60  1.20  0.09     Mature internode diameter, reference stalk (cm)",
    "  YVSWH(10)     0.34  0.52  3.04  5.57  6.90  4.07  3.14  2.23  0.34  0.07     Canopy width per node, reference stalk (cm)",
    "!-------------------------------------------------",
    "  XLFNUM(6)        0     6    22    25    32    36      Leaf number for calculation of potential leaf area",
    "  YLFSZ(6)         0   150   510   535   515   500      Area corresponding to leaf number for primary stalk (cm2)",
    "!------------------------------------------------------",
    "  XStkNum(8)       1    3    5   10   13   20   30   50     Tiller Number for calculation of potential leaf area ",
    "  YLfFac(8)      1.0  1.3  1.6  2.0  2.0  1.4  1.1  0.8     Factor for calculating tiller leaf sizes based on primary or other reference leaf sizes",
    "!-------------------------------------   ",
    "  XFRSU(4)      10.0  14.0  25.0  50.0    Node # for sugar deposition TABEX function            ",
    "  YFRSU(4)      .000  .005  .130  .650    Max sucrose accumulation as proportion of stalk dry weight, per stalk per day according to node #.              ",
    "!-------------------------------------   ",
    "  XSENMX(4)      3.0   5.0  10.0  45.0    Leaf number determining SENMAX",
    "  SENMAX(4)     .100  .020  .006  .002    Maximum proportion of total leaf weight as a function of LeafNum (XSENMX(I)) which can be senesced due to water stress. ",
    "  XShdMX(4)      0.0   5.0  45.0  50.0    Leaf number determining ShdMAX",
    "  ShdMAX(4)     .000  .010  .015  .017    Maximum proportion of total leaf weight as a function of LeafNum (XShdMX(I)) which can be senesced due to low-light stress. ",
    "  XSTAGE(4)      0.0   5.0  12.0  45.0    Leaf number determining SENPOR",
    "  SENPOR(4)      0.0   0.0 .0080  .008    Proportion of leaf weight grown which will have been senesced by a given LeafNun (XSTAGE(I)) if no water stress has occurred prior to this LeafNum (XSTAGE(I)) -- normal vegetative senescence does not occur if prior water stress has already reduced leaf ",
    "  XTMIN(4)      -9.0  -7.0  -5.0   0.0    Minimum temperature (Deg C) ",
    "  YLOSS(4)      1.00  0.50  0.30  0.10    Proportion of live leaf weight senesced each day that minimum temp reaches corresponding XTMIN value.   ",
    "", "CA0003  (CP89-2143)",
    "!-------------------",
    "  KCAN_ECO      0.70    Superseeds KCAN from .SPE file",
    "  SMAX            25    Maximum number of stalks a variety can yield per stubble or plant (limit 41)",
    "!-------------------",
    "  CAB              8    Number of leaves in spindle cluster at top of stalk (\"cabbage\").  In CASUPRO, stalk dry matter begins to accumulate only after CAB leaves have emerged. ",
    "  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-populated light interception zones full.",
    "  LfShdFac      0.35    Proportion of a stalk\x92s new leaf area that shades (displaces to the next lower zone) leaves on other stalks.",
    "  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of ground area in plant shadow) during early growth.(0.01-0.20)",
    "!-------------------",
    "  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ratio (TotalDEF(Stalk) / STKWT(DAS-1,Stalk) at which stalk death occurs. ",
    "  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on a single day as a function of severe water stress 4 days earlier. ",
    "!-------------------------------------------------",
    "  XDAY(6)          1    65    77    90   182   273     Days after planting corresponding to observed YSLA.    ",
    "  YSLA(6)        250   230   130    80    67    60     SLA measured at XDAY days after planting  (cm2/g)   ",
    "!----------------------------------------------------------------",
    "  XLI(6)         0.0    0.200    0.350     0.45     0.50     0.60        Light Interception fraction that controls tillering rate ",
    "  YVTR(6)    0.01800  0.00870  0.00670  0.00350   0.0000   0.0000        Tillering Rate (Stalk / \xb0C-day) (Bezuidenhout et al 2003)",
    "!-------------------------------------------------------------------------   ",
    "  XVSHT(10)        0     4     8    13    19    22    26    29    32    50     Node (v-stage or VS) number, reference stalk    ",
    "  YVSHT(10)     0.65   3.0   7.0  10.6  12.5  12.0  10.0   5.0   4.1   1.0     Mature internode length, reference stalk (cm) ",
    "  ZVSDI(10)     3.20  3.20  3.20  3.10  2.94  2.70  2.40  2.00  1.70  1.20     Mature internode diameter, reference stalk (cm)",
    "  YVSWH(10)     0.51  0.78  4.56 8.355 10.35 6.105  4.71 3.345  0.51 0.105     Canopy width per node, reference stalk (cm)",
    "!-------------------------------------------------",
    "  XLFNUM(6)        0    11    14    23    32    36      Leaf number for calculation of potential leaf area",
    "  YLFSZ(6)         0   216   400   515   515   500      Area corresponding to leaf number for primary stalk (cm2)  ",
    "!------------------------------------------------------",
    "  XStkNum(8)       1    3    5   10   13   20   30   50     Tiller Number for calculation of potential leaf area ",
    "  YLfFac(8)      1.0  1.3  1.6  2.0  2.0  1.4  1.1  0.8     Factor for calculating tiller leaf sizes based on primary or other reference leaf sizes",
    "!-------------------------------------   ",
    "  XFRSU(4)      10.0  20.0  30.0  50.0    Node # for sugar deposition TABEX function            ",
    "  YFRSU(4)      .000  .040  .160  .670    Max sucrose accumulation as proportion of stalk dry weight, per stalk per day according to node #.              ",
    "!-------------------------------------   ",
    "  XSENMX(4)      3.0   5.0  10.0  45.0    Leaf number determining SENMAX",
    "  SENMAX(4)     .100  .020  .006  .002    Maximum proportion of total leaf weight as a function of LeafNum (XSENMX(I)) which can be senesced due to water stress. ",
    "  XShdMX(4)      0.0   5.0  45.0  50.0    Leaf number determining ShdMAX",
    "  ShdMAX(4)     .000  .010  .015  .017    Maximum proportion of total leaf weight as a function of LeafNum (XShdMX(I)) which can be senesced due to low-light stress. ",
    "  XSTAGE(4)      0.0   5.0  12.0  45.0    Leaf number determining SENPOR",
    "  SENPOR(4)      0.0   0.0 .0080  .008    Proportion of leaf weight grown which will have been senesced by a given LeafNun (XSTAGE(I)) if no water stress has occurred prior to this LeafNum (XSTAGE(I)) -- normal vegetative senescence does not occur if prior water stress has already reduced leaf ",
    "  XTMIN(4)      -9.0  -7.0  -5.0   0.0    Minimum temperature (Deg C) ",
    "  YLOSS(4)      1.00  0.50  0.30  0.10    Proportion of live leaf weight senesced each day that minimum temp reaches corresponding XTMIN value.   ",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SCSAM048.ECO")

  c("*SUGARCANE ECOTYPE COEFFICIENTS: SCSAM048 MODEL",
    "!",
    "! Crop Coefficients for the SAMUCA (Sugarcane) model",
    "! Scientific documentation in Appendix A of Vianna et al (2020): ",
    "! https://doi.org/10.1016/j.compag.2020.105361", "!",
    "! COEFF   \t\t   \tDEFINITIONS",
    "! =====   \t\t   \t===========",
    "! NS_LF_TIL     \tNumber of dry leaves to consider on canopy light ",
    "!\t\t\t\t\ttransmission (#/tiller)",
    "! N_LF_MAX_ILA  \tNumber of leaves when leaves appear at it maximum initial",
    "! \t\t\t\t\tarea (#/tiller)",
    "! TB0PHO        \tMinimum base temperature for photosynthesis (°C)",
    "! TB1PHO        \tOptimum temperature for photosynthesis (°C)",
    "! TB2PHO        \tOptimum temperature for photosynthesis (°C)",
    "! TBFPHO        \tMaximum base temperature for photosynhesis (°C)",
    "! TBPER         \tMinimum base temperature for plant expansion (°C)",
    "! TBMAX_PER     \tMaximum base temperature for plant expansion (°C)",
    "! LTTHRESHOLD   \tThreshold of light transmited through canopy to start ",
    "!\t\t\t\t\ttiller senescence (0-1)",
    "! FDEADLF       \tFraction of dryied leaves blade area considered on canopy ",
    "!\t\t\t\t\tlight transmission (0-1)",
    "! RDM           \tMaximum root depth (cm)",
    "! DPERCOEFF     \tMaximum plant expansion rate (mm/h)",
    "! RWUEP1        \tWater Stress Sensitivity of Photosynthesis (dml)",
    "! RWUEP2        \tWater Stress Sensitivity of Plant Expansion (dml)",
    "! T_MAX_WS_PHO  \tSupply/Demand ratio where water stress effect is maximum ",
    "!\t\t\t\t\tfor photosynthesis (0-1)",
    "! T_MID_WS_PHO  \tSupply/Demand ratio where half of maximum water stress ",
    "!\t\t\t\t\teffect (0.5) for photosynthesis occurs (0-1)",
    "! T_MIN_WS_PHO  \tSupply/Demand ratio where water stress effect on ",
    "!\t\t\t\t\tphotosynthesis onsets (0-1)",
    "! T_MAX_WS_EXP  \tSupply/Demand ratio where water stress effect is maximum ",
    "!\t\t\t\t\tfor expansion (0-1)",
    "! T_MID_WS_EXP  \tSupply/Demand ratio where half of maximum water stress ",
    "!\t\t\t\t\teffect (0.5) for expansionoccurs (0-1)",
    "! T_MIN_WS_EXP  \tSupply/Demand ratio where water stress effect on expansion",
    "!\t\t\t\t\tonsets (0-1)",
    "! FRAC_SUC_BG   \tSucrose fraction of total sugars of below ground ",
    "!\t\t\t\t\tinternode (0-1)",
    "! FRAC_HEX_BG   \tHexose fraction of total sugars of below ground ",
    "!\t\t\t\t\tinternode (0-1)",
    "! INIT_PD_RAT   \tInitial plant depth for ratooning cane (cm)",
    "! IT_STR_TB_INI \tMinimum base temperature for internode structural ",
    "!\t\t\t\t\tpartitioning (°C)",
    "! IT_STR_TO1    \tOptimum temperature for internode structural ",
    "!\t\t\t\t\tpartitioning (°C)",
    "! IT_STR_TO2    \tOptimum temperature for internode structural ",
    "!\t\t\t\t\tpartitioning (°C)",
    "! IT_STR_TB_END \tMaximum base temperature for internode structural ",
    "!\t\t\t\t\tpartitioning (°C)",
    "! IT_STR_PF_MAX \tMaximum biomass partitioning fraction to structural parts ",
    "!\t\t\t\t\tof internodes (0-1)",
    "! IT_STR_PF_MIN \tMinimum biomass partitioning fraction to structural parts ",
    "!\t\t\t\t\tof internodes (0-1)",
    "! IT_STR_PF_TB  \tThermal time for onset of biomass partitioning to internode",
    "!\t\t\t\t\tstructural parts (°Cdays)",
    "! IT_STR_PF_TM  \tThermal time where biomass partitioning to internodes ",
    "!\t\t\t\t\tstructural parts is at maximum (°Cdays)",
    "! IT_STR_PF_TE  \tThermal time for biomass partitioning to internodes ",
    "!\t\t\t\t\tstructural parts cessation (°Cdays)",
    "! IT_STR_PF_D   \tShape coefficient for biomass partitioning to internodes ",
    "!\t\t\t\t\tstrucutural parts (dml)",
    "! IT_STR_T_RED  \tMaximum reduction of internode structural partitioning ",
    "!\t\t\t\t\tdue to temperature (0-1)",
    "! IT_STR_W_RED  \tMaximum reduction of internode structural partitioning ",
    "!\t\t\t\t\tdue to water stress (0-1)",
    "! MAX_PER_IT    \tMaximum expansion rate of internodes (mm/day)",
    "! DSWAT_DDWS    \tWater weight increment per unit of structural biomass ",
    "!\t\t\t\t\tgain (d[H2O]/d[STR])",
    "! DSWAT_DSUC    \tWater weight decrease per unit of sugars biomass ",
    "!\t\t\t\t\tgain (d[H2O]/d[SUG])",
    "! HEX_MIN       \tMinimum hexoses fraction of total sugars in a growing ",
    "!\t\t\t\t\tinternode (g/g)",
    "! SUC_ACC_INI   \tInternode total sugars concentration where sucrose ",
    "!\t\t\t\t\taccumulation onsets (0-1)",
    "! DSUC_FRAC_TS  \tSucrose weight increment per unit of total sugars increment",
    "!\t\t\t\t\tin internodes (TSUG > suc_acc_ini) (d[SUC]/d[TSUG])",
    "! TT_CHUMAT_LT  \tThermal time required after peak of population for ",
    "!\t\t\t\t\ttillering stabilization (°Cdays)",
    "!",
    "@ECO#  ECO-NAME.........       NS_LF_TIL   N_LF_MAX_ILA         TB0PHO         TB1PHO         TB2PHO         TBFPHO          TBPER      TBMAX_PER    LTTHRESHOLD        FDEADLF            RDM      DPERCOEFF         RWUEP1         RWUEP2   T_MAX_WS_PHO   T_MID_WS_PHO   T_MIN_WS_PHO   T_MAX_WS_EXP   T_MID_WS_EXP   T_MIN_WS_EXP    FRAC_SUC_BG    FRAC_HEX_BG    INIT_PD_RAT  IT_STR_TB_INI     IT_STR_TO1     IT_STR_TO2  IT_STR_TB_END  IT_STR_PF_MAX  IT_STR_PF_MIN   IT_STR_PF_TB   IT_STR_PF_TM   IT_STR_PF_TE    IT_STR_PF_D   IT_STR_T_RED   IT_STR_W_RED     MAX_PER_IT     DSWAT_DDWS     DSWAT_DSUC        HEX_MIN    SUC_ACC_INI   DSUC_FRAC_TS   TT_CHUMAT_LT",
    "SC0001 RIDESA BRAZIL                 3.0           15.0           12.0           16.0           32.0           40.0           18.0           35.0            0.4           0.75          120.0           2.75            0.3            0.9            0.0            0.2            0.6            0.0            0.4            1.0            0.5            0.5           12.0           18.0           31.0           55.0           60.0           0.95            0.0            0.0           50.0          800.0            1.0           0.15           0.15            4.0       9.881798       11.24845          0.004           0.35            2.5         1600.0",
    "SC0002 SOUTH AFRICAN                 3.0           15.0           12.0           16.0           32.0           40.0           18.0           35.0            0.3           0.05          120.0           2.75            0.3            0.9            0.0            0.2            0.6            0.0            0.4            1.0            0.5            0.5           12.0           18.0           31.0           55.0           60.0           0.95            0.1            0.0           50.0          800.0            1.0           0.15           0.15            4.0      11.250000       13.50000          0.004           0.35            2.5         2600.0",
    "SC0003 SOUTH AFRICAN                 3.0           15.0           12.0           16.0           32.0           40.0           18.0           35.0            0.3           0.50          120.0           2.75            0.3            0.9            0.0            0.2            0.6            0.0            0.4            1.0            0.5            0.5           12.0           18.0           31.0           55.0           60.0           0.95            0.0            0.0           50.0          800.0            1.0           0.15           0.15            4.0       9.881798       11.24845          0.004           0.35            2.5         2000.0",
    "SC0004 RIDESA HIGHFIBER              3.0           15.0           12.0           16.0           32.0           40.0           18.0           35.0            0.4           0.75          120.0           2.75            0.3            0.9            0.0            0.2            0.6            0.0            0.4            1.0            0.5            0.5           12.0           18.0           31.0           55.0           60.0           0.99            0.2            0.0           50.0          800.0            1.0           0.15           0.15            4.0       9.881798       11.24845          0.004           0.35            2.5         1600.0",
    ""
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SCSAM048.ECO"

  `char_cols` <- c("ECO#", "ECO-NAME")
  expected_vals <- list(
    "ECO#" = c("SC0001", "SC0002", "SC0003", "SC0004"),
    "ECO-NAME" = c("RIDESA BRAZIL", "SOUTH AFRICAN", "SOUTH AFRICAN",
                   "RIDESA HIGHFIBER"),
    NS_LF_TIL = c(3, 3, 3, 3),
    N_LF_MAX_ILA = c(15, 15, 15, 15),
    TB0PHO = c(12, 12, 12, 12),
    TB1PHO = c(16, 16, 16, 16),
    TB2PHO = c(32, 32, 32, 32),
    TBFPHO = c(40, 40, 40, 40),
    TBPER = c(18, 18, 18, 18),
    TBMAX_PER = c(35, 35, 35, 35),
    LTTHRESHOLD = c(0.4, 0.3, 0.3, 0.4),
    FDEADLF = c(0.75, 0.05, 0.5, 0.75),
    RDM = c(120, 120, 120, 120),
    DPERCOEFF = c(2.75, 2.75, 2.75, 2.75),
    RWUEP1 = c(0.3, 0.3, 0.3, 0.3),
    RWUEP2 = c(0.9, 0.9, 0.9, 0.9),
    T_MAX_WS_PHO = c(0, 0, 0, 0),
    T_MID_WS_PHO = c(0.2, 0.2, 0.2, 0.2),
    T_MIN_WS_PHO = c(0.6, 0.6, 0.6, 0.6),
    T_MAX_WS_EXP = c(0, 0, 0, 0),
    T_MID_WS_EXP = c(0.4, 0.4, 0.4, 0.4),
    T_MIN_WS_EXP = c(1, 1, 1, 1),
    FRAC_SUC_BG = c(0.5, 0.5, 0.5, 0.5),
    FRAC_HEX_BG = c(0.5, 0.5, 0.5, 0.5),
    INIT_PD_RAT = c(12, 12, 12, 12),
    IT_STR_TB_INI = c(18, 18, 18, 18),
    IT_STR_TO1 = c(31, 31, 31, 31),
    IT_STR_TO2 = c(55, 55, 55, 55),
    IT_STR_TB_END = c(60, 60, 60, 60),
    IT_STR_PF_MAX = c(0.95, 0.95, 0.95, 0.99),
    IT_STR_PF_MIN = c(0, 0.1, 0, 0.2),
    IT_STR_PF_TB = c(0, 0, 0, 0),
    IT_STR_PF_TM = c(50, 50, 50, 50),
    IT_STR_PF_TE = c(800, 800, 800, 800),
    IT_STR_PF_D = c(1, 1, 1, 1),
    IT_STR_T_RED = c(0.15, 0.15, 0.15, 0.15),
    IT_STR_W_RED = c(0.15, 0.15, 0.15, 0.15),
    MAX_PER_IT = c(4, 4, 4, 4),
    DSWAT_DDWS = c(9.881798, 11.25, 9.881798, 9.881798),
    DSWAT_DSUC = c(11.24845, 13.5, 11.24845, 11.24845),
    HEX_MIN = c(0.004, 0.004, 0.004, 0.004),
    SUC_ACC_INI = c(0.35, 0.35, 0.35, 0.35),
    DSUC_FRAC_TS = c(2.5, 2.5, 2.5, 2.5),
    TT_CHUMAT_LT = c(1600, 2600, 2000, 1600))

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SFGRO048.ECO")

  c("*SAFFLOWER ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under long days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "",
    "!2/12/2019 - modified by K. Boote and K. Steberl, to go with modified spe and cul for 2 German cultivars and NM cultivar.",
    "!5/2/2023 - modified PL-EM to match lower soil temperature executable",
    "SF0401 New Mexico cult   04 01   0.0   4.5   6.0   0.0  05.0   0.0  0.35  10.0  26.0  7.00  1.00  0.75  0.75  .369  20.0  .035",
    "",
    "BW0001 Goldschopf        04 01   0.0   4.0   3.0   0.0  05.0   0.0  0.35  10.0  26.0 14.00  1.00   .75   .80  .369  20.0  .035",
    "BW0002 Thornless Saff    04 01   0.0   4.0   3.0   0.0  05.0   0.0  0.35  10.0  26.0 14.00  1.00  1.00  1.00  .369  20.0  .035",
    "") |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SFGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
  expected_vals <- list(`ECO#` = c("SF0401", "BW0001", "BW0002"),
                         `ECONAME` = c("New Mexico cult", "Goldschopf",
                                       "Thornless Saff"),
                         `MG` = c(4, 4, 4),
                         `TM` = c(1, 1, 1),
                         `THVAR` = c(0, 0, 0),
                         `PL-EM` = c(4.5, 4, 4),
                         `EM-V1` = c(6, 3, 3),
                         `V1-JU` = c(0, 0, 0),
                         `JU-R0` = c(5.0, 5.0, 5.0),
                         `PM06` = c(0, 0, 0),
                         `PM09` = c(0.35, 0.35, 0.35),
                         `LNGSH` = c(10, 10, 10),
                         `R7-R8` = c(26, 26, 26),
                         `FL-VS` = c(7, 14, 14),
                         `TRIFL` = c(1, 1, 1),
                         `RWDTH` = c(0.75, 0.75, 1),
                         `RHGHT` = c(0.75, 0.8, 1),
                         `R1PPO` = c(0.369, 0.369, 0.369
                         ),
                         `OPTBI` = c(20, 20, 20),
                         `SLOBI` = c(0.035, 0.035, 0.035
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

  input_file <- file.path(tempdir(), "SGCER048.ECO")

  c("*SORGHUM ECOTYPE COEFFICIENTS: SGCER048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul file)",
    "! ECONAME Name of the ecotype, which is referenced from the cultivar file",
    "! TBASE   Base temperature below which no development occurs (oC)",
    "! TOPT    Temperature at which maximum development occurs for vegetative stages (oC)",
    "! ROPT    Temperature at which maximum development occurs for reproductive stages (oC)",
    "! GDDE    Growing degree days per cm seed depth required for emergence (degree days/cm)",
    "! RUE     Radiation use efficiency (g plant dry matter/MJ PAR)",
    "! KCAN    Canopy light extinction coefficient for daily PAR",
    "! STPC    Partitioning to stem growth as a fraction of potential leaf growth",
    "! RTPC    Partitioning to root growth as a fraction of available carbohydrates",
    "! TILFC   Tillering factor (0.0 no tillering; 1.0 full tillering)",
    "! PLAM    Plant leaf area maximun (Initial leaf area)",
    "!",
    "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  GDDE   RUE  KCAN  STPC  RTPC TILFC  PLAM",
    "!                            1     2     3     4     5     6     7     8     9    10",
    "IB0001 GENERIC             8.0  34.0  34.0   6.0   3.2  0.85 0.100 0.250   0.0 6000.",
    "IB0002 West Africa        11.0  34.0  34.0   6.0   3.8  0.85 3.000 0.200   1.0 6000.",
    "DFAULT DEFAULT             8.0  34.0  34.0   6.0   3.2  0.85 0.100 0.250   1.0 6000.",
    "") |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "SUGRO048.ECO")

  c("*SUNFLOWER  ECOTYPE COEFFICIENTS: CRGRO048 MODEL       ",
    "!                                                                                                                                                    ",
    "! COEFF   DEFINITIONS                                                                                                                                                                                   ",
    "! =====   ===========                                                                                                                                                                                   ",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul                                                                                                                                   ",
    "!         file)                                                                                                                                                                                         ",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file                                                                                                                                      ",
    "! MG      Maturity group number for this ecotype, such as maturity                                                                                                                                      ",
    "!         group in soybean                                                                                                                                                                              ",
    "! TM      Indicator of temperature adaptation                                                                                                                                                           ",
    "! THVAR   Minimum rate of reproductive development under long days                                                                                                                                      ",
    "!         and optimal temperature                                                                                                                                                                       ",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)                                                                                                                                       ",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal                                                                                                                                 ",
    "!         days                                                                                                                                                                                          ",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,                                                                                                                                  ",
    "!         thermal days                                                                                                                                                                                  ",
    "! JU-R0   Time required for floral induction, equal to the minimum                                                                                                                                      ",
    "!         number of days for floral induction under optimal temperature and                                                                                                                             ",
    "!         daylengths, photothermal days                                                                                                                                                                 ",
    "! PM06    Proportion of time between first flower and first pod for                                                                                                                                     ",
    "!         first peg (peanut only)                                                                                                                                                                       ",
    "! PM09    Proportion of time between first seed and physiological                                                                                                                                       ",
    "!         maturity that the last seed can be formed                                                                                                                                                     ",
    "! LNGSH   Time required for growth of individual shells (photothermal                                                                                                                                   ",
    "!         days)                                                                                                                                                                                         ",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)                                                                                                                              ",
    "! FL-VS   Time from starburst to last leaf on main stem (photothermal                                                                                                                                ",
    "!         days).  Duration should be slightly less than FL-SD, to mimic determinate.                                                                                                                                                                                         ",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per                                                                                                                                      ",
    "!         thermal day)                                                                                                                                                                                  ",
    "! RWDTH   Relative width of this ecotype in comparison to the standard                                                                                                                                  ",
    "!         width per node (YVSWH) defined in the species file (*.SPE)                                                                                                                                    ",
    "! RHGHT   Relative height of this ecotype in comparison to the                                                                                                                                          ",
    "!         standard height per node (YVSHT) defined in the species file                                                                                                                                  ",
    "!         (*.SPE)                                                                                                                                                                                       ",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR                                                                                                                                 ",
    "!         both decrease with the same amount) (h)                                                                                                                                                       ",
    "! OPTBI   Minimum daily temperature above which there is no effect on                                                                                                                                   ",
    "!         slowing normal development toward flowering (oC). Soybean only                                                                                                                                             ",
    "! SLOBI   Slope of relationship reducing progress toward flowering if                                                                                                                                   ",
    "!         TMIN for the day is less than OPTBI.  Soybean only                                                                                                                                                           ",
    "!                                                                                                                                                                                                       ",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI                                                                          ",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16                                                                          ",
    "SU0702 MATURITY GROUP 7  07 01   0.0   3.0   1.0   0.0  05.0   0.0  0.35   8.0   4.0   9.5  0.80   0.6   1.2  .000   0.0  .000",
    "SU0703 EKLLOR   GROUP 1  07 01   0.0   4.8   1.0   0.0  05.0   0.0  0.35   8.0   4.0   9.5  0.80   0.6   1.2  .000   0.0  .000",
    "",
    "DFAULT DEFAULT           07 01   0.0   3.0   1.0   0.0  05.0   0.0  0.35   8.0   4.0   9.5  0.80   0.6   1.2  .000   0.0  .000",
    "", "                                                                                                                                                                                                      "
    ) |>
  write(input_file)

  actual <- DSSAT::read_eco(input_file)

  file.remove(input_file)

  info_prefix <- "read_eco() SUGRO048.ECO"

  `char_cols` <- c("ECO#", "ECONAME", "MG", "TM", "JU-R0")
  expected_vals <- list(`ECO#` = c("SU0702", "SU0703", "DFAULT"),
                         `ECONAME` = c("MATURITY GROUP 7",
                                       "EKLLOR   GROUP 1", "DEFAULT"),
                         `MG` = rep(7, 3),
                         `TM` = rep(1, 3),
                         `THVAR` = rep(0, 3),
                         `PL-EM` = c(3, 4.8, 3),
                         `EM-V1` = rep(1, 3),
                         `V1-JU` = rep(0, 3),
                         `JU-R0` = rep(5.0, 3),
                         `PM06` = rep(0, 3),
                         `PM09` = rep(0.35, 3),
                         `LNGSH` = rep(8, 3),
                         `R7-R8` = rep(4, 3),
                         `FL-VS` = rep(9.5, 3),
                         `TRIFL` = rep(0.8, 3),
                         `RWDTH` = rep(0.6, 3),
                         `RHGHT` = rep(1.2, 3),
                         `R1PPO` = rep(0, 3),
                         `OPTBI` = rep(0, 3),
                         `SLOBI` = rep(0, 3))

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

  input_file <- file.path(tempdir(), "SUOIL048.ECO")

  c("*SUNFLOWER ECOTYPE COEFFICIENTS: SUOIL048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! TBASE   Base temperature below which no development occurs, C",
    "! TOPT    Temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT    Temperature at which maximum development rate occurs for reproductive stages, C",
    "! P2O     Daylength below which daylength does not affect development rate, hours",
    "! DJTI    Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "!\t         is not photoperiod sensitive, days",
    "! GDDE    Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT   GDD from silking to effective grain filling period, C",
    "! RUE     Radiation use efficiency, g plant dry matter/MJ PAR",
    "! KCAN    Canopy light extinction coefficient for daily PAR.",
    "! TSEN    Critical temperature below which leaf damage occurs (default -3˚C)",
    "! CDAY    Number of cold days parameter (default 7 )",
    "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
    "!                            1     2    3     4     5     6     7     8      9    10    11",
    "!",
    "DFAULT DEFAULT             4.0 28.0  28.0  15.0   3.0   6.7   150.  2.2   1.00  -3.0     7",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "SWCER048.ECO")

  c("*SWEET CORN ECOTYPE COEFFICIENTS: SWCER048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! TBASE   Base temperature below which no development occurs, C",
    "! TOPT    Temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT    Temperature at which maximum development rate occurs for reproductive stages, C",
    "! P2O     Day length below which day length does not affect development rate, hours",
    "! DJTI    Minimum days from end of juvenile stage to tassel initiation if the cultivar",
    "!\t         is not photoperiod sensitive, days", "! GDDE    Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT   GDD from silking to effective grain filling period, C",
    "! RUE     Radiation use efficiency, g plant dry matter/MJ PAR",
    "! KCAN    Canopy light extinction coefficient for daily PAR.",
    "! TSEN    Critical temperature below which leaf damage occurs (default 6°C)",
    "! CDAY    Number of cold days parameter (default 15.0 )",
    "!",
    "@ECO#  ECONAME.........  TBASE  TOPT  ROPT   P20  DJTI  GDDE DSGFT   RUE  KCAN  TSEN  CDAY",
    "!                            1     2     3     4     5     6     7     8     9    10    11",
    "IB0001 GENERIC             8.0  34.0  34.0  12.5   4.0   6.0  170.   4.2  0.85",
    "DFAULT DEFAULT             8.0  34.0  34.0  12.5   4.0   6.0  170.   4.2  0.85",
    ""
    ) |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "TFAPS048.ECO")

  c("*TEF ECOTYPE COEFFICIENTS: TFAPS048 MODEL",
    "",
    "!                            1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36    37    38    39    40    41    42    43    44    45    46    47    48    49    50",
    "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  TTOP   P20  VREQ  GDDE DSGFT  RUE1  RUE2 KVAL1 KVAL2 SLAP2 TC1P1 TC1P2 DTNP1 PLGP1 PLGP2  P2AF  P3AF  P4AF  P5AF  P6AF ADLAI ADTIL ADPHO STEMN MXNUP MXNCR  WFNU PNUPR EXNO3 MNNO3 EXNH4 MNNH4 INGWT INGNC FREAR MNNCR GPPSS GPPES MXGWT MNRTN NOMOB RTDP1 RTDP2  FOZ1 SFOZ1  TSEN  CDAY",
    "IB0001 GENERIC             0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "IB0002 GENERIC             1.0  34.0  34.0  34.0  12.5   70.   6.0  170.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "IB0003 GENERIC             0.0  34.0  34.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "!Change TBASE from 0 to 7.8 C.                                                                                                                                                                                                                                                                              ",
    "!IB0004 TEF 1               7.8  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  2.47 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "!Remove vernalization requirement by seeting VREQ to 0                                                                                                                                                                                                                                                      ",
    "!IB0004 TEF 1               7.8  26.0  26.0  34.0  12.5    0.  10.2  200.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  2.47 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "!Increase TOPT and TTOP to 30 and 42 (same as values used in APSIM-Sorghum)                                                                                                                                                                                                                                 ",
    "IB0004 TEF 1               7.8  30.0  30.0  42.0  12.5    0.  10.2  200.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  2.47 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "DFAULT DEFAULT             0.0  34.0  34.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  2.47 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1",
    "                                                                                                                                                                                                                                                                                                            ",
    "!chp added this for test of optional temperature input for cold damage                                                                                                                                                                                                                                      ",
    "IB0099 Cold Hardy (test)   0.0  26.0  26.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1               0.5    20",
    "IB0098 Cold Sens. (test)   0.0  26.0  26.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.60  0.70 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1              10.0     5",
    "",
    "!TBASE - base temperature below which no development occurs, C",
    "!TOPT  - temperature at which maximum development rate occurs during vegetative stages, C",
    "!ROPT  - temperature at which maximum development rate occurs for reproductive stages, C (no effect, TFAPS)",
    "!TTOP  - temperature above which no development occurs, C",
    "!P2O   - Daylength below which daylength does not affect development rate, hours\t(no effect, TFAPS)",
    "!VREQ  - Vernalization required for max.development rate (VDays)",
    "!GDDE  - Growing degree days per cm seed depth required for emergence, GDD/cm",
    "!DSGFT - GDD from End Ear Growth to Start Grain Filling period, C",
    "!RUE1  - Pre-anthesis radiation use efficiency, g plant dry matter/MJ PAR      (no effect, TFAPS)",
    "!RUE2  - Post-anthesis radiation use efficiency, g plant dry matter/MJ PAR     (no effect, TFAPS)",
    "!KVAL1 - Pre-anthesis canopy light extinction coefficient for daily PAR      (no effect, TFAPS)",
    "!KVAL2 - Post-anthesis canopy light extinction coefficient for daily PAR     (no effect, TFAPS)",
    "!SLAP2 - ratio of leaf area to mass at end of leaf growth (cm2/g) ",
    "!TC1P1 - for calculating tc1: tiller number from emerg. to term. spik.(=stem elongation) ",
    "!TC1P2 - tc1 = tc1_p1 + tc1_p2 *cumph_nw(istage)", "!DTNP1 - for calculating dtiln: tiller number after term. spik.(=stem elongation)",
    "!PLGP1 - for calculating plag: potential leaf growth.  plag= plag_p1*cumph(istage)**plag_p2",
    "!PLGP2 - for calculating plag: potential leaf growth.  plag= plag_p1*cumph(istage)**plag_p2",
    "!P2AF  - threshold AD in a layer becoming effective on root growth",
    "!P3AF  - length of downwards root not effected under aeration deficit",
    "!P4AF  - days to be accumulated before aeration deficit effects root growth",
    "!P5AF  - power term at af1", "!P6AF  - days to be accumulated before aeration deficit effects crop growth",
    "!ADLAI - threshold aeration deficit (AF2) affecting LAI        (set to 1.0 for no stress run)",
    "!ADTIL - threshold aeration deficit (AF2) effecting tillering  (set to 1.0 for no stress run)",
    "!ADPHO - threshold aeration deficit (AF2) effecting photosyn.  (set to 1.0 for no stress run)",
    "!STEMN - 0=original C to grain translocation, >0 to 1.0 sets % of C of stem to be transloc. to grain",
    "!MXNUP - max N uptake per day", "!MXNCR - 0.035=20%,   .04=23% protein, max n:c ratio of grain growth",
    "!WFNU  - power term for water effect on N supply", "!PNUPR - potential uptake rate (mg/meter/day)",
    "!EXNO3 - exponent for NO3 supply factor", "!MNNO3 - minimum for NO3 supply factor",
    "!EXNH4 - exponent for NH4 supply factor", "!MNNH4 - minimum for NH4 supply factor",
    "!INGWT - initial grain weight  (mg/100 grains)", "!INGNC - % protein, initial grain N conc   (init_grain_nconc or p_init_grain_nconc from APSIM Nwheat)",
    "!FREAR - fraction between end ear and begin grainfilling, setting min stem weight for remobilisation",
    "!MNNCR - % protein, min n:c ratio of grain growth", "!GPPSS - gpp_start_stage - Grain per plant: 2=stem elong., 3=end leaf stage at which to start accumo. stem for gpp calc.",
    "!GPPES - gpp_end_stage - Start grainfilling stage at which to end accumulation stem for Grain per plant calc",
    "!MXGWT - maximum kernal weight  [100 = no effect]", "!MNRTN - min root n due to grain n initialisation [0 = off] (root_n_min or p_root_n_min from APSIM Nwheat)",
    "!NOMOB - fraction of accum stem weight that is not mobile [0 = original]",
    "!RTDP1 - sw effect, 0 = old version", "!RTDP2 - crop stress effect, 0 = old version",
    "!FOZ1  - (no effect, TFAPS) ozone effect rate on photosynthesis: 0.06 = ozone tolerant, 0.10 = intermediate, 0.50 = ozone sensitive",
    "!FOZ2  - (no effect, TFAPS) ozone effect initialization on photosynthesis (dependent on FOZ1): 1.015 = ozone tolerant, 1.025 = intermediate, 1.125 = ozone sensitive",
    "!SFOZ1 - (no effect, TFAPS) ozone effect rate on leaf senescence: 0.08 = ozone tolerant, 0.25 = intermediate, 0.40 = ozone sensitive",
    "!SFOZ2 - (no effect, TFAPS) ozone effect initialization on leaf senescence (dependent on SFOZ1): 0.80 = ozone tolerant, 0.38 = intermediate, 0.00 = ozone sensitive",
    "!TSEN  - Critical temperature below which leaf damage occurs (default 6°C)",
    "!CDAY  - cold days parameter (default 15.0)",
    "") |>
  write(input_file)

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
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNGSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f",
                       XMAGE = "%6.1f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "TMGRO048.ECO")

  c("*TOMATO ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFL   Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWDTH   Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "! XMAGE   Photothermal time required for Multi-harvest",
    "!",
    "@ECO#  ECONAME.......... MG TM THVAR PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNGSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI XMAGE",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17",
    "TM0001 SEMI-DETERMINATE  01 01   0.0   6.0  22.0   0.0  05.0   .55  0.75  39.0   0.0 24.50  0.45   1.0   1.0  .000  00.0  .000  10.0",
    "DFAULT DEFAULT TYPE      01 01   0.0   6.0  22.0   0.0  05.0   .55  0.75  39.0   0.0 24.50  0.45   1.0   1.0  .000  00.0  .000  10.0",
    "") |>
  write(input_file)

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
                       MG = "%2.0f", TM = "%3.0f", `PP-SS` = "%6.0f",
                       "PL-EM" = "%6.2f", "EM-V1" = "%6.1f",
                       "V1-JU" = "%6.0f", "JU-R0" = "%6.1f",
                       PM06 = "%6.2f", PM09 = "%6.2f", LNHSH = "%6.1f",
                       "R7-R8" = "%6.2f", "FL-VS" = "%6.2f",
                       TRIFL = "%6.2f", RWDTH = "%6.2f", RHGHT = "%6.2f",
                       R1PPO = "%6.3f", OPTBI = "%6.0f", SLOBI = "%6.3f"
  )

  `tier_info_expected` = NULL

  input_file <- file.path(tempdir(), "VBGRO048.ECO")

  c("*VELVETBEAN ECOTYPE COEFFICIENTS: CRGRO048 MODEL",
    "!",
    "! COEFF   DEFINITIONS",
    "! =====   ===========",
    "! ECO#    Code for the ecotype to which a cultivar belongs (see *.cul",
    "!         file)",
    "! ECONAME Name of the ecotype, which is referenced from *.CUL file",
    "! MG      Maturity group number for this ecotype, such as maturity",
    "!         group in soybean",
    "! TM      Indicator of temperature adaptation",
    "! THVAR   Minimum rate of reproductive development under short days",
    "!         and optimal temperature",
    "! PL-EM   Time between planting and emergence (V0) (thermal days)",
    "! EM-V1   Time required from emergence to first true leaf (V1), thermal",
    "!         days",
    "! V1-JU   Time required from first true leaf to end of juvenile phase,",
    "!         thermal days",
    "! JU-R0   Time required for floral induction, equal to the minimum",
    "!         number of days for floral induction under optimal temperature and",
    "!         daylengths, photothermal days",
    "! PM06    Proportion of time between first flower and first pod for",
    "!         first peg (peanut only)",
    "! PM09    Proportion of time between first seed and physiological",
    "!         maturity that the last seed can be formed",
    "! LNGSH   Time required for growth of individual shells (photothermal",
    "!         days)",
    "! R7-R8   Time between physiological (R7) and harvest maturity (R8) (days)",
    "! FL-VS   Time from first flower to last leaf on main stem (photothermal",
    "!         days)",
    "! TRIFOL  Rate of appearance of leaves on the mainstem (leaves per",
    "!         thermal day)",
    "! RWIDTH  Relative width of this ecotype in comparison to the standard",
    "!         width per node (YVSWH) defined in the species file (*.SPE)",
    "! RHGHT   Relative height of this ecotype in comparison to the",
    "!         standard height per node (YVSHT) defined in the species file",
    "!         (*.SPE)",
    "! SIZELF  The size of a normal upper node leaf (nodes 8 - 10) of",
    "!         variety I, used to adjust leaf area expansion during",
    "!         sink-limited phase of vegetative growth, i.e., prior to",
    "!         VSSINK nodes on the main stem (cm2/leaf)",
    "! R1PPO   Increase in daylength sensitivity after R1 (CSDVAR and CLDVAR",
    "!         both decrease with the same amount) (h)",
    "! OPTBI   Minimum daily temperature above which there is no effect on",
    "!         slowing normal development toward flowering (oC)",
    "! SLOBI   Slope of relationship reducing progress toward flowering if",
    "!         TMIN for the day is less than OPTBI",
    "!",
    "@ECO#  ECONAME.......... MG TM PP-SS PL-EM EM-V1 V1-JU JU-R0  PM06  PM09 LNHSH R7-R8 FL-VS TRIFL RWDTH RHGHT R1PPO OPTBI SLOBI",
    "!                                  1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16",
    "VB0001 MUCUNA GENERAL    08 01   0.0   2.0   4.0   0.0  05.0   0.0  0.35  25.0  21.0 90.00  0.30   1.0   1.0  .549  20.0  .000",
    "VB0002 MUCUNA Small      08 01   0.0   2.8   5.0   0.0  05.0   0.0  0.35  12.0  12.0 12.00  0.30   1.0   0.8  .549  20.0  .000",
    "!VB0001 MUCUNA GENERAL    08 01   0.0   3.0   4.0   0.0  05.0   0.0  0.35  25.0  21.0 90.00  0.30   1.0   1.0  .549  20.0  .000",
    "!VB0002 MUCUNA Small      08 01   0.0   3.8   5.0   0.0  05.0   0.0  0.35  12.0  12.0 12.00  0.30   1.0   0.8  .549  20.0  .000",
    "DFAULT DEFAULT           08 01   0.0   3.0   4.0   0.0  05.0   0.0  0.35  25.0  21.0 90.00  0.30   1.0   1.0  .549  20.0  .000",
    "") |>
  write(input_file)

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
    `PL-EM` = c(2, 2.8, 3),
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

  input_file <- file.path(tempdir(), "WHAPS048.ECO")

  c("*WHEAT ECOTYPE COEFFICIENTS: WHAPS048 MODEL",
    "!",
    "! COEFF       DEFINITIONS",
    "! =====       ===========",
    "! TBASE - base temperature below which no development occurs, C",
    "! TOPT  - temperature at which maximum development rate occurs during vegetative stages, C",
    "! ROPT  - temperature at which maximum development rate occurs for reproductive stages, C (no effect, WHAPS)",
    "! TTOP  - temperature above which no development occurs, C",
    "! P2O   - Daylength below which daylength does not affect development rate, hours\t(no effect, WHAPS)",
    "! VREQ  - Vernalization required for max.development rate (VDays)",
    "! GDDE  - Growing degree days per cm seed depth required for emergence, GDD/cm",
    "! DSGFT - GDD from End Ear Growth to Start Grain Filling period, C",
    "! RUE1  - Pre-anthesis radiation use efficiency, g plant dry matter/MJ PAR",
    "! RUE2  - Post-anthesis radiation use efficiency, g plant dry matter/MJ PAR",
    "! KVAL1 - Pre-anthesis canopy light extinction coefficient for daily PAR",
    "! KVAL2 - Post-anthesis canopy light extinction coefficient for daily PAR",
    "! SLAP2 - ratio of leaf area to mass at end of leaf growth (cm2/g) ",
    "! TC1P1 - for calculating tc1: tiller number from emerg. to term. spik.(=stem elongation)",
    "! TC1P2 - tc1 = tc1_p1 + tc1_p2 *cumph_nw(istage)",
    "! DTNP1 - for calculating dtiln: tiller number after term. spik.(=stem elongation)",
    "! PLGP1 - for calculating plag: potential leaf growth.  plag= plag_p1*cumph(istage)**plag_p2",
    "! PLGP2 - for calculating plag: potential leaf growth.  plag= plag_p1*cumph(istage)**plag_p2",
    "! P2AF  - threshold AD in a layer becoming effective on root growth",
    "! P3AF  - length of downwards root not effected under aeration deficit",
    "! P4AF  - days to be accumulated before aeration deficit effects root growth",
    "! P5AF  - power term at af1",
    "! P6AF  - days to be accumulated before aeration deficit effects crop growth",
    "! ADLAI - threshold aeration deficit (AF2) affecting LAI        (set to 1.0 for no stress run)",
    "! ADTIL - threshold aeration deficit (AF2) effecting tillering  (set to 1.0 for no stress run)",
    "! ADPHO - threshold aeration deficit (AF2) effecting photosyn.  (set to 1.0 for no stress run)",
    "! STEMN - 0=original C to grain translocation, >0 to 1.0 sets % of C of stem to be transloc. to grain",
    "! MXNUP - max N uptake per day",
    "! MXNCR - 0.035=20%,   .04=23% protein, max n:c ratio of grain growth",
    "! WFNU  - power term for water effect on N supply",
    "! PNUPR - potential uptake rate (mg/meter/day)",
    "! EXNO3 - exponent for NO3 supply factor",
    "! MNNO3 - minimum for NO3 supply factor",
    "! EXNH4 - exponent for NH4 supply factor",
    "! MNNH4 - minimum for NH4 supply factor",
    "! INGWT - initial grain weight  (mg/100 grain)",
    "! INGNC - % protein, initial grain N conc   (init_grain_nconc or p_init_grain_nconc from APSIM Nwheat)",
    "! FREAR - fraction between end ear and begin grainfilling, setting min stem weight for remobilisation",
    "! MNNCR - % protein, min n:c ratio of grain growth",
    "! GPPSS - gpp_start_stage - Grain per plant: 2=stem elong., 3=end leaf stage at which to start accumo. stem for gpp calc.",
    "! GPPES - gpp_end_stage - Start grainfilling stage at which to end accumulation stem for Grain per plant calc",
    "! MXGWT - maximum kernal weight  [100 = no effect]",
    "! MNRTN - min root n due to grain n initialisation [0 = off] (root_n_min or p_root_n_min from APSIM Nwheat)",
    "! NOMOB - fraction of accum stem weight that is not mobile [0 = original]",
    "! RTDP1 - sw effect, 0 = old version",
    "! RTDP2 - crop stress effect, 0 = old version",
    "! FOZ1  - ozone effect rate on photosynthesis: 0.06 = ozone tolerant, 0.10 = intermediate, 0.50 = ozone sensitive",
    "! FOZ2  - ozone effect initialization on photosynthesis (dependent on FOZ1): 1.015 = ozone tolerant, 1.025 = intermediate, 1.125 = ozone sensitive",
    "! SFOZ1 - ozone effect rate on leaf senescence: 0.08 = ozone tolerant, 0.25 = intermediate, 0.40 = ozone sensitive",
    "! SFOZ2 - ozone effect initialization on leaf senescence (dependent on SFOZ1): 0.80 = ozone tolerant, 0.38 = intermediate, 0.00 = ozone sensitive",
    "! TSEN  - Critical temperature below which leaf damage occurs (default 6°C)",
    "! CDAY  - cold days parameter (default 15.0)",
    "",
    "@ECO#  ECONAME.........  TBASE  TOPT  ROPT  TTOP   P20  VREQ  GDDE DSGFT  RUE1  RUE2 KVAL1 KVAL2 SLAP2 TC1P1 TC1P2 DTNP1 PLGP1 PLGP2  P2AF  P3AF  P4AF  P5AF  P6AF ADLAI ADTIL ADPHO STEMN MXNUP MXNCR  WFNU PNUPR EXNO3 MNNO3 EXNH4 MNNH4 INGWT INGNC FREAR MNNCR GPPSS GPPES MXGWT MNRTN NOMOB RTDP1 RTDP2  FOZ1 SFOZ1  TSEN  CDAY",
    "!                            1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32    33    34    35    36    37    38    39    40    41    42    43    44    45    46    47    48    49    50",
    "IB0001 GENERIC             0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2", "IB0002 GENERIC2            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2 and TC1P2", "IB0003 GENERIC3            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  1.00 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "IB0004 GENERIC4            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 225.0  2.50  1.00 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2 and P5AF", "IB0005 GENERIC5            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  3.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2, P2AF, and P5AF", "IB0006 GENERIC6            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.10  50.0  3.00  3.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2 and ADLAI", "IB0007 GENERIC7            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  0.70  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "!GENERIC with different SLAP2, P2AF, P5AF, and ADLAI", "IB0008 GENERIC8            0.0  26.0  26.0  34.0  12.5   50.  10.2  200.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.10  50.0  3.00  3.00  3.00  0.50  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "DFAULT DEFAULT             0.0  34.0  34.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.63  0.63 270.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08",
    "",
    "!chp added this for test of optional temperature input for cold damage",
    "IB0099 Cold Hardy (test)   0.0  26.0  26.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.63  0.63 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08   0.5    20",
    "IB0098 Cold Sens. (test)   0.0  26.0  26.0  34.0  12.5   50.   6.0  170.   3.8   3.8  0.63  0.63 300.0  2.50  0.60 0.005 1400.  0.60  0.60  50.0  3.00  1.00  3.00  1.00  1.00  1.00  0.00  0.60 0.040  2.00 0.450  6.75  0.00  6.50  0.00  3.50 0.030 0.250 1.230  2.00  5.00  55.0  4.50 0.250     1     1  0.06  0.08  10.0     5",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "WHCER048.ECO")

  c("$ECOTYPES:WHCER048.20200721   Last edit: 2020-07-21 CHP",
    "! ", "! COEFF   DEFINITION",
    "! =====   ==========",
    "! AWNS    Awn score (0-10;10=very long)",
    "! ECO#    Code for the ecotype (code)",
    "! GN%MN   Minimum grain N (%)",
    "! GN%S    Standard grain N (%)",
    "! HTSTD   Standard canopy height (cm)",
    "! KCAN    PAR extinction coefficient (#)",
    "! LA1S    Area of standard first leaf (cm2)",
    "! LAFR    Increase in potential area of leaves,reproductive phase (fr/leaf)",
    "! LAFV    Increase in potential area of leaves,vegetative phase (fr/leaf)",
    "! LARS    Area of standard reproductive phase leaf (cm2)",
    "! LAVS    Area of standard vegetative phase leaf (cm2)",
    "! LLIFE   Life of leaves during vegetative phase (phyllochrons)",
    "! LSPHE   Final leaf senescence ends (GrowhStage)",
    "! LSPHS   Final leaf senescence starts (GrowhStage)",
    "! P1      Duration of phase end juvenile to terminal spikelet (PVTU)",
    "! P2      Duration of phase terminal spikelet to end leaf growth (TU)",
    "! P2FR1   Duration of phase terminal spikelet to jointing (fr P2)",
    "! P3      Duration of phase end leaf growth to end spike growth (TU)",
    "! P4      Duration of phase end spike growth to end grain fill lag (TU)",
    "! P4FR1   Duration of phase end spike growth to anthesis (fr P4)",
    "! P4FR2   Duration of phase anthesis start to anthesis end (fr P4)",
    "! PARU2   PAR conversion to dm ratio,after last leaf (g/MJ) (If -99,set to PARUE)",
    "! PARUE   PAR conversion to dm ratio,before last leaf stage (g/MJ)",
    "! PHFn    Factor by which PHINTS is multiplied -> PHINT for phase (#)",
    "! PHLn    Leaf # produced during phyllochron phase (#) ",
    "! PPFPE   Daylength factor,pre emergence (#,0-1)",
    "! RDGS    Root depth growth rate,early phase (cm/standard d)",
    "! RS%S    Reserves part of assimilates going to stem (%)",
    "! SLAS    Specific leaf area,standard first leaf (cm2/g)",
    "! TDFAC   Tiller death factor (%/st.day when tiller wt 2xstandard wt)",
    "! TDPHE   Tiller death ending stage (GrowthStage)",
    "! TDPHS   Tiller death start stage (GrowthStage)",
    "! TIFAC   Tiller initiation (rate) factor (fr of phyllochron based) (#)",
    "! TIL#S   Tiller production starts (leaf #)",
    "! TIPHE   Tillering phase end stage (GrowthStage)",
    "! TKFH    Temperature at which killed when fully hardened (oC)",
    "! VEFF    Vernalization effect (Rate reduction when unvernalized (fr)",
    "! WFGU    Water stress factor,growth,upper (fr)",
    "! WFPU    Water stress factor,photosynthesis,upper (fr)",
    "!",
    "! Coefficients presented here differ from those used in DSSAT ",
    "! Version 3.5. They have been developed from 'parameters'",
    "! embedded in the code of the Ceres model,from the Cropsim model,",
    "! and from the literature. They are likely to change as more",
    "! experience is gained, and should not yet be taken as fixed.",
    "", "! In Ceres3.5, P1=400 for PHINT=95; P2=phint*3; P3=phint*2; P4=200,",
    "! with anthesis occurring in P4 after 80 units.",
    "",
    "*ECOTYPE:WHCER048",
    "!         ------PHENOLOGY(PHASE_DURATIONS)------ P.MOD --MAX_RUE--  LEAF PRODN  ------LEAF_SIZES------ LEAF_SENESC TILLER_PRODUCTION ---TILLER_DEATH-- ROOTS -----CANOPY------  ---COMPOSITION--  KILL                 ",
    "@ECO#     P1 P2FR1    P2    P3 P4FR1 P4FR2    P4  VEFF PARUE PARU2  PHL2  PHF3  LA1S  LAFV  LAFR  SLAS LSPHS LSPHE TIL#S TIPHE TIFAC TDPHS TDPHE TDFAC  RDGS HTSTD  AWNS  KCAN  RS%S  GN%S GN%MN  TKFH",
    "!          1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26    27    28    29    30    31    32",
    "!       oC.d    fr  oC.d  oC.d    fr    fr  oC.d    fr  g/MJ  g/MJ   Lf#   Fac   cm2 fr/lf fr/lf cm2/g GrStg GrStg   Lf# GrStg   Fac GrStg GrStg.  Fac  cm/d    cm Score   Exp     %     %     %    oC",
    "999991   100     0   100   100  0.15  0.05   100   0.0   1.0   1.0   4.0   1.0   1.0  0.01  0.10   100   4.0   5.5   2.5   2.0   0.5   1.5   2.0   0.0   1.0    60   0.0   .65    10   1.0   0.0   -10",
    "999992   500   .60   500   500  0.35  0.25   500   1.0   6.0   6.0   200   1.6  20.0  0.80  3.00   600   5.7   6.5   7.0   4.0   2.0   4.0   6.0  20.0   5.0   150  10.0   .95    60   3.5   6.0   -25",
    "                                                                                                                                                                                                      ",
    "DFAULT   200   .25   200   200  0.25  0.10   200   0.6   2.7   2.7    15   1.3   5.0  0.10  0.50   400   5.5   6.3   3.5   2.5   1.0   2.5   6.0   4.0   3.0   100   0.0   .85    30   3.0   0.0   -10",
    "                                                                                                                                                                                                      ",
    "CAWH01   362   .25   258   172   .25   .10   200   0.5   2.7   2.7    13   1.0   3.0  0.05  0.30   300   4.2   6.0   3.0   2.5   1.0   2.7   6.0   4.0   3.0   100   0.0   .85    30   3.0   2.0   -10",
    "USWH01   400   .25   285   190   .25   .10   200   1.0   2.3   2.3    13   1.0   2.0  0.15  0.01   400   5.1   6.5   4.5   2.0   0.8   2.2   6.0   4.0   3.0   100   5.0   .85    30   2.2   1.9   -20",
    "UKWH01   421   .25   300   200   .25   .10   200   0.5   2.7   2.7    13   1.0   2.0  0.10  0.30   485   5.7   6.3   4.5   2.0   0.5   2.2   6.0  20.0   3.0   100   0.0   .85    60   2.0   1.0   -15                                  ",
    "",
    "AZWH18   460   .25   328   219   .25   .10   200   0.6   2.7   2.7    13   1.0   2.0  0.15  0.50   400   5.3   6.5   4.5   2.0   0.8   2.2   6.0   4.0   3.0   100   5.0   .85    30   2.2   1.9   -20   ",
    "CI0001   400   .25   280   200   .25   .10   260   0.6   2.0   2.5    13   1.0  10.0  0.30  0.40   350   5.4   6.1   2.3  1.95   2.0   2.8   6.0   4.0   3.0   100   5.0   .85    30   2.2   1.9   -20   ",
    "",
    "TXWH01   400   .25   285   190   .25   .10   200   1.0   1.5   1.5    13   1.0   2.0  0.15  0.01   400   5.1   6.5   4.5   2.0   0.8   2.2   6.0   4.0   3.0   100   5.0   .85    30   2.2   1.9   -20",
    "TWKG01   421   .25   300   240   .25   .10   240   1.0   2.3   2.3    13   1.0   5.0  0.10  0.55   400   5.7   6.3   4.5   2.0   0.5   2.0   5.0   0.5   3.0   100   0.0   .85    60   2.0   0.0   -15",
    "") |>
  write(input_file)

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

  input_file <- file.path(tempdir(), "WHCRP048.ECO")

  c("$ECOTYPES:WHCRP048.20200721   Last edit: 2020-07-21 CHP",
    "!",
    "! COEFF   DEFINITION                                                                                                                                  ",
    "! =====   ==========                                                                                                                                  ",
    "! AWNS    Awn score (0-10;10=very long)                                                                                                               ",
    "! ECO#    Ecotype code (text)                                                                                                                         ",
    "! GM%H    Grain moisture percentage at harvest (%)",
    "! GN%MN   Minimum grain nitrogen (%)",
    "! GN%S    Standard grain nitrogen concentration (%)",
    "! HTSTD   Standard canopy height (cm)                                                                                                                 ",
    "! KCAN    PAR extinction coefficient (#)",
    "! LSENI   Leaf senescence,intermediate phases (%/standard day)               ",
    "! LSPHE   Leaf senescence (final) phase end stage (GrowthStage)                                                                                             ",
    "! LSPHS   Leaf senescence (final) phase start stage (GrowthStage)                                                                                             ",
    "! PARU2   PAR conversion factor,after change (g dry matter/MJ)                                                                                        ",
    "! PARUE   PAR conversion factor,standard (g dry matter/MJ)                                                                                            ",
    "! PHFn    Factor by which PHINTS multiplied -> PHINT for particular phase (#)",
    "! PHLn    Leaf # at end of phyllochron phase (ie,at which PHINT changes) (#) ",
    "! RDGS    Root depth growth rate,standard (cm/standard day)",
    "! RS%A    Reserves concentration in tops at start of anthesis (%)           ",
    "! SLAS    Specific leaf area,standard (cm2/g)                                                                                   ",
    "! SSPHE   Stem senescence (final) phase end stage (GrowthStage)                                                                                             ",
    "! SSPHS   Stem senescence (final) phase start stage (GrowthStage)                                                                                             ",
    "! TDFAC   Tiller death factor (%/st.day when tiller wt 2xstandard wt)",
    "! TDPHE   Tiller death phase end stage (GrowthStage)",
    "! TDPHS   Tiller death phase start stage (GrowthStage)",
    "! TDSF    Tiller death stress factor (#;0,2->no,full stress acceleration)",
    "! TIFAC   Tiller initiation (rate) factor (fr of phyllochron based) (#)",
    "! TIL#S   Tillering phase (production) start stage (leaf #)",
    "! TILPE   Tillering phase (production) end (GrowthStage)",
    "! TKFH    Cold tolerance when fully hardened (oC)",
    "!", "! Coefficients presented here differ from those used in previous",
    "! model versions. They have been developed by taking into account",
    "! the characteristics of a limited number of groups of cultivars.",
    "! The groupings are likely to change as more experience is gained,",
    "! and they should should not be taken as 'fixed'.",
    "",
    "! Users should be aware that some of the coefficients are likely",
    "! to vary from region to region,reflecting either an incomplete",
    "! understanding of the environmental physiology of wheat,or an",
    "! inadequate incorporation of aspects of current understanding.",
    "! For example,PARUE may vary from region to region,possibly",
    "! because of variation in the proportion of diffuse radiation",
    "! in the incoming solar and sky components,or because of ",
    "! differences in the contribution of photosynthetic surfaces ",
    "! not accounted for in the model (eg.awns,peduncles),or even",
    "! because of differences in disease intensities.",
    "",
    "*ECOTYPE:WHCRP047",
    "!                        --MAX_RUE--  LEAF_APPEARANCE,AREA/WT,SENESCENCE TILLER_PRODUCTION ------TILLER_DEATH----- ROOTS -----CANOPY------  ------COMPOSITION-----  KILL STEM_SENECE",
    "@ECO#  ECONAME.......... PARUE PARU2  PHL2  PHF3  SLAS LSENI LSPHS LSPHE TIL#S TILPE TIFAC TDPHS TDPHE TDFAC  TDSF  RDGS HTSTD  AWNS  KCAN  RS%A  GN%S GN%MN  GM%H  TKFH SSPHS SSPHE",
    "!                            1     2     3     4     5     6     7     8     9    10    11    12    13    14    15    16    17    18    19    20    21    22    23    24    25    26 ",
    "!                         g/MJ  g/MJ   Lf#   Fac cm2/g   %/d GrStg GrStg   Lf# GrStg   Fac GrStg GrStg   Fac   Fac  cm/d    cm Score   Exp     %     %     %     %    oC GrStg GrStg  ",
    "999991 MINIMA              1.0   1.0   4.0   1.0   100    .1   5.0   5.0   2.0   2.0   0.1   1.5   4.5   0.1  0.00   1.0    50     0  0.65     5   1.0   0.5   0.0   -10   5.0   7.0  ",
    "999992 MAXIMA              4.0   4.0   200   1.6   600   2.5   8.5   9.5   5.0   5.0   1.0   3.5   8.0  15.0  2.00   5.0   150  10.0  0.95    30   4.0   2.5  25.0   -30   8.5   9.5  ",
    "                                                                                                                                                                                    ",
    "DFAULT DEFAULT             2.7   2.7    12   1.3   400   1.5   8.0   9.2   4.0   3.0   1.0   3.0   7.0   5.0  1.00   3.0   100   5.0  0.85    15   2.0   1.5  15.0   -15   8.0   9.3",
    "",
    "CA0001 CANADA(SPRING)      2.7   2.7   200   1.0   300    .3   5.5   9.0   3.0   3.5   1.0   3.7   9.0   4.0  1.00   3.0   100   0.0  0.85    15   4.0   1.5  15.0    -8   8.7   9.4",
    "US0001 USA(WINTER)         2.5   2.7   200   1.0   400   1.5   8.3   9.3   4.5   3.0   0.8   3.2   9.0   4.0  1.00   4.0   100   5.0  0.85    10   2.3   1.7   8.0   -30   8.3   8.5",
    "UK0001 UK(MFUNDIN)         2.7   2.7    15   1.5   485    .3   8.7   9.2   4.5   3.0   0.2   3.0   9.0  12.0  1.00   3.0   100   0.0  0.85    25   2.5   1.0  15.0   -10   8.5   9.7",
    "") |>
  write(input_file)

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

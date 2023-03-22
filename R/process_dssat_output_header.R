#' Extracts run number, model code, experiment code, treatment number and data
#' headline from DSSAT output header
#'
#' @keywords internal
#'
#' @param raw_lines a character vector that includes the contents
#' of a single tier of data (including version stamp and header
#' information) from a DSSAT output file
#'
#' @return a list containing the data headline, model code, experiment code,
#' treatment number, and run number extracted from the raw output
#'
#' @importFrom stringr str_which str_subset str_extract str_remove str_sub
#'
#' @examples
#'
#' sample_data_tier <- c(
#' "*DSSAT Cropping System Model Ver. 4.6.0.030 -forage       MAR 27, 2014; 06:11:48",
#' "",
#' "*RUN   1        : 0 KG N/HA                 PRFRM046 UFGA0601    1              ",
#' "MODEL          : PRFRM046 - Tifton 85 bermud                                   ",
#' "EXPERIMENT     : UFGA0601 G0 NITROGEN RESPONSE OF TIFTON 85 BERMUDAGRASS REGROW",
#' "DATA PATH      :                                                               ",
#' "  TREATMENT  1   : 0 KG N/HA                 PRFRM046                            ",
#' "",
#' "",
#' "!                          Soil evaporation (mm/d) by soil depth (cm):",
#' "!                          0-5    5-15   15-23   23-32   32-41   41-51   51-61   61-71",
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046")
#'
#' DSSAT:::process_dssat_output_header(sample_data_tier)

process_dssat_output_header <- function(raw_lines){

  # Find header line
  skip <- str_which(raw_lines,'^@') %>%
    min()

  # Extract model code
  model <- raw_lines[1:skip] %>%
    str_subset('MODEL') %>%
    str_extract(' : [^ ]+') %>%
    str_remove(' : ')

  # Extract experiment code
  experiment <- raw_lines[1:skip] %>%
    str_subset('EXPERIMENT') %>%
    str_extract(' : [^ ]+') %>%
    str_remove(' : ')

  # Extract treatment number
  trtno <- raw_lines[1:skip] %>%
    str_subset('TREATMENT') %>%
    str_extract('TREATMENT *[^ ]+ ') %>%
    str_remove('TREATMENT *') %>%
    as.integer()

  # Extract run number
  runno <- raw_lines[1:skip] %>%
    str_subset('^\\*RUN') %>%
    str_sub(6,8) %>%
    as.integer()

  return(list(model=model,experiment=experiment,trtno=trtno,runno=runno))
}

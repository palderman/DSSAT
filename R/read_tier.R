#' Reads and combines data and header information from a single tier of a DSSAT
#' output file
#'
#' @export
#'
#' @inheritParams read_tier_data
#'
#' @param raw_lines a character vector that includes the contents
#' of a single tier of data (including headline, but excluding version
#'  stamp and other header information) from a DSSAT output file
#'
#' @inheritParams read_dssat
#'
#' @param store_v_fmt a logical value indicating whether or not to store the
#' format for variables being read
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom dplyr "%>%" mutate select everything
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
#' read_tier(sample_data_tier)

read_tier <- function(raw_lines,col_types=NULL,col_names=NULL,na_strings=NULL,
                      left_justified='EXCODE',guess_max=1000,store_v_fmt=TRUE,
                      read_only = NULL){

  # Extract header information
  header_info <- suppressWarnings({
      process_dssat_output_header(raw_lines)
    })

  # Read data from tier
  tier_data <- read_tier_data(raw_lines,
                              col_types=col_types,
                              col_names=col_names,
                              left_justified=left_justified,
                              na_strings = na_strings,
                              store_v_fmt = store_v_fmt,
                              read_only = read_only)

  # To prevent "no visible binding for global variable" from R CMD check for select()
  # statement below:
  EXPERIMENT <- MODEL <- RUN <- TRNO <- DATE <- NULL

  # Combine header information and data
  if(length(header_info$runno)>0){
    tier <- tier_data %>%
      mutate(EXPERIMENT=header_info$experiment,
             MODEL=header_info$model,
             TRNO = header_info$trtno,
             RUN = header_info$runno) %>%
      select(EXPERIMENT,MODEL,RUN,TRNO,DATE,everything())
    return(tier)
  }else{
    return(tier_data)
  }

}

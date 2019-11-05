#' Reads data from a single DSSAT output file
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @examples
#'
#' sample_output <- c(
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
#' "!                          0-5    5-15   15-23   23-32   32-41   41-51   51-61   61-71   71-81  81-213",
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035   0.032   0.639",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036   0.033   0.662",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046   0.042   0.843",
#' "",
#' "*DSSAT Cropping System Model Ver. 4.6.0.030 -forage       MAR 27, 2014; 06:11:48",
#' "",
#' "*RUN   2        : 45 KG N/HA                 PRFRM046 UFGA0601    1              ",
#' "MODEL          : PRFRM046 - Tifton 85 bermud                                   ",
#' "EXPERIMENT     : UFGA0601 G0 NITROGEN RESPONSE OF TIFTON 85 BERMUDAGRASS REGROW",
#' "DATA PATH      :                                                               ",
#' "  TREATMENT  2   : 45 KG N/HA                 PRFRM046                            ",
#' "",
#' "",
#' "!                          Soil evaporation (mm/d) by soil depth (cm):",
#' "!                          0-5    5-15   15-23   23-32   32-41   41-51   51-61   61-71   71-81  81-213",
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035   0.032   0.639",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036   0.033   0.662",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046   0.042   0.843")
#'
#'write(sample_output,'SAMPLE.OUT')
#'
#' read_output('SAMPLE.OUT')

read_output <- function(file_name,col_types=NULL,col_names=NULL,left_justified=NULL){

  col_types <- cols(` TNAME\\.*`=col_character(),
                    ` TNAM\\.*`=col_character(),
                    ` EXNAME\\.*`=col_character(),
                    ` FNAM\\.*`=col_character(),
                    ` WSTA\\.*`=col_character(),
                    ` SOIL_ID\\.*`=col_character(),
                    ` MODEL\\.*`=col_character()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}

  left_justified <- left_justified %>%
    c(.,' TNAME\\.*',' TNAM\\.*',' EXNAME\\.*',' FNAM\\.*',' WSTA\\.*',
      ' SOIL_ID\\.*',' MODEL\\.*')

  col_names <- col_names %>%
    c(.,
      ' +S(?= |$)',' +O(?= |$)',' +C(?= |$)',' +CR(?= |$)')

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Find beginning of each section
  begin <- raw_lines %>%
    str_which('^\\*DSSAT')

  if(length(begin)==0) begin <- 1

  # Calculate end of each section based on beginning of next section
  end <- c(begin[-1]-1,length(raw_lines))

  # Read each section of output file
  output <- map(1:length(begin),
                   ~read_tier(raw_lines[begin[.]:end[.]],
                              col_types = col_types,
                              col_names = col_names,
                              left_justified = left_justified,
                              store_v_fmt = FALSE)) %>%
    reduce(combine_tiers) %>%
    as_DSSAT_tbl()

  return(output)
}

#' Reads soil parameters from a single DSSAT soil parameter file (*.SOL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @examples
#'
#' sample_sol <- c(
#' "*SOILS: General DSSAT Soil Input File",
#' "! DSSAT v4.7; 09/01/2017",
#' "*IB00000001  IBSNAT      SIC     210 DEFAULT - DEEP SILTY CLAY",
#' "@SITE        COUNTRY          LAT     LONG SCS FAMILY",
#' " Generic     Generic          -99      -99 Generic",
#' "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE",
#' "   -99  0.11   6.0  0.30  85.0  1.00  1.00 IB001 IB001 IB001",
#' "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB  SCEC  SADC",
#' "     5   -99 0.228 0.385 0.481 1.000   -99  1.30  1.75  50.0  45.0   0.0 0.170   6.5   -99   -99   -99",
#' "    15   -99 0.228 0.385 0.481 1.000   -99  1.30  1.75  50.0  45.0   0.0 0.170   6.5   -99   -99   -99",
#' "    30   -99 0.249 0.406 0.482 0.638   -99  1.30  1.60  50.0  45.0   0.0 0.170   6.5   -99   -99   -99",
#' "    45   -99 0.249 0.406 0.465 0.472   -99  1.35  1.45  50.0  45.0   0.0 0.140   6.5   -99   -99   -99",
#' "    60   -99 0.249 0.406 0.465 0.350   -99  1.35  1.45  50.0  45.0   0.0 0.140   6.5   -99   -99   -99",
#' "    90   -99 0.308 0.456 0.468 0.223   -99  1.35  1.10  50.0  45.0   0.0 0.110   6.5   -99   -99   -99",
#' "   120   -99 0.207 0.341 0.452 0.122   -99  1.40  0.65  50.0  45.0   0.0 0.060   6.5   -99   -99   -99",
#' "   150   -99 0.243 0.365 0.455 0.067   -99  1.40  0.30  50.0  45.0   0.0 0.030   6.5   -99   -99   -99",
#' "   180   -99 0.259 0.361 0.457 0.037   -99  1.40  0.10  50.0  45.0   0.0 0.010   6.5   -99   -99   -99",
#' "   210   -99 0.259 0.361 0.457 0.020   -99  1.40  0.01  50.0  45.0   0.0 0.000   6.5   -99   -99   -99")
#'
#' write(sample_sol,'SOIL.SOL')
#'
#' read_sol('SOIL.SOL')

read_sol <- function(file_name,col_types=NULL,col_names=NULL,id_soil=NULL){

  # Load required packages
  require(dplyr)
  require(stringr)
  require(purrr)

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Find beginning of each soil profile
  begin <- raw_lines %>%
    str_which('^\\*(?!SOILS)')
  if(length(begin)==0) begin <- 1

  if(is.null(id_soil)){
    # Calculate end of each section based on beginning of next section
    end <- c(begin[-1]-1,length(raw_lines))
  }else{

    # Find index for profile id_soil
    id_soil_ind <- str_c('^\\*',id_soil) %>%
      str_which(raw_lines,.)

    # Find start of next soil profile
    end <- begin[begin>id_soil_ind] %>%
      {first(.)-1}

    # Handle case where id_soil is last profile in file
    if(is.null(end)||is.na(end)){
      end <- length(raw_lines)
    }

    begin <- id_soil_ind
  }

  # Extract all profiles
  all_tiers <- map(1:length(begin),
                  ~read_soil_profile(raw_lines[begin[.]:end[.]]))

  return(all_tiers)
}

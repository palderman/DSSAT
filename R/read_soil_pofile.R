#' Reads a single DSSAT formatted soil profile from a raw character vector
#'
#' @export
#'
#' @inheritParams read_tier
#'
#' @return a list containing tibbles for each tier of a DSSAT formatted
#'  soil profile
#'
#' @examples
#'
#' sample_sol <- c(
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
#' read_soil_profile(sample_sol)
#'

read_soil_profile <- function(raw_lines){

  # Read general information
  gen_info <- raw_lines %>%
    str_subset('^\\*') %>%
    str_sub(c( 2,14,26,32,38),
            c(11,24,30,36,87)) %>%
    str_replace_all(c('^  *'='',
                      '  *$'='')) %>%
  as.list() %>%
    {names(.) <- c("PEDON","SOURCE","TEXTURE","DEPTH","DESCRIPTION")
    .} %>%
    as_tibble()

  # Read first tier
  # tier_1 <- raw_lines %>%
  #   str_which('^@') %>%
  #   first() %>%
  #   {raw_lines[.+1]} %>%
  #   str_sub(c( 2,14,26,35,44),
  #           c(12,24,33,42,93)) %>%
  #   str_replace_all(c('^  *'='',
  #                     '  *$'='')) %>%
  #   as.list() %>%
  #   {names(.) <- c("SITE","COUNTRY","LAT","LONG","SCS FAMILY")
  #   .} %>%
  #   as_tibble()

  tier_begin <- str_which(raw_lines,'^@')

  # Calculate end of each data tier based on beginning of next tier
  tier_end <- c(tier_begin[-1]-1,length(raw_lines))

  # Read data from tier
  tier_data <- map(1:length(tier_begin),
                   ~read_tier_data(raw_lines[tier_begin[.]:tier_end[.]],
                                   left_justified = c('SITE',
                                                      'SCS FAMILY'),
                                   col_types = cols(LAT=col_double(),
                                                    SSAT=col_double())))
  attr(tier_data,'gen_info') <- gen_info

  return(tier_data)
}

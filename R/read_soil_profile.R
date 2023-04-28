#' Reads a single DSSAT formatted soil profile from a raw character vector
#'
#' @export
#'
#' @inheritParams read_tier
#'
#' @return a list containing tibbles for each tier of a DSSAT formatted
#'  soil profile
#'
#' @importFrom dplyr "%>%" as_tibble mutate rename_all group_by
#' @importFrom readr cols col_double col_character
#' @importFrom stringr str_subset str_sub str_replace_all str_which
#' @importFrom purrr map reduce
#'
#' @examples
#'
#' sample_sol <- c(
#' "*IB00000001  IBSNAT      SIC     210 DEFAULT - DEEP SILTY CLAY",
#' "@SITE        COUNTRY          LAT     LONG SCS FAMILY",
#' " Generic     Generic          -99      -99 Generic",
#' "@ SCOM  SALB  SLU1  SLDR  SLRO  SLNF  SLPF  SMHB  SMPX  SMKE",
#' "   -99  0.11   6.0  0.30  85.0  1.00  1.00 IB001 IB001 IB001",
#' "@  SLB  SLMH  SLLL  SDUL  SSAT  SRGF  SSKS  SBDM  SLOC  SLCL  SLSI  SLCF  SLNI  SLHW  SLHB",
#' "     5   -99 0.228 0.385 0.481 1.000   -99  1.30  1.75  50.0  45.0   0.0 0.170   6.5   -99",
#' "    15   -99 0.228 0.385 0.481 1.000   -99  1.30  1.75  50.0  45.0   0.0 0.170   6.5   -99",
#' "    30   -99 0.249 0.406 0.482 0.638   -99  1.30  1.60  50.0  45.0   0.0 0.170   6.5   -99",
#' "    45   -99 0.249 0.406 0.465 0.472   -99  1.35  1.45  50.0  45.0   0.0 0.140   6.5   -99",
#' "    60   -99 0.249 0.406 0.465 0.350   -99  1.35  1.45  50.0  45.0   0.0 0.140   6.5   -99",
#' "    90   -99 0.308 0.456 0.468 0.223   -99  1.35  1.10  50.0  45.0   0.0 0.110   6.5   -99",
#' "   120   -99 0.207 0.341 0.452 0.122   -99  1.40  0.65  50.0  45.0   0.0 0.060   6.5   -99",
#' "   150   -99 0.243 0.365 0.455 0.067   -99  1.40  0.30  50.0  45.0   0.0 0.030   6.5   -99",
#' "   180   -99 0.259 0.361 0.457 0.037   -99  1.40  0.10  50.0  45.0   0.0 0.010   6.5   -99",
#' "   210   -99 0.259 0.361 0.457 0.020   -99  1.40  0.01  50.0  45.0   0.0 0.000   6.5   -99")
#'
#' read_soil_profile(sample_sol)
#'

read_soil_profile <- function(raw_lines, left_justified=NULL,
                              col_types=NULL, col_names=NULL){

  left_justified <- left_justified %>%
    c('SITE','COUNTRY',' SCS FAMILY',
      ' SCS Family')

  col_types <- cols(`      LAT`=col_double(),
                    `     LONG`=col_double(),
                    SSAT=col_double(),
                    ` SCS FAMILY`=col_character(),
                    ` SCS Family`=col_character(),
                    SCOM=col_character(),
                    COUNTRY=col_character(),
                    SITE=col_character(),
                    SMHB=col_character(),
                    SMPX=col_character(),
                    SMKE=col_character(),
                    SLMH=col_character(),
                    SLBS=col_double(),
                    SLB=col_double()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}


  # Read general information
  gen_info <- raw_lines %>%
    str_subset('^\\*') %>%
    read_sol_gen_info()

  attr(gen_info,'v_fmt') <- c('*%-10s','  %-11s',' %-5s','%6.0f',' %-s') %>%
    {names(.) <- colnames(gen_info)
    .}

  tier_begin <- str_which(raw_lines,'^@')

  # Calculate end of each data tier based on beginning of next tier
  tier_end <- c(tier_begin[-1]-1,length(raw_lines))

  # To prevent "no visible binding for global variable" from R CMD check for group_by()
  # statement below:
  PEDON <- SOURCE <- TEXTURE <- DEPTH <- DESCRIPTION <-
    SITE <- COUNTRY <- LAT <- LONG <- `SCS FAMILY` <-
    SCOM <- SALB <- SLU1 <- SLDR <- SLRO <- SLNF <- SLPF <- SMHB <- SMPX <- SMKE <- NULL

  # Read data from tier
  tier_data <- map(1:length(tier_begin),
                   ~read_tier_data(raw_lines[tier_begin[.]:tier_end[.]],
                                   left_justified = left_justified,
                                   col_types = col_types,
                                   col_names = col_names)) %>%
    c(list(gen_info),.) %>%
    reduce(combine_tiers) %>%
    rename_all(toupper) %>%
    {v_fmt <- attr(.,'v_fmt')
     names(v_fmt) <- toupper(names(v_fmt))
     attr(.,'v_fmt') <- v_fmt
     tier_info <- attr(.,'tier_info')
     tier_info <- map(tier_info,toupper)
     attr(.,'tier_info') <- tier_info
     .} %>%
    group_by(PEDON,SOURCE,TEXTURE,DEPTH,DESCRIPTION,
             SITE,COUNTRY,LAT,LONG,`SCS FAMILY`,
             SCOM,SALB,SLU1,SLDR,SLRO,SLNF,SLPF,SMHB,SMPX,SMKE) %>%
    collapse_rows() %>%
    ungroup()

#  attr(tier_data,'gen_info') <- gen_info

  return(tier_data)
}

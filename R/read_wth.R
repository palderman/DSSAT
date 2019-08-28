#' Reads weather input data from a single DSSAT weather file (*.WTH)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @examples
#'
#' sample_wth <- c(
#' "*WEATHER DATA : Gainesville,Florida,USA",
#' "",
#' "@ INSI      LAT     LONG  ELEV   TAV   AMP REFHT WNDHT",
#' "  UFGA   29.630  -82.370    10  21.3  13.0   2.0   3.0",
#' "@DATE  SRAD  TMAX  TMIN  RAIN  DEWP  WIND   PAR  EVAP  RHUM",
#' "06001   7.6  26.8  14.1   0.5                          ",
#' "06002   9.5  27.8  19.4   0.5                          ",
#' "06003   6.1  24.9  11.7   0.0                          ",
#' "06004  12.5  21.8   6.6   0.0                          ",
#' "06005  12.3  22.3   7.5   0.0                          ")
#'
#' write(sample_wth,'EXAMPLE.WTH')
#'
#' read_wth('EXAMPLE.WTH')

read_wth <- function(file_name,col_types=NULL,col_names=NULL){

  left_justified <- c('SITE','PEOPLE','ADDRESS','METHODS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES')

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Find section boundaries
  sec_begin <- str_which(raw_lines,'^\\*')
  if(length(sec_begin)>0) sec_end <- c(sec_begin[-1]-1,length(raw_lines))

  # handle case with no section headers
  if(length(sec_begin)==0){
    sec_begin <- 1
    sec_end <- length(raw_lines)
    raw_lines <- str_subset(raw_lines,'^(?!$WEATHER)')
  }

  # Extract section names
  sec_names <- str_remove(raw_lines[sec_begin],'^\\*')

  # Extract all tiers
  all_secs <- map(1:length(sec_begin),
                   ~read_tier_data(raw_lines[sec_begin[.]:sec_end[.]],
                                   left_justified = left_justified,
                                   join_tiers = FALSE))

  names(all_secs) <- sec_names

  # If new DSSAT format add GENERAL section as attribute and return DAILY DATA
  if('GENERAL' %in% sec_names){
    attr(all_secs$`DAILY DATA`[[1]],'GENERAL') <- all_secs$GENERAL
    all_secs <- all_secs$`DAILY DATA`[[1]]
  }else{
    # Assume old DSSAT format
    attr(all_secs[[1]][[2]],'GENERAL') <- all_secs[[1]][[1]]
    all_secs <- all_secs[[1]][[2]]
  }

  return(all_secs)
}

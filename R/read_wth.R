#' Reads weather input data from a single DSSAT weather file (*.WTH)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom readr cols col_double col_character
#' @importFrom stringr str_subset str_extract str_remove str_detect str_replace_all str_which
#' @importFrom purrr map
#'
#' @examples
#'
#' # Extract file path for sample weather file
#' sample_wth <- system.file('extdata','SAMPLE.WTH',package='DSSAT')
#'
#' read_wth(sample_wth)
#'

read_wth <- function(file_name,col_types=NULL,col_names=NULL){


  col_types <- cols(LAT=col_double(),
                    LONG=col_double(),
                    ELEV=col_double(),
                    TAV=col_double(),
                    ` +AMP`=col_double(),
                    TAMP=col_double(),
                    REFHT=col_double(),
                    WNDHT=col_double(),
                    SRAD=col_double(),
                    TMAX=col_double(),
                    TMIN=col_double(),
                    RAIN=col_double(),
                    DEWP=col_double(),
                    WIND=col_double(),
                    PAR=col_double(),
                    EVAP=col_double(),
                    RHUM=col_double(),
                    ` SITE`=col_character(),
                    PEOPLE=col_character(),
                    ADDRESS=col_character(),
                    METHODS=col_character(),
                    INSTRUMENTS=col_character(),
                    PROBLEMS=col_character(),
                    PUBLICATIONS=col_character(),
                    DISTRIBUTION=col_character(),
                    NOTES=col_character(),
                    ` CO2`=col_double(),
                    CCO2=col_double()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}

  left_justified <- c(' SITE','PEOPLE','ADDRESS','METHODS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES')

  # Read in raw data from file
  raw_lines <- readLines(file_name, warn = FALSE) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  location <- raw_lines %>%
    str_subset('^[*$] *WEATHER.*') %>%
    str_extract('(?<=:).*') %>%
    str_remove('^ *')

  comments <- extract_comments(raw_lines)

  raw_lines <- raw_lines %>%
    {.[!str_detect(.,'WEATHER')]} %>%
    str_replace_all(c('!.*'=''))

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
                                   col_types = col_types,
                                   left_justified = left_justified,
                                   join_tiers = FALSE))

  names(all_secs) <- sec_names

  # If new DSSAT format add GENERAL section as attribute and return DAILY DATA
  if('GENERAL' %in% sec_names){
    daily_data <- all_secs$`DAILY DATA`
    attr(daily_data,'GENERAL') <- all_secs$GENERAL
  }else{
    # Assume old DSSAT format
    daily_data <- all_secs[[1]][[2]]
    attr(daily_data,'GENERAL') <- all_secs[[1]][[1]]
  }

  attr(daily_data,'location') <- location
  attr(daily_data,'comments') <- comments

  daily_data <- as_DSSAT_tbl(daily_data)

  return(daily_data)
}

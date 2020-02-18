#' Reads input data from a single DSSAT pest file (*.PST)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_subset str_replace_all str_split
#' @importFrom readr cols col_character col_double read_fwf
#' @importFrom readr fwf_positions
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#'

read_pest <- function(file_name,col_types=NULL,col_names=NULL){

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  start_end <- matrix(nrow=6,ncol=2)

  start_end[1,1:2] <- c(1,2)
  start_end[2,1:2] <- c(4,8) # Skip 1 column
  start_end[3,1:2] <- c(10,29) # Skip 1 column
  start_end[4,1:2] <- c(31,31) # Skip 1 column
  start_end[5,1:2] <- c(33,37) # Skip 1 column
  start_end[6,1:2] <- c(39,48) # Skip 1 column

  fwf_pos <- fwf_positions(start=start_end[,1],end=start_end[,2],
                col_names=c('LN','PID','PNAME','PCTID','PCPID','PDFC1'))

  # Get experiment name
  crop_model <- str_subset(raw_lines,'^\\*') %>%
    str_replace_all(c('^\\*'='',
                      ' PEST COEFFICIENTS:'='',
                      ' MODEL'='')) %>%
    str_split(' +') %>%
    {.[[1]]} %>%
    {names(.) <- c('crop','model')
    .}

  raw_lines <- str_subset(raw_lines,'^(?!\\*)')

  sec_begin <- 1
  sec_end <- length(raw_lines)

  col_types <- cols(LN=col_double(),
                    PID=col_character(),
                    PNAME=col_character(),
                    PCTID=col_double(),
                    PCPID=col_character(),
                    PDFC1=col_double()
                    )

  # Extract all tiers
  pest_coefs <- read_fwf(raw_lines[sec_begin[1]:sec_end[1]],
                    fwf_pos,
                    comment = '!',
                    na = c('-99','-99.','-99.0','-99.00','-99.000',
                           '*','**','***','****','*****','******','*******','********'),
                    skip_empty_rows = TRUE,
                    guess_max = 1000,
                    col_types=col_types)

  attr(pest_coefs,'CROP') <- crop_model['crop']
  attr(pest_coefs,'MODEL') <- crop_model['model']

  pest_coefs <- as_DSSAT_tbl(pest_coefs)

  return(pest_coefs)
}

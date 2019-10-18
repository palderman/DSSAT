#' Reads parameters from a single DSSAT ecotype parameter file (*.ECO)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @examples
#'
#' sample_eco <- c(
#' "*MAIZE ECOTYPE COEFFICIENTS: MZCER047 MODEL",
#' "@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
#' "!                            1     2    3     4     5     6     7     8      9    10    11",
#' "IB0001 GENERIC MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
#' "IB0002 GENERIC MIDWEST2    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.5   0.85",
#' "IB0003 GENERIC MIDWEST3    8.0 34.0  34.0  12.5   4.0   6.0   170.  2.0   0.85",
#' "IB0004 +5% RUE MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.4   0.85",
#' "DFAULT DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85")
#'
#' write(sample_eco,'SAMPLE.ECO')
#'
#' read_eco('SAMPLE.ECO')

read_eco <- function(file_name,col_types=NULL,col_names=NULL,
                     left_justified=c('ECO   ','ECO#','ECONAME\\.*','ECO-NAME\\.*')){

  if(str_detect(basename(file_name),'^((BA)|(WH))CER')){
    col_names <- col_names %>%
      c(.,'    P1')
  }else if(str_detect(basename(file_name),'^((BA)|(WH))CER')){
    col_names <- col_names %>%
      c(.,'ECO   ')
  }
  eco_col_types <- cols(`ECO   `=col_character(),
                        `ECO#`=col_character(),
                        `ECONAME\\.*`=col_character(),
                        `ECO-NAME\\.*`=col_character())


  if(!is.null(col_types)){
    eco_col_types$cols <- c(eco_col_types$cols,col_types$cols)
  }


  # Read in raw data from file
  raw_lines <- readLines(file_name)

  first_line <- raw_lines %>%
    head(1)

  comments <- raw_lines %>%
    str_subset('^!')

  raw_lines <- raw_lines %>%
    str_subset('^(?!\032) *([^ ]+)') %>%  # exclude lines that are all spaces or lines with EOF in initial position
    {.[!str_detect(.,'^(!|\\*|$)')]}

  begin <- raw_lines %>%
    str_which('^@')

  end <- begin %>%
    tail(-1) %>%
    {. - 1} %>%
    c(.,length(raw_lines))

  if(str_detect(file_name,'SCCSP')){
    eco <- read_casupro_eco(raw_lines)
  }else{
    eco <- map(1:length(begin),
               ~read_tier_data(raw_lines[begin[.]:end[.]],
                               col_types = eco_col_types,
                               col_names = col_names,
                               left_justified = left_justified)) %>%
      reduce(combine_tiers)
  }

  attr(eco,'first_line') <- first_line
  attr(eco,'comments') <- comments

  return(eco)
}

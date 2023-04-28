#' Reads parameters from a single DSSAT ecotype parameter file (*.ECO)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom dplyr "%>%"
#' @importFrom readr cols col_character
#' @importFrom stringr str_detect str_subset str_which
#' @importFrom purrr map reduce
#'
#' @examples
#'
#' # Extract file path for sample ecotype file path
#' sample_eco <- system.file('extdata','SAMPLE.ECO',package='DSSAT')
#'
#' eco <- read_eco(sample_eco)
#'

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
  raw_lines <- readLines(file_name, warn = FALSE)

  first_line <- raw_lines %>%
    head(1)

  comments <- extract_comments(raw_lines)

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
                               left_justified = left_justified,
                               convert_date_cols = FALSE)) %>%
      reduce(combine_tiers)
  }

  attr(eco,'first_line') <- first_line
  attr(eco,'comments') <- comments

  eco <- as_DSSAT_tbl(eco)

  return(eco)
}

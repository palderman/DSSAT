#' Reads parameters from a single DSSAT cultivar parameter file (*.CUL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom dplyr "%>%"
#' @importFrom readr cols col_character
#' @importFrom stringr str_detect str_subset str_which
#' @importFrom purrr map reduce
#'
#' @examples
#'
#' # Extract file path for sample cultivar file path
#' sample_cul_file <- system.file('extdata','SAMPLE.CUL',package='DSSAT')
#'
#' # Read sample cultivar file
#' cul <- read_cul(sample_cul_file)
#'
#'

read_cul <- function(file_name,col_types=NULL,col_names=NULL,
                     left_justified=c('VAR#','VARNAME\\.*','VAR-NAME\\.*','VRNAME\\.*')){

  cul_col_types <- cols(`VAR#`=col_character(),
                        `VARNAME\\.*`=col_character(),
                        `VAR-NAME\\.*`=col_character(),
                        `VRNAME\\.*`=col_character(),
                        `  ECO#`=col_character(),
                        ` EXPNO`=col_character(),
                        `  EXP#`=col_character())

  if(str_detect(file_name,'SCCSP')){
    col_names <- col_names %>%
      c(.,'Stalk','Sucro','Null1',
          'TB(1)','TO1(1)','TO2(1)',
          'TB(2)','TO1(2)','TO2(2)',
          ' *TM(1)',' *TM(2)',
          'StHrv','RTNFAC','Null7',
          'RES30C','RLF30C') %>%
      unique()
  }

  if(!is.null(col_types)){
    col_types$cols <- c(cul_col_types$cols,col_types$cols)
  }else{
    col_types <- cul_col_types
  }

  # Read in raw data from file
  raw_lines <- readLines(file_name)

  first_line <- raw_lines %>%
    head(1)

  comments <- extract_comments(raw_lines)

  begin <- raw_lines %>%
    str_which('^@')

  end <- begin %>%
    tail(-1) %>%
    {. - 1} %>%
    c(.,length(raw_lines))

  cul <- map(1:length(begin),
             ~read_tier_data(raw_lines[begin[.]:end[.]],
                        col_types = cul_col_types,
                        col_names = col_names,
                        left_justified = left_justified)) %>%
    reduce(combine_tiers)

  attr(cul,'first_line') <- first_line
  attr(cul,'comments') <- comments

  cul <- as_DSSAT_tbl(cul)

  return(cul)
}

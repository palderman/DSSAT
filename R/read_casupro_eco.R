#' Reads parameters from a single DSSAT CASUPRO ecotype parameter file (*.ECO)
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom dplyr "%>%" as_tibble select bind_rows
#' @importFrom purrr map
#' @importFrom stringr str_which str_split str_subset
#'
#' @examples
#'
#' sample_eco <- c('CA0001  (CP 80-1743; CP 88-1762)',
#' '!-------------------',
#' '  KCAN_ECO      0.80    Superseeds KCAN from .SPE file',
#' '  SMAX            20    Maximum number of stalks a variety can yield per stubble or plant',
#' '!-------------------',
#' '  CAB              8    Number of leaves in spindle cluster at top of stalk ("cabbage"). ',
#' '  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-popula',
#' '  LfShdFac      0.35    Proportion of a stalks new leaf area that shades (displaces to t',
#' '  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of',
#' '!-------------------',
#' '  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight rat',
#' '  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on')
#'
#' read_casupro_eco(sample_eco)

read_casupro_eco <- function(raw_lines){

  raw_lines <- sanitize_raw_lines(raw_lines)

  begin <- raw_lines %>%
    str_which('^[^ *!]')

  end <- begin %>%
    tail(-1) %>%
    c(.,length(raw_lines))

  eco <- map(1:length(begin),function(i){
      ecotype <- raw_lines[begin[i]] %>%
        str_split(' +',n=2) %>%
        {.[[1]]} %>%
        as.list() %>%
        {names(.) <- c('ECO#','ECONAME')
         .} %>%
        as_tibble()

      # To prevent "no visible binding for global variable" from R CMD check for select()
      # statement below:
      `ECO#` <- ECONAME <- NULL

      prms <- raw_lines[begin[i]:end[i]] %>%
        tail(-1) %>%
        str_subset('^ +[^ ]') %>%
        read_horizontal_array() %>%
        combine_tiers(.,ecotype) %>%
        select(`ECO#`,ECONAME,everything())

      return(prms)
    })
   v_fmt <- map(eco,~attr(.,'v_fmt'))
   # %>%
  #   map(~matrix(.,nrow=1,byrow=TRUE)) %>%
  #   map(~as_tibble(.)) %>%
  #   bind_rows()
  eco <- bind_rows(eco)
  attr(eco,'v_fmt') <- v_fmt

  return(eco)
}

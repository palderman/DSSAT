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
#' @examples
#'
#' sample_eco <- c('CA0001  (CP 80-1743; CP 88-1762)',
#' '!-------------------',
#' '  KCAN_ECO      0.80    Superseeds KCAN from .SPE file',
#' '  SMAX            20    Maximum number of stalks a variety can yield per stubble or plant (limit 41)',
#' '!-------------------',
#' '  CAB              8    Number of leaves in spindle cluster at top of stalk ("cabbage").  In CASUPRO, stalk dry matter begins to accumulate only after CAB leaves have emerged. ',
#' '  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-populated light interception zones full.',
#' '  LfShdFac      0.35    Proportion of a stalks new leaf area that shades (displaces to the next lower zone) leaves on other stalks.',
#' '  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction of ground area in plant shadow) during early growth.(0.01-0.20)',
#' '!-------------------',
#' '  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ratio (TotalDEF(Stalk) / STKWT(DAS-1,Stalk) at which stalk death occurs. ',
#' '  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced on a single day as a function of severe water stress 4 days earlier.  ')
#'
#' write(sample_eco,'SAMPLE.ECO')
#'
#' read_casupro_eco('SAMPLE.ECO')

read_casupro_eco <- function(file_name){

  raw_lines <- readLines(file_name)

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

      prms <- raw_lines[begin[i]:end[i]] %>%
        tail(-1) %>%
        str_subset('^ +[^ ]') %>%
        read_horizontal_array() %>%
        combine_tiers(.,ecotype) %>%
        select(`ECO#`,ECONAME,everything())

      return(prms)
    }) %>%
    reduce(combine_tiers)

  return(eco)
}

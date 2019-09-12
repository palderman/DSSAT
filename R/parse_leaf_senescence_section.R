#' Parses leaf senescence section of a DSSAT CROPGRO species file (*.SPE)
#'
#' @export
#'
#' @keywords internal
#'
#' @param lines a character vector
#'
#' @return a list containing the data from the raw DSSAT file
#'
#'
parse_leaf_senescence_section <- function(lines){

  tmp <- lines %>%
    str_replace_all(c('(^ *)|(\\(.*)'='')) %>%
    str_subset('(?!^$)')

  xline <- tmp %>%
    str_which('XSTAGE') %>%
    {. + 1}

  x <- tmp[xline] %>%
    str_remove('^  *') %>%
    str_split('  *') %>%
    {.[[1]]} %>%
    as.numeric() %>%
    {list(XSTAGE=.[1:(length(.)/2)],
         XSENMX=.[(length(.)/2+1):length(.)])}

  sline <- tmp %>%
    str_which('SENPOR') %>%
    {. + 1}

  s <- tmp[sline] %>%
    str_split('  *') %>%
    {.[[1]]} %>%
    as.numeric() %>%
    {list(SENPOR=.[1:(length(.)/2)],
          SENMAX=.[(length(.)/2+1):length(.)])}

  drp <- c(xline-1,xline,sline-1,sline)

  sec <- tmp[-drp] %>%
    str_subset('^(?!\\!)') %>%
    map(parse_cropgro_spe_line) %>%
    reduce(c)

  return(c(sec,x,s))

}

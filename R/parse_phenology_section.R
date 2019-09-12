#' Parses phenology section of a DSSAT CROPGRO species file (*.SPE)
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
parse_cropgro_phenology_section <- function(lines){

  lines <- lines %>%
    str_subset('^(?!\\!)')

  t_card <- lines %>%
    str_subset('DEVELOPMENT') %>%
    map(parse_cropgro_spe_line) %>%
    map(unlist) %>%
    do.call(rbind,.) %>%
    {list(TB=.[,1],
          TO1=.[,2],
          TO2=.[,3],
          TM=.[,4])}

  tmp <- lines %>%
    str_which('(DEVELOPMENT)|(^$)') %>%
    {lines[-.]} %>%
    str_sub(1,37) %>%
    str_replace_all(c('^  *'='',
                      '  *$'='')) %>%
    str_split('  *') %>%
    do.call(rbind,.) %>%
    as_tibble()

  colnames(tmp) <- c('J','NPRIOR','DLTYP','CTMP','TSELC','WSENP','NSENP','PSENP')

  for(n in c('J','NPRIOR','DLTYP','CTMP','TSELC','WSENP','NSENP','PSENP')){
    if(!n%in%c('DLTYP','CTMP')) tmp[[n]] <- as.numeric(tmp[[n]])
    tmp[[n]] <- tmp[[n]][order(tmp$J)]
  }

  tmp$J <- tmp$J[order(tmp$J)]

  tmp <- merge(tmp,data.frame(J=1:max(tmp$J)),all=TRUE) %>%
    select(.,-J) %>%
    as.list(.)

  p_out <- c(t_card,tmp)

  return(p_out)
}

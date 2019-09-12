#' Reads data from one line of a DSSAT CROPGRO species file (*.SPE)
#'
#' @export
#'
#' @keywords internal
#'
#' @param line a length-one character vector
#' @param sec_name a length-one character vector
#'
#' @return a list containing the data from the raw line
#'
#'
parse_cropgro_spe_line <- function(line,sec_name=''){

  line <- line %>%
    str_remove('^ *')
  vnames <- NULL

  if(str_detect(sec_name,'PARTITIONING')&&
     str_detect(line,'(XLEAF)|(YLEAF)|(YSTEM)')){
    vnames <- str_extract(line,'(XLEAF)|(YLEAF)|(YSTEM)')
    vals <- line %>%
      str_extract('.*(?=XLEAF)|(?=YLEAF)|(?=YSTEM)') %>%
      str_split('  *') %>%
      {.[[1]]} %>%
      as.numeric() %>%
      list()
    names(vals) <- vnames
  }else if(str_detect(sec_name,'ROOT')){
    vnames <- line %>%
      str_extract('[[:alpha:]].*') %>%
      str_split(' *((,)|( )) *') %>%
      {.[[1]]}
    if(any(str_detect(vnames,'XRTFAC'))){
      vals <- line %>%
        str_remove(' *[[:alpha:]].*') %>%
        str_split('  *') %>%
        {.[[1]]} %>%
        as.numeric() %>%
        matrix(ncol=2,byrow=TRUE) %>%
        {list(.[,1],.[,2])}
      vnames <- c('XRTFAC','YRTFAC')
    }else{
      vals <- line %>%
        str_remove(' *[[:alpha:]].*') %>%
        str_split('  *') %>%
        {.[[1]]} %>%
        as.list() %>%
        map(function(v){
          v.out <- type.convert(v)
          if(is.factor(v.out)){
            return(v)
          }else{
            return(v.out)
          }
        })
    }
    names(vals) <- vnames
  }else if(any(str_detect(line,'SNACTM'))){
    vals <- line %>%
      str_remove(' *[[:alpha:]].*') %>%
      str_split('  *') %>%
      {.[[1]]} %>%
      as.numeric()
    names(vals) <- c("SNACTM","NODRGM","DWNODI","TTFIX","NDTHMX","CNODCR")
  }else if(any(str_detect(line,'WTFSD'))){
      vals <- line %>%
        str_remove(' *[[:alpha:]].*') %>%
        str_split('  *') %>%
        {.[[1]]} %>%
        as.numeric()
      names(vals) <- c("WTFSD","PORPT","FRSTMF","FRLFF","ATOP","FRCNOD")
  }else{

    if(str_detect(line,' *\\(')){
      vnames[1] <- line %>%
        str_extract('[^ ]+(?= *\\()') %>%
        str_extract('(?<! )[^ ]+$')
      vals <- line %>%
        str_remove(' *[^ ]+ *\\(.*') %>%
        str_remove('^ *') %>%
        str_split('  *') %>%
        {.[[1]]}
      if(str_detect(line,'TYP')){
        vnames[2] <- line %>%
          str_extract('TYP[[:alpha:]]+')
        vals <- list(as.numeric(head(vals,-1)),
                     tail(vals,1))
      }else{
        vals <- list(as.numeric(vals))
      }
      names(vals) <- vnames
    }else{
      n_ind <- line %>%
        str_locate_all('  *') %>%
        {.[[1]]} %>%
        {ml <- .[,2] - .[,1] + 1
         .[which.max(ml),1]
         } %>%
        tail(1)

      vnames <- line %>%
        str_sub(n_ind) %>%
        str_replace_all(c('(^ *)|( *$)|(;.*)'='')) %>%
        str_split(' *((,)|( )) *') %>%
        {.[[1]]}

      vals <- line %>%
        str_sub(1,n_ind-1) %>%
        str_remove('^ *') %>%
        str_split('  *') %>%
        {.[[1]]} %>%
        as.list() %>%
        map(function(v){
          v.out <- type.convert(v)
          if(is.factor(v.out)){
            return(v)
          }else{
            return(v.out)
          }
        })

      names(vals) <- vnames
    }
  }

  return(vals)
}

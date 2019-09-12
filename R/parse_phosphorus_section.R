#' Parses phosphorus section of a DSSAT species file (*.SPE)
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
parse_phosphorus_section <- function(lines){
  # START HERE
  omm <- grep('(Optimum)|(Minimum)|(Maximum)',lines)
  n.ind <- regexpr('(Optimum)|(Minimum)|(Maximum)',lines[omm])
  n1 <- substr(lines[omm],n.ind,n.ind+2)
  n2.ind <- regexpr('(Leaf)|(Shoot)|(Stem)|(Root)|(Shell)|(Seed)|(Veg)',lines[omm])
  n2.ml <- attr(n2.ind,'match.length')
  n2 <- sapply(substr(lines[omm],n2.ind,n2.ind+n2.ml-1),function(x){
    n.out <- switch(x,
                    Shoot='Shut',
                    Shell='Shel',
                    x)
    return(n.out)
  })
  omm.names <- ifelse(n2=='Veg',paste0('N2P',n1),paste0('PC',n2,n1))
  omm.vals <- gsub('(^  *)|(  *$)','',substr(lines[omm],1,n.ind-1)) %>%
    strsplit(.,'  *') %>%
    lapply(.,type.convert,na.strings=dssat_na_strings())
  names(omm.vals) <- omm.names

  tmp <- gsub('SRATPHOTO','         SRATPHOTO',lines[-omm])
  tmp <- gsub(' - .*','',tmp)

  phos.out <- c(list(omm.vals),lapply(tmp,parse_cropgro_spe_line))

  return(phos.out)
  char.start <- grep('[[:alpha:]]',tmp)[1]
  vals <- type.convert(tmp[1:(char.start-1)],
                       na.strings=dssat.na.strings())
  if(n1%in%c('Min','Max','Opt')){
    if(n2=='Veg'){
      attr(vals,'name') <- paste0('N2P',n1)
    }else{
      attr(vals,'name') <- paste0('PC',n2,n1)
    }
  }else{
    vals <- as.list(vals)
    n.ind <- char.start:(char.start+length(vals)-1)
    names(vals) <- gsub(',','',tmp[n.ind])
  }
}

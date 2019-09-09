guess_significant_digits <- function(variable,width){
    if(is.numeric(variable)&&
       !all(is.na(variable))&&
       !is.character(width)){
      sig_dig <- head(variable,100) %>%
        map_dbl(function(v){
          sig <- round(v,0:(width-1)) %>%
            {diff(.) == 0} %>%
            which() %>%
            first()
          return(sig)
        }) %>%
        {max(.,na.rm=TRUE) - 1} %>%
        paste0('.',.)
    }else{
      sig_dig <- ''
    }
  return(sig_dig)
}

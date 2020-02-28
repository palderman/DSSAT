#' @importFrom dplyr "%>%"
#' @importFrom purrr map_dbl
#' @importFrom stringr str_c
guess_significant_digits <- function(variable,width){
    if(is.list(variable)) variable <- unlist(variable)
    if(is.numeric(variable)&&
       !all(is.na(variable))&&
       !is.character(width)&&
       !all(is.na(width))){
      sig_dig <- variable %>%
        {.[!is.na(.)]} %>%
        map_dbl(function(v){
          ne_0 <- round(v,0:(width-1)) %>%
            {diff(.) != 0}
          if(!any(ne_0)){
            sig <- 0
          }else{
            sig <- ne_0 %>%
              which() %>%
              ifelse(is.na(.),0,.) %>%
              max(na.rm=TRUE)
          }
          return(sig)
        }) %>%
        ifelse(is.na(.),0,.) %>%
        max(na.rm=TRUE) %>%
        str_c('.',.)
    }else{
      sig_dig <- ''
    }
  return(sig_dig)
}

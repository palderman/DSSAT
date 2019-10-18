filter_for_all_equal <- function(x){
  if(length(unique(x))==1){
    return(c(TRUE,rep(FALSE,length(x)-1)))
  }else{
    return(rep(TRUE,length(x)))
  }
}

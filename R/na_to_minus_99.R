na_to_minus_99 <- function(vr_out, fmt){
  if(grepl('-', fmt[1])){
    vr_out <- gsub("(^| )NA( |$)",
                   "\\1-99",
                   vr_out,
                   perl = TRUE)
  }else{
    vr_out <- gsub("(^| )NA( |$)",
                   "-99\\2",
                   vr_out,
                   perl = TRUE)
  }
  return(vr_out)
}

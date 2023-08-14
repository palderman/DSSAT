write_POSIXct <- function(vr_val, width){
  if(width<7){
    vr_out <- format(vr_val,'%y%j')
  }else{
    vr_out <- format(vr_val,'%Y%j')
  }
  return(vr_out)
}

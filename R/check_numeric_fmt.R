check_numeric_fmt <- function(fmt, cname, vr_val){
  if(grepl("%.*f", fmt) & !is.numeric(vr_val)){
    warning(
      paste0('Column ', cname,' is not numeric even though the format indicates it should be. It will be treated as character. Please check output for introduced errors.')
    )
    fmt_out <- gsub("\\.[0-9]f", "s", fmt)
  }else{
    fmt_out <- fmt
  }
  return(fmt_out)
}

#' @importFrom stringr str_remove str_length str_detect str_sub str_replace_all str_c str_sub<-
#' @importFrom dplyr "%>%"
#' @importFrom lubridate is.POSIXct
#'
check_numerical_column_width <- function(vr_out,vr_val,width){
  if( is.numeric(vr_val) && !is.POSIXct(vr_val)){

    # If value has trailing zero after decimal, drop trailing zeros
    check <-  !is.na(vr_val) &
      {str_remove(vr_out,'^ *') %>% str_length()} >= width &
      str_detect(vr_out,'\\.') &
      str_sub(vr_out,nchar(vr_out),nchar(vr_out)) == '0'
    vr_out[ check ] <- vr_out[ check ] %>%
      str_replace_all(c('0+$'='')) %>%
      sprintf(str_c('%',width,'s'),.)

    # if value is between 0 and 1
    check <- !is.na(vr_val) &
      nchar(vr_out) >= width &
      ! str_detect(vr_out,'^ ') &
      vr_val < 1 &
      vr_val > 0
    vr_out[check] <- vr_out[check] %>%
    {str_sub(.,1,1) <- ' '
    .}

    # If value is between -1 and 0
    check <- !is.na(vr_val) &
      nchar(vr_out) >= width &
      ! str_detect(vr_out,'^ ') &
      vr_val > -1 &
      vr_val < 0
    vr_out[check] <- vr_out[check] %>%
      str_replace('0\\.','\\.') %>% # Don't do replace with space here in case of negative numbers
      sprintf(str_c('%',width,'s'),.)

    # If value is large number with .0 at end, drop trailing zero
    check <-  !is.na(vr_val) &
      ! str_detect(vr_out,'^ ') &
      {str_remove(vr_out,'^ *') %>% str_length()} >= width &
      str_detect(vr_out,'\\.0$')
    vr_out[ check ] <- vr_out[ check ] %>%
      str_sub(.,end=width-1) %>%
      sprintf(str_c('%',width,'s'),.)

    # If value is large number with . at end, drop trailing decimal point
    check <-  !is.na(vr_val) &
      ! str_detect(vr_out,'^ ') &
      {str_remove(vr_out,'^ *') %>% str_length()} >= width &
      str_detect(vr_out,'\\.$')
    vr_out[ check ] <- vr_out[ check ] %>%
      str_sub(.,end=width-1) %>%
      sprintf(str_c('%',width,'s'),.)
  }
  return(vr_out)
}

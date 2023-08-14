write_column <- function(fmt, vr_val, cname){

  width <- v_fmt_to_width(fmt)

  if(!str_detect(fmt,'-')) fmt <- str_remove(fmt,'^ *')

  if(is_POSIXct(vr_val)) vr_val <- write_POSIXct(vr_val, width)

  # In future, throw error if value is too large to fit within column width?
  # else if(is.numeric(vr_val)){
  #  if(any(vr_val >= 10^width-0.5)) stop()
  # }

  fmt <- check_numeric_fmt(fmt, cname, vr_val)

  vr_out <- sprintf(fmt, vr_val)

  if(!is.na(width)){
    vr_out <- check_column_width(
      check_numerical_column_width(vr_out, vr_val, width),
      cname,
      fmt,
      width)
  }

  vr_out <- na_to_minus_99(vr_out, fmt)

  return(vr_out)
}

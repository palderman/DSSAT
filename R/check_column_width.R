check_column_width <- function(vr_out, cname, fmt, width){

  vr_nchar <- nchar(vr_out)

  if(!is.na(width) & max(vr_nchar, na.rm = TRUE) > width){

    # Throw warning
    warning(
      paste0('Column ', cname, ' values were trimmed to fit specified column width. Please check output for introduced errors.')
    )

    # Find elements to be trimmed
    trim_ind <- vr_nchar > width

    if(grepl('-', fmt)){
      # If '-' in fmt then left justified and trim from right
      vr_out[trim_ind] <- substr(vr_out[trim_ind], 1, width)

    }else{
      # Otherwise trim from the left
      vr_out[trim_ind] <- substr(vr_out[trim_ind],
                                 start = vr_nchar[trim_ind] - width + 1,
                                 stop = vr_nchar[trim_ind])
    }
  }

  return(vr_out)
}

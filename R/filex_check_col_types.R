#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c str_detect
#' @importFrom purrr map
#' @importFrom lubridate is.POSIXct
#'
filex_check_col_types <- function(sec, data){

  check_type <- function(col, check, conv){
    if(!check(col)) col <- conv(col)
    return(col)
  }

  conv_POSIXct <- function(col){
    if(is.numeric(col)){
      col <- as.POSIXct(col, tz = "UTC")
    }else{
      if(max(nchar(col)) > 5){
        col <- as.POSIXct(col, format = "%Y%j", tz = "UTC")
      }else{
        col <- as.POSIXct(col, format = "%y%j", tz = "UTC")
      }
    }
      return(col)
  }

  v_fmt <- v_fmt_filex(sec)

  for(nm in names(data)){
    if(!nm %in% names(v_fmt)){
      str_c(nm," not found in v_fmt.") %>%
        stop()
    }
    if(str_detect(v_fmt[nm], "s *$")){
      if(str_detect(nm, "DAT$")){
        if(is.list(data[[nm]])){
          data[[nm]] <- map(data[[nm]],
                            check_type,
                            check = is.POSIXct,
                            conv = conv_POSIXct)
        }else{
          data[[nm]] <- check_type(data[[nm]],
                                   check = is.POSIXct,
                                   conv = conv_POSIXct)
        }
      }else if(is.list(data[[nm]])){
        data[[nm]] <- map(data[[nm]],
                          check_type,
                          check = is.character,
                          conv = as.character)
      }else{
        data[[nm]] <- check_type(data[[nm]],
                                 check = is.character,
                                 conv = as.character)
      }
    }else if(str_detect(v_fmt[nm], "f *$")){
      if(is.list(data[[nm]])){
        data[[nm]] <- map(data[[nm]],
                          check_type,
                          check = is.numeric,
                          conv = as.numeric)
      }else{
        data[[nm]] <- check_type(data[[nm]],
                                 check = is.numeric,
                                 conv = as.numeric)
      }
    }else{
      str_c("v_fmt for variable ", nm, "is ", v_fmt[nm],
            ".\n Conversion has not been implemented for this type yet.") %>%
        stop()
    }
  }

  return(data)
}

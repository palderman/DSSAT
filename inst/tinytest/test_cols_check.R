test_cols_check <- function(data,
                       char_cols = NULL,
                       list_cols = NULL,
                       date_cols = NULL,
                       missing = NULL,
                       list_col_length = NULL,
                       list_col_groups = NULL,
                       expected_vals = NULL,
                       info_prefix = ""){

  tinytest_out <- list()

  # Check for all missing variables
  for(nm in names(data)){
    if(nm %in% missing){
      if(nm %in% char_cols){
        na_val <- NA_character_
      }else if(!is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz="UTC")
      }else{
        na_val <- NA_real_
      }
      if(!is.null(list_cols) && nm %in% list_cols){
        tinytest_out <- expect_equal(unlist(data[[nm]]),
                               rep(na_val, length(unlist(data[[nm]]))),
                               info = paste0(info_prefix, ": ", nm))
      }else{
        tinytest_out <- expect_equal(data[[nm]],
                       rep(na_val, nrow(data)),
                       info = paste0(info_prefix, ": ", nm))
      }
    }
  }

  # Check for specific expected values
  if(!is.null(expected_vals)){
    for(nm in names(expected_vals)){
      tinytest_out[[length(tinytest_out)+1]] <-
        expect_equal(data[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if(!is.null(list_cols)){
    for(nm in list_cols){
      tinytest_out <- c(tinytest_out,
        expect_true(is.list(data[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      )
      if(!is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(data[[nm]]))
        }
        for(i in 1:length(data[[nm]])){
          expect_equal(length(unlist(data[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if(!is.null(list_col_groups)){
        for(i in 1:nrow(data)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(data[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
            expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  return(tinytest_out)
}

#' @importFrom stats sd
invert_collapse_rows <- function(df){

  is_list <- unlist(lapply(df, is.list))

  if(any(is_list)){

    df_out <- vector(mode = "list", length = ncol(df))

    # Make sure length of list column elements are the same
    list_col_elem_lengths <- lapply(df[is_list],
                                   function(.x) unlist(lapply(.x, length)))

    check_list_col_elem_lengths <- do.call(
      mapply,
      c(
        list_col_elem_lengths,
        FUN = function(...) sd(unlist(list(...)))
      )
    )

    if(any(check_list_col_elem_lengths != 0)){
      stop("List column elements are not of same length")
    }

    # Unnest list columns and expand non-list columns
    for(i in 1:length(df_out)){
      if(is_list[i]){
        if(any(sapply(df[[i]], is_POSIXct))){
          df_out[[i]] <- as.POSIXct(unlist(df[[i]]), tz = attr(df[[i]][[1]], "tzone"))
        }else{
          df_out[[i]] <- unlist(df[[i]])
        }
      }else{
        df_out[[i]] <- rep(df[[i]], times = list_col_elem_lengths[[1]])
      }
    }

    # Add attributes to convert list to data frame
    attr(df_out, "names") <- names(df)
    attr(df_out, "class") <- "data.frame"
    attr(df_out, "row.names") <- c(NA, -length(df_out[[1]]))

  }else{

    df_out <- df
  }

  return(df_out)

}

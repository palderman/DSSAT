nest_rows <- function(df, by){

  .nest_index <- do.call(paste0, as.list(df)[by])

  df_out <- cbind(df, .nest_index)

  .nest_index_unique <- unique(.nest_index)

  df_out <- data.frame(.nest_index_unique = .nest_index_unique)

  # df_list <- lapply(df, function(column){
  #        })
  #
  # df_out <- do.call(data.frame, c(df_list,
  #                                 list(stringsAsFactors = FALSE,
  #                                      check.names = FALSE)))
  #
  # colnames(df_out) <- names(df_list)

  for(cl in colnames(df)){
    if(cl %in% by){
      df_out[[cl]] <- unlist(
        lapply(.nest_index_unique,
               function(ind){
                 df[[cl]][.nest_index == ind][1]
               })
      )
    }else{
      df_out[[cl]] <- lapply(.nest_index_unique,
                             function(ind){
                               df[[cl]][.nest_index == ind]
                             })
    }
  }

  df_out[[".nest_index_unique"]] <- NULL

  return(df_out)
}

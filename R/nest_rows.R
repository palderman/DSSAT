nest_rows <- function(df, by){

  .nest_index <- interaction(as.list(df)[by])

  df_out <- cbind(.nest_index, df)

  .nest_index_unique <- unique(.nest_index)

  df_out <- as.data.frame(
    do.call(cbind,
            lapply(df,
                   function(column){
                     lapply(.nest_index_unique,
                            function(ind){
                              column[.nest_index == ind]
                            })
                     })
    )
  )

  for(cl in by){
    df_out[[cl]] <- unlist(lapply(df_out[[cl]], "[[", 1))
  }

  return(df_out)
}

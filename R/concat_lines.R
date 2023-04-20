expand_rows <- function(df, times){
  as.data.frame(
    lapply(df, rep, times = times)
  )
}

expand_start_end <- function(start, end){
  unlist(
    lapply(seq_along(start),
           function(i){
             (start[i] + 1):end[i]
           })
  )
}

concat_lines <- function(raw, df_in){

  cnames <- colnames(df_in)

  times <- with(df_in, end - start)

  df_out <- expand_rows(
    df = df_in[!cnames %in% c("start", "end")],
    times = times
    )

  index <- expand_start_end(start = df_in$start,
                            end = df_in$end)

  df_out$lines <- raw[index]

  return(df_out)

}

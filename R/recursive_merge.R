recursive_merge <- function(.list, by = NULL){

  for(i in seq_along(.list)){
    # For first element of .list assign to df_out
    if(i == 1){
      df_out <- .list[[i]]
    }else{
      if(!is.null(by)){
        # if by is not null use it in merge
        df_out <- coalesce_merge(df_out, .list[[i]], by = by)
      }else{
        # otherwise use the intersection of names for merge
        df_out <- coalesce_merge(df_out, .list[[i]],
                                 by = intersect(names(df_out),
                                                names(.list[[i]])))
      }
    }
  }

  return(df_out)
}

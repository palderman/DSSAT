add_level_column <- function(df_in, lev_col_name){

  # Copy original
  df_out <- df_in

  # Add level column
  df_out[[lev_col_name]] <- as.numeric(1:nrow(df_in))

  # Return with level column in first position
  return(df_out[,c(lev_col_name, colnames(df_in))])

}

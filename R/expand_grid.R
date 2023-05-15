# Function that mimics expand_grid() from the tidyverse
expand_grid <- function(...){

  # Create local list of arguments
  arg_list <- list(...)

  # Preserve original order of arguments
  name_order <- names(arg_list)

  # Call expand.grid() with reverse order of arguments and reorder output to original order
  df_out <- do.call(expand.grid, c(rev(arg_list),
                                   KEEP.OUT.ATTRS = FALSE,
                                   stringsAsFactors = FALSE))[, name_order]

  return(df_out)
}

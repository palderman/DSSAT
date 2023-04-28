col_types_to_vec <- function(col_types){

  ctypes <- unlist(
    strsplit(as.character(col_types),
             "")
  )

  ctypes[ctypes == "c"] <- "character"
  ctypes[ctypes == "d"] <- "numeric"
  ctypes[ctypes == "i"] <- "integer"

  names(ctypes) <- names(col_types$col)

  return(ctypes)
}

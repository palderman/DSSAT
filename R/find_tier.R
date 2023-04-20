find_tier <- function(df_in, headers = NULL){
  # Find start of each tier
  start <- grep("^[@*]", df_in$lines)

  end <- c(
    tail(start, -1) - 1,
    nrow(df_in)
  )

  # Extract header
  pedon <- df_in$PEDON[start]
  header <- df_in$lines[start]

  header_subset <- grepl("^@", df_in$lines[start])

  # Subset to list of headers in `headers`
  if(!is.null(headers)){
    header_subset <- header_subset & header %in% headers
  }

  pedon <- pedon[header_subset]
  header <- header[header_subset]
  start <- start[header_subset]
  end <- end[header_subset]

  return(data.frame(PEDON = pedon, header = header, start = start, end = end))
}

find_filex <- function(raw, filex_name){

    # Find start of each FileX
    start <- grep("^\\*EXP\\.DETAILS", raw,
                  perl = TRUE)

    end <- c(
      tail(start, -1) - 1,
      length(raw)
    )

  # Extract first_line
  experiment <- gsub("\\*EXP.DETAILS: *", "", raw[start])

  return(data.frame(filex_name = filex_name, experiment = experiment, start = start, end = end))
}

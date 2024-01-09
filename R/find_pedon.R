find_pedon <- function(raw, pedons = NULL){

  # Find start of each soil profile
  start <- grep("^\\*(?![Ss][Oo][Ii][Ll][Ss])", raw,
                perl = TRUE)

  end <- c(
    tail(start, -1) - 1,
    length(raw)
  )

  # Extract soil_id
  pedon <- gsub(" ", "", substr(raw[start], 2, 11))

  if(!is.null(pedons)){
    # Subset to list of profiles in `pedons`
    pedon_subset <- pedon %in% pedons
    start <- start[pedon_subset] + 1
    end <- end[pedon_subset]
    pedon <- pedon[pedon_subset]
  }

  return(data.frame(PEDON = pedon, start = start, end = end))
}

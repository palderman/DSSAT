coalesce_merge <- function(x, y, by = intersect(names(x), names(y))){

  # Perform merge
  xy <- merge(x, y, by = by, all = TRUE)

  # Extract unmerged columns
  xy_name_check <- grep("\\.(x|y)", names(xy), value = TRUE)

  # Extract base column names for unmerged columns
  xy_unique <- unique(gsub("\\.(x|y)", "", xy_name_check))

  for(nm in xy_unique){
    # Reconstruct paired column names
    nm.x <- paste0(nm, ".x")
    nm.y <- paste0(nm, ".y")
    if(nm.x %in% names(xy) & nm.y %in% names(xy)){
      # Coalesce nm.x and nm.y
      # Start with values from nm.x
      xy[[nm]] <- xy[[nm.x]]
      # Fill in values from nm.y where nm.x is NA
      xy[[nm]][is.na(xy[[nm.x]])] <- xy[[nm.y]][is.na(xy[[nm.x]])]
      # Drop nm.x and nm.y columns
      xy[[nm.x]] <- NULL
      xy[[nm.y]] <- NULL
    }
  }

  return(xy)
}

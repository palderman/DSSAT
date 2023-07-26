find_section <- function(df_in, headers = NULL){

  df_out <- vector(mode = "list", length = 5)
  names(df_out) <- c("filex_name", "experiment", "section", "start", "end")

  # Find start of each section
  df_out[["start"]] <- grep("^\\*", df_in$lines)

  # Set end of each section
  df_out[["end"]] <- c(
    tail(df_out[["start"]], -1) - 1,
    nrow(df_in)
  )

  # Set filex_name, experiment and section
  df_out[["filex_name"]] <- df_in$filex_name[ df_out[["start"]] ]
  df_out[["experiment"]] <- df_in$experiment[ df_out[["start"]] ]
  df_out[["section"]] <- gsub("\\*", "", df_in$lines[ df_out[["start"]] ])

  # Add attributes to convert df_out into a data frame
  attr(df_out, "row.names") <- c(NA, -length(df_out[["filex_name"]]))
  attr(df_out, "class") <- "data.frame"

  return(df_out)
}

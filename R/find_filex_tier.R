find_filex_tier <- function(df_in){

  df_out <- vector(mode = "list", length = 6)

  names(df_out) <- c("filex_name", "experiment", "section", "header",
                     "start", "end")

  # Find start of each tier
  df_out[["start"]] <- grep("^@", df_in$lines)

  df_out[["end"]] <- c(
    tail(df_out[["start"]], -1) - 1,
    nrow(df_in)
  )

  # Only keep tiers that have at least one row of data
  keep <- (df_out[["end"]] - df_out[["start"]]) > 0
  df_out[["start"]] <- df_out[["start"]][keep]
  df_out[["end"]] <- df_out[["end"]][keep]

  # Set filex_name, experiment, section and header
  df_out[["filex_name"]] <- df_in$filex_name[ df_out[["start"]] ]
  df_out[["experiment"]] <- df_in$experiment[ df_out[["start"]] ]
  df_out[["section"]] <- df_in$section[ df_out[["start"]] ]
  df_out[["header"]] <- df_in$lines[ df_out[["start"]] ]

  # Add attributes to convert df_out into a data frame
  attr(df_out, "row.names") <- c(NA, -length(df_out$start))
  attr(df_out, "class") <- "data.frame"

  return(df_out)
}

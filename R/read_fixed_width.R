#' @importFrom utils type.convert
#' @importFrom methods as
read_fixed_width <- function(text, fwf_pos, ctypes, na_regex){

  df <- vector(mode = "list", length = nrow(fwf_pos))

  names(df) <- fwf_pos$col_names

  begin <- fwf_pos$begin + 1

  end <- fwf_pos$end

  # Account for NA in end (i.e. left-justified final column)
  end[is.na(end)] <- max(nchar(text))

  for(cl in 1:nrow(fwf_pos)){

    df[[cl]] <- gsub("(^ +)|( +$)", "",
                        substr(text, begin[cl], end[cl]))

    df[[cl]][grepl(na_regex, df[[cl]])] <- NA_character_

    ctype_cl <- ctypes[names(df)[cl]]

    if(is.na(ctype_cl)){
      df[[cl]] <- type.convert(df[[cl]],
                               na.strings = character(0L),
                               as.is = TRUE)
    }else{
      df[[cl]] <- as(df[[cl]], ctype_cl)
    }
  }

  attr(df, "row.names") <- 1:length(df[[1]])
  attr(df, "class") <- "data.frame"

  return(df)
}

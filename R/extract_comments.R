extract_comments <- function(raw_lines){
  comment_lines <- grep('!',
                        iconv(raw_lines, sub = "?"),
                        value = TRUE)
  comments <- gsub(" +$", # remove trailing spaces
                   "",
                   # extract only comments prefaced with !
                   regmatches(comment_lines,
                              regexpr("(?<=!).*",
                                      comment_lines,
                                      perl = TRUE)))
  return(comments)
}


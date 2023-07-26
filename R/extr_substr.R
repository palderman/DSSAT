# equivalent to str_extract()
extr_substr <- function(string, regex){
  matches <- regexpr(regex, string, perl = TRUE)
  str_out <- vector(mode = "character", length = length(matches))
  str_out[matches < 0] <- NA_character_
  str_out[matches >= 0] <- regmatches(string, matches)
  return(str_out)
}

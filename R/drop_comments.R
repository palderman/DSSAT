drop_comments <- function(raw){
  # Strip comments from lines that are not only comments
  gsub("!.*", "",
       # Drop lines with only comments
       grep("(^ *!)", raw,
            value = TRUE, invert = TRUE)
  )
}

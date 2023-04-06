drop_empty_lines <- function(raw){
  grep("^ *$", raw, value = TRUE, invert = TRUE)
}

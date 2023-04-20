read_sol_gen_info <- function(raw){

  gen_info <- as.data.frame(
    lapply(
      list(PEDON = substr(raw, 2, 11),
           SOURCE = substr(raw, 14, 24),
           TEXTURE = substr(raw, 26, 30),
           DEPTH = substr(raw, 32, 36),
           DESCRIPTION = substr(raw, 38, 87)),
      gsub,
      pattern = "(^  *)|(  *$)",
      replacement = "")
  )

  gen_info$DEPTH <- as.numeric(gen_info$DEPTH)

  return(gen_info)
}

read_sol_gen_info <- function(raw){

  as.data.frame(
    lapply(
      list(PEDON = substr(raw, 2, 11),
           SOURCE = substr(raw, 14, 24),
           TEXTURE = substr(raw, 26, 30),
           DEPTH = as.numeric(substr(raw, 32, 36)),
           DESCRIPTION = substr(raw, 38, 87)),
      gsub,
      pattern = "(^  *)|(  *$)",
      replacement = "")
  )

}

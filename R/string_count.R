# replacement for str_count()
string_count <- function(string, regex, fixed = TRUE){
  greg_out <- gregexpr(regex, string, fixed = fixed)
  count <- unlist(lapply(
    greg_out,
    function(x){
      length(x[x > 0])
    }))
  return(count)
}

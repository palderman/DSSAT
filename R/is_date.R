is_date <- function(x){
  any(c("Date", "POSIXct") %in% class(x))
}

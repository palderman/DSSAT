v_fmt_to_type <- function(v_fmt, vnames = NULL){
  if(is.null(vnames)) vnames <- names(v_fmt)
  v_fmt[vnames] |>
    extr_substr("[a-z]") |>
    sapply(\(.x) switch(.x,
                        "f" = "numeric",
                        "s" = "character"))
}

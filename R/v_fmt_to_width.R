v_fmt_to_width <- function(v_fmt){

  width <- abs(
    as.numeric(
      extr_substr(v_fmt, "(?<=%)-*[[:digit:]]+")
      )
    )

  if(length(width) < 1) width = NA_real_

  nspaces <- nchar(gsub("[^ *]", "", v_fmt))

  full_width <- width + nspaces

  names(full_width) <- NULL

  return(full_width)
}

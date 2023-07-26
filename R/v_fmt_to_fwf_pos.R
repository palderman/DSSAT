v_fmt_to_fwf_pos <- function(v_fmt, header = NULL){

  if(!is.null(header)){

    # Construct regular expression with names in v_fmt
    v_name_regex <- paste0("(^|@| |\\.)",
                           names(v_fmt),
                           "($| |\\.)")

    # Find positions of names within header
    loc <- sapply(v_name_regex, regexpr, text = header)

    v_fmt <- v_fmt[loc > 0]

    v_fmt <- v_fmt[order(loc[loc > 0])]

  }

  fwf_pos <- v_fmt_to_fwf_widths(v_fmt)

  return(fwf_pos)
}

v_fmt_to_fwf_widths <- function(v_fmt){

    fwf_pos <- vector(mode = "list", length = 3)

    names(fwf_pos) <- c("begin", "end", "col_names")

    widths <- v_fmt_to_width(v_fmt)

    fwf_pos$end <- cumsum(widths)

    fwf_pos$begin <- c(0, head(fwf_pos$end, -1))

    fwf_pos$col_names <- names(v_fmt)

    attr(fwf_pos, "row.names") <- 1L:length(v_fmt)
    attr(fwf_pos, "class") <- "data.frame"

    return(fwf_pos)
}

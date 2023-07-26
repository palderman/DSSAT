filex_sanitize_section <- function(sec_in){
  regex <- paste0(" +(",
                  paste0(
                    paste0("(",
                           c("-+FACTOR LEVELS-+",
                             "AND WATER MANAGEMENT",
                             "DETAILS",
                             "\\(INORGANIC\\)",
                             "AND ROTATIONS",
                             "CONTROLS",
                             "CONDITIONS",
                             "AND ORGANIC FERTILIZER",
                             "MODIFICATIONS"),
                           ")"
                    ),
                    collapse = "|"
                  ),
                  ")"
  )

  sec_out <- gsub(regex,
                  "",
                  sec_in)
  return(sec_out)
}

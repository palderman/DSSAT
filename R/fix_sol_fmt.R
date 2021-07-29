fix_sol_fmt <- function(path){
  sol <- readLines(path)

  latLines <- str_which(sol,"LAT")

  # Exclude commented lines
  latLines <- sol[latLines] %>%
    str_detect("^!", negate = TRUE) %>%
    latLines[.]

  sol[latLines] %>%
    str_locate(" +LONG")

  sol[latLines] %>%
    str_locate(" +LAT")

  sol[latLines+1] %>%
    str_sub(34,43)

  str_sub(sol[latLines+1],25,34) <- sol[latLines+1] %>%
    str_sub(25,35) %>%
    str_replace(" +([^ ]+) +.*","\\1") %>%
    sprintf("%9s ",.)

  str_sub(sol[latLines+1],34,43) <- sol[latLines+1] %>%
    str_sub(34,43) %>%
    str_replace(" *(-*[^ ]+) +[^ ]*","\\1") %>%
    str_remove("^ +") %>%
    sprintf("%9s ",.)

  str_sub(sol[latLines+1],44) <- str_sub(sol[latLines+1],44) %>%
    str_remove("^ ")

  sol %>%
    str_replace_all(c("9L" = "9 L",
                      " oamy" = " Loamy",
                      " LAT    LOG " = "LAT     LONG")) %>%
    write(path,append = FALSE)
}

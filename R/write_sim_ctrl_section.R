#' @importFrom dplyr "%>%"
#' @importFrom purrr map
write_sim_ctrl_section <- function(section){
  sec_out <- 1:nrow(section) %>%
    map(function(i){
      sub_sec_out <- section[i,] %>%
        write_tier(pad_name='SNAME') %>%
        append(.,'@  AUTOMATIC MANAGEMENT',after = str_which(.,'PLANTING')-1)
      return(sub_sec_out)
    }) %>%
    unlist()
  return(sec_out)
}

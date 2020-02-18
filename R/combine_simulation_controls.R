#' @importFrom dplyr "%>%"
#' @importFrom purrr map_lgl reduce
#'
combine_simulation_controls <- function(sim_ctrl_in){

  begin <- sim_ctrl_in %>%
    map_lgl(~{all(c('N','GENERAL') %in% colnames(.))}) %>%
    which()

  end <- begin %>%
    {tail(.,-1) - 1} %>%
    {c(.,length(sim_ctrl_in))}


  sim_ctrl_out <- 1:length(begin) %>%
    map(function(i){
      combined <- sim_ctrl_in[begin[i]:end[i]] %>%
        reduce(combine_tiers)
      return(combined)
    }) %>%
    reduce(combine_tiers)

  return(sim_ctrl_out)
}

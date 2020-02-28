#' @importFrom dplyr "%>%" select select_if
#' @importFrom purrr map
write_soil_profile <- function(soil_profile){
  tier_info <- attr(soil_profile,'tier_info')
  soil_profile_out <- tier_info %>%
    map(function(tier_names){
      tier <- soil_profile %>%
        select(tier_names) %>%
        select_if(~!is.null(unlist(.)))
      if(ncol(tier) == length(tier_names)){
        attr(tier,'v_fmt') <- attr(soil_profile,'v_fmt')
        attr(tier,'tier_info') <- NULL
        tier_out <- write_tier(tier)
        return(tier_out)
      }else{
        return(NULL)
      }
    }) %>%
    unlist() %>%
    {.[1] <- ''
    .}
  return(soil_profile_out)
}

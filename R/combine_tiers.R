#' Efficiently combined data from two data tiers into one
#'
#' @export
#'
#' @keywords internal
#'
#' @param tier1,tier2 a tibble for each tier of data
#'
#' @return a tibble containing the data from the combined tiers
#'

combine_tiers <- function(tier1,tier2){
  # Load required packages
  require(dplyr)
  require(purrr)

  # Check if all columns are present in both tiers
  if(all(colnames(tier1) %in% colnames(tier2))){
    # Ensure column names match up and then bind tiers together
    if(any(colnames(tier1) != colnames(tier2))){
      tier2 <- tier2 %>%
        select(one_of(colnames(tier1)))
    }
    new_tier <- bind_rows(tier1,tier2)
  }else{
    # In this case the tiers do not have the same column names and must be
    # merged with a join operation
    new_tier <- full_join(tier1,tier2)
  }
  return(new_tier)
}

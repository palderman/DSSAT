missing_columns <- function(tier_data){
  all_cols <- unlist(
    attr(tier_data, "tier_info")
  )
  return(all_cols[!all_cols %in% colnames(tier_data)])
}

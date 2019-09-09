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

  # Check if all columns are present in both tiers
  # if(all(colnames(tier1) %in% colnames(tier2))){
  #   # Ensure column names match up and then bind tiers together
  #   if(any(colnames(tier1) != colnames(tier2))){
  #     tier2 <- tier2 %>%
  #       select(one_of(colnames(tier1)))
  #   }
  #   new_tier <- bind_rows(tier1,tier2)
  #   for()
  # }else
  if(!any(colnames(tier1) %in% colnames(tier2))){
    # In this case no column names are in common
    new_tier <- bind_cols(tier1,tier2)
  }else{
    # In this case the tiers do not have the same column names and must be
    # merged with a join operation
    new_tier <- full_join(tier1,tier2)
  }

  tier1_attr <- attributes(tier1)
  tier2_attr <- attributes(tier2)

  if('tier_info' %in% names(tier1_attr)&&
     'tier_info' %in% names(tier2_attr)){
    if(identical(tier1_attr$tier_info, tier2_attr$tier_info)){
      tier_info <- tier1_attr$tier_info
    }else{
      tier_info <- c(tier1_attr$tier_info, tier2_attr$tier_info)
    }
  }else if('tier_info' %in% names(tier1_attr)){
    tier_info <- tier1_attr$tier_info %>%
      c(.,list(colnames(tier2)))
  }else if('tier_info' %in% names(tier2_attr)){
    tier_info <- tier2_attr$tier_info %>%
      c(list(colnames(tier1)),.)
  }else{
    tier_info <- list(colnames(tier1),colnames(tier2))
  }
  if('v_fmt' %in% names(tier1_attr) &&
     'v_fmt' %in% names(tier2_attr)){
    if(identical(tier1_attr$v_fmt, tier2_attr$v_fmt)){
      v_fmt <- tier1_attr$v_fmt
    }else{
      v_fmt <- c(tier1_attr$v_fmt, tier2_attr$v_fmt)
    }
  }else if('v_fmt' %in% names(tier1_attr)){
    v_fmt <- tier1_attr$v_fmt
  }else if('v_fmt' %in% names(tier2_attr)){
    v_fmt <- tier2_attr$v_fmt
  }else{
    v_fmt <- NULL
  }

  attr(new_tier,'tier_info') <- tier_info

  if(!is.null(v_fmt)){
    v_fmt <- v_fmt %>%
      {.[!duplicated(names(.))]}
    attr(new_tier,'v_fmt') <- v_fmt
  }

  return(new_tier)
}

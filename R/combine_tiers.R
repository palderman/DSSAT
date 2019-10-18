#' Efficiently combined data from two data tiers into one
#'
#' @export
#'
#' @keywords internal
#'
#' @param tier1,tier2 a tibble for each tier of data
#'
#' @param use_collapse_rows a length-one logical vector that
#' indicates whether rows should be collapsed before join
#'
#' @return a tibble containing the data from the combined tiers
#'

combine_tiers <- function(tier1,tier2,use_collapse_rows=FALSE){

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

  tier1_attr <- attributes(tier1)
  tier2_attr <- attributes(tier2)

  # Determine intersection of columns
  by_col_1 <- tier1 %>%
    select_if(function(cl) !is.list(cl)) %>%
    colnames()
  by_col_2 <- tier2 %>%
    select_if(function(cl) !is.list(cl)) %>%
    colnames()
  col_inter <- intersect(by_col_1,by_col_2)

  ctypes_1 <- tier1 %>%
    ungroup() %>%
    select(col_inter) %>%
    summarize_all(~head(class(.),1)) %>%
    unlist()
  ctypes_2 <- tier2 %>%
    ungroup() %>%
    select(col_inter) %>%
    summarize_all(~head(class(.),1)) %>%
    unlist()

  if(any(ctypes_1 != ctypes_2)){
    for(cname in names(ctypes_1)){
      all_na_1 <- tier1 %>%
        ungroup() %>%
        summarize_at(vars(cname),~all(is.na(.))) %>%
        unlist()
      all_na_2 <- tier2 %>%
        ungroup() %>%
        summarize_at(vars(cname),~all(is.na(.))) %>%
        unlist()
      if(all_na_1 && ! all_na_2){
       tier1 <- tier1 %>%
         ungroup(cname) %>%
         mutate_at(vars(cname),~as(.,ctypes_2[cname]))
      }else if(all_na_2 && ! all_na_1){
        tier2 <- tier2 %>%
          ungroup(cname) %>%
          mutate_at(vars(cname),~as(.,ctypes_1[cname]))
      }
    }
  }
  if(use_collapse_rows){
    if(length(col_inter) > 0){
      tier1 <- tier1 %>%
        group_by_at(vars(one_of(col_inter))) %>%
        collapse_rows()
      tier2 <- tier2 %>%
        group_by_at(vars(one_of(col_inter))) %>%
        collapse_rows()
    }else{
      tier1 <- tier1 %>%
        collapse_rows()
      tier2 <- tier2 %>%
        collapse_rows()
    }
  }

  if(length(col_inter) == 0){
    # In this case no column names are in common
    new_tier <- bind_cols(tier1,tier2)
  }else{
    # In this case the tiers do not have the same column names and must be
    # merged with a join operation
    new_tier <- full_join(tier1,tier2,by=col_inter)
  }

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
    if(identical(colnames(tier1),colnames(tier2))){
      tier_info <- list(colnames(tier1))
    }else{
      tier_info <- list(colnames(tier1),colnames(tier2))
    }
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
    dup_names <- names(v_fmt) %>%
      {.[duplicated(.)]} %>%
      unique()
    v_fmt_new <- v_fmt %>%
      {.[!duplicated(names(.))]}
    for(nm in dup_names){
        v_fmt_new[nm] <- v_fmt %>%
          {.[names(.)==nm]} %>%
          reconcile_v_fmt()
    }
    attr(new_tier,'v_fmt') <- v_fmt_new
  }

  return(new_tier)
}

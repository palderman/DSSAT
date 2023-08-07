sub_test_func <- function(.x){
  if(is.list(.x)){
    test_out <- unlist(lapply(.x, function(.y) !is.null(.y) & any(!is.na(.y))))
  }else{
    test_out <- !is.na(.x)
  }
  return(test_out)
}

write_sub_tier <- function(section, sub_tier_info, sub_v_fmt,
                           pad_name, drop_duplicate_rows){

  sub_tier <- vector(mode = "list", length = nrow(section))

  sub_names <- grep('^[A-Z]$', sub_tier_info, value = TRUE)
  sub_filter <- do.call(
    Reduce,
    list(
      lapply(section[, sub_names, drop = FALSE],
             sub_test_func),
      f = `&`
    )
  )

  for(i in 1:nrow(section)){
    if(sub_filter[i]){
      sub_sec <- invert_collapse_rows(section[i, sub_tier_info, drop = FALSE])
      attr(sub_sec, "tier_info") <- list(sub_tier_info)
      attr(sub_sec, "v_fmt") <- sub_v_fmt
      sub_tier[[i]] <- write_tier(sub_sec,
                                  pad_name = pad_name,
                                  drop_duplicate_rows = drop_duplicate_rows)
    }else{
      sub_tier[[i]] <- NULL
    }
  }

  return(sub_tier)

}

write_dual_tier_section <- function(section, pad_name=NULL, drop_duplicate_rows=TRUE){

  tier_info <- attr(section,'tier_info')

  if(is.null(tier_info)){
    tier_info <- list(colnames(section))
  }

  v_fmt <- attr(section,'v_fmt')

  # Write first tier
  first_tier <- write_sub_tier(section,
                               sub_tier_info = tier_info[[1]],
                               sub_v_fmt = v_fmt,
                               pad_name,
                               drop_duplicate_rows)

  if(length(tier_info) > 1){

    # if(length(list_cols) > 0){
    #   levs <- section %>%
    #     filter_at(list_cols,all_vars(map_lgl(.,function(x){!is.null(x)&!is.na(x)}))) %>%
    #     select(matches('^[A-Z]$')) %>%
    #     filter_at(vars(matches('^[A-Z]$')),~{!is.na(.)}) %>%
    #     {.[[1]]}
    # }else{
    #   levs <- section %>%
    #     filter_at(tier_info[[2]],all_vars(map_lgl(.,function(x){!is.null(x)&!is.na(x)}))) %>%
    #     select(matches('^[A-Z]$')) %>%
    #     filter_at(vars(matches('^[A-Z]$')),~{!is.na(.)}) %>%
    #     {.[[1]]}
    # }


    # Write second tier
    second_tier <- write_sub_tier(section,
                                  sub_tier_info = tier_info[[2]],
                                  sub_v_fmt = v_fmt,
                                  pad_name,
                                  drop_duplicate_rows)

  }else{
    second_tier <- ''
  }

  # Drop empty lines
  sec_out <- grep("^$",
    unlist(
      mapply(c, first_tier, second_tier)
    ),
    invert = TRUE,
    value = TRUE
  )

  return(sec_out)
}

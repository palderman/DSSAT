#' @importFrom dplyr "%>%" ungroup select_if select filter_at matches
#' @importFrom tidyr unnest
#' @importFrom purrr map pmap
write_dual_tier_section <- function(section,pad_name=NULL,drop_duplicate_rows=TRUE){

  tier_info <- attr(section,'tier_info')

  if(is.null(tier_info)){
    tier_info <- list(colnames(section))
  }

  v_fmt <- attr(section,'v_fmt')

  list_cols <- section %>%
    ungroup %>%
    select_if(is.list) %>%
    colnames()

  first_tier <- 1:nrow(section) %>%
    map(function(i){
      sub_sec <- section[i,] %>%
        select(tier_info[[1]]) %>%
        filter_at(vars(matches('^[A-Z]$')),~{!is.na(.)})
      if(nrow(sub_sec) > 0){
        tier_out <- sub_sec %>%
        {attr(.,'tier_info') <- tier_info[1]
         .} %>%
        write_tier(.,pad_name=pad_name,drop_duplicate_rows=drop_duplicate_rows)
      }else{
        tier_out <- NULL
      }
      return(tier_out)
    })

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

    second_tier <- 1:nrow(section) %>%
      map(function(i){
        sub_sec <- section[i,] %>%
          filter_at(vars(matches('^[A-Z]$')),~{!is.na(.)})
        if(length(list_cols>0)){
          sub_sec <- sub_sec %>%
          filter_at(list_cols,any_vars(map_lgl(.,function(x){!is.null(x)&any(!is.na(x))})))
        }
        if(nrow(sub_sec) > 0){
        tier_out <- sub_sec %>%
          select(tier_info[[2]]) %>%
          unnest(cols=list_cols) %>%
          {attr(.,'tier_info') <- tier_info[2]
           attr(.,'v_fmt') <- v_fmt
          .} %>%
          write_tier(.,pad_name=pad_name,drop_duplicate_rows=drop_duplicate_rows)
        }else{
          tier_out <- NULL
        }
        return(tier_out)
      })
  }else{
    second_tier <- ''
  }

  sec_out <- list(first_tier,second_tier) %>%
      pmap(c) %>%
      unlist() %>%
      {.[.!='']}

  return(sec_out)
}

#' @importFrom dplyr "%>%"
#' @importFrom purrr map_lgl reduce
#' @importFrom stringr str_detect
#'
combine_multi_section <- function(tiers_in,info_vars){

  if(!is.data.frame(tiers_in)){

    first_tier <- tiers_in %>%
      map_lgl(function(tier){
        check <- map_lgl(info_vars,~any(str_detect(colnames(tier),.))) %>%
          all()
        return(check)
      }) %>%
      which() %>%
      {tiers_in[.]} %>%
      {if(!is.data.frame(.)) . <- reduce(.,combine_tiers)
      .}
    attr(first_tier,'tier_info') <- attr(first_tier,'tier_info')[1]

    second_tier <- tiers_in %>%
      map_lgl(function(tier){
        check <- map_lgl(info_vars,~any(str_detect(colnames(tier),.))) %>%
          all() %>%
          {!.}
        return(check)
      }) %>%
      which() %>%
      {tiers_in[.]} %>%
      {if(!is.data.frame(.)) . <- reduce(.,combine_tiers)
      .}
    attr(second_tier,'tier_info') <- attr(second_tier,'tier_info')[1]

    tier_out <- combine_tiers(first_tier,second_tier,use_collapse_rows = TRUE)
  }else{
    tier_out <- tiers_in
  }

  return(tier_out)
}

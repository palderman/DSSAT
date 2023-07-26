#' Writes data from a single DSSAT data tier
#'
#' @export
#'
#' @param tier_data a tibble containing the data to write out
#' @param pad_name a character vector of column names for which to add leading spaces/trailing periods
#' @param drop_duplicate_rows a logical value indicating whether duplicate rows
#'    should be dropped from tier_data
#' @param drop_na_rows a logical value indicating whether rows containing all NA values
#'    should be dropped from tier_data
#'
#' @return a character vector
#'
#' @importFrom dplyr "%>%" select group_by_at vars one_of filter_all any_vars arrange_at select_if filter_at do
#' @importFrom tidyr unnest replace_na
#' @importFrom stringr str_c str_replace_all str_extract str_remove str_detect str_which str_replace str_subset str_sub
#' @importFrom purrr pmap
#' @importFrom tidyselect all_of
#'
#' @examples
#'
#' tier_data <- data.frame(TRNO=1:4,HWAM=rnorm(4,2000,250))
#'
#' tier_data <- add_v_fmt(tier_data,v_fmt=c(TRNO='%6.0f', HWAM='%6.0f'))
#'
#' output <- write_tier(tier_data)
#'

write_tier <- function(tier_data, pad_name=NULL, drop_duplicate_rows=FALSE,
                       drop_na_rows=TRUE){

  v_fmt <- attr(tier_data,'v_fmt')

  if(is.null(v_fmt)){
    stop("Tier data has no v_fmt attribute.")
  }

  missing_names <- colnames(tier_data) %>%
    {.[!.%in%names(v_fmt)]}

  if(length(missing_names)>0){
    emsg <- missing_names %>%
      str_c(collapse = ', ') %>%
      str_c('The following variables were not found in the v_fmt: ',.)
    stop(emsg)
  }

  tier_info <- attr(tier_data,'tier_info')

  if(is.null(tier_info)){
    tier_info <- list(colnames(tier_data))
  }

  all_tier_output <- tier_info %>%
    map(function(tier_names){
      group_cols <- intersect(c('TRNO','DATE'), tier_names)
      if(length(group_cols) > 0 && drop_duplicate_rows){
        # Handle case of duplicate rows (e.g. in File A or T)
        tier_data_tmp <- tier_data %>%
          select(all_of(tier_names)) %>%
          group_by_at(vars(one_of(group_cols))) %>%
          do({filter_all(.,any_vars(filter_for_all_equal(.)))})
      }else{
        tier_data_tmp <- tier_data %>%
          select(all_of(tier_names))
      }
      if(length(group_cols) > 0 ){
        tier_data_tmp <- tier_data_tmp %>%
          arrange_at(group_cols)
      }

      list_cols <- tier_data_tmp %>%
        ungroup %>%
        select_if(is.list) %>%
        colnames()

      if(length(list_cols) > 0){
        tier_data_tmp <- tier_data_tmp %>%
          unnest(cols=list_cols)
      }

      header_output <- tier_names %>%
        {v_fmt[.]} %>%
        str_replace_all(c('(\\.[0-9]*)*[fi]+'='s')) %>%
        list(.,tier_names) %>%
        pmap(sprintf)
      max_width <- tier_names %>%
        {v_fmt[.]} %>%
        {.[1]} %>%
        str_extract('(?<!\\.)[0-9]+')
      if(is.na(max_width)){
        header_output[1] <- header_output[1] %>%
          str_c('@',.)
      }else{
        header_output[1] <- header_output[1] %>%
          str_remove('(^ )|( $)') %>%
          str_c('@',.)
      }
      header_output <- header_output %>%
        list(.,v_fmt[tier_names]) %>%
        pmap(function(hn,fmt){
          if({hn %>% str_replace_all(c(' '=''))} %in% pad_name){
            if(str_detect(fmt,'-')){
              hn <- str_replace_all(hn,c(' (?= *$)'='.'))
            }else{
              hn <- str_replace_all(hn,c('(?<=[ .]) (?= *[^ ])'='.'))
            }
          }
          return(hn)
        }) %>%
        unlist() %>%
        {dots <- str_which(.,'\\.$')
         dots <- dots[dots<length(.)]
         dots <- dots[!str_detect(.[dots+1],'^ ')]
         .[dots] <- str_replace(.[dots],'\\.$',' ')
        .} %>%
        str_c(collapse='') %>%
        # str_replace('^@( +)([^ ]+)','@\\2\\1')
        str_replace('^@ TRNO','@TRNO ')

      v_format <- tier_names %>%
        {v_fmt[.]}

      if(drop_na_rows){
        tier_data_tmp <- tier_data_tmp %>%
          {filter_at(.,str_subset(colnames(.),'^(?!TRNO|DATE)'),
                     any_vars(!is.na(.)))}
      }

      # Drop class to convert to list
      attr(tier_data_tmp, "class") <- NULL

      # Iterate over columns to write each column
      for(i in 1:length(tier_data_tmp)){
        tier_data_tmp[[i]] <- write_column(v_format[i],
                                           tier_data_tmp[[i]],
                                           tier_names[i])
      }

      # Combine with header and paste columns together
      tier_output <- c(
        header_output,
        do.call(paste0, tier_data_tmp)
      )

      return(tier_output)
    }) %>%
    unlist()

  return(invisible(all_tier_output))
}

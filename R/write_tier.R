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

      tier_output <- tier_data_tmp %>%
        as.list() %>%
        list(v_format,.,tier_names) %>%
        pmap(function(fmt,vr_val,cname){
          width <- fmt %>%
            str_extract('(?<=%)[-0-9]+') %>%
            str_replace('-','') %>%
            as.numeric()
          spaces <- fmt %>%
            str_extract('^.*(?=%)') %>%
            nchar() %>%
            replace_na(0)
          width <- width + spaces
          if(!str_detect(fmt,'-')) fmt <- str_remove(fmt,'^ *')
          if(is.POSIXct(vr_val)){
            if(width<7){
              vr_val <- format(vr_val,'%y%j')
            }else{
              vr_val <- format(vr_val,'%Y%j')
            }
          }
         # In future, throw error if value is too large to fit within column width?
         # else if(is.numeric(vr_val)){
         #  if(any(vr_val >= 10^width-0.5)) stop()
         # }
          if(str_detect(fmt, "%.*f") & !is.numeric(vr_val)){
            msg <- cname %>%
              str_c('Column ',.,' is not numeric even though the format indicates it should be. It will be treated as character. Please check output for introduced errors.')
            warning(msg)
            fmt <- str_replace(fmt, "\\.[0-9]f", "s")
          }
          vr_out <- sprintf(fmt,vr_val)
          if(!is.na(width)) vr_out <- check_numerical_column_width(vr_out,vr_val,width)
          if(any(nchar(vr_out)>width,na.rm=TRUE)){
            msg <- cname %>%
              str_c('Column ',.,' values were trimmed to fit specified column width. Please check output for introduced errors.')
            warning(msg)
            if(str_detect(fmt,'-')){
              vr_out[nchar(vr_out)>width] <- vr_out[nchar(vr_out)>width] %>%
                str_sub(start=width)
            }else{
              vr_out[nchar(vr_out)>width] <- vr_out[nchar(vr_out)>width] %>%
                str_sub(start=-width)
            }
          }
          if(str_detect(fmt,'-')){
            vr_out <- vr_out %>%
              str_replace_all(c('(?<=(^| ))NA( |$)'='-99'))
          }else{
            vr_out <- vr_out %>%
              str_replace_all(c(' NA(?=( |$))'='-99'))
          }
          return(vr_out)
        }) %>%
        do.call(str_c,.) %>%
        c(header_output,.)

      return(tier_output)
    }) %>%
    unlist()

  return(invisible(all_tier_output))
}

#' Writes data from a single DSSAT data tier
#'
#' @export
#'
#' @param tier_data a tibble containing the data to write out
#'
#' @return a character vector
#'
#' @examples
#'
#' tier_data <- tibble(TRNO=1:4,HWAM=rnorm(4,2000,250))
#'
#' tier_data <- add_v_fmt(tier_data,v_fmt=c(TRNO='%6.0f', HWAM='%6.0f'))
#'
#' write_tier(tier_data)

write_tier <- function(tier_data){

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
      header_output <- tier_names %>%
        {v_fmt[.]} %>%
        str_replace_all(c('(\\.[0-9]*)*[fi]+'='s')) %>%
        list(.,tier_names) %>%
        pmap(sprintf) %>%
        {.[1] <- str_replace(.[1],'^ ','@')
         .} %>%
        str_c(collapse='') %>%
        str_replace('@ TRNO','@TRNO ')

      v_format <- tier_names %>%
        {v_fmt[.]}

      tier_output <- tier_data %>%
        select(tier_names) %>%
        filter_at(vars(-TRNO,-DATE),any_vars(!is.na(.))) %>%
        as.list() %>%
        list(v_format,.) %>%
        pmap(function(fmt,vr_val){
          width <- fmt %>%
            str_extract('(?<=%)[0-9]+') %>%
            as.numeric()
          if('POSIXt'%in%class(vr_val)){
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
          vr_out <- sprintf(fmt,vr_val)
          if(any(nchar(vr_out)>width)){
            vr_out <- vr_out %>%
              str_sub(end=width)
            warning('Some columns trimmed to fit specified column width.')
          }
          return(vr_out)
        }) %>%
        do.call(paste0,.) %>%
        str_replace_all(c(' NA'='-99')) %>%
        c(header_output,.)

      return(tier_output)
    }) %>%
    unlist()

  return(invisible(all_tier_output))
}

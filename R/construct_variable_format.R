#' @importFrom dplyr "%>%" bind_rows mutate if_else select summarize_all as_tibble left_join rowwise summarize ungroup contains
#' @importFrom purrr map_lgl
#' @importFrom stringr str_detect str_extract str_replace_all
#' @importFrom glue glue_data
#' @importFrom tidyr replace_na
#' @importFrom rlang .data
#' @importFrom utils head
#'
construct_variable_format <- function(tier_data,fwf_pos,left_justified){
  # Determine width, justification, and data type for variable format
  fwf_pos[1,'begin'] <- max(fwf_pos[1,'begin'] - 1, 0)
#  left_justified <- left_justified %>% de_regex()
  if(length(left_justified) > 0){
    justification <- left_justified %>%
      str_replace_all('(^ +[+* ]*)|( +[+* ]*$)','') %>%
      str_c(collapse=')|(') %>%
      str_c('(',.,')') %>%
      map_lgl(fwf_pos$col_names,str_detect,.) %>%
      ifelse('-','')
  }else{
    justification <- ''
  }
  w_j_t <- fwf_pos %>%
    mutate(just = justification,
           leading_chars = if_else(.data$just == '',
                                   '',
                                   {str_extract(.data$col_names,'^[ *$]+') %>% replace_na('')}),
           col_names = str_replace_all(.data$col_names,c('^ +'='',
                                                         ' +$'=''))) %>%
    filter(!duplicated(.data$col_names) & !str_detect(.data$col_names,'-99')) %>%
    mutate(width = if_else(.data$just == '',
                           .data$end - .data$begin,
                           .data$end - .data$begin - nchar(.data$leading_chars)),
           type = {tier_data %>%
                   select(-contains('-99')) %>%
                   summarize_all(~{unlist(.) %>% class() %>% head(1)}) %>%
                   unlist()})

  # To prevent "no visible binding for global variable" from R CMD check for select()
  # statement below:
  col_names <- digits <- NULL

  # Estimate significant digits
  digits <- tier_data %>%
    # Use up to first 1000 values
    head(1000) %>%
    # Convert to a row of lists
    summarize_all(~{list(.)}) %>%
    # Transpose into a single-column matrix of lists
    t() %>%
    # Convert matrix to tibble and name column 'values'
    as_tibble(.name_repair=~{'values'}) %>%
    # Add column names from tier_data as a column
    mutate(col_names=colnames(tier_data)) %>%
    # Join with v_fmt table
    left_join(w_j_t,by='col_names') %>%
    # Group by row
    rowwise() %>%
    # Estimate significant digits for each variable
    summarize(col_names = .data$col_names,
              digits = guess_significant_digits(.data$values,.data$width)) %>%
    ungroup() %>%
    select(col_names,digits)

  v_fmt <- digits %>%
    left_join(w_j_t,by='col_names') %>%
    mutate(type=str_replace_all(.data$type,c(numeric='f',
                                             integer='f',
                                             character='s',
                                             logical='s',
                                             POSIXct='s')),
           width = replace_na(.data$width,'')) %>%
    mutate(fmt=glue_data(.,'{leading_chars}%{just}{width}{digits}{type}')) %>%
    select(col_names,fmt) %>%
    {fmt <- as.character(.$fmt)
    names(fmt) <- .$col_names
    fmt}

  return(v_fmt)
}

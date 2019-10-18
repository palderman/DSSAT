construct_variable_format <- function(tier_data,fwf_pos,left_justified){
  # Determine width, justification, and data type for variable format
  fwf_pos[1,'begin'] <- max(fwf_pos[1,'begin'] - 1, 0)
#  left_justified <- left_justified %>% de_regex()
  w_j_t <- fwf_pos %>%
    bind_rows() %>%
    mutate(just = {col_names %>%
#                    name_to_regex() %>%
                    map_lgl(~any(map_lgl(left_justified,str_detect,string=.))) %>%
                    ifelse('-','')},
           leading_space = if_else(just == '',
                                   '',
                                   {str_extract(col_names,'^ +') %>% replace_na('')}),
           col_names = str_replace_all(col_names,' ','')) %>%
    filter(!duplicated(col_names) & !str_detect(col_names,'-99')) %>%
    mutate(width = if_else(just == '',
                           end - begin,
                           end - begin - nchar(leading_space)),
           type = {tier_data %>%
                   select(-contains('-99')) %>%
                   summarize_all(~{unlist(.) %>% class() %>% head(1)}) %>%
                   t()})

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
    summarize(col_names=col_names,digits = guess_significant_digits(values,width)) %>%
    ungroup() %>%
    select(col_names,digits)

  v_fmt <- digits %>%
    left_join(w_j_t,by='col_names') %>%
    mutate(type=str_replace_all(type,c(numeric='f',
                                       integer='f',
                                       character='s',
                                       logical='s',
                                       POSIXct='s')),
           width = replace_na(width,'')) %>%
    mutate(.,fmt=glue_data(.,'{leading_space}%{just}{width}{digits}{type}')) %>%
    select(col_names,fmt) %>%
    {fmt <- as.character(.$fmt)
    names(fmt) <- .$col_names
    fmt}

  return(v_fmt)
}

construct_variable_format <- function(tier_data,fwf_pos,left_justified){
  # Determine width, justification, and data type for variable format
  w_j_t <- fwf_pos %>%
    bind_rows() %>%
    mutate(width = end - begin,
           just = ifelse(col_names%in%left_justified,'-',''),
           type = {tier_data %>% summarize_all(class) %>% t()})

  # Estimate significant digits
  digits <- tier_data %>%
    # Use up to first 100 values
    head(100) %>%
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
    left_join(w_j_t) %>%
    mutate(type=str_replace_all(type,c(numeric='f',
                                       integer='f',
                                       character='s'))) %>%
    mutate(.,fmt=glue_data(.,'%{width}{just}{digits}{type}')) %>%
    select(col_names,fmt) %>%
    {fmt <- as.character(.$fmt)
    names(fmt) <- .$col_names
    fmt}

  return(v_fmt)
}

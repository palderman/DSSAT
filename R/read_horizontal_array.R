read_horizontal_array <- function(lines){

  lines_out <- lines %>%
    str_replace_all(c('!.*'='',
                      ' +$'='',
                      '^ +'='')) %>%
    str_split(' +') %>%
    map(function(items){

      n_elem <- items[1] %>%
        str_extract('(?<=\\()[0-9]+(?=\\))') %>%
        as.numeric()

      if(is.null(n_elem)||is.na(n_elem)){
        n_elem <- 1
      }

      values <- items %>%
        head(n_elem+1) %>%
        read_table()

      if(nrow(values)>1){
        values <- values %>%
          summarize_all(~list(.))
      }

      return(values)
    }) %>%
    reduce(combine_tiers)

  return(lines_out)
}

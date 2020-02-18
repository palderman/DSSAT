#' @importFrom dplyr "%>%" summarize_all rename
#' @importFrom purrr map map_dbl reduce
#' @importFrom stringr str_replace_all str_split str_extract str_remove str_locate_all str_c str_locate
#' @importFrom readr read_table
#' @importFrom rlang "!!!" sym
read_horizontal_array <- function(all_lines){

  lines_out <- all_lines %>%
    map(function(line){

      items <- line %>%
        str_replace_all(c('!.*'='',
                          ' +$'='',
                          '^ +'='')) %>%
          str_split(' +') %>%
          {.[[1]]}

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
        new_name <- colnames(values) %>%
          {name_sym <- list(sym(.))
           names(name_sym) <- str_remove(.,'\\(.*')
           name_sym}
        values <- values %>%
          rename(.,!!!new_name)
      }

      if(n_elem>1){
        end <- items %>%
          head(n_elem+1) %>%
          tail(-1) %>%
          str_c('(?<= |^)',.,'(?= |$)') %>%
          str_locate_all(line,.) %>%
          map(~{.[,2]})

        end[[1]] <- end[[1]][1]

        for(i in 2:length(end)){
          end[[i]] <- end[[i]][ end[[i]] > end[[i-1]]] %>% head(1)
        }

        width <- end %>%
          unlist() %>%
          diff() %>%
          max()
      }else{
        width <- items %>%
          head(2) %>%
          map_dbl(~{str_locate(line,.)[,2]})
      }

      attr(values,'v_fmt') <- width %>%
        tibble(begin=0,end=.,col_names=colnames(values)) %>%
        construct_variable_format(values,.,NULL)

      return(values)
    }) %>%
    reduce(combine_tiers)

  return(lines_out)
}

#' @importFrom dplyr "%>%"
#' @importFrom stringr str_detect str_remove str_length
#' @importFrom purrr map_lgl
reconcile_gaps <- function(loc,left_justified){
  # Calculate separation between columns, should be 1
  separation <- loc[,c('start','end')] %>%
    t() %>%
    c() %>%
    head(-1) %>%
    tail(-1) %>%
    matrix(ncol=2,byrow=TRUE) %>%
    apply(1,diff)

  # Check for gaps between columns
  has_gaps <- separation %>%
  {. > 1} %>%
    which()

  # Check for overlaps between columns
  has_overlaps <- separation %>%
  {. < 1} %>%
    which()

  # Extend columns to fill in gaps
  for(i in has_gaps){
    if(loc[i,'cnames'] %in% left_justified){
      if(str_detect(loc[i+1,'regex'],'^ \\*')|
         loc[i+1,'cnames'] %in% left_justified){
        # If column i is left justified and start of column i+1
        #   is determined by regex extend end of column i
        loc[i,'end'] <- loc[i+1,'start'] - 1
      }else{
        # If column i is left justified and start of column i+1
        #   is determined by given name then extend start of
        #   column i+1
        loc[i+1,'start'] <- loc[i,'end'] + 1
      }
    }else{
      # If column i is not left justified then extend start of
      #   column i+1
      loc[i+1,'start'] <- loc[i,'end'] + 1
    }
  }

  # Shrink columns to eliminate overlaps
  for(i in has_overlaps){
    if(any(map_lgl(left_justified,str_detect,string=loc[i,'cnames']))){
      if(str_detect(loc[i+1,'regex'],'^ \\*')){
        # If column i is left justified and start of column i+1
        #   is determined by regex shrink start of column i+1
        # Limit shift in start of column i+1 to width of name
        #   without extra spaces " *"
        name_len <- loc[i+1,'cnames'] %>%
          str_remove('^ \\*') %>%
          str_length()
        loc[i,'end'] <- loc[i+1,'end'] - name_len
        loc[i+1,'start'] <- loc[i,'end'] + 1
      }else{
        # If column i is left justified and start of column i+1
        #   is determined by given name then shrink end of
        #   column i
        loc[i,'end'] <- loc[i+1,'start'] - 1
      }
    }else{
      # If column i is not left justified then shrink start of
      #   column i+1
      loc[i+1,'start'] <- loc[i,'end'] + 1
    }
  }
  return(loc)
}

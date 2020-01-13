reconcile_gaps <- function(loc,cnames,cnames_regex,left_justified){
  # Calculate separation between columns, should be 1
  separation <- loc %>%
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
    if(cnames[i] %in% left_justified){
      if(str_detect(cnames_regex[i+1],'^ \\*')){
        # If column i is left justified and start of column i+1
        #   is determined by regex extend end of column i
        loc[i,2] <- loc[i+1,1] - 1
      }else{
        # If column i is left justified and start of column i+1
        #   is determined by given name then extend start of
        #   column i+1
        loc[i+1,1] <- loc[i,2] + 1
      }
    }else{
      # If column i is not left justified then extend start of
      #   column i+1
      loc[i+1,1] <- loc[i,2] + 1
    }
  }

  # Shrink columns to eliminate overlaps
  for(i in has_overlaps){
    if(any(map_lgl(left_justified,str_detect,string=cnames[i]))){
      if(str_detect(cnames_regex[i+1],'^ \\*')){
        # If column i is left justified and start of column i+1
        #   is determined by regex shrink start of column i+1
        # Limit shift in start of column i+1 to width of name
        #   without extra spaces " *"
        name_len <- cnames[i+1] %>%
          str_remove('^ \\*') %>%
          str_length()
        loc[i,2] <- loc[i+1,2] - name_len
        loc[i+1,1] <- loc[i,2] + 1
      }else{
        # If column i is left justified and start of column i+1
        #   is determined by given name then shrink end of
        #   column i
        loc[i,2] <- loc[i+1,1] - 1
      }
    }else{
      # If column i is not left justified then shrink start of
      #   column i+1
      loc[i+1,1] <- loc[i,2] + 1
    }
  }
  return(loc)
}

#' Converts header line into a vector of column names
#'
#' @export
#'
#' @keywords internal
#'
#' @param header A length-one character vector of a header line
#' from a DSSAT format output file
#'
#' @param left_justified A character vector of column names that
#' should be left justified
#'
#' @return a tibble containing the begin position, end position,
#'  and name for each column from the original header line
#'
#' @examples
#'
#' header_line <-
#'   "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10"
#' header_to_fwf_position(header_line)

header_to_fwf_position <- function(header,left_justified='EXCODE',
                                   col_types=NULL,col_names=NULL,
                                   read_only = NULL){

  # Replace @ sign and | with space
  header <- header %>%
    str_replace_all(c('@'=' ',
                      '\\|'=' ',
                      '!.*'=''))

  if(is.null(read_only)){
    # Combine left justified,col_types and col_names for known columns
    col_names <- c(col_names,left_justified,names(col_types$cols)) %>%
      unique() %>%
      map_chr(function(pattern){
        if(str_detect(header,name_to_regex(pattern))){
          return(pattern)
        }else{
          return(NA)
        }
      }) %>%
      {.[!is.na(.)]}
  }else{
    col_names <- read_only %>%
      map_chr(function(pattern){
        if(str_detect(header,name_to_regex(pattern))){
          return(pattern)
        }else{
          return(NA)
        }
      }) %>%
      {.[!is.na(.)]}

  }

  # Loop over known col_names
  cnames <- header
  if(!is.null(col_names)){
    for(name in col_names){
      cnames <- splice_in_col_name(cnames,name)
    }
  }

  if(is.null(read_only)){
    # Extract unknown column names
    cnames <- map(cnames,function(new_names){
        potential_matches <- str_detect(new_names,col_names)
        if(any(potential_matches)){
          process <- col_names[potential_matches] %>%
            map_lgl(~{str_remove(new_names,.) %>%
                str_remove_all(' ') %>%
                str_length() %>%
                {. == 0}}) %>%
            {!any(.)}
        }else{
          process <- TRUE
        }
        if(process){
          new_names <- str_split(new_names,'(?<=[^ ]) +(?=[^ ])')
        }
        return(new_names)
      }) %>%
      unlist() %>%
      map(function(name){
        if(!any(str_detect(name,col_names))){
          name <- str_replace_all(name,c('^ +'='',' +$'=''))
        }
        return(name)
      }) %>%
      str_subset('(?!^$)')
  }else{
    cnames <- read_only
  }

  if(is.null(read_only)){
    # Infer column positions based on header
#  cnames_regex <- name_to_regex(cnames) %>%
      cnames_regex <- cnames %>%
      map_chr(function(name){
        if(any(str_detect(name,name_to_regex(left_justified)))){
          regex <- name %>%
            name_to_regex() %>%
            str_c(' *')
        }else if(!any(str_detect(name,name_to_regex(col_names)))){
          regex <- name %>%
            name_to_regex() %>%
            str_c(' *',.,'((?= )|(?=$))')
        }else{
          regex <- name %>%
            name_to_regex()
        }
        return(regex)
      })
  }else{
    cnames_regex <- str_c('\\.*',read_only,'\\.*')
  }

  start_end <- str_locate_all(header,cnames_regex) %>%
    map(~{
      if(nrow(.)>1){
        front_check <- str_sub(header,.[,1],.[,1]) %in% c(' ','') |
                          str_sub(header,.[,1]-1,.[,1]-1) %in% c(' ','')
        back_check <- str_sub(header,.[,2],.[,2]) %in% c(' ','') |
          str_sub(header,.[,2]+1,.[,2]+1) %in% c(' ','')
        if(sum(front_check) == 1){
          . <- .[front_check,]
        }else if(sum(back_check) == 1){
          . <- .[back_check,]
        }else if(sum(front_check & back_check) == 1){
          . <- .[front_check & back_check,]
        }else{
            . <- .[1,]
        }
      }
      .}) %>%
    do.call(rbind,.)

  # Set start of first column to 1
  start_end[1,1] <- 1

  # Reconcile gaps/overlaps in column bounds
  start_end <- reconcile_gaps(start_end,cnames,cnames_regex,left_justified)

  # Check column positions for left justified cases
  left_justified <- intersect(left_justified,cnames)
  for(ljc in left_justified){
    st <- {cnames == ljc} %>%
      which()
    # Set end of last column to NA (i.e. unbounded)
    if(st == length(cnames)) start_end[st,2] <- NA
  }

  # Convert column positions to fixed widths for use with read_fwf()
  fwf_pos <- cnames %>%
    de_regex() %>%
    fwf_positions(start=start_end[,1],end=start_end[,2],col_names=.) %>%
    filter(col_names!='-99')

  if(!is.null(read_only)){
    fwf_pos <- fwf_pos %>%
      filter(col_names %in% read_only)
  }

  return(fwf_pos)
}

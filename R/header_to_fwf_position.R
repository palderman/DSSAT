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
                                   col_types=NULL,col_names=NULL){

  # Replace @ sign and | with space
  header <- header %>%
    str_replace_all(c('@'=' ',
                      '\\|'=' ',
                      '!.*'=''))

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

  # Loop over known col_names
  cnames <- header
  if(!is.null(col_names)){
    for(name in col_names){
      cnames <- splice_in_col_name(cnames,name)
    }
  }

  # Extract unknown column names
  cnames <- map(cnames,function(new_names){
      if(!any(str_detect(new_names,col_names))){
        new_names <- str_split(new_names,'(?<=([^ ])) +(?=([^ ]))')
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

  # Infer column positions based on header
#  cnames_regex <- name_to_regex(cnames) %>%
    cnames_regex <- cnames %>%
    map_chr(function(name){
      if(any(str_detect(name,left_justified))){
        regex <- name %>%
          name_to_regex() %>%
          str_c(' *')
      }else if(!any(name %in% col_names)){
        regex <- name %>%
          name_to_regex() %>%
          str_c(' *',.,'((?= )|(?=$))')
      }else{
        regex <- name %>%
          name_to_regex()
      }
      return(regex)
    })

  start_end <- str_locate(header,cnames_regex)

  # Set start of first column to 1
  start_end[1,1] <- 1

  # Reconcile gaps/overlaps in column bounds
  start_end <- reconcile_gaps(start_end,cnames,left_justified)

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

  return(fwf_pos)
}

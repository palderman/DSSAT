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
  # Load required packages
  require(dplyr)
  require(stringr)
  require(readr)

  # Replace @ sign with space
  header <- header %>%
    str_replace('@',' ') %>%
    str_replace_all('\\|',' ')

  # Extract column names
  cnames <- header %>%
    str_split('(?<=([^ ])) +(?=([^ ]))') %>%
    unlist() %>%
    str_remove_all(' +')

  # Loop over known col_names
  if(!is.null(col_names)){
    for(name in col_names){
      cnames <- splice_in_col_name(cnames,name)
    }
  }

  # Infer column positions based on header
  start_end <- name_to_regex(cnames) %>%
    {str_c(' *',.)} %>%
    map(~str_locate_all(header,.)) %>%
    map(~{.[[1]]}) %>%
    do.call(rbind,.)

  # Check column positions for left justified cases
  if(!is.null(left_justified)&&
     any(left_justified%in%col_names)){
    for(ljc in left_justified){
      s <- str_which(col_names,paste0('^',ljc,'$'))
      if(length(s)>0){
        start_end[s,] <- str_locate(header,paste0(ljc,'[ \\.]+'))
        if(s==1) start_end[s,1] <- 1
        if(s > 1 &&
           !col_names[s-1]%in%left_justified){
          start_end[s-1,] <- paste0(col_names[s-1],' +') %>%
            str_locate(header,.)
        }
        if(s<length(col_names) &&
           !col_names[s+1]%in%left_justified){
          start_end[s+1,] <- str_locate(header,col_names[s+1])
        }
      }
    }
  }

  # Convert column positions to fixed widths for use with read_fwf()
  fwf_pos <- fwf_positions(start=start_end[,1],end=start_end[,2],col_names=cnames)

  return(fwf_pos)
}

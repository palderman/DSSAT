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
    str_replace('@',' ') %>%
    str_replace_all('\\|',' ')

  # Combine left justified,col_types and col_names for known columns
  col_names <- c(col_names,left_justified,names(col_types$cols)) %>%
    unique()

  # Loop over known col_names
  cnames <- header
  if(!is.null(col_names)){
    for(name in col_names){
      cnames <- splice_in_col_name(cnames,name)
    }
  }

  # Extract unkown column names
  cnames <- map(cnames,function(new_names){
      if(!new_names%in%col_names){
        new_names <- str_split(new_names,'(?<=([^ ])) +(?=([^ ]))')
      }
      return(new_names)
    }) %>%
    unlist() %>%
    map(function(name){
      if(!name%in%col_names){
        name <- str_replace_all(name,c('^ +'='',' +$'=''))
      }
      return(name)
    }) %>%
    str_subset('(?!^$)')

  # Infer column positions based on header
  cnames_regex <- name_to_regex(cnames) %>%
    {str_c(' *',.,'((?= )|(?=$))')}

  start_end <- matrix(nrow=length(cnames_regex),ncol=2)
  tmp_header <- header
  for(i in 1:length(cnames_regex)){
    start_end[i,] <- str_locate(tmp_header,cnames_regex[i])
    if(i>1) start_end[i,] <- start_end[i,] + start_end[i-1,2]
    tmp_header <- str_remove(tmp_header,cnames_regex[i])
  }

  # Check column positions for left justified cases
  if(!is.null(left_justified)&&
     any(left_justified%in%cnames)){
    for(ljc in left_justified){
      s <- str_which(cnames,paste0('^',ljc,'$'))
      if(length(s)>0){
        start_end[s,] <- name_to_regex(ljc) %>%
          str_locate(header,.)
        if(s==1) start_end[s,1] <- 1
        if(s==length(cnames)) start_end[s,2] <- NA
        if(s > 1 &&
           !cnames[s-1]%in%left_justified){
          start_end[s-1,] <- name_to_regex(cnames[s-1]) %>%
            str_locate(header,.)
        }
        if(s<length(col_names) &&
           !col_names[s+1]%in%left_justified){
          start_end[s+1,] <- name_to_regex(cnames[s+1]) %>%
            str_locate(header,.)
        }
      }
    }
  }

  # Convert column positions to fixed widths for use with read_fwf()
  fwf_pos <- fwf_positions(start=start_end[,1],end=start_end[,2],col_names=cnames)

  return(fwf_pos)
}

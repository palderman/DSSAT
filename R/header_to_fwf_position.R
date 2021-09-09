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
#' @importFrom stringr str_replace_all str_detect str_c str_split
#'  str_subset str_extract str_remove_all
#' @importFrom purrr map_lgl map_chr
#' @importFrom dplyr "%>%" mutate arrange tibble filter last pull
#' @importFrom readr fwf_positions
#'
#' @examples
#'
#' header_line <-
#'   "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D"
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
      unique()
    col_names <- col_names %>%
      name_to_regex() %>%
      map_lgl(~str_detect(header,.)) %>%
      {col_names[.]}
  }else{
    col_names <- read_only %>%
      str_c('((^)|( ))',.,'(( )|($))') %>%
      map_lgl(~str_detect(header,.)) %>%
      {read_only[.]}
  }

  if(is.null(read_only)){
    # reduce to unknown column names
    if(length(col_names) >= 1){
      unknown <- col_names %>%
        name_to_regex() %>%
        str_c('(',.,')') %>%
        str_c(collapse='|') %>%
        str_remove_all(header,.)
    }else{
      unknown <- header
    }
    # Extract unknown column names and combine with known col_names
    cnames <- unknown %>%
      str_split('(?<=[^ ]) +(?=[^ ])') %>%
      unlist() %>%
      str_subset('^ *$',negate = TRUE) %>%
      str_remove_all('(^ +)|( +$)') %>%
      c(col_names,.)
  }else{
    cnames <- col_names
  }

  if(is.null(read_only)){
    # Infer column positions based on header
      cnames_regex <- cnames %>%
      map_chr(function(name){
        if(any(str_detect(name,name_to_regex(left_justified)))){
          regex <- name %>%
            name_to_regex() %>%
            str_c(' *')
        }else if(!any(str_detect(de_regex(name),name_to_regex(col_names)))){
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
    cnames_regex <- str_c('\\.*',col_names,'\\.*')
  }

  start_end <- get_start_end(header,cnames_regex) %>%
    {tibble(start = as.numeric(.[,1]),
            end = as.numeric(.[,2]))} %>%
    mutate(col_names = {cnames %>%
                        de_regex() %>%
                        str_remove_all('(^ *)|( *$)')},
           cnames = cnames_regex %>%
             str_remove_all("( \\*)|( \\+)") %>%
             str_extract(header,.),
           regex = cnames_regex) %>%
    arrange(.data$start)

  # Set start of first column to 1
  start_end$start[1] <- 1

  # Convert column positions to fixed widths for use with read_fwf()
  if(is.null(left_justified)){
    left_justified <- character()
  }else{
    left_justified <- left_justified %>%
      str_remove_all("( \\*)|( \\+)") %>%
      str_extract(header,.)
  }
  if(is.null(read_only)) read_only <- character()
  fwf_pos <- header_to_fwf_position_cpp(start_end, left_justified, read_only)

  return(fwf_pos)
}

#' Reads soil parameters from a single DSSAT soil parameter file (*.SOL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @param id_soil a length-one character vector containing the soil ID code for a
#' single soil profile
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom dplyr "%>%" first
#' @importFrom stringr str_subset str_replace str_extract str_which str_c
#' @importFrom purrr map reduce
#'
#' @examples
#'
#' # Extract file path for sample soil file
#' sample_sol <- system.file('extdata','SAMPLE.SOL',package='DSSAT')
#'
#' sol <- read_sol(sample_sol)
#'

read_sol <- function(file_name,id_soil=NULL,left_justified=NULL,col_types=NULL,col_names=NULL){

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  # Extract title from file
  title <- raw_lines %>%
    str_subset('^\\*[Ss][Oo][Ii][Ll][Ss]') %>%
    str_replace('^\\*[Ss][Oo][Ii][Ll][Ss]:* *','')

  # Extract comments from file
  comments <- extract_comments(raw_lines)

  # Find beginning of each soil profile
  begin <- raw_lines %>%
    str_which('^\\*(?![Ss][Oo][Ii][Ll][Ss])')
  if(length(begin)==0) begin <- 1

  if(is.null(id_soil)){
    # Calculate end of each section based on beginning of next section
    end <- c(begin[-1]-1,length(raw_lines))
  }else{

    # Find index for profile id_soil
    id_soil_ind <- str_c('^\\*',id_soil) %>%
      str_which(raw_lines,.)

    # Find start of next soil profile
    end <- begin[begin>id_soil_ind] %>%
      {first(.)-1}

    # Handle case where id_soil is last profile in file
    if(is.null(end)||is.na(end)){
      end <- length(raw_lines)
    }

    begin <- id_soil_ind
  }

  # Extract and combine all profiles
  all_profiles <- map(1:length(begin),
                      ~read_soil_profile(raw_lines[begin[.]:end[.]],
                                     left_justified = left_justified,
                                     col_types = col_types,
                                     col_names = col_names)
    ) %>%
    reduce(combine_tiers,force_bind_rows=TRUE)

  attr(all_profiles,'title') <- title
  attr(all_profiles,'comments') <- comments

  all_profiles <- as_DSSAT_tbl(all_profiles)

  return(all_profiles)
}

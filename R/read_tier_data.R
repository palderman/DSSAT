#' Reads data from a single tier of a DSSAT output file
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_tier
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @examples
#'
#' sample_data_tier <- c(
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035   0.032   0.639",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036   0.033   0.662",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046   0.042   0.843")
#'
#' read_tier_data(sample_tier)

read_tier_data <- function(raw_lines,col_types=NULL,col_names=NULL,
                           left_justified='EXCODE',guess_max=10){
  # Load required packages
  require(dplyr)
  require(stringr)
  require(purrr)

  # Find header line
  skip <- str_which(raw_lines,'^@')
  headline <- raw_lines[skip]

  # Process header into fixed-width format positions
  fwf_pos <- map(headline,
                 ~header_to_fwf_position(.,left_justified,col_types,col_names))

  # Calculate end of each section based on beginning of next section
  end <- c(skip[-1]-1,length(raw_lines))

  # Put check_col_types here
  if(!is.null(col_types)){
    col_types <- map(1:length(skip),~check_col_types(col_types,fwf_pos[[.]]$col_names))
  }

  # Read data from tier
  tier_data <- map(1:length(skip),~read_fwf(raw_lines[skip[.]:end[.]],
                                            fwf_pos[[.]],
                                            comment = '!',
                                            skip = 1,
                                            na = c('-99','-99.','-99.0','-99.00','-99.000',
                                                   '*','**','***','****','*****','******','*******','********'),
                                            skip_empty_rows = TRUE,
                                            guess_max = guess_max,
                                            col_types=col_types[[.]])) %>%
    map(~{
      # Add DATE column if YEAR and DOY are in tier_data
      if({colnames(.) %>%
          {c('YEAR','DOY') %in% .} %>%
          all()}
         ){
        . <- . %>%
          mutate(DATE={paste0(YEAR,DOY) %>% as.POSIXct(format='%Y%j')}) %>%
          select(-YEAR,-DOY)
        }
      .}) %>%
    reduce(combine_tiers)

  return(tier_data)
}

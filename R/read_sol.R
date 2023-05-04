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
read_sol <- function(file_name, id_soil=NULL, left_justified=NULL,
                     col_types=NULL, col_names=NULL){

  # Read in raw data from file
  # exclude lines that are all spaces or lines with EOF in initial position
  raw_lines <- grep("^(?!\032) *([^ ]+)",
                    readLines(file_name, warn = FALSE),
                    perl = TRUE,
                    value = TRUE)

  # Specify left-justified columns
  left_justified <- left_justified %>%
    c('SITE','COUNTRY',' SCS FAMILY',
      ' SCS Family')

  # Specify column types
  col_types <- cols(`      LAT`=col_double(),
                    `     LONG`=col_double(),
                    SSAT=col_double(),
                    ` SCS FAMILY`=col_character(),
                    ` SCS Family`=col_character(),
                    SCOM=col_character(),
                    COUNTRY=col_character(),
                    SITE=col_character(),
                    SMHB=col_character(),
                    SMPX=col_character(),
                    SMKE=col_character(),
                    SLMH=col_character(),
                    SLB=col_double()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}

  # Drop comments and empty lines
  clean_lines <- drop_empty_lines( drop_comments(raw_lines) )

  # Find start/end positions for each soil profile (PEDON)
  pedon_start_end <- find_pedon(clean_lines)

  # Filter profiles based on id_soil
  if(!is.null(id_soil)){
    pedon_start_end <- pedon_start_end[pedon_start_end$PEDON %in% id_soil, ]
  }

  # Extract general information for each PEDON
  gen_info <- read_sol_gen_info(clean_lines[pedon_start_end$start])

  # Strip out and concatenate the lines for each PEDON
  pedon_lines <- concat_lines(clean_lines, pedon_start_end)

  # Find start/end positions for each soil data tier within each PEDON
  tier_start_end <- find_tier(pedon_lines)

  # Strip out and concatenate the lines for each soil data tier
  tier_lines <- concat_lines(pedon_lines$lines, tier_start_end)

  # Remove empty lines
  tier_lines <- with(tier_lines,
                     tier_lines[lines != "", ])

  # Read all lines by the same header
  tiers_out <- lapply(unique(tier_lines$header),
         function(h){
           raw_lines <- c(h,
                          with(tier_lines, lines[header == h]))

           pedon <- with(tier_lines, PEDON[header == h])

           tier_data <- read_tier_data(raw_lines,
                                       left_justified = left_justified,
                                       col_types = col_types,
                                       tier_fmt = sol_v_fmt(),
                                       convert_date_cols = FALSE)

           tier_data$PEDON <- pedon

           colnames(tier_data) <- toupper(colnames(tier_data))

           return(tier_data)
         })

  layer_ind <- sapply(tiers_out, is_sol_layer)

  # Create layer-specific data frame with rows nested by PEDON
  layer_data <- nest_rows(
    # Recursively merge layer-specific data
    recursive_merge(
      # Subset for list elements with layer-specific data
      tiers_out[layer_ind],
      by = c("PEDON", "SLB")),
    by = "PEDON")

  # Create whole profile data frame with one row per PEDON
  profile_data <- recursive_merge(
    c(list(gen_info),
      tiers_out[!layer_ind]),
    by = c("PEDON"))

  # Merge whole-profile and layer-specific data
  tiers_out <- coalesce_merge(profile_data, layer_data)

  return(tiers_out)
}

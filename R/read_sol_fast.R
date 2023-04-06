read_sol_fast <- function(raw_lines, left_justified=NULL,
                          col_types=NULL, col_names=NULL){

  left_justified <- left_justified %>%
    c('SITE','COUNTRY',' SCS FAMILY',
      ' SCS Family')

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

  clean_lines <- drop_empty_lines( drop_comments(raw_lines) )

  pedon_start_end <- find_pedon(clean_lines)

  gen_info <- read_sol_gen_info(clean_lines[pedon_start_end$start])

  pedon_lines <- concat_lines(clean_lines, pedon_start_end)

  tier_start_end <- find_tier(pedon_lines)

  tier_lines <- concat_lines(pedon_lines$lines, tier_start_end)

  tier_lines <- with(tier_lines,
                     tier_lines[lines != "", ])

  tiers_out <- lapply(unique(tier_lines$header),
         function(h){
           raw_lines <- c(h,
                          with(tier_lines, lines[header == h]))

           pedon <- with(tier_lines, PEDON[header == h])

           tier_data <- read_tier_data(raw_lines,
                                       left_justified = left_justified,
                                       col_types = col_types)

           tier_data$PEDON <- pedon

           if(any(duplicated(tier_data$PEDON))){
             tier_data <- nest_rows(tier_data, by = "PEDON")
           }

           return(tier_data)
         })

  # fwf_pos_list <- lapply(unique(tier_lines$header),
  #   FUN = header_to_fwf_position)

  # first_tier <- read_sol_first_tier()

  return(tiers_out)
}

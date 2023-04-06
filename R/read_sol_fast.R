read_sol_fast <- function(raw_lines){

  clean_lines <- drop_comments(raw_lines)

  pedon_start_end <- find_pedon(clean_lines)

  gen_info <- read_sol_gen_info(clean_lines[pedon_start_end$start])

  pedon_lines <- concat_lines(clean_lines, pedon_start_end)

  tier_start_end <- find_tier(pedon_lines)

  tier_lines <- concat_lines(pedon_lines, tier_start_end)

  # first_tier <- read_sol_first_tier()

  return(tier_start_end)
}

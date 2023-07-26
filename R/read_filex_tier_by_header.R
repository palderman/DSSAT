read_filex_tier_by_header <- function(tier_lines,
                                      left_justified = NULL,
                                      col_types = NULL){

  tier_data_list <- lapply(unique(tier_lines$header),
         function(h){
           raw_lines <- c(h,
                          with(tier_lines, lines[header == h]))

           section <- with(tier_lines, section[header == h])

           tier_data <- read_tier_data(raw_lines,
                                       left_justified = left_justified,
                                       col_types = col_types,
                                       tier_fmt = filex_v_fmt(section))

           colnames(tier_data) <- toupper(colnames(tier_data))

           tier_data$filex_name <- with(tier_lines,
                                        filex_name[header == h])
           tier_data$experiment <- with(tier_lines,
                                        experiment[header == h])
           tier_data$section <- with(tier_lines,
                                     section[header == h])

           return(tier_data)

         })

}

filex_expand_section <- function(sec_name){

  sec_out <- vector(mode = "character", length = length(sec_name))

  sec_out[grepl('^CHEMICAL', sec_name)] <- "CHEMICAL APPLICATIONS"

  sec_out[grepl('^CULTIVARS', sec_name)] <- "CULTIVARS"

  sec_out[grepl('^ENVIRONMENT', sec_name)] <- "ENVIRONMENT MODIFICATIONS"

  sec_out[grepl('^FERTILIZERS', sec_name)] <- "FERTILIZERS (INORGANIC)"

  sec_out[grepl('^FIELDS', sec_name)] <- "FIELDS"

  sec_out[grepl('^GENERAL', sec_name)] <- "GENERAL"

  sec_out[grepl('^HARVEST', sec_name)] <- "HARVEST DETAILS"

  sec_out[grepl('^INITIAL', sec_name)] <- "INITIAL CONDITIONS"

  sec_out[grepl('^IRRIGATION', sec_name)] <- "IRRIGATION AND WATER MANAGEMENT"

  sec_out[grepl('^PLANTING', sec_name)] <- "PLANTING DETAILS"

  sec_out[grepl('^RESIDUES', sec_name)] <- "RESIDUES AND ORGANIC FERTILIZER"

  sec_out[grepl('^SIMULATION', sec_name)] <- "SIMULATION CONTROLS"

  sec_out[grepl('^SOIL', sec_name)] <- "SOIL ANALYSIS"

  sec_out[grepl('^TILLAGE', sec_name)] <- "TILLAGE AND ROTATIONS"

  sec_out[grepl('^TREATMENTS', sec_name)] <- "TREATMENTS                        -------------FACTOR LEVELS------------"

  return(sec_out)
}

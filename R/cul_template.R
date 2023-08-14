# Generate template cultivar parameter data frame
#
# @export - Still in development
#
# @param model_code a character value that contains the DSSAT-CSM model code
#
# @param title a character value of the first line header for the cultivar
#  file (optional)
#
cul_template <- function(model_code, title = NULL, ...){

  if(is.null(title)) title <- cul_title(model_code)

  v_fmt <- cul_v_fmt(model_code)

  tier_info <- cul_tier_info(model_code)

  tier_names <- unique(unlist(tier_info))

  arg_list <- list(...)

  arg_names <- names(arg_list)

  v_names <- names(v_fmt)

  if(!is.null(tier_names)){
    v_fmt <- v_fmt[v_names %in% tier_names]
    v_names <- v_names[v_names %in% tier_names]
  }

  cul_args <- vector(mode = "list", length = length(v_fmt) + 1)
  names(cul_args) <- c(v_names, "check.names")

  for(v in v_names){
    if(v %in% arg_names){
      cul_args[[v]] <- arg_list[[v]]
    }else{
      type <- gsub(".*([fs]).*", "\\1", v_fmt[v])
      cul_args[[v]] <- switch(type,
                              f = NA_real_,
                              s = NA_character_)
    }
  }

  cul_args$check.names = FALSE

  cul <- do.call(data.frame, cul_args)

  attr(cul, "first_line") <- title

  attr(cul, "v_fmt") <- v_fmt

  attr(cul, "tier_info") <- tier_info

  return(cul)
}

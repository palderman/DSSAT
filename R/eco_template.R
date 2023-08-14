# Generate template ecotype parameter data frame
#
# @export - Still in development
#
# @param model_code a character value that contains the DSSAT-CSM model code
#
# @param title a character value of the first line header for the cultivar
#  file (optional)
#
eco_template <- function(model_code, title = NULL, ...){

  if(is.null(title)) title <- eco_title(model_code)

  v_fmt <- eco_v_fmt(model_code)

  tier_info <- eco_tier_info(model_code)

  tier_names <- unique(unlist(tier_info))

  arg_list <- list(...)

  arg_names <- names(arg_list)

  v_names <- names(v_fmt)

  if(!is.null(tier_names)){
    v_fmt <- v_fmt[v_names %in% tier_names]
    v_names <- v_names[v_names %in% tier_names]
  }

  eco_args <- vector(mode = "list", length = length(v_fmt) + 1)
  names(eco_args) <- c(v_names, "check.names")

  for(v in v_names){
    if(v %in% arg_names){
      eco_args[[v]] <- arg_list[[v]]
    }else{
      type <- gsub(".*([fs]).*", "\\1", v_fmt[v])
      eco_args[[v]] <- switch(type,
                              f = NA_real_,
                              s = NA_character_)
    }
  }

  eco_args$check.names = FALSE

  eco <- do.call(data.frame, eco_args)

  attr(eco, "first_line") <- title

  attr(eco, "v_fmt") <- v_fmt

  attr(eco, "tier_info") <- tier_info

  return(eco)
}

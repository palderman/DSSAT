get_dssat_version <- function(){

  dssat_csm <- options()$DSSAT.CSM

  if(is.null(dssat_csm)){

    version <- '47'

    warning("Missing value for DSSAT.CSM within options().\n",
            "DSSAT version is assumed to be 4.7. Please use\n\n",
            "  options(DSSAT.CSM=\"",root_dir,
            "/path/to/executable.exe\")\n\n",
            " to set the proper location and file name for DSSAT-CSM.\n")

  }else{

    version <- dssat_csm %>%
      basename() %>%
      str_extract('(?<=dscsm0|DSCSM0)[1-9]+')

  }

  return(version)

}

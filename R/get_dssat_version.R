#' @importFrom dplyr "%>%"
#' @importFrom stringr str_extract
get_dssat_version <- function(){

  dssat_csm <- options()$DSSAT.CSM

  if(is.null(dssat_csm) || length(dssat_csm) == 0 || dssat_csm == '' ){

    sys_info <- Sys.info()

    if(is.null(sys_info)){
      os <- NULL
      root_dir = ''
    }else{
      os <- sys_info['sysname']
      if(os == 'Windows'){
        root_dir <- 'C:/'
      }else{
        root_dir <- '/'
      }
    }

    version <- '48'

    warning("Missing value for DSSAT.CSM within options().\n",
            "DSSAT version is assumed to be 4.8. Please use\n\n",
            "  options(DSSAT.CSM=\"",root_dir,
            "path/to/executable.exe\")\n\n",
            " to set the proper location and file name for DSSAT-CSM.\n")

  }else{

    version <- dssat_csm %>%
      basename() %>%
      str_extract('(?<=dscsm0|DSCSM0)[1-9]+')

  }

  return(version)

}

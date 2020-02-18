utils::globalVariables(".")

#' @importFrom utils tail
.onAttach <- function(libname,pkgname){

  op <- options()

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

  if('DSSAT.CSM' %in% names(op)){
    startup_msg <- c("An existing value for DSSAT.CSM was found in options():\n\n",
                     "  ",op$DSSAT.CSM,
                     "\n\nIf this is not the correct executable, please use\n\n",
                     "  options(DSSAT.CSM=\"",root_dir,
                     "path/to/executable\")\n\n",
                     " to set the proper location and file name for DSSAT-CSM.\n")
  }else{

    dssat_root <- getwd()
    if(!is.null(os)){
      dssat_root <- list.dirs(path=root_dir,
                              full.names = TRUE,
                              recursive = FALSE)
      dssat_root <- grep('DSSAT',
                         dssat_root,
                         ignore.case = TRUE,
                         value = TRUE)
      if(length(dssat_root) > 0){
        dssat_root <- tail(dssat_root,1)
      }else{
        dssat_root <- getwd()
      }
    }

    dscsm <- NULL
    if(!is.null(os)){
      dscsm_candidates <- list.files(path=dssat_root,
                                     pattern='dscsm',
                                     full.names = TRUE,
                                     ignore.case = TRUE)
      if(os == 'Windows'){
        dscsm <- grep('DSCSM???\\.EXE',dscsm_candidates,value=TRUE)
        if(length(dscsm) == 0){
          dscsm <- grep('dscsm???\\.exe',dscsm_candidates,value=TRUE)
        }
        dscsm <- gsub('\\/','\\\\',dscsm)
      }else{
        dscsm <- grep('dscsm',dscsm_candidates,value=TRUE)
        if(length(dscsm) > 0){
          dscsm <- tail(dscsm,1)
        }
      }

    }

    if(is.null(dscsm)){
      startup_msg <- c("Unable to find DSSAT-CSM executable.\n",
                       "Please use\n\n",
                       " options(DSSAT.CSM=\"",root_dir,
                       "/path/to/executable\")\n\n to set the location\n",
                       "and file name for the DSSAT-CSM executable\n")
    }else{
      startup_msg <- c("A DSSAT-CSM executable was found here:\n\n",
                       "  ",dscsm,
                       "\n\nIf this is not the correct executable, please use\n\n",
                       "  options(DSSAT.CSM=\"",root_dir,
                       "/path/to/executable\")\n\n",
                       " to set the proper location and file name for DSSAT-CSM.\n")
    }

    options(DSSAT.CSM = dscsm)

  }

  if(!is.null(os)){
    if(os == 'Windows'){
      startup_msg <- gsub('\\/','\\\\ ',startup_msg)
    }
  }

  packageStartupMessage(startup_msg)

  return(invisible())

}


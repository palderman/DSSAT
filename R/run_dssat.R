#' Writes data from a single DSSAT data tier
#'
#' @export
#'
#' @param run_mode a length-one character vector that specifies the run
#'   mode that should be used for the DSSAT simulation. One of:
#'      A - Run all treatments.  User specifies fileX on the command
#'          line and the model runs all treatments
#'      B - Batch mode. User defines fileX and treatment numbers in
#'          Batch file
#'      C - Command line mode.  Use input from the command line.
#'      D - Debug mode.  Model skips input module and reads temp
#'          file from the command line
#'      E - Sensitivity analysis.  User defines fileX and treatment
#'          number in Batch file
#'      F - Farm model.  Use Batch file to define experiment
#'      G - Gencalc. Use Command line to define experiment and treatment
#'      I - Interactive mode.  Use model interface for exp. & trtno.
#'      L - Gene based model (Locus). Use Batch file to define experiment
#'      N - Seasonal analysis. Use Batch file to define experiment and
#'          treatments
#'      Q - Sequence analysis. Use Batch file to define experiment
#'      S - Spatial.  Use Batch file to define experiment
#'      T - Gencalc. Use Batch file to define experiments and treatment
#'
#' @param file_name a length-one character vector that specifies the file
#'   name to be used for simulation. Usually the name of a batch file or file X.
#'
#' @param suppress_output a logical value indicating whether to suppress DSSAT-CSM
#' output from being printed to the console
#'
#' @param wd an optional character string that specifies the working directory
#'   within which to run DSSAT-CSM. If left NULL, DSSAT-CSM will be run in the
#'   current working directory
#'
#' @return Invisibly returns the console output from running DSSAT-CSM
#'
#' @examples
#'
#' \dontrun{
#'   run_dssat()
#' }
#'
run_dssat <- function(run_mode='B', file_name=NULL, suppress_output=FALSE,
                      wd = NULL){
  if(!is.null(wd)){
    orig_wd <- getwd()
    on.exit({setwd(orig_wd)})
    setwd(wd)
  }
  dssat_csm <- options()$DSSAT.CSM
  if(is.null(dssat_csm)){
    sys_info <- Sys.info()
    if(!is.null(sys_info)){
      os <- sys_info['sysname']
      if(os == 'Windows'){
        root_dir <- 'C:\\'
        slash <- "\\"
      }else{
        root_dir <- "/"
        slash <- "/"
      }
    }else{
      root_dir <- "/"
      slash <- "/"
    }
    err_msg <- c("Missing value for DSSAT.CSM within options().\n",
                 "Please use\n\n",
                 "  options(DSSAT.CSM=\"",root_dir,
                 "path",slash,"to",slash,"executable.exe\")\n\n",
                 " to set the proper location and file name for DSSAT-CSM.\n")
    stop(err_msg)
  }else if(is.null(file_name)){
    version <- get_dssat_version()
    file_name <- str_c('DSSBatch.V',version)
  }
  system_call <- paste(dssat_csm, run_mode, file_name, sep=' ')
  output <- system(system_call, intern=suppress_output)
  return(invisible(output))
}

#' Writes soil parameters to a single DSSAT soil parameter file (*.SOL)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @param sol a tibble of soil profiles that have been read in by read_sol()
#'
#' @param append TRUE or FALSE indicating whether soil profile should
#' be appended to file_name. If FALSE, the soil profile will be written
#' to a new file and will overwrite file_name (if it exists).
#'
#' @param title a length-one character vector that contains the title of the soil file
#'
#' @param force_std_fmt a logical value indicating whether to override the
#' variable format stored within the FileX object with standard DSSAT formatting
#'
#' @return Invisibly returns NULL
#'
#' @importFrom dplyr "%>%"
#' @importFrom purrr map
#' @importFrom stringr str_c
#'
#' @examples
#'
#' # Extract file path for sample soil file
#' sample_sol <- system.file('extdata','SAMPLE.SOL',package='DSSAT')
#'
#' # Read sample soil file
#' sol <- read_sol(sample_sol)
#'
#' # Create example soil file path
#' sample_sol2 <- paste0(tempdir(),'/SAMPLE.SOL')
#'
#' # Write example soil file
#' write_sol(sol,sample_sol2)
#'

write_sol <- function(sol,file_name,title=NULL,append=TRUE,force_std_fmt=TRUE){

  if(is.null(title))  title <- attr(sol,'title')
  if(is.null(title))  title <- 'General DSSAT Soil Input File'

  comments <- attr(sol,'comments')

  if(force_std_fmt | is.null(attr(sol,'v_fmt'))){
    attr(sol,'v_fmt') <- v_fmt_sol()
  }
  if(is.null(attr(sol,'tier_info'))){
    attr(sol,'tier_info') <- tier_info_sol() %>%
      {.[map_lgl(.,~{any(. != "SLB" & . %in% names(sol))})]}
  }

  sol_out <- 1:nrow(sol) %>%
    map(~{sol[.,]}) %>%
    map(write_soil_profile) %>%
    unlist()

  if(!append){
    sol_out <- title %>%
      str_c('*SOILS: ',.) %>%
      c(.,comments,sol_out)
  }

  write(sol_out,file_name,append = append)

  return(invisible())
}

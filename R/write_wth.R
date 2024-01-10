#' Writes data to a single DSSAT weather file
#'
#' @export
#'
#' @param wth a tibble containing the data to write to a DSSAT
#' weather file
#'
#' @param file_name a character vector of length one that contains the name
#' of a single DSSAT file into which `wth` will be written
#'
#' @param force_std_fmt a logical value indicating whether to override the
#'   variable format stored within the `wth` object with standard DSSAT formatting
#'
#' @param location a character value that gives the location for the
#'   weather file header line
#'
#' @param comments a character vector containing any comments to be
#'   included in the weather file
#'
#' @param INSI Institute and site code (four-digit character code)
#'
#' @param LAT Latitude in decimal degrees
#'
#' @param LONG Longitude in decimal degrees
#'
#' @param ELEV Elevation in meters
#'
#' @param TAV Long-term average air temperature at reference
#'   height (typically 2 meters)
#'
#' @param AMP Long-term monthly air temperature amplitude at
#'   reference height (typically 2 meters)
#'
#' @param REFHT reference height for air temperature measurements
#'
#' @param WNDHT reference height for wind speed measurements
#'
#' @param CO2 carbon dioxide concentration in parts per million
#'
#' @return NULL
#'
#' @importFrom tibble tibble
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c
#' @importFrom purrr map
#'

write_wth <- function(wth, file_name, force_std_fmt = TRUE,
                      location = NULL, comments = NULL,
                      INSI = NULL, LAT = NULL, LONG = NULL,
                      ELEV = NULL, TAV = NULL, AMP = NULL,
                      REFHT = NULL, WNDHT = NULL, CO2 = NULL){

  if(is.null(location)){
    location <- attr(wth, "location")
  }

  location <- paste0('$WEATHER: ', location)

  if(is.null(comments)){
    comments <- fmt_comments(wth)
  }else{
    comments <- fmt_comments(comments)
  }

  # Determine if wth was read from old or new file format
  general <- attr(wth,'GENERAL')

  if(is.null(general)){
    general <- data.frame(INSI = if(is.null(INSI)) NA_character_ else INSI,
                          LAT = if(is.null(LAT)) NA_real_ else LAT,
                          LONG = if(is.null(LONG)) NA_real_ else LONG,
                          ELEV = if(is.null(ELEV)) NA_real_ else ELEV,
                          TAV = if(is.null(TAV)) NA_real_ else TAV,
                          AMP = if(is.null(AMP)) NA_real_ else AMP,
                          REFHT = if(is.null(REFHT)) NA_real_ else REFHT,
                          WNDHT = if(is.null(WNDHT)) NA_real_ else WNDHT)
  }

  old_format <- is.data.frame(general)

  if(old_format){
    g_v_fmt <- attr(general,"v_fmt")
  }else{
    g_v_fmt <- do.call(
      c,
      lapply(general,
             function(.x){
               attr(.x,"v_fmt")
             })
      )
  }

  if(old_format){
    if(force_std_fmt | is.null(g_v_fmt)){
      g_v_fmt <- wth_v_fmt("GENERAL", old_format = old_format)
    }

    # Replace columns in general data.frame with non-null function arguments
    # the double exclamation "bang-bang" operator (!!) forces assignment
    # using the function argument of the same name
    if(!is.null(INSI)) general$INSI <- INSI
    if(!is.null(LAT)) general$LAT <- LAT
    if(!is.null(LONG)) general$LONG <- LONG
    if(!is.null(ELEV)) general$ELEV <- ELEV
    if(!is.null(TAV)) general$TAV <- TAV
    if(!is.null(AMP)) general$AMP <- AMP
    if(!is.null(REFHT)) general$REFHT <- REFHT
    if(!is.null(WNDHT)) general$WNDHT <- WNDHT
    if(!is.null(CO2)) general$CO2 <- CO2

    attr(general, "v_fmt") <- g_v_fmt

    gen_out <-  c(
      write_tier(general,
                 drop_na_rows = FALSE),
      "")
  }else{
    if(force_std_fmt | is.null(g_v_fmt)){
      g_v_fmt <- wth_v_fmt("GENERAL", old_format = old_format)
    }
    gen_out <- c(
      "*GENERAL",
      unlist(
        lapply(
          lapply(general,
                 function(.x){
                   attr(.x, "v_fmt") <- g_v_fmt
                   return(.x)
                   }),
          function(.y){
            c(
              write_tier(.y, drop_na_rows=FALSE),
              "")
            })
        ),
      "*DAILY DATA"
      )
  }

  d_v_fmt <- attr(wth,"v_fmt")

  if(force_std_fmt | is.null(d_v_fmt)){
      d_v_fmt <- wth_v_fmt("DAILY")
  }

  attr(wth, "v_fmt") <- d_v_fmt

  tier_output <- c(
    location,
    "",
    comments,
    "",
    gen_out,
    write_tier(wth, drop_na_rows = FALSE)
    )

  write(tier_output, file_name)

  return(invisible())
}

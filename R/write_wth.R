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

  location <- location %>%
    c('*WEATHER: ',.) %>%
    str_c(collapse='')

  if(is.null(comments)) comments <- attr(wth,'comments')

  # Determine if wth was read from old or new file format
  general <- attr(wth,'GENERAL')

  if(is.null(general)){
    general <- tibble(INSI = if(is.null(INSI)) NA_character_ else INSI,
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
    g_v_fmt <- general %>%
      map(~attr(.,"v_fmt")) %>%
      do.call(c,.)
  }

  if(old_format){
    if(force_std_fmt | is.null(g_v_fmt)){
      g_v_fmt <- c(INSI = "%6s", LAT = "%9.3f", LONG = "%9.3f", ELEV = "%6.0f",
                   TAV = "%6.1f", AMP = "%6.1f", REFHT = "%6.1f",
                   WNDHT = "%6.1f", CO2 = "%6f")
    }

    # Replace columns in general tibble with non-null function arguments
    # the double exclamation "bang-bang" operator (!!) forces assignment
    # using the function argument of the same name
    if(!is.null(INSI)) general <- mutate(general, INSI = !!INSI)
    if(!is.null(LAT)) general <- mutate(general, LAT = !!LAT)
    if(!is.null(LONG)) general <- mutate(general, LONG = !!LONG)
    if(!is.null(ELEV)) general <- mutate(general, ELEV = !!ELEV)
    if(!is.null(TAV)) general <- mutate(general, TAV = !!TAV)
    if(!is.null(AMP)) general <- mutate(general, AMP = !!AMP)
    if(!is.null(REFHT)) general <- mutate(general, REFHT = !!REFHT)
    if(!is.null(WNDHT)) general <- mutate(general, WNDHT = !!WNDHT)
    if(!is.null(CO2)) general <- mutate(general, CO2 = !!CO2)

    gen_out <- general %>%
      `attr<-`("v_fmt", g_v_fmt) %>%
      write_tier(drop_na_rows = FALSE) %>%
      c(.,'')
  }else{
    if(force_std_fmt | is.null(g_v_fmt)){
      g_v_fmt <- c(Latitude = "%9.1f", Longitud = "%9.2f", Elev = "%6.0f",
                   Zone = "%5f", TAV = "%7f", TAMP = "%6.1f", REFHT = "%6f",
                   WNDHT = "%6f", SITE = "%-s", WYR = "%4.0f",
                   WFIRST = "%8.0f", WLAST = "%8.0f", PEOPLE = "%-s",
                   ADDRESS = "%-s", METHODS = "%-s", INSTRUMENTS = "%-s",
                   PROBLEMS = "%-s", PUBLICATIONS = "%-s",
                   DISTRIBUTION = "%-s", NOTES = "%-s")
    }
    gen_out <- general %>%
      map(~`attr<-`(.,"v_fmt",g_v_fmt)) %>%
      map(write_tier, drop_na_rows=FALSE) %>%
      map(~{c(.,'')}) %>%
      unlist() %>%
      c('*GENERAL',.,'*DAILY DATA')
  }

  d_v_fmt <- attr(wth,"v_fmt")

  if(force_std_fmt | is.null(d_v_fmt)){
      d_v_fmt <- c(DATE = "%5s", SRAD = "%6.1f", TMAX = "%6.1f",
                   TMIN = "%6.1f", RAIN = "%6.1f", WIND = "%6.0f",
                   RHUM = "%6.1f", DEWP = "%6.1f", PAR = "%6.1f",
                   EVAP = "%6.1f", VAPR = "%6.2f", SUNH = "%6.1f")
    if(!old_format){
      d_v_fmt["DATE"] <- "%7s"
    }
  }

  if(!is.null(comments)){
    comments <- comments %>%
      str_c("! ", .)
  }

  tier_output <- wth %>%
    `attr<-`("v_fmt", d_v_fmt) %>%
    write_tier(drop_na_rows = FALSE) %>%
    c(location,'',comments,'',gen_out,.)

  write(tier_output, file_name)

  return(invisible())
}

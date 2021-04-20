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

#' @return NULL
#'
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c
#' @importFrom purrr map
#'

write_wth <- function(wth, file_name, force_std_fmt = TRUE){

  location <- attr(wth,'location') %>%
    c('*WEATHER: ',.) %>%
    str_c(collapse='')

  comments <- attr(wth,'comments')

  # Determine if wth was read from old or new file format
  general <- attr(wth,'GENERAL')

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
                   TAV = "%6.1f", AMP = "%6.0f", REFHT = "%6.0f",
                   WNDHT = "%6.0f", CO2 = "%6f")
    }
    gen_out <- general %>%
      `attr<-`("v_fmt",g_v_fmt) %>%
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
      map(write_tier,drop_na_rows=FALSE) %>%
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

  tier_output <- wth %>%
    `attr<-`("v_fmt", d_v_fmt) %>%
    write_tier(drop_na_rows = FALSE) %>%
    c(location,'',comments,'',gen_out,.)

  write(tier_output,file_name)

  return(invisible())
}

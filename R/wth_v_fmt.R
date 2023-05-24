wth_v_fmt <- function(section, old_format = FALSE){
  if(section == "DAILY"){
      v_fmt <- c(DATE = "%7s", SRAD = "%6.1f", TMAX = "%6.1f",
                 TMIN = "%6.1f", RAIN = "%6.1f", WIND = "%6.0f",
                 RHUM = "%6.1f", DEWP = "%6.1f", PAR = "%6.1f",
                 EVAP = "%6.1f", VAPR = "%6.2f", SUNH = "%6.1f")
  }else if(section == "GENERAL"){
    if(old_format){
     v_fmt <- c(INSI = "%6s", LAT = "%9.3f", LONG = "%9.3f", ELEV = "%6.0f",
                TAV = "%6.1f", AMP = "%6.1f", REFHT = "%6.1f",
                WNDHT = "%6.1f", CO2 = "%6f")
    }else{
      v_fmt <- c(Latitude = "%9.1f", Longitud = "%9.2f", Elev = "%6.0f",
                 Zone = "%5f", TAV = "%7f", TAMP = "%6.1f", REFHT = "%6f",
                 WNDHT = "%6f", SITE = "%-s", WYR = "%4.0f",
                 WFIRST = "%8.0f", WLAST = "%8.0f", PEOPLE = "%-s",
                 ADDRESS = "%-s", METHODS = "%-s", INSTRUMENTS = "%-s",
                 PROBLEMS = "%-s", PUBLICATIONS = "%-s",
                DISTRIBUTION = "%-s", NOTES = "%-s")
    }
  }else{
    v_fmt <- NULL
  }
}

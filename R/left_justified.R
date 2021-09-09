#' Return list of left justified columns in DSSAT FileX
#'
left_justified_filex <- function(){

  left_justified <- c('SITE','PEOPLE','ADDRESS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES','  HARM\\.*',
                      ' TNAME\\.*','FLNAME','  ID_SOIL',' CNAME',
                      ' WSTA\\.*',' SLTX',
                      ' ID_FIELD',' ICNAME',' IRNAME',' FERNAME',' GENERAL',
                      ' SNAME\\.*','SMODEL',' MODEL',' OPTIONS',' METHODS',' MANAGEMENT',
                      ' OUTPUTS',' PLANTING',' IRRIGATION',' NITROGEN',
                      ' RESIDUES',' HARVEST',
                      ' EDAY','ERAD','EMAX','EMIN','ERAIN','ECO2',
                      'EDEW','EWIND','ENVNAME',
                      ' HNAME',' CHT\\.*',
                      ' RENAME',' +PLNAME','CHNAME')

  return(left_justified)

}

#' Return list of left justified columns in DSSAT Soil file
#'
left_justified_soil <- function(){
  left_justified <- c('SITE','COUNTRY',' SCS FAMILY', ' SCS Family')
  return(left_justified)
}

#' Return list of left justified columns in DSSAT Weather file
#'
left_justified_wth <- function(){
  left_justified <- c(' SITE','PEOPLE','ADDRESS','METHODS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES')
  return(left_justified)
}

#' Return list of left justified columns in DSSAT CUL files
#'
left_justified_cul <- function(){
  left_justified <- c('VAR#','VARNAME\\.*','VAR-NAME\\.*','VRNAME\\.*')
  return(left_justified)
}

#' Return list of left justified columns in DSSAT ECO files
#'
left_justified_eco <- function(){
  left_justified <- c('ECO   ','ECO#','ECONAME\\.*','ECO-NAME\\.*')
  return(left_justified)
}

#' Return list of left justified columns in DSSAT OUT files
#'
left_justified_out <- function(){
  left_justified <- c(' TNAME\\.*',' TNAM\\.+',' EXNAME\\.*',
                      ' FNAM\\.*(?= |$)',' WSTA\\.*', ' SOIL_ID\\.*',
                      ' MODEL\\.*','EXCODE  ', "FILEX       ")
  return(left_justified)
}



#' Return list of column names in DSSAT FileX
#'
col_names_filex <- function(){
  col_names <- c(' +N(?= |$)',' +R(?= |$)',' +O(?= |$)',' +C(?= |$)',
                 ' +L(?= |$)',' +P(?= |$)',' +F(?= |$)',' +T(?= |$)',
                 ' +H(?= |$)',' +I(?= |$)',' +A(?= |$)',' +E(?= |$)',
                 ' CU(?= |$)',' FL(?= |$)',' SA(?= |$)',' IC(?= |$)',
                 ' MP(?= |$)',' MI(?= |$)',' MF(?= |$)',' MR(?= |$)',
                 ' MC(?= |$)',' MT(?= |$)',' ME(?= |$)',' MH(?= |$)',
                 ' SM(?= |$)','  FLSA')
  return(col_names)
}

#' Return list of column names in DSSAT Output files
#'
col_names_out <- function(){
  col_names <- c(' +S(?= |$)', ' +O(?= |$)', ' +C(?= |$)',
                 ' +CR(?= |$)', ' TNAM(?= |$)', '  TRNO', '    SDAT')
  return(col_names)
}

#' Return list of column names in DSSAT FileT
#'
col_names_filet <- function(){
  col_names <- c(' TRNO ')
  return(col_names)
}

#' Return list of column names in DSSAT CUL file
#'
col_names_cul <- function(){
  col_names <- c('Stalk','Sucro','Null1',
                 'TB(1)','TO1(1)','TO2(1)',
                 'TB(2)','TO1(2)','TO2(2)',
                 ' *TM(1)',' *TM(2)',
                 'StHrv','RTNFAC','Null7',
                 'RES30C','RLF30C')
  return(col_names)
}

#' Return list of column names in DSSAT ECO file
#'
col_names_eco <- function(){
  col_names <- c('    P1','ECO   ')
  return(col_names)
}

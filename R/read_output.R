#' Reads data from a single DSSAT output file
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @inheritParams read_tier_data
#'
#' @return a tibble containing the data from the raw DSSAT output
#'
#' @importFrom readr cols col_character read_csv
#' @importFrom stringr str_subset str_which
#' @importFrom dplyr "%>%"
#' @importFrom purrr map reduce
#' @importFrom utils read.csv
#'
#' @examples
#'
#' # Extract file path for sample output file path
#' sample_output <- system.file('extdata','SAMPLE.OUT',package='DSSAT')
#'
#' out <- read_output(sample_output)
#'

read_output <- function(file_name, col_types = NULL, col_names = NULL,
                        left_justified = NULL, read_only = NULL,
                        store_v_fmt = FALSE){

  # Add if statement for csv output files

  if(any(grepl("\\.csv", file_name))){

    raw_lines <- readLines(file_name, warn = FALSE)

    cnames <- unlist(
      strsplit(raw_lines[1], split = ",")
    )

    na_strings <- c('-99','-99.','-99.0','-99.00','-99.000',
                    '-99.0000','-99.00000','-99.000000','-99.0000000',
                    '*','**','***','****','*****','******','*******','********')

    output <- read.csv(text = raw_lines[-1], header = FALSE, na.strings = na_strings)

    if(ncol(output) > length(cnames)){
      output <- output[, 1:length(cnames)]
    }

    colnames(output) <- cnames

    if("YEAR" %in% cnames & "DOY" %in% colnames(output)){
      output$DATE <- with(output,
           as.POSIXct(
             sprintf("%4i%3.3i", YEAR, DOY),
             format = "%Y%j",
             tz = "UTC")
      )
      output$YEAR <- NULL
      output$DOY <- NULL
    }

    cnames <- colnames(output)

    cnames[cnames == "EXP"] <- "EXPERIMENT"
    cnames[cnames == "TRTNUM"] <- "TRNO"

    colnames(output) <- cnames

  }else{

    col_types <- cols(` TNAME\\.*`=col_character(),
                      ` TNAM\\.+`=col_character(),
                      ` EXNAME\\.*`=col_character(),
                      ` FNAM\\.*(?= |$)`=col_character(),
                      ` WSTA\\.*`=col_character(),
                      ` SOIL_ID\\.*`=col_character(),
                      ` MODEL\\.*`=col_character()) %>%
      {.$cols <- c(.$cols,col_types$cols);.}

    left_justified <- left_justified %>%
      c(.,' TNAME\\.*',' TNAM\\.+',' EXNAME\\.*',' FNAM\\.*(?= |$)',' WSTA\\.*',
        ' SOIL_ID\\.*',' MODEL\\.*')

    col_names <- col_names %>%
      c(.,
        ' +S(?= |$)',' +O(?= |$)',' +C(?= |$)',' +CR(?= |$)',' TNAM(?= |$)',
        '            XLAT', '            LONG')

    if(basename(file_name) == "Plantsum.OUT"){
      col_types <- cols(`EXCODE    `=col_character()) %>%
        {.$cols <- c(.$cols, col_types$cols);.}
      left_justified <- left_justified %>%
        c(., 'EXCODE    ')
      col_names <- col_names %>%
        c(., 'TRNO')
    }else{
      col_types <- cols(`EXCODE  `=col_character()) %>%
        {.$cols <- c(.$cols, col_types$cols);.}
      left_justified <- left_justified %>%
        c(., 'EXCODE  ')
      col_names <- col_names %>%
        c(., '  TRNO')
    }

    # Read in raw data from file
    raw_lines <- readLines(file_name, warn = FALSE) %>%
      str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

    # Find beginning of each section
    begin <- raw_lines %>%
      str_which('^\\*DSSAT')

    if(length(begin)==0) begin <- 1

    # Calculate end of each section based on beginning of next section
    end <- c(begin[-1]-1,length(raw_lines))

    # Read each section of output file
    output <- map(1:length(begin),
                     ~read_tier(raw_lines[begin[.]:end[.]],
                                col_types = col_types,
                                col_names = col_names,
                                left_justified = left_justified,
                                store_v_fmt = store_v_fmt,
                                read_only = read_only)) %>%
      reduce(combine_tiers) %>%
      as_DSSAT_tbl()

  }

  return(output)
}

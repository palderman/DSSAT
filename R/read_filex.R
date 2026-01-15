#' Reads input data from a single DSSAT experiment file (*.*X)
#'
#' @export
#'
#' @inheritParams read_dssat
#'
#' @inheritParams read_tier_data
#'
#' @param use_std_fmt logical value indicating whether to read
#'   FileX using the standard column formats. If FALSE, column
#'   formats will be inferred from tier headers
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#' @importFrom readr cols col_character
#'
read_filex <- function(file_name, col_types=NULL, col_names=NULL, na_strings=NULL,
                       store_v_fmt = FALSE, use_std_fmt = FALSE){

  col_types <- cols(` SNAME\\.*`=col_character(),
                    FMOPT=col_character(),
                    EVAPO=col_character(),
                    PEOPLE=col_character(),
                    ADDRESS=col_character(),
                    INSTRUMENTS=col_character(),
                    PROBLEMS=col_character(),
                    PUBLICATIONS=col_character(),
                    DISTRIBUTION=col_character(),
                    NOTES=col_character(),
                    SITE=col_character(),
                    ` GENERAL`=col_character(),
                    START=col_character(),
                    ` SNAME\\.*`=col_character(),
                    ` MODEL`=col_character(),
                    SMODEL=col_character(),
                    ` OPTIONS`=col_character(),
                    WATER=col_character(),
                    ` NITRO(?= )`=col_character(),
                    SYMBI=col_character(),
                    PHOSP=col_character(),
                    POTAS=col_character(),
                    DISES=col_character(),
                    CHEM=col_character(),
                    TILL=col_character(),
                    ` METHODS`=col_character(),
                    WTHER=col_character(),
                    INCON=col_character(),
                    LIGHT=col_character(),
                    EVAPO=col_character(),
                    INFIL=col_character(),
                    PHOTO=col_character(),
                    HYDRO=col_character(),
                    MESOM=col_character(),
                    ` MANAGEMENT`=col_character(),
                    `PLANT(?= )`=col_character(),
                    ` IRRIG(?= )`=col_character(),
                    ` FERTI(?= )`=col_character(),
                    ` RESID(?= )`=col_character(),
                    HARVS=col_character(),
                    ` OUTPUTS`=col_character(),
                    FNAME=col_character(),
                    OVVEW=col_character(),
                    SUMRY=col_character(),
                    GROUT=col_character(),
                    CAOUT=col_character(),
                    WAOUT=col_character(),
                    NIOUT=col_character(),
                    MIOUT=col_character(),
                    DIOUT=col_character(),
                    VBOSE=col_character(),
                    CHOUT=col_character(),
                    OPOUT=col_character(),
                    ` PLANTING`=col_character(),
                    ` IRRIGATION`=col_character(),
                    IMETH=col_character(),
                    IROFF=col_character(),
                    ` NITROGEN`=col_character(),
                    NCODE=col_character(),
                    NAOFF=col_character(),
                    ` RESIDUES`=col_character(),
                    ` HARVEST`=col_character(),
                    PLME=col_character(),
                    ENVNAME=col_character(),
                    ` TNAME\\.*`=col_character(),
                    `  HARM\\.*`=col_character(),
                    ` +CO2`=col_character(),
                    ` IRNAME`=col_character(),
                    ` CHT\\.*`=col_character(),
                    ` WSTA\\.*`=col_character(),
                    PCR = col_character(),
                    ` ICNAME` = col_character(),
                    SANAME = col_character(),
                    SMKE = col_character(),
                    SMHB = col_character(),
                    SMPX = col_character(),
                    FLHST = col_character(),
                    `  FLSA` = col_character(),
                    FLNAME = col_character()) |>
    (\(.x){.x$cols <- c(.x$cols,col_types$cols);.x})()


  left_justified <- c('SITE','PEOPLE','ADDRESS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES','  HARM\\.*',
                      ' TNAME\\.*','FLNAME','  ID_SOIL',' CNAME','  FLSA',
                      ' WSTA\\.*',' SLTX',
                      ' ID_FIELD',' ICNAME',' IRNAME',' FERNAME',' GENERAL',
                      ' SNAME\\.*','SMODEL',' MODEL',' OPTIONS',' METHODS',' MANAGEMENT',
                      ' OUTPUTS',' PLANTING',' IRRIGATION',' NITROGEN',
                      ' RESIDUES',' HARVEST',
                      ' EDAY','ERAD','EMAX','EMIN','ERAIN','ECO2',
                      'EDEW','EWIND','ENVNAME',
                      ' HNAME',' CHT\\.*',
                      ' RENAME',' +PLNAME','CHNAME', 'SANAME')

  col_names <- col_names |>
    c(' +N(?= |$)',' +R(?= |$)',' +O(?= |$)',' +C(?= |$)',
      ' +L(?= |$)',' +P(?= |$)',' +F(?= |$)',' +T(?= |$)',
      ' +H(?= |$)',' +I(?= |$)',' +A(?= |$)',' +E(?= |$)',
      ' CU(?= |$)',' FL(?= |$)',' SA(?= |$)',' IC(?= |$)',
      ' MP(?= |$)',' MI(?= |$)',' MF(?= |$)',' MR(?= |$)',
      ' MC(?= |$)',' MT(?= |$)',' ME(?= |$)',' MH(?= |$)',
      ' SM(?= |$)')

  # Read in raw data from file
  raw_lines <- readLines(file_name, warn = FALSE) |>
    # exclude lines that are all spaces or lines with EOF in initial position
    grep('^(?!\032) *([^ ]+)', x = _, perl = TRUE, value = TRUE)

  # Get experiment name
  experiment <- grep('^\\*EXP\\.DETAILS: ', raw_lines, value = TRUE) |>
    gsub('^\\*EXP\\.DETAILS: ', "", x = _)

  # Get comments
  comments <- extract_comments(raw_lines)

  # Remove EXP.DETAILS and AUTOMATIC MANAGEMENT headers
  raw_lines <- grep('^(?!\\*EXP\\.DETAILS: )(?!@ *AUTOMATIC MANAGEMENT)',
                    raw_lines, perl = TRUE, value = TRUE)

  # Find section boundaries
  sec_begin <- grep("^\\*", raw_lines)
  if(length(sec_begin)>0) sec_end <- c(sec_begin[-1]-1,length(raw_lines))

  # handle case with no section headers
  if(length(sec_begin)==0){
    sec_begin <- 1
    sec_end <- length(raw_lines)
    raw_lines <- grep('^\\*(?!EXP\\.DETAILS)', raw_lines, value = TRUE)
  }

  # Extract section names
  sec_names <- gsub("^\\*", "", raw_lines[sec_begin])

  # Extract all tiers
  if(use_std_fmt){
    all_secs <- lapply(1:length(sec_begin),
                    \(.i) read_tier_data(
                            raw_lines[sec_begin[.i]:sec_end[.i]],
                            left_justified = left_justified,
                            col_names = col_names,
                            col_types = col_types,
                            na_strings = na_strings,
                            join_tiers = FALSE,
                            store_v_fmt = store_v_fmt,
                            tier_fmt = filex_v_fmt(sec_names[.i])))
  }else{
    all_secs <- lapply(1:length(sec_begin),
                    \(.i) read_tier_data(
                            raw_lines[sec_begin[.i]:sec_end[.i]],
                            left_justified = left_justified,
                            col_names = col_names,
                            col_types = col_types,
                            na_strings = na_strings,
                            join_tiers = FALSE,
                            store_v_fmt = store_v_fmt))
  }

  names(all_secs) <- sec_names

  if(any(grepl("SIMULATION CONTROLS", sec_names))){
    all_secs$`SIMULATION CONTROLS` <- all_secs$`SIMULATION CONTROLS` |>
      combine_simulation_controls()
  }

  two_tier_sec <- c('GENERAL','FIELDS','INITIAL','IRRIGATION',
                    'SOIL')

  for(sec in two_tier_sec){
    sec_i <- grep(sec, sec_names)
    if(length(sec_i)>0){
      if(sec == 'IRRIGATION'){
        all_secs[[sec_i]] <- all_secs[[sec_i]] |>
          combine_multi_section(c('I','(EFIR)|(IEFF)'))
      }else if(sec == 'INITIAL'){
        all_secs[[sec_i]] <- all_secs[[sec_i]] |>
          combine_multi_section(c('C','PCR'))
      }else if(sec == 'SOIL'){
        all_secs[[sec_i]] <- all_secs[[sec_i]] |>
          combine_multi_section(c('A','SADAT'))
      }else if(sec == 'FIELDS'){
        all_secs[[sec_i]] <- all_secs[[sec_i]] |>
          combine_multi_section(c('L','ID_FIELD'))
      }else if(!is.data.frame(all_secs[[sec_i]])){
        all_secs[[sec_i]] <- all_secs[[sec_i]] |>
          reduce(combine_tiers,use_collapse_rows=TRUE)
      }
    }
  }

  attr(all_secs,'experiment') <- experiment

  all_secs <- lapply(all_secs,as_DSSAT_tbl)

  return(all_secs)
}

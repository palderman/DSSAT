#' Read multiple File X
#'
#' @inheritParams read_filex
#'
read_filex_multiple <- function(file_name, col_types=NULL, col_names=NULL,
                                na_strings=NULL, store_v_fmt = FALSE,
                                use_std_fmt = TRUE){

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
                    FLNAME = col_character()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}

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

  col_names <- col_names %>%
    c(.,
      ' +N(?= |$)',' +R(?= |$)',' +O(?= |$)',' +C(?= |$)',
      ' +L(?= |$)',' +P(?= |$)',' +F(?= |$)',' +T(?= |$)',
      ' +H(?= |$)',' +I(?= |$)',' +A(?= |$)',' +E(?= |$)',
      ' CU(?= |$)',' FL(?= |$)',' SA(?= |$)',' IC(?= |$)',
      ' MP(?= |$)',' MI(?= |$)',' MF(?= |$)',' MR(?= |$)',
      ' MC(?= |$)',' MT(?= |$)',' ME(?= |$)',' MH(?= |$)',
      ' SM(?= |$)')


  # Read in raw data from files
  # exclude lines that are all spaces or lines with EOF in initial position
  raw_input <- data.frame(filex_name = basename(file_name))

  raw_input$raw_lines <- lapply(file_name, function(.x){
    grep("^(?!\032) *([^ ]+)",
         readLines(.x, warn = FALSE),
         perl = TRUE,
         value = TRUE)
    })

  comments <- lapply(raw_input$raw_lines, extract_comments)

  names(comments) <- raw_input$filex_name

  # Drop comments and empty lines
  clean_lines <- drop_empty_lines(
    drop_comments(
      unlist(raw_input$raw_lines)
      )
  )

  # Find start/end positions for each FileX
  filex_start_end <- find_filex(clean_lines,
                                filex_name = raw_input$filex_name)

  # Strip out and concatenate the lines for each FileX
  filex_lines <- concat_lines(clean_lines, filex_start_end)

  # Find start/end positions for each section within each FileX
  section_start_end <- find_section(filex_lines)

  # Strip out and concatenate the lines for each FileX and section
  section_lines <- concat_lines(filex_lines$lines, section_start_end)

  # Find start/end positions for each tier within each section
  tier_start_end <- find_filex_tier(section_lines)

  # Strip out and concatenate the lines for each data tier
  tier_lines <- concat_lines(section_lines$lines, tier_start_end)

  # Read all lines by the same header
  tiers_out <- read_filex_tier_by_header(tier_lines,
                                         left_justified,
                                         col_types)

  filex_multi <- tiers_out

  attr(filex_multi, "comments") <- comments

  return(filex_multi)

}

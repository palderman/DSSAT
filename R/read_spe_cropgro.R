#' Reads input data from a single DSSAT CROPGRO species file (*.SPE)
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_dssat
#'
#' @return a tibble containing the data from the raw DSSAT file
#'
#'

read_spe_cropgro <- function(file_name,col_types=NULL,col_names=NULL,left_justified=NULL){

  left_justified <- c(left_justified,'SITE','PEOPLE','ADDRESS','METHODS','INSTRUMENTS',
                      'PROBLEMS','PUBLICATIONS','DISTRIBUTION','NOTES',
                      'TNAME','FLNAME','ID_SOIL','CNAME','WSTA','SLTX',
                      'ID_FIELD','ICNAME','IRNAME','FERNAME','GENERAL',
                      'SNAME','SMODEL','OPTIONS','METHODS','MANAGEMENT',
                      'OUTPUTS','PLANTING','IRRIGATION','NITROGEN',
                      'RESIDUES','HARVEST') %>%
    unique()

  # Read in raw data from file
  raw_lines <- readLines(file_name) %>%
    str_subset('^(?!\032) *([^ ]+)') # exclude lines that are all spaces or lines with EOF in initial position

  raw_lines <- str_subset(raw_lines,'^(?!\\*SPECIES:)')

  # Find section boundaries
  sec_begin <- str_which(raw_lines,'^\\*')
  if(length(sec_begin)>0) sec_end <- c(sec_begin[-1]-1,length(raw_lines))

  # handle case with no section headers
  if(length(sec_begin)==0){
    sec_begin <- 1
    sec_end <- length(raw_lines)
    raw_lines <- str_subset(raw_lines,'^\\*(?!EXP\\.DETAILS)')
  }

  # Extract section names
  sec_names <- str_remove(raw_lines[sec_begin],'^\\*')

  # Extract all tiers
  all_secs <- map(1:length(sec_begin),
                  ~read_tier_data(raw_lines[sec_begin[.]:sec_end[.]],
                                  left_justified = left_justified,
                                  join_tiers = FALSE))

  names(all_secs) <- sec_names

  # If new DSSAT format add GENERAL section as attribute and return DAILY DATA
  # if('GENERAL' %in% sec_names){
  #   attr(all_secs$`DAILY DATA`[[1]],'GENERAL') <- all_secs$GENERAL
  #   all_secs <- all_secs$`DAILY DATA`[[1]]
  # }else{
  #   # Assume old DSSAT format
  #   attr(all_secs[[1]][[2]],'GENERAL') <- all_secs[[1]][[1]]
  #   all_secs <- all_secs[[1]][[2]]
  # }

  return(all_secs)
}

read.cropgro.spe <- function(filename,s=1){

  tmp <- readLines(filename)

  tmp <- tmp[!grepl('SPECIES COEFFICIENTS',tmp)] %>%
  {.[!grepl('^ *$',.)]}

  hlines <- grep('^!*\\*',tmp)
  begin <- hlines + 1
  end <- c(hlines[-1]-1,length(tmp))

  sec.names <- gsub('^!*\\*','',tmp[hlines])

  sec <- list()
  for(i in 1:length(begin)){
    sec[[i]] <- tmp[begin[i]:end[i]]
    if(!grepl('LEAF SENESCENCE',sec.names[i]) &&
       !grepl('ROOT',sec.names[i]))
      sec[[i]] <- gsub(' *!.*','',sec[[i]])
    sec[[i]] <- sec[[i]][sec[[i]]!='']
  }

  spe <- vector(mode='list',length=length(sec.names))

  for(i in 1:length(spe)){
    if(grepl('LEAF SENESCENCE',sec.names[i])){
      spe[[i]] <- parse.lf.sen.sec(sec[[i]])
    }else if(grepl('PHENOLOGY',sec.names[i])){
      spe[[i]] <- parse.phen.sec(sec[[i]])
    }else if(grepl('PHOSPHORUS',sec.names[i])){
      spe[[i]] <- parse.phos.sec(sec[[i]])
    }else{
      spe[[i]] <- lapply(sec[[i]],
                         parse.cropgro.spe.line,
                         sec.name=sec.names[i])
    }
    spe[[i]] <- do.call(c,spe[[i]])
  }

  spe <- do.call(c,spe)

  names(spe) <- gsub('CH20','CH2O',names(spe))

  return(spe)

}

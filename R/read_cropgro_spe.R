#' Parses a DSSAT CROPGRO species file (*.SPE)
#'
#' @export
#'
#' @keywords internal
#'
#' @param filename a length-one character vector
#'
#' @return a list containing the data from the raw DSSAT file
#'
#'
read_cropgro_spe <- function(filename){

    lines <- readLines(filename) %>%
      str_subset('^((?!SPECIES COEFFICIENTS).)+$') %>%
      str_subset('[^ ]+')
    #'(?!\\![^\\*])'
    hlines <- lines %>%
      str_which('^!*\\*')
    begin <- hlines + 1
    end <- c(hlines[-1]-1,length(lines))

    sec_names <- lines[hlines] %>%
      str_replace('^!*\\*','')

    spe <- map(1:length(begin),
               function(i){
                 if(str_detect(sec_names[i],'LEAF SENESCENCE')){
                   spe_sec <- lines[begin[i]:end[i]] %>%
                     parse_leaf_senescence_section() %>%
                     do.call(c,.)
                 }else if(str_detect(sec_names[i],'PHENOLOGY')){
                   spe_sec <- lines[begin[i]:end[i]] %>%
                     str_replace_all(c(' *!.*'='')) %>%
                     str_subset('^.+$') %>%
                     parse_cropgro_phenology_section() %>%
                     do.call(c,.)
                  }else if(str_detect(sec_names[i],'PHOSPHORUS')){
                    spe_sec <- lines[begin[i]:end[i]] %>%
                      str_replace_all(c(' *!.*'='')) %>%
                      str_subset('^.+$') %>%
                      parse_phosphorus_section() %>%
                      do.call(c,.)
                 }else if(str_detect(sec_names[i],'ROOT')){
                   spe_sec <- lines[begin[i]:end[i]] %>%
                     map(parse_cropgro_spe_line,sec_name=sec_names[i]) %>%
                     do.call(c,.)
                 }else{
                   spe_sec <- lines[begin[i]:end[i]] %>%
                     str_replace_all(c(' *!.*'='')) %>%
                     str_subset('^.+$') %>%
                     map(parse_cropgro_spe_line,sec_name=sec_names[i]) %>%
                     do.call(c,.)
                 }
                 return(spe_sec)
               }) %>%
      do.call(c,.)

    names(spe) <- names(spe) %>%
      str_replace_all(c('CH20'='CH2O'))

    return(spe)

}

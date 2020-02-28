#' Writes parameters to a single DSSAT CASUPRO ecotype parameter file (*.ECO)
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_dssat
#'
#' @importFrom dplyr "%>%"
#' @importFrom stringr str_c str_replace str_extract
#'
#' @examples
#'
#' sample_eco <- c('CA0001  (CP 80-1743; CP 88-1762)',
#' '!-------------------',
#' '  KCAN_ECO      0.80    Superseeds KCAN from .SPE file',
#' '  SMAX            20    Maximum number of stalks a variety can yield per stubble or plan',
#' '!-------------------',
#' '  CAB              8    Number of leaves in spindle cluster at top of stalk ("cabbage").',
#' '  CanLmtFac    0.010    Proportion of stalk leaf area moved up each day to keep de-popul',
#' '  LfShdFac      0.35    Proportion of a stalks new leaf area that shades (displaces to ',
#' '  MINSHD        0.15    Minimum value allowed for FRSHAV (Average of daylight fraction o',
#' '!-------------------',
#' '  StkSenFrac  .00005    Threshold maintenance respiration deficit to stalk dry weight ra',
#' '  SENDAY        0.05    Maximum fraction of existing leaf weight which can be senesced o')
#'
#' eco <- read_casupro_eco(sample_eco)
#'
#' write_casupro_eco(eco)
#'

write_casupro_eco <- function(eco){

  v_fmt <- attr(eco,'v_fmt')

  val_lines <- map(1:nrow(eco),function(i){
    cnames <- colnames(eco)
    lines <- map_chr(1:ncol(eco),function(j){
        if(j == 1){
          return(sprintf('%-8s',eco[i,j]))
        }else if(j == 2){
          return(sprintf('%-s',eco[i,j]))
        }else{
          l_fmt <- v_fmt[[i]][cnames[j]]
          vals_in <- unlist(eco[i,j])
          if(length(vals_in) == 1){
            lname <- sprintf('  %s',cnames[j])
            vals_out <- {20 - nchar(cnames[j]) - 2} %>%
              str_c('.') %>%
              str_replace(l_fmt,'[0-9]+\\.',.) %>%
              sprintf(vals_in[1])
          }else{
            lname <- cnames[j] %>%
              str_c(.,'(',length(vals_in),')') %>%
              sprintf('  %s',.)
            val_1 <- {20 - nchar(lname) - 2} %>%
              str_c('.') %>%
              str_replace(l_fmt,'[0-9]+\\.',.) %>%
              sprintf(vals_in[1])
            vals_out <- sprintf(l_fmt,vals_in[-1]) %>%
              c(val_1,.)
            width <- l_fmt %>%
              str_extract('[0-9]+\\.') %>%
              as.numeric()
            vals_out <- check_numerical_column_width(vals_out,vals_in,width)
          }
          line_out <- c(lname,vals_out) %>%
            str_c(collapse='')
          return(line_out)
        }
      })
      lines[1] <- str_c(lines[1],lines[2])
      lines <- lines[-2] %>%
        c('')
    return(lines)
  }) %>%
  unlist()

  return(val_lines)
}

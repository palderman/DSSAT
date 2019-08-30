#' Reads data from a single tier of a DSSAT output file
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_tier
#'
#' @param join_tiers A logical indicating whether the multiple tiers should be
#' combined into a single tibble
#'
#' @return a tibble or list of tibbles containing the data from the raw DSSAT output
#'
#' @examples
#'
#' sample_data_tier <- c(
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D    ES9D    ES10",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035   0.032   0.639",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036   0.033   0.662",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046   0.042   0.843")
#'
#' read_tier_data(sample_tier)

read_tier_data <- function(raw_lines,col_types=NULL,col_names=NULL,
                           left_justified='EXCODE',guess_max=1000,join_tiers=TRUE){

  # Find header line
  skip <- str_which(raw_lines,'^@')
  headline <- raw_lines[skip]

  col_types <- cols(DATE=col_character()) %>%
    {.$cols <- c(.$cols,col_types$cols);.}

  # Process header into fixed-width format positions
  fwf_pos <- map(headline,
                 ~header_to_fwf_position(.,left_justified,col_types,col_names))

  # Calculate end of each section based on beginning of next section
  end <- c(skip[-1]-1,length(raw_lines))

  # Put check_col_types here
  if(!is.null(col_types)){
    col_types <- map(1:length(skip),~check_col_types(col_types,fwf_pos[[.]]$col_names))
  }

  # Read data from tier
  tier_data <- map(1:length(skip),function(i){
        if(skip[i]==end[i]){
          tdata <- map(fwf_pos[[i]]$col_names,~as.character(NA)) %>%
            {names(.) <- fwf_pos[[i]]$col_names
            .} %>%
            as_tibble()
          # colnames(tdata) <- fwf_pos[[i]]$col_names
        }else{
          tdata <- read_fwf(raw_lines[skip[i]:end[i]],
                            fwf_pos[[i]],
                            comment = '!',
                            skip = 1,
                              na = c('-99','-99.','-99.0','-99.00','-99.000',
                                   '*','**','***','****','*****','******','*******','********'),
                            skip_empty_rows = TRUE,
                            guess_max = guess_max,
                            col_types=col_types[[i]])
        }
        return(tdata)
      }) %>%
    add_col_widths(fwf_pos) %>%
    map(function(one_df){
      colnames(one_df) <- colnames(one_df) %>%
        str_replace_all(c('^ +'='',
                          ' +$'=''))
      # Add DATE column if YEAR and DOY are in tier_data
      add_date <- colnames(one_df) %>%
          {c('YEAR','DOY') %in% .} %>%
          all()
      if(add_date){
        one_df <- one_df %>%
          mutate(DATE={paste0(YEAR,DOY) %>% as.POSIXct(format='%Y%j')}) %>%
          select(-YEAR,-DOY)
      }
      # Convert DATE column if DATE is not already POSIXct
      convert_date <- colnames(one_df) %>%
        {'DATE' %in% .} %>%
        {. && ! 'POSIXct' %in% class(one_df)}
      if(convert_date){
        if(nchar(one_df$DATE[1]) < 7){
          one_df <- one_df %>%
            mutate(DATE=as.POSIXct(DATE,format='%y%j'))
        }else{
          one_df <- one_df %>%
            mutate(DATE=as.POSIXct(DATE,format='%Y%j'))
        }
      }
      return(one_df)
    })

  if(join_tiers&&
     !is.data.frame(tier_data)&&
     length(tier_data)>1){
    tier_info <- tier_data %>%
      map(colnames)

    tier_data <- tier_data %>%
      reduce(combine_tiers)

    attr(tier_data,'tier_info') <- tier_info

  }else if(!is.data.frame(tier_data)&&
           length(tier_data)==1){

    tier_data <- tier_data[[1]]

  }

  v_fmt <- construct_variable_format(tier_data,
                                     fwf_pos,
                                     left_justified)

  attr(tier_data,'v_fmt') <- v_fmt

  return(tier_data)
}

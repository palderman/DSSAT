#' Reads data from a single tier of a DSSAT output file
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_tier
#'
#' @param na_strings a character vector of string to represent missing values
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

read_tier_data <- function(raw_lines,col_types=NULL,col_names=NULL,na_strings=NULL,
                           left_justified='EXCODE',guess_max=1000,join_tiers=TRUE,
                           store_v_fmt=TRUE, read_only = NULL){

  # Find header line
  skip <- str_which(raw_lines,'^@')
  headline <- raw_lines[skip]

  raw_lines <- raw_lines %>%
    str_replace_all(c('\\cz'='','^ +$'=''))

  if(!is.null(read_only)){
    i <- which(read_only == 'DATE')
    if(length(i) > 1){
      read_only <- c(read_only[i-1],'YEAR','DOY',read_only[i+1])
    }
  }

#  if(!'DATE'%in%{col_types$cols %>% str_replace_all(c(' '=''))})
  col_types <- cols(` DATE`=col_character()) %>%
    {.$cols <- c(.$cols,col_types$cols)
   .}

  # Process header into fixed-width format positions
  fwf_pos <- map(headline,
                 ~header_to_fwf_position(.,left_justified,col_types,col_names,read_only))

  # Calculate end of each section based on beginning of next section
  end <- c(skip[-1]-1,length(raw_lines))

  # Put check_col_types here
  if(!is.null(col_types)){
    col_types <- map(1:length(skip),~check_col_types(col_types,fwf_pos[[.]]$col_names))
  }

  na_strings <- c(na_strings,'-99','-99.','-99.0','-99.00','-99.000',
                  '*','**','***','****','*****','******','*******','********')

  # Read data from tier
  tier_data <- map(1:length(skip),function(i){
        if(skip[i]==end[i]){
          tdata <- map(fwf_pos[[i]]$col_names,~as.character(NA)) %>%
            {names(.) <- fwf_pos[[i]]$col_names
            .} %>%
            as_tibble()
          # colnames(tdata) <- fwf_pos[[i]]$col_names
        }else{
          if(any(str_detect(fwf_pos[[i]]$col_names,'NOTES'))){
            cmnt <- ''
          }else{
            cmnt <- '!'
          }
          tdata <- read_fwf(raw_lines[skip[i]:end[i]],
                            fwf_pos[[i]],
                            comment = cmnt,
                            skip = 1,
                              na = na_strings,
                            skip_empty_rows = TRUE,
                            guess_max = guess_max,
                            col_types=col_types[[i]])
        }
        return(tdata)
      }) %>%
    # add_col_widths(fwf_pos) %>%
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
          mutate(DATE={paste0(YEAR,DOY) %>%
                       as.POSIXct(format='%Y%j',tz='UTC')}) %>%
          select(-YEAR,-DOY)
      }
      # Convert DATE column if DATE is not already POSIXct
      potential_date_cols <- colnames(one_df) %>%
        str_subset('(DATE)|(AT$)')
      date_cols <- col_types %>%
        {map(.,~names(.$cols)) %>%
            unlist()} %>%
        str_replace_all(c('^ +'='',
                          ' +$'='')) %>%
        { potential_date_cols[(! potential_date_cols %in% .) |
                               potential_date_cols == 'DATE' ]}
      one_df <- one_df %>%
        mutate_at(.,date_cols,~convert_to_date(.))
      return(one_df)
    }) %>%
    map(~mutate_if(.,
                   .predicate = ~{all(is.na(.)) && is.logical(.)},
                   .funs = ~as.numeric(.)))

    if(join_tiers&&
       !is.data.frame(tier_data)&&
       length(tier_data)>1){
      tier_info <- tier_data %>%
        map(colnames)

      tier_data <- tier_data %>%
        reduce(combine_tiers)

      fwf_pos <- fwf_pos %>%
        reduce(full_join,by=c('begin','end','col_names'))

      attr(tier_data,'tier_info') <- tier_info

    }else if(!is.data.frame(tier_data)&&
             length(tier_data)==1){

      tier_data <- tier_data[[1]]

      if(!is.data.frame(fwf_pos)&&
         length(fwf_pos)==1){
        fwf_pos <- fwf_pos[[1]]
      }

    }

  if(store_v_fmt){
    if(is.data.frame(tier_data)){
      v_fmt <- construct_variable_format(tier_data,
                                         fwf_pos,
                                         left_justified)
      tier_data <- as_DSSAT_tbl(tier_data,v_fmt = v_fmt)

    }else{

      tier_data <- list(tier_data,fwf_pos) %>%
        pmap(function(td,fpos){
          v_fmt <- construct_variable_format(td,
                                             fpos,
                                             left_justified)
          attr(td,'v_fmt') <- v_fmt
          return(td)
        }) %>%
        map(as_DSSAT_tbl)
    }
  }

  return(tier_data)
}

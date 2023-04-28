#' Reads data from a single tier of a DSSAT output file
#'
#' @export
#'
#' @keywords internal
#'
#' @inheritParams read_tier
#'
#' @param read_only NULL or a character vector of column names that should be read in;
#' If non-NULL only the columns listed will be read in.
#'
#' @param na_strings a character vector of string to represent missing values
#'
#' @param join_tiers A logical indicating whether the multiple tiers should be
#' combined into a single tibble
#'
#' @param convert_date_cols A logical value indicating whether to convert
#'  columns expected to be dates into date-time format. If TRUE, any column that
#'  matches the following regular expression will be converted:
#'  "(DATE)|((?<!(L)|(SS))AT$)|(PFRST)|(PLAST)|(HFRST)|(HLAST)"
#'
#' @return a tibble or list of tibbles containing the data from the raw DSSAT output
#'
#' @importFrom stringr str_which str_replace_all str_detect str_subset
#' @importFrom readr cols col_character read_fwf
#' @importFrom purrr map reduce pmap
#' @importFrom dplyr "%>%" as_tibble mutate select mutate_at mutate_if full_join
#'
#' @examples
#'
#' sample_data_tier <- c(
#' "@YEAR DOY   DAS   SRAA    ES1D    ES2D    ES3D    ES4D    ES5D    ES6D    ES7D    ES8D",
#' " 2006 001     1   7.40   0.508   0.175   0.060   0.101   0.083   0.110   0.098   0.035",
#' " 2006 002     2   8.40   0.849   0.263   0.064   0.104   0.086   0.113   0.101   0.036",
#' " 2006 003     3  13.10   1.148   0.549   0.091   0.132   0.108   0.144   0.128   0.046")
#'
#' read_tier_data(sample_data_tier)

read_tier_data <- function(raw_lines, col_types=NULL, col_names=NULL, na_strings=NULL,
                           left_justified='EXCODE', guess_max=1000, join_tiers=TRUE,
                           store_v_fmt=TRUE, read_only = NULL, tier_fmt = NULL,
                           convert_date_cols = TRUE){

  raw_lines <- sanitize_raw_lines(raw_lines)

  # Find header line
  skip <- str_which(raw_lines,'^@')
  headline <- raw_lines[skip]

  if(!is.null(read_only)){
    i <- which(read_only == 'DATE')
    if(length(i) == 1){
      read_only <- c(head(read_only,i-1),
                     'YEAR','DOY',
                     tail(read_only,length(read_only)-i))
    }
  }

  if(is.null(tier_fmt)){

    col_types <- cols(` DATE`=col_character()) %>%
      {.$cols <- c(.$cols,col_types$cols)
      .}

    # Process header into fixed-width format positions
    fwf_pos <- map(headline,
                   ~header_to_fwf_position(.,left_justified, col_types, col_names, read_only))

  }else{
    fwf_pos <- map(headline,
                   ~v_fmt_to_fwf_pos(tier_fmt, header = .))

    col_types <- map(fwf_pos,
                     ~v_fmt_to_col_types(tier_fmt[.$col_names]))
  }

  # Calculate end of each section based on beginning of next section
  end <- c(skip[-1]-1,length(raw_lines))

  # Put check_col_types here
  if(is.null(tier_fmt) & !is.null(col_types)){
    col_types <- map(1:length(skip),~check_col_types(col_types,fwf_pos[[.]]$col_names))
  }

  na_strings <- c(na_strings,'-99','-99.','-99.0','-99.00','-99.000',
                  '*','**','***','****','*****','******','*******','********')

  na_regex <- paste0(paste0("(^", gsub("\\*", "\\\\*", na_strings), "$)"), collapse = "|")

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
          tdata <- read_fixed_width(text = raw_lines[(skip[i]+1):end[i]],
                                    fwf_pos = fwf_pos[[i]],
                                    ctypes = col_types_to_vec(col_types[[i]]),
                                    na_regex = na_regex)
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
        # To prevent "no visible binding for global variable" from R CMD check for
        # select() statement below:
        YEAR <- DOY <- NULL
        one_df <- one_df %>%
          mutate(DATE={paste0(YEAR,DOY) %>%
                       as.POSIXct(format='%Y%j',tz='UTC')}) %>%
          select(-YEAR,-DOY)
      }
      if(convert_date_cols){
        # Convert DATE column if DATE is not already POSIXct
        potential_date_cols <- colnames(one_df) %>%
          str_subset('(DATE)|((?<!(L)|(SS))AT$)|(PFRST)|(PLAST)|(HFRST)|(HLAST)')
        date_cols <- col_types %>%
          {map(.,~names(.$cols)) %>%
              unlist()} %>%
          str_replace_all(c('^ +'='',
                            ' +$'='')) %>%
          { potential_date_cols[(! potential_date_cols %in% .) |
                                 potential_date_cols == 'DATE' |
                                  !is.null(tier_fmt)]}
        one_df <- one_df %>%
          mutate_at(.,date_cols,~convert_to_date(.))
      }
      return(one_df)
    }) %>%
    map(~mutate_if(.,
                   .predicate = ~{all(is.na(.)) && is.logical(.)},
                   .funs = ~as.numeric(.)))

    fwf_pos <- fwf_pos %>%
      map(~{
        .data <- .
        if(all(c('YEAR','DOY') %in% .data$col_names)){
          the_rest <- .data %>%
            filter(! col_names %in% c('YEAR','DOY'))
          date <- .data %>%
            filter(col_names %in% c('YEAR','DOY')) %>%
            summarize(begin = min(begin),
                      end = max(end),
                      col_names = 'DATE')
          new <- bind_rows(date,the_rest) %>%
            arrange(begin)
          return(new)
        }else{
          return(.data)
        }
      })

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

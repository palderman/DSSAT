#' @importFrom stringr str_locate_all str_sub
#' @importFrom dplyr "%>%"
#' @importFrom purrr map
get_start_end <- function(header,regex){
  start_end <- str_locate_all(header,regex) %>%
    map(~{
      if(nrow(.)>1){
        front_check <- str_sub(header,.[,1],.[,1]) %in% c(' ','') |
          str_sub(header,.[,1]-1,.[,1]-1) %in% c(' ','')
        back_check <- str_sub(header,.[,2],.[,2]) %in% c(' ','') |
          str_sub(header,.[,2]+1,.[,2]+1) %in% c(' ','')
        if(sum(front_check) == 1){
          . <- .[front_check,]
        }else if(sum(back_check) == 1){
          . <- .[back_check,]
        }else if(sum(front_check & back_check) == 1){
          . <- .[front_check & back_check,]
        }else{
          . <- .[1,]
        }
      }
      .}) %>%
    do.call(rbind,.)
return(start_end)
}

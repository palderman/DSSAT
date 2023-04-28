fmt_comments <- function(x_in){
  comments <- attr(x_in, "comments")

  if(is.null(comments) & is.character(x_in)) comments <- x_in

  if(!is.null(comments)){
    comments <- gsub(" +$", "", # remove trailing spaces
                     gsub("^[ ]{0,1}", "! ", # add initial !
                          gsub("^ *!", "", comments))) # strip off any initial !
  }
  return(comments)
}

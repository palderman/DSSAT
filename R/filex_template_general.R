# Generate a template GENERAL section of File X
#
# @export
#
filex_template_general <- function(PEOPLE = NA_character_, ADDRESS = NA_character_,
                                   SITE = NA_character_,
                                   PAREA = NA_real_, PRNO = NA_real_, PLEN = NA_real_,
                                   PLDR = NA_real_, PLSP = NA_real_,
                                   PLAY = NA_character_, HAREA = NA_real_,
                                   HRNO = NA_real_, HLEN = NA_real_,
                                   HARM = NA_character_, NOTES = NA_character_){
  general <- data.frame(
    PEOPLE = PEOPLE, ADDRESS = ADDRESS, SITE = SITE,
    PAREA = PAREA, PRNO = PRNO, PLEN = PLEN, PLDR = PLDR,
    PLSP = PLSP, PLAY = PLAY, HAREA = HAREA, HRNO = HRNO,
    HLEN = HLEN, HARM = HARM
  )

  if(is.list(NOTES)){
    general$NOTES <- NOTES
  }else{
    general$NOTES <- list(NOTES)
  }

  return(general)
}

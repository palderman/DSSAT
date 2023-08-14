# Generate a template FEILDS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_fields <- function(ID_FIELD = NA_character_, WSTA = NA_character_,
                                  FLSA = NA_character_, FLOB = NA_real_,
                                  FLDT = NA_character_, FLDD = NA_real_,
                                  FLDS = NA_real_, FLST = NA_character_,
                                  SLTX = NA_character_, SLDP = NA_real_,
                                  ID_SOIL = NA_character_, FLNAME = NA_character_,
                                  XCRD = NA_real_, YCRD = NA_real_, ELEV = NA_real_,
                                  AREA = NA_real_, SLEN = NA_real_, FLWR = NA_real_,
                                  SLAS = NA_real_, FLHST = NA_character_,
                                  FHDUR = NA_real_, expand = FALSE){
  if(expand){
    fields <- expand_grid(
      ID_FIELD = ID_FIELD, WSTA = WSTA, FLSA = FLSA, FLOB = FLOB, FLDT = FLDT,
      FLDD = FLDD, FLDS = FLDS, FLST = FLST, SLTX = SLTX, SLDP = SLDP,
      ID_SOIL = ID_SOIL, FLNAME = FLNAME,
      XCRD = XCRD, YCRD = YCRD, ELEV = ELEV, AREA = AREA, SLEN = SLEN,
      FLWR = FLWR, SLAS = SLAS, FLHST = FLHST, FHDUR = FHDUR
    )
  }else{
    fields <- data.frame(
      ID_FIELD = ID_FIELD, WSTA = WSTA, FLSA = FLSA, FLOB = FLOB, FLDT = FLDT,
      FLDD = FLDD, FLDS = FLDS, FLST = FLST, SLTX = SLTX, SLDP = SLDP,
      ID_SOIL = ID_SOIL, FLNAME = FLNAME,
      XCRD = XCRD, YCRD = YCRD, ELEV = ELEV, AREA = AREA, SLEN = SLEN,
      FLWR = FLWR, SLAS = SLAS, FLHST = FLHST, FHDUR = FHDUR
    )
  }

  fields <- add_level_column(fields, "L")

  return(fields)
}

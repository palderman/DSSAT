# Generate a template CULTIVARS section of File X
#
# @export
#
# @inheritParams filex_template
#
filex_template_cultivars <- function(CR = "FA", INGENO = "IB0001", CNAME = "",
                                     expand = FALSE){
  if(expand){
    cultivars <- expand_grid(
      CR = CR, INGENO = INGENO, CNAME = CNAME
    )
  }else{
    cultivars <- data.frame(
      CR = CR, INGENO = INGENO, CNAME = CNAME

    )
  }

  cultivars <- add_level_column(cultivars, "C")

  return(cultivars)
}

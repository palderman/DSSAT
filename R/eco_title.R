eco_title <- function(model_code){

  if(nchar(model_code) > 5) model_code <- substr(model_code, 1, 5)

  version <- paste0("0", get_dssat_version())

  if(model_code == "ALFRM"){

    title <- sprintf("*ALFALFA ECOTYPE COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BACER"){

    title <- "$ECOTYPES:BACER048.20200721"

  }else if(model_code == "BACRP"){

    title <- "$ECOTYPES:BACRP048.20200721"

  }else if(model_code == "BHGRO"){

    title <- sprintf("*BAHIA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BMFRM"){

    title <- sprintf("*Bermuda Grass ECOTYPE COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BNGRO"){

    title <- sprintf("*DRYBEAN ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BRFRM"){

    title <- sprintf("*BRACHIARIA ECOTYPE COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BRGRO"){

    title <- sprintf("*BRACHIARIA DECUMBENS ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BSCER"){

    title <- sprintf("*Sugarbeet ECOTYPE COEFFICIENTS: BSCER%3s MODEL", version)

  }else if(model_code == "CBGRO"){

    title <- sprintf("*CABBAGE ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CHGRO"){

    title <- sprintf("*CHICKPEA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CIGRO"){

    title <- sprintf("*CHIA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CNGRO"){

    title <- sprintf("*CANOLA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "COGRO"){

    title <- sprintf("*COTTON ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CPGRO"){

    title <- sprintf("*COWPEA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CSCAS"){

    title <- "$ECOTYPES:CSCAS048.20200721"

  }else if(model_code == "CSYCA"){

    title <- "$ECOTYPES:CSYCA048.041621"

  }else if(model_code == "FBGRO"){

    title <- sprintf("*FABA BEAN ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "G0GRO"){

    title <- sprintf("*BAHIA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "GBGRO"){

    title <- sprintf("*GREENBEAN ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "GGFRM"){

    title <- sprintf("*GUINEAGRASS ECOTYPE COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "MLCER"){

    title <- sprintf("*MILLET ECOTYPE COEFFICIENTS: MLCER%3s MODEL", version)

  }else if(model_code == "MZCER"){

    title <- sprintf("*MAIZE ECOTYPE COEFFICIENTS: MZCER%3s MODEL", version)

  }else if(model_code == "MZIXM"){

    title <- sprintf("*MAIZE ECOTYPE COEFFICIENTS: MZIXM%3s MODEL", version)

  }else if(model_code == "PIALO"){

    title <- sprintf("*PINEAPPLE ECOTYPE COEFFICIENTS: PIALO%3s MODEL", version)

  }else if(model_code == "PNGRO"){

    title <- sprintf("*PEANUT ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PPGRO"){

    title <- sprintf("*PIGEONPEA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PRGRO"){

    title <- sprintf("*BELL PEPPER ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PTSUB"){

    title <- sprintf("*POTATO ECOTYPE COEFFICIENTS: PTSUB%3s MODEL", version)

  }else if(model_code == "QUGRO"){

    title <- sprintf("*QUINOA ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "RICER"){

    title <- sprintf("*RICE ECOTYPE COEFFICIENTS: RICER%3s MODEL", version)

  }else if(model_code == "SBGRO"){

    title <- sprintf("*SOYBEAN ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SCCAN"){

    title <- sprintf("*SUGARCANE ECOTYPE COEFFICIENTS: SCCAN%3s MODEL", version)

  }else if(model_code == "SCCSP"){

    title <- sprintf("*SUGARCANE ECOTYPE COEFFICIENTS: SCCSP%3s MODEL", version)

  }else if(model_code == "SCSAM"){

    title <- sprintf("*SUGARCANE ECOTYPE COEFFICIENTS: SCSAM%3s MODEL", version)

  }else if(model_code == "SFGRO"){

    title <- sprintf("*SAFFLOWER ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SGCER"){

    title <- sprintf("*SORGHUM ECOTYPE COEFFICIENTS: SGCER%3s MODEL", version)

  }else if(model_code == "SUGRO"){

    title <- sprintf("*SUNFLOWER ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SUOIL"){

    title <- sprintf("*SUNFLOWER ECOTYPE COEFFICIENTS: SUOIL%3s MODEL", version)

  }else if(model_code == "SWCER"){

    title <- sprintf("*SWEET CORN ECOTYPE COEFFICIENTS: SWCER%3s MODEL", version)

  }else if(model_code == "TFAPS"){

    title <- sprintf("*TEFF ECOTYPE COEFFICIENTS: TFAPS%3s MODEL", version)

  }else if(model_code == "TFCER"){

    title <- sprintf("*TEFF ECOTYPE COEFFICIENTS: TFCER%3s MODEL", version)

  }else if(model_code == "TMGRO"){

    title <- sprintf("*TOMATO ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "TNARO"){

    title <- sprintf("*TANIER ECOTYPE COEFFICIENTS: TNARO%3s MODEL", version)

  }else if(model_code == "TRARO"){

    title <- sprintf("*TARO ECOTYPE COEFFICIENTS: TRARO%3s MODEL", version)

  }else if(model_code == "VBGRO"){

    title <- sprintf("*VELVETBEAN ECOTYPE COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "WHAPS"){

    title <- sprintf("*WHEAT ECOTYPE COEFFICIENTS: WHAPS%3s MODEL", version)

  }else if(model_code == "WHCER"){

    title <- "$ECOTYPES:WHCER048.20200721"

  }else if(model_code == "WHCRP"){

    title <- "$ECOTYPES:WHCRP048.20200721"

  }

  return(title)
}

cul_title <- function(model_code){

  if(nchar(model_code) > 5) model_code <- substr(model_code, 1, 5)

  version <- paste0("0", get_dssat_version())

  if(model_code == "ALFRM"){

    title <- sprintf("*ALFALFA CULTIVAR COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BACER"){

    title <- "$CULTIVARS:BACER048.20200721"

  }else if(model_code == "BACRP"){

    title <- "$CULTIVARS:BACRP048.20200721"

  }else if(model_code == "BHGRO"){

    title <- sprintf("*BAHIA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BMFRM"){

    title <- sprintf("*Bermuda Grass CULTIVAR COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BNGRO"){

    title <- sprintf("*DRYBEAN CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BRFRM"){

    title <- sprintf("*BRACHIARIA CULTIVAR COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "BRGRO"){

    title <- sprintf("*BRACHIARIA DECUMBENS CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "BSCER"){

    title <- sprintf("*Sugarbeet CULTIVAR COEFFICIENTS: BSCER%3s MODEL", version)

  }else if(model_code == "CBGRO"){

    title <- sprintf("*CABBAGE CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CHGRO"){

    title <- sprintf("*CHICKPEA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CIGRO"){

    title <- sprintf("*CHIA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CNGRO"){

    title <- sprintf("*CANOLA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "COGRO"){

    title <- sprintf("*COTTON CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CPGRO"){

    title <- sprintf("*COWPEA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "CSCAS"){

    title <- "$CULTIVARS:CSCAS048.20200721"

  }else if(model_code == "CSYCA"){

    title <- "$CULTIVARS:CSYCA048.041621"

  }else if(model_code == "FBGRO"){

    title <- sprintf("*FABA BEAN CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "G0GRO"){

    title <- sprintf("*BAHIA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "GBGRO"){

    title <- sprintf("*GREENBEAN CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "GGFRM"){

    title <- sprintf("*GUINEAGRASS CULTIVAR COEFFICIENTS: PRFRM%3s MODEL", version)

  }else if(model_code == "MLCER"){

    title <- sprintf("*MILLET CULTIVAR COEFFICIENTS: MLCER%3s MODEL", version)

  }else if(model_code == "MZCER"){

    title <- sprintf("*MAIZE CULTIVAR COEFFICIENTS: MZCER%3s MODEL", version)

  }else if(model_code == "MZIXM"){

    title <- sprintf("*MAIZE CULTIVAR COEFFICIENTS: MZIXM%3s MODEL", version)

  }else if(model_code == "PIALO"){

    title <- sprintf("*PINEAPPLE CULTIVAR COEFFICIENTS: PIALO%3s MODEL", version)

  }else if(model_code == "PNGRO"){

    title <- sprintf("*PEANUT CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PPGRO"){

    title <- sprintf("*PIGEONPEA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PRGRO"){

    title <- sprintf("*BELL PEPPER CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "PTSUB"){

    title <- sprintf("*POTATO CULTIVAR COEFFICIENTS: PTSUB%3s MODEL", version)

  }else if(model_code == "QUGRO"){

    title <- sprintf("*QUINOA CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "RICER"){

    title <- sprintf("*RICE CULTIVAR COEFFICIENTS: RICER%3s MODEL", version)

  }else if(model_code == "SBGRO"){

    title <- sprintf("*SOYBEAN CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SCCAN"){

    title <- sprintf("*SUGARCANE CULTIVAR COEFFICIENTS: SCCAN%3s MODEL", version)

  }else if(model_code == "SCCSP"){

    title <- sprintf("*SUGARCANE CULTIVAR COEFFICIENTS: SCCSP%3s MODEL", version)

  }else if(model_code == "SCSAM"){

    title <- sprintf("*SUGARCANE CULTIVAR COEFFICIENTS: SCSAM%3s MODEL", version)

  }else if(model_code == "SFGRO"){

    title <- sprintf("*SAFFLOWER CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SGCER"){

    title <- sprintf("*SORGHUM CULTIVAR COEFFICIENTS: SGCER%3s MODEL", version)

  }else if(model_code == "SUGRO"){

    title <- sprintf("*SUNFLOWER CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "SUOIL"){

    title <- sprintf("*SUNFLOWER CULTIVAR COEFFICIENTS: SUOIL%3s MODEL", version)

  }else if(model_code == "SWCER"){

    title <- sprintf("*SWEET CORN CULTIVAR COEFFICIENTS: SWCER%3s MODEL", version)

  }else if(model_code == "TFAPS"){

    title <- sprintf("*TEFF CULTIVAR COEFFICIENTS: TFAPS%3s MODEL", version)

  }else if(model_code == "TFCER"){

    title <- sprintf("*TEFF CULTIVAR COEFFICIENTS: TFCER%3s MODEL", version)

  }else if(model_code == "TMGRO"){

    title <- sprintf("*TOMATO CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "TNARO"){

    title <- sprintf("*TANIER CULTIVAR COEFFICIENTS: TNARO%3s MODEL", version)

  }else if(model_code == "TRARO"){

    title <- sprintf("*TARO CULTIVAR COEFFICIENTS: TRARO%3s MODEL", version)

  }else if(model_code == "VBGRO"){

    title <- sprintf("*VELVETBEAN CULTIVAR COEFFICIENTS: CRGRO%3s MODEL", version)

  }else if(model_code == "WHAPS"){

    title <- sprintf("*WHEAT CULTIVAR COEFFICIENTS: WHAPS%3s MODEL", version)

  }else if(model_code == "WHCER"){

    title <- "$CULTIVARS:WHCER048.20200721"

  }else if(model_code == "WHCRP"){

    title <- "$CULTIVARS:WHCRP048.20200721"

  }

  return(title)
}

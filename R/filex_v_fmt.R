filex_v_fmt <- function(sec_name){

  if(any(grepl('^CHEMICAL', sec_name))){

    v_fmt <- c(C = "%2.0f", CDATE = "%6s", CHCOD = "%6s", CHAMT = "%6.0f", CHME = "%6s",
               CHDEP = "%6.0f", CHT = " %-5s", CHNAME = "  %-s")

  }else if(any(grepl('^CULTIVARS', sec_name))){

    v_fmt <- c(C = "%2.0f", CR = "%3s", INGENO = "%7s", CNAME = " %-s")


  }else if(any(grepl('^ENVIRONMENT', sec_name))){

    v_fmt <- c(E = "%2.0f", ODATE = "%6s", EDAY = " %-6s", ERAD = "%-6s", EMAX = "%-6s",
               EMIN = "%-6s", ERAIN = "%-6s", ECO2 = "%-6s", EDEW = "%-6s",
               EWIND = "%-6s", ENVNAME = "%-s")

  }else if(any(grepl('^FERTILIZERS', sec_name))){

    v_fmt <- c(F = "%2.0f", FDATE = "%6s", FMCD = "%6s", FACD = "%6s", FDEP = "%6.0f",
               FAMN = "%6.0f", FAMP = "%6.0f", FAMK = "%6.0f", FAMC = "%6.0f",
               FAMO = "%6.0f", FOCD = "%6s", FERNAME = " %-s")

  }else if(any(grepl('^FIELDS', sec_name))){

    v_fmt <- c(L = "%2.0f", ID_FIELD = " %-8s", WSTA = " %-8s", FLSA = "%6s",
               FLOB = "%6.0f", FLDT = "%6s", FLDD = "%6.0f", FLDS = "%6.0f",
               FLST = "%6s", SLTX = " %-6s", SLDP = "%4.0f", ID_SOIL = "  %-10s ",
               FLNAME = "%-s", XCRD = "%16.6f", YCRD = "%16.6f", ELEV = "%10.1f",
               AREA = "%18.0f", SLEN = "%6.0f", FLWR = "%6.1f", SLAS = "%6.0f",
               FLHST = "%6s", FHDUR = "%6.0f")

  }else if(any(grepl('^GENERAL', sec_name))){

    v_fmt <- c(PEOPLE = "%-s", ADDRESS = "%-s", SITE = "%-s", PAREA = "%7.0f",
               PRNO = "%6.0f", PLEN = "%6.0f", PLDR = "%6.0f", PLSP = "%6.0f", PLAY = "%6s",
               HAREA = "%6.0f", HRNO = "%6.0f", HLEN = "%6.1f", HARM = "  %-13s", NOTES = "%-s")

  }else if(any(grepl('^HARVEST', sec_name))){

    v_fmt <- c(H = "%2.0f", HDATE = "%6s", HSTG = "%6s", HCOM = "%6s", HSIZE = "%6s",
               HPC = "%6.0f", HBPC = "%6.0f", HNAME = " %-s")

  }else if(any(grepl('^INITIAL', sec_name))){

    v_fmt <- c(C = "%2.0f", PCR = "%6s", ICDAT = "%6s", ICRT = "%6.0f", ICND = "%6.0f",
               ICRN = "%6.1f", ICRE = "%6.0f", ICWD = "%6.0f", ICRES = "%6.0f",
               ICREN = "%6.2f", ICREP = "%6.2f", ICRIP = "%6.0f", ICRID = "%6.0f",
               ICNAME = " %-s", ICBL = "%6.0f", SH2O = "%6.3f", SNH4 = "%6.2f",
               SNO3 = "%6.2f")

  }else if(any(grepl('^IRRIGATION', sec_name))){

    v_fmt <- c(I = "%2.0f", EFIR = "%6.2f", IDEP = "%6.0f", ITHR = "%6.0f",
               IEPT = "%6.0f",
               IOFF = "%6s", IAME = "%6s", IAMT = "%6.0f", IRNAME = " %-s", IDATE = "%6s",
               IROP = "%6s", IRVAL = "%6.1f")

  }else if(any(grepl('^PLANTING', sec_name))){

    v_fmt <- c(P = "%2.0f", PDATE = "%6s", EDATE = "%6s", PPOP = "%6.1f",
               PPOE = "%6.1f", PLME = "%6s", PLDS = "%6s", PLRS = "%6.1f", PLRD = "%6.0f",
               PLDP = "%6.1f", PLWT = "%6.0f", PAGE = "%6.0f", PENV = "%6.0f", PLPH = "%6.0f",
               SPRL = "%6.1f", PLNAME = "                        %-s")

  }else if(any(grepl('^RESIDUES', sec_name))){

    v_fmt <- c(R = "%2.0f", RDATE = "%6s", RCOD = "%6s", RAMT = "%6.0f", RESN = "%6.2f",
               RESP = "%6.0f", RESK = "%6.0f", RINP = "%6.0f", RDEP = "%6.0f", RMET = "%6s",
               RENAME = " %-s")

  }else if(any(grepl('^SIMULATION', sec_name))){

    v_fmt <- c(N = "%2.0f", GENERAL = " %-11s", NYERS = "%6.0f", NREPS = "%6.0f",
               START = "%6s", SDATE = "%6s", RSEED = "%6.0f", SNAME = " %-25s",
               SMODEL = " %-8s", MODEL = " %-8s",
               OPTIONS = " %-11s", WATER = "%6s", NITRO = "%6s",
               SYMBI = "%6s", PHOSP = "%6s", POTAS = "%6s", DISES = "%6s", CHEM = "%6s",
               TILL = "%6s", CO2 = "%6s", METHODS = " %-11s", WTHER = "%6s",
               INCON = "%6s", LIGHT = "%6s", EVAPO = "%6s", INFIL = "%6s", PHOTO = "%6s",
               HYDRO = "%6s", NSWIT = "%6.0f", MESOM = "%6s", MESEV = "%6s",
               MESOL = "%6.0f", MANAGEMENT = " %-11s", PLANT = "%6s", IRRIG = "%6s",
               FERTI = "%6s", RESID = "%6s", HARVS = "%6s", OUTPUTS = " %-11s",
               FNAME = "%6s", OVVEW = "%6s", SUMRY = "%6s", FROPT = "%6.0f",
               GROUT = "%6s", CAOUT = "%6s", WAOUT = "%6s", NIOUT = "%6s", MIOUT = "%6s",
               DIOUT = "%6s", VBOSE = "%6s", CHOUT = "%6s", OPOUT = "%6s",
               FMOPT = "%6s", LONG = "%6s", PLANTING = " %-11s",
               PFRST = "%6s", PLAST = "%6s", PH2OL = "%6.0f", PH2OU = "%6.0f",
               PH2OD = "%6.0f", PSTMX = "%6.0f", PSTMN = "%6.0f", IRRIGATION = " %-11s",
               IMDEP = "%6.0f", ITHRL = "%6.0f", ITHRU = "%6.0f", IROFF = "%6s",
               IMETH = "%6s", IRAMT = "%6.0f", IREFF = "%6.2f", NITROGEN = " %-11s",
               NMDEP = "%6.0f", NMTHR = "%6.2f", NAMNT = "%6.0f", NCODE = "%6s",
               NAOFF = "%6s", RESIDUES = " %-11s", RIPCN = "%6.0f", RTIME = "%6.0f",
               RIDEP = "%6.0f", HARVEST = " %-11s", HFRST = "%6s", HLAST = "%6s",
               HPCNP = "%6.0f", HPCNR = "%6.0f",
               SIMDATES = " %-11s",
               ENDAT = "%6s", SDUR = "%8.0f", FODAT = "%8s", FSTRYR = "%8.0f",
               FENDYR = "%8.0f", FWFILE = " %-15s", FONAME = "  %-s")

  }else if(any(grepl('^SOIL', sec_name))){

    v_fmt <- c(A = "%2.0f", SADAT = "%6s", SMHB = "%6s", SMPX = "%6s", SMKE = "%6s",
               SANAME = "  %-s", SABL = "%6.0f", SADM = "%6.1f", SAOC = "%6.2f",
               SANI = "%6.2f", SAPHW = "%6.1f", SAPHB = "%6.0f", SAPX = "%6.1f",
               SAKE = "%6.1f", SASC = "%6.3f")

  }else if(any(grepl('^TILLAGE', sec_name))){

    v_fmt <- c(T = "%2.0f", TDATE = "%6s", TIMPL = "%6s", TDEP = "%6.0f", TNAME = " %-s")

  }else if(any(grepl('^TREATMENTS', sec_name))){

    v_fmt <- c(N = "%2.0f", R = "%2.0f", O = "%2.0f", C = "%2.0f", TNAME = " %-25s",
               CU = "%3.0f", FL = "%3.0f", SA = "%3.0f", IC = "%3.0f", MP = "%3.0f",
               MI = "%3.0f", MF = "%3.0f", MR = "%3.0f", MC = "%3.0f", MT = "%3.0f",
               ME = "%3.0f", MH = "%3.0f", SM = "%3.0f")

  }else{

    v_fmt <- NULL

  }

  return(v_fmt)
}

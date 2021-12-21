#' Lookup function for fwf_pos
#' 
#' @importFrom tibble tribble
#' 
fwf_pos_lookup <- function(header){
  if(header == "@PEOPLE"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,NA_real_,   "PEOPLE"
    )
  }else if(header == "@ADDRESS"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,NA_real_,  "ADDRESS"
    )
  }else if(header == "@SITE"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,NA_real_,     "SITE"
    )
  }else if(header == "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN  HARM........."){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       7,    "PAREA",
          7,      13,     "PRNO",
         13,      19,     "PLEN",
         19,      25,     "PLDR",
         25,      31,     "PLSP",
         31,      37,     "PLAY",
         37,      43,    "HAREA",
         43,      49,     "HRNO",
         49,      55,     "HLEN",
         55,NA_real_,     "HARM"
    )
  }else if(header == "@N R O C TNAME.................... CU FL SA IC MP MI MF MR MC MT ME MH SM"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,    4,        "R",
          4,    6,        "O",
          6,    8,        "C",
          8,   34,    "TNAME",
         34,   37,       "CU",
         37,   40,       "FL",
         40,   43,       "SA",
         43,   46,       "IC",
         46,   49,       "MP",
         49,   52,       "MI",
         52,   55,       "MF",
         55,   58,       "MR",
         58,   61,       "MC",
         61,   64,       "MT",
         64,   67,       "ME",
         67,   70,       "MH",
         70,   73,       "SM"
    )
  }else if(header == "@C CR INGENO CNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "C",
          2,       5,       "CR",
          5,      12,   "INGENO",
         12,NA_real_,    "CNAME"
    )
  }else if(header == "@L ID_FIELD WSTA....  FLSA  FLOB  FLDT  FLDD  FLDS  FLST SLTX  SLDP  ID_SOIL    FLNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "L",
          2,      11, "ID_FIELD",
         11,      20,     "WSTA",
         20,      26,     "FLSA",
         26,      32,     "FLOB",
         32,      38,     "FLDT",
         38,      44,     "FLDD",
         44,      50,     "FLDS",
         50,      56,     "FLST",
         56,      63,     "SLTX",
         63,      67,     "SLDP",
         67,      80,  "ID_SOIL",
         80,NA_real_,   "FLNAME"
    )
  }else if(header == "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS FLHST FHDUR"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "L",
          2,   18,     "XCRD",
         18,   34,     "YCRD",
         34,   44,     "ELEV",
         44,   62,     "AREA",
         62,   68,     "SLEN",
         68,   74,     "FLWR",
         74,   80,     "SLAS",
         80,   86,    "FLHST",
         86,   92,    "FHDUR"
    )
  }else if(header == "@P PDATE EDATE  PPOP  PPOE  PLME  PLDS  PLRS  PLRD  PLDP  PLWT  PAGE  PENV  PLPH  SPRL                        PLNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "P",
          2,       8,    "PDATE",
          8,      14,    "EDATE",
         14,      20,     "PPOP",
         20,      26,     "PPOE",
         26,      32,     "PLME",
         32,      38,     "PLDS",
         38,      44,     "PLRS",
         44,      50,     "PLRD",
         50,      56,     "PLDP",
         56,      62,     "PLWT",
         62,      68,     "PAGE",
         68,      74,     "PENV",
         74,      80,     "PLPH",
         80,      86,     "SPRL",
         86,NA_real_,   "PLNAME"
    )
  }else if(header == "@I  EFIR  IDEP  ITHR  IEPT  IOFF  IAME  IAMT IRNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "I",
          2,       8,     "EFIR",
          8,      14,     "IDEP",
         14,      20,     "ITHR",
         20,      26,     "IEPT",
         26,      32,     "IOFF",
         32,      38,     "IAME",
         38,      44,     "IAMT",
         44,NA_real_,   "IRNAME"
    )
  }else if(header == "@I IDATE  IROP IRVAL"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "I",
          2,    8,    "IDATE",
          8,   14,     "IROP",
         14,   20,    "IRVAL"
    )
  }else if(header == "@F FDATE  FMCD  FACD  FDEP  FAMN  FAMP  FAMK  FAMC  FAMO  FOCD FERNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "F",
          2,       8,    "FDATE",
          8,      14,     "FMCD",
         14,      20,     "FACD",
         20,      26,     "FDEP",
         26,      32,     "FAMN",
         32,      38,     "FAMP",
         38,      44,     "FAMK",
         44,      50,     "FAMC",
         50,      56,     "FAMO",
         56,      62,     "FOCD",
         62,NA_real_,  "FERNAME"
    )
  }else if(header == "@T TDATE TIMPL  TDEP TNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "T",
          2,       8,    "TDATE",
          8,      14,    "TIMPL",
         14,      20,     "TDEP",
         20,NA_real_,    "TNAME"
    )
  }else if(header == "@H HDATE  HSTG  HCOM HSIZE   HPC  HBPC HNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "H",
          2,       8,    "HDATE",
          8,      14,     "HSTG",
         14,      20,     "HCOM",
         20,      26,    "HSIZE",
         26,      32,      "HPC",
         32,      38,     "HBPC",
         38,NA_real_,    "HNAME"
    )
  }else if(header == "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... SMODEL"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "N",
          2,      15,  "GENERAL",
         15,      20,    "NYERS",
         20,      26,    "NREPS",
         26,      32,    "START",
         32,      38,    "SDATE",
         38,      44,    "RSEED",
         44,      71,    "SNAME",
         71,NA_real_,   "SMODEL"
    )
  }else if(header == "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL   CO2"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "OPTIONS",
         15,   20,    "WATER",
         20,   26,    "NITRO",
         26,   32,    "SYMBI",
         32,   38,    "PHOSP",
         38,   44,    "POTAS",
         44,   50,    "DISES",
         50,   56,     "CHEM",
         56,   62,     "TILL",
         62,   68,      "CO2"
    )
  }else if(header == "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM MESEV MESOL"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "METHODS",
         15,   20,    "WTHER",
         20,   26,    "INCON",
         26,   32,    "LIGHT",
         32,   38,    "EVAPO",
         38,   44,    "INFIL",
         44,   50,    "PHOTO",
         50,   56,    "HYDRO",
         56,   62,    "NSWIT",
         62,   68,    "MESOM",
         68,   74,    "MESEV",
         74,   80,    "MESOL"
    )
  }else if(header == "@N MANAGEMENT  PLANT IRRIG FERTI RESID HARVS"){
    fwf_pos_out <- tribble(
     ~begin, ~end,  ~col_names,
          0,    2,         "N",
          2,   15,"MANAGEMENT",
         15,   20,     "PLANT",
         20,   26,     "IRRIG",
         26,   32,     "FERTI",
         32,   38,     "RESID",
         38,   44,     "HARVS"
    )
  }else if(header == "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT FMOPT"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "OUTPUTS",
         15,   20,    "FNAME",
         20,   26,    "OVVEW",
         26,   32,    "SUMRY",
         32,   38,    "FROPT",
         38,   44,    "GROUT",
         44,   50,    "CAOUT",
         50,   56,    "WAOUT",
         56,   62,    "NIOUT",
         62,   68,    "MIOUT",
         68,   74,    "DIOUT",
         74,   80,    "VBOSE",
         80,   86,    "CHOUT",
         86,   92,    "OPOUT",
         92,   98,    "FMOPT"
    )
  }else if(header == "@  AUTOMATIC MANAGEMENT"){
    fwf_pos_out <- tribble(
     ~begin,    ~end,  ~col_names,
          0,      12, "AUTOMATIC",
         12,NA_real_,"MANAGEMENT"
    )
  }else if(header == "@N PLANTING    PFRST PLAST PH2OL PH2OU PH2OD PSTMX PSTMN"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15, "PLANTING",
         15,   20,    "PFRST",
         20,   26,    "PLAST",
         26,   32,    "PH2OL",
         32,   38,    "PH2OU",
         38,   44,    "PH2OD",
         44,   50,    "PSTMX",
         50,   56,    "PSTMN"
    )
  }else if(header == "@N IRRIGATION  IMDEP ITHRL ITHRU IROFF IMETH IRAMT IREFF"){
    fwf_pos_out <- tribble(
     ~begin, ~end,  ~col_names,
          0,    2,         "N",
          2,   15,"IRRIGATION",
         15,   20,     "IMDEP",
         20,   26,     "ITHRL",
         26,   32,     "ITHRU",
         32,   38,     "IROFF",
         38,   44,     "IMETH",
         44,   50,     "IRAMT",
         50,   56,     "IREFF"
    )
  }else if(header == "@N NITROGEN    NMDEP NMTHR NAMNT NCODE NAOFF"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15, "NITROGEN",
         15,   20,    "NMDEP",
         20,   26,    "NMTHR",
         26,   32,    "NAMNT",
         32,   38,    "NCODE",
         38,   44,    "NAOFF"
    )
  }else if(header == "@N RESIDUES    RIPCN RTIME RIDEP"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15, "RESIDUES",
         15,   20,    "RIPCN",
         20,   26,    "RTIME",
         26,   32,    "RIDEP"
    )
  }else if(header == "@N HARVEST     HFRST HLAST HPCNP HPCNR"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "HARVEST",
         15,   20,    "HFRST",
         20,   26,    "HLAST",
         26,   32,    "HPCNP",
         32,   38,    "HPCNR"
    )
  }else if(header == "@C   PCR ICDAT  ICRT  ICND  ICRN  ICRE  ICWD ICRES ICREN ICREP ICRIP ICRID ICNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "C",
          2,       8,      "PCR",
          8,      14,    "ICDAT",
         14,      20,     "ICRT",
         20,      26,     "ICND",
         26,      32,     "ICRN",
         32,      38,     "ICRE",
         38,      44,     "ICWD",
         44,      50,    "ICRES",
         50,      56,    "ICREN",
         56,      62,    "ICREP",
         62,      68,    "ICRIP",
         68,      74,    "ICRID",
         74,NA_real_,   "ICNAME"
    )
  }else if(header == "@C  ICBL  SH2O  SNH4  SNO3"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "C",
          2,    8,     "ICBL",
          8,   14,     "SH2O",
         14,   20,     "SNH4",
         20,   26,     "SNO3"
    )
  }else if(header == "@NOTES"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,NA_real_,    "NOTES"
    )
  }else if(header == "@E ODATE EDAY  ERAD  EMAX  EMIN  ERAIN ECO2  EDEW  EWIND ENVNAME  "){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "E",
          2,       8,    "ODATE",
          8,      15,     "EDAY",
         15,      21,     "ERAD",
         21,      27,     "EMAX",
         27,      33,     "EMIN",
         33,      39,    "ERAIN",
         39,      45,     "ECO2",
         45,      51,     "EDEW",
         51,      57,    "EWIND",
         57,NA_real_,  "ENVNAME"
    )
  }else if(header == "@A SADAT  SMHB  SMPX  SMKE  SANAME"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "A",
          2,    8,    "SADAT",
          8,   14,     "SMHB",
         14,   20,     "SMPX",
         20,   26,     "SMKE",
         26,   34,   "SANAME"
    )
  }else if(header == "@A  SABL  SADM  SAOC  SANI SAPHW SAPHB  SAPX  SAKE  SASC"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "A",
          2,    8,     "SABL",
          8,   14,     "SADM",
         14,   20,     "SAOC",
         20,   26,     "SANI",
         26,   32,    "SAPHW",
         32,   38,    "SAPHB",
         38,   44,     "SAPX",
         44,   50,     "SAKE",
         50,   56,     "SASC"
    )
  }else if(header == "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT VBOSE CHOUT OPOUT"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "OUTPUTS",
         15,   20,    "FNAME",
         20,   26,    "OVVEW",
         26,   32,    "SUMRY",
         32,   38,    "FROPT",
         38,   44,    "GROUT",
         44,   50,    "CAOUT",
         50,   56,    "WAOUT",
         56,   62,    "NIOUT",
         62,   68,    "MIOUT",
         68,   74,    "DIOUT",
         74,   80,    "VBOSE",
         80,   86,    "CHOUT",
         86,   92,    "OPOUT"
    )
  }else if(header == "@L ...........XCRD ...........YCRD .....ELEV .............AREA .SLEN .FLWR .SLAS"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "L",
          2,   18,     "XCRD",
         18,   34,     "YCRD",
         34,   44,     "ELEV",
         44,   62,     "AREA",
         62,   68,     "SLEN",
         68,   74,     "FLWR",
         74,   80,     "SLAS"
    )
  }else if(header == "@N OPTIONS     WATER NITRO SYMBI PHOSP POTAS DISES  CHEM  TILL"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "OPTIONS",
         15,   20,    "WATER",
         20,   26,    "NITRO",
         26,   32,    "SYMBI",
         32,   38,    "PHOSP",
         38,   44,    "POTAS",
         44,   50,    "DISES",
         50,   56,     "CHEM",
         56,   62,     "TILL"
    )
  }else if(header == "@N METHODS     WTHER INCON LIGHT EVAPO INFIL PHOTO HYDRO NSWIT MESOM"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "METHODS",
         15,   20,    "WTHER",
         20,   26,    "INCON",
         26,   32,    "LIGHT",
         32,   38,    "EVAPO",
         38,   44,    "INFIL",
         44,   50,    "PHOTO",
         50,   56,    "HYDRO",
         56,   62,    "NSWIT",
         62,   68,    "MESOM"
    )
  }else if(header == "@N OUTPUTS     FNAME OVVEW SUMRY FROPT GROUT CAOUT WAOUT NIOUT MIOUT DIOUT  LONG CHOUT OPOUT"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   15,  "OUTPUTS",
         15,   20,    "FNAME",
         20,   26,    "OVVEW",
         26,   32,    "SUMRY",
         32,   38,    "FROPT",
         38,   44,    "GROUT",
         44,   50,    "CAOUT",
         50,   56,    "WAOUT",
         56,   62,    "NIOUT",
         62,   68,    "MIOUT",
         68,   74,    "DIOUT",
         74,   80,     "LONG",
         80,   86,    "CHOUT",
         86,   92,    "OPOUT"
    )
  }else if(header == "@ PAREA  PRNO  PLEN  PLDR  PLSP  PLAY HAREA  HRNO  HLEN HARM........."){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    7,    "PAREA",
          7,   13,     "PRNO",
         13,   19,     "PLEN",
         19,   25,     "PLDR",
         25,   31,     "PLSP",
         31,   37,     "PLAY",
         37,   43,    "HAREA",
         43,   49,     "HRNO",
         49,   55,     "HLEN",
         55,   69,     "HARM"
    )
  }else if(header == "@N GENERAL     NYERS NREPS START SDATE RSEED SNAME.................... MODEL"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "N",
          2,      15,  "GENERAL",
         15,      20,    "NYERS",
         20,      26,    "NREPS",
         26,      32,    "START",
         32,      38,    "SDATE",
         38,      44,    "RSEED",
         44,      70,    "SNAME",
         70,NA_real_,    "MODEL"
    )
  }else if(header == "@R RDATE  RCOD  RAMT  RESN  RESP  RESK  RINP  RDEP  RMET RENAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "R",
          2,       8,    "RDATE",
          8,      14,     "RCOD",
         14,      20,     "RAMT",
         20,      26,     "RESN",
         26,      32,     "RESP",
         32,      38,     "RESK",
         38,      44,     "RINP",
         44,      50,     "RDEP",
         50,      56,     "RMET",
         56,NA_real_,   "RENAME"
    )
  }else if(header == "@C CDATE CHCOD CHAMT  CHME CHDEP   CHT..CHNAME"){
    fwf_pos_out <- tribble(
     ~begin,    ~end, ~col_names,
          0,       2,        "C",
          2,       8,    "CDATE",
          8,      14,    "CHCOD",
         14,      20,    "CHAMT",
         20,      26,     "CHME",
         26,      32,    "CHDEP",
         32,      40,      "CHT",
         40,NA_real_,   "CHNAME"
    )
  }else if(header == "@N SIMDATES    ENDAT    SDUR   FODAT  FSTRYR  FENDYR FWFILE           FONAME"){
    fwf_pos_out <- tribble(
     ~begin, ~end, ~col_names,
          0,    2,        "N",
          2,   11, "SIMDATES",
         11,   20,    "ENDAT",
         20,   28,     "SDUR",
         28,   36,    "FODAT",
         36,   44,   "FSTRYR",
         44,   52,   "FENDYR",
         52,   59,   "FWFILE",
         59,   76,   "FONAME"
    )
  }else{
    fwf_post_out <- NULL
  }
  return(fwf_pos_out)
}

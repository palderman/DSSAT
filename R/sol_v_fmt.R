sol_v_fmt <- function(){

  v_fmt <- c(PEDON = "*%-10s", SOURCE = "  %-11s", TEXTURE = " %-5s", DEPTH = "%6.0f",
             DESCRIPTION = " %-s", SITE = " %-12s", COUNTRY = "%-11s", LAT = "%9.3f",
             LONG = "%9.3f", `SCS FAMILY` = " %-s", SCOM = "%6s", SALB = "%6.2f",
             SLU1 = "%6.2f", SLDR = "%6.2f", SLRO = "%6.1f", SLNF = "%6.2f",
             SLPF = "%6.2f", SMHB = "%6s", SMPX = "%6s", SMKE = "%6s",
             # SGRP = "%6s",
             SLB = "%6.0f",
             SLMH = "%6s", SLLL = "%6.3f", SDUL = "%6.3f", SSAT = "%6.3f",
             SRGF = "%6.3f", SSKS = "%6.3f", SBDM = "%6.2f", SLOC = "%6.3f",
             SLCL = "%6.1f", SLSI = "%6.1f", SLCF = "%6.1f", SLNI = "%6.2f", SLHW = "%6.2f",
             SLHB = "%6.2f", SCEC = "%6.2f", SADC = "%6f", SLPX = "%6.2f",
             SLPT = "%6f", SLPO = "%6f", CACO3 = "%6.2f", SLAL = "%6.2f",
             SLFE = "%6f", SLMN = "%6f", SLBS = "%6f", SLPA = "%6f", SLPB = "%6f",
             SLKE = "%6.2f", SLMG = "%6.2f", SLNA = "%6.2f", SLSU = "%6f",
             SLEC = "%6f", SLCA = "%6.2f",
             ALFVG = "%6.3f", MVG = "%6.3f", NVG = "%6.3f", WCRES = "%6.3f",
             `SCS Family` = " %-s")

  return(v_fmt)
}

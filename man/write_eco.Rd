% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_eco.R
\name{write_eco}
\alias{write_eco}
\title{Reads parameters from a single DSSAT ecotype parameter file (*.ECO)}
\usage{
write_eco(eco, file_name)
}
\arguments{
\item{file_name}{a character vector of length one that contains the name
of a single DSSAT output file}
}
\value{
a tibble containing the data from the raw DSSAT output
}
\description{
Reads parameters from a single DSSAT ecotype parameter file (*.ECO)
}
\examples{


sample_eco <- c(
"*MAIZE ECOTYPE COEFFICIENTS: MZCER047 MODEL",
"@ECO#  ECONAME.........  TBASE  TOPT ROPT   P20  DJTI  GDDE  DSGFT  RUE   KCAN  TSEN  CDAY",
"!                            1     2    3     4     5     6     7     8      9    10    11",
"IB0001 GENERIC MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85",
"IB0002 GENERIC MIDWEST2    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.5   0.85",
"IB0003 GENERIC MIDWEST3    8.0 34.0  34.0  12.5   4.0   6.0   170.  2.0   0.85",
"IB0004 +5\% RUE MIDWEST1    8.0 34.0  34.0  12.5   4.0   6.0   170.  4.4   0.85",
"DFAULT DEFAULT             8.0 34.0  34.0  12.5   4.0   6.0   170.  4.2   0.85")

write(sample_eco,'SAMPLE.ECO')

read_eco('SAMPLE.ECO')

write_eco(eco,'SAMPLE2.ECO')

}
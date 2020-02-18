## Resubmission
This is a resubmission. In this version I have:

* Removed LICENSE file from the source package

## Test environments

* local Ubuntu 16.04.6, R 3.6.2
* R-hub Windows Server 2008 R2 SP1, R-devel, 32/64 bit
* R-hub Windows Server 2008 R2 SP1, R-release, 32/64 bit
* R-hub Ubuntu Linux 16.04 LTS, R-devel, GCC
* R-hub Fedora Linux, R-devel, clang, gfortran

## R CMD check results

There were no ERRORs or WARNINGs.

There was 1 NOTE:

* checking CRAN incoming feasibility ... NOTE

  Maintainer: 'Phillip D. Alderman <phillip.alderman@okstate.edu>'

  New submission

  Possibly mis-spelled words in DESCRIPTION:
    Agrotechnology (8:52)
    DSSAT (3:44, 9:38, 12:9)
    CSM (9:44, 12:15)
    al (9:58)
    et (9:55)
  
None of these words is mis-spelled. They are a mixture of acronyms and a citation
  of the external software for which this new package is an interface.

## Downstream dependencies

There are currently no downstream dependencies for this package.

## Test environments

* local Ubuntu 22.04.2 LTS, R 4.2.3, GCC
* R-hub Ubuntu Linux 20.04.1 LTS, R-release, GCC (ubuntu-gcc-release)
* R-hub Debian Linux, R-devel, GCC (debian-gcc-devel)
* R-hub Fedora Linux, R-devel, clang, gfortran (fedora-clang-devel)
* R-hub Windows Server 2022, R-release, 64 bit (windows-x86_64-release)
* win-builder (devel and release)

## R CMD check results

There were no ERRORs or WARNINGs. There were 2 NOTEs:

* ONLY on R-hub Windows Server 2022, R-release, 64 bit:

```
    * checking for detritus in the temp directory ... NOTE
    Found the following files/directories:
      'lastMiKTeXException'
```
    As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this is likely due to a bug/crash in MiKTeX and can likely be ignored.

* ONLY on R-hub Fedora Linux, R-devel, clang, gfortran:

```
    * checking HTML version of manual ... NOTE
    Skipping checking HTML validation: no command 'tidy' found
```

    This NOTE is due to the `tidy` utility being unavailable on the R-hub Fedora server. I think this can be safely ignored given that HTML checks are passing on all other platforms.

## Downstream dependencies

There are currently no downstream dependencies for this package.

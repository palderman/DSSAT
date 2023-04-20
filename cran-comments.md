## Test environments

* local Ubuntu 22.04.2 LTS, R 4.2.3, GCC
* win-builder (devel and release)
* R-hub Fedora Linux, R-devel, clang, gfortran (fedora-clang-devel)
* R-hub Debian Linux, R-devel, clang (debian-clang-devel)
* R-hub Windows Server 2022, R-release, 64 bit (windows-x86_64-release)

## R CMD check results

There were no ERRORs or WARNINGs. There were 2 NOTEs:

* ONLY on R-hub Windows Server 2022, R-release, 64 bit:

```
    * checking for detritus in the temp directory ... NOTE
```

Inspecting the logs revealed this message:
    
```
    Found the following files/directories:
    * DONE
    'lastMiKTeXException'
```

As noted in [R-hub issue #503](https://github.com/r-hub/rhub/issues/503), this is likely due to a bug/crash in MiKTeX and can likely be ignored.

* ONLY on R-hub Debian Linux, R-devel, clang:

```
* checking examples ... [31s/75s] NOTE
Examples with CPU (user + system) or elapsed time > 5s
            user system elapsed
write_sol  3.074  0.012   7.317
read_dssat 2.047  0.025   5.449
read_sol   2.022  0.003   5.048
```

I do not think this is a problem. Although I am not sure why these examples are running slowly in this environment, elapsed time for each example is less than 3 seconds for the other test environments.

## Downstream dependencies

There are currently no downstream dependencies for this package.

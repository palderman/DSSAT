# DSSAT 0.0.3

This version updates calls to read_fwf() to be compatible with readr version 2.0.0.

# DSSAT 0.0.2

This version updates calls to dplyr functions to be compatible with dplyr version 1.0.0.

# DSSAT 0.0.1

This version provides cross-platform functions to:
  - Read input files:
    - FileX
    - FileT
    - FileA
    - Crop parameter files (\*.CUL,\*.ECO)
    - Soil input files (\*.SOL)
    - Weather input files (\*.WTH)
    - Pest input files (\*.PST)
    - DSSAT Batch file (DSSBatch.V\*)
- Write input files:
    - File X
    - File T
    - File A
    - Weather input files (\*.WTH)
    - DSSAT Batch file (DSSBatch.V\*)
- Run DSSAT-CSM in the following modes:
    - Batch
- Read output files:
    - Daily
    - Seasonal

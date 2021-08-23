# DSSAT 0.0.4

- This version fixes a bug related writing soil profiles when the v_fmt and tier_info attributes are missing.

- Updates citations in package description, adds CITATION entry, and includes citation notice in startup message

- Adds store_v_fmt argument to read_output() and read_filex() to allow storing of variable format to be controlled by user

- Resolves bug in header_to_fwf_position() uncovered during testing with R-devel

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

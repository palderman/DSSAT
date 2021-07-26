# DSSAT
[![DOI](https://zenodo.org/badge/196852406.svg)](https://zenodo.org/badge/latestdoi/196852406)

The purpose of this package is to provide a comprehensive R interface to the Decision Support System for Agrotechnology Transfer Cropping Systems Model (DSSAT-CSM). The package provides cross-platform functions to:

# Implemented
- Read input files:
    - File X
    - File T
    - File A
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
    - Soil input files (\*.SOL)
    - DSSAT Batch file (DSSBatch.V\*)
- Run DSSAT-CSM in the following modes:
    - Batch
- Read output files:
    - Daily
    - Seasonal

# Awaiting implementation
- Read input files:
    - Crop parameter files (\*.SPE)
- Write input files:
    - Pest input files (\*.PST)
    - Crop parameter files (\*.SPE)
- Run DSSAT-CSM in the following modes:
    - Seasonal
    - Sequence

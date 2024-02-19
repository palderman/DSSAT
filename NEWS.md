# DSSAT 0.0.9

- Fixed spelling of EXPERIMENT column name in read_output()

- Adding new filex_template_harvest_details() function to generate a template HARVEST DETAILS section for File X

- Bugfix for using $ instead of * for start of weather file header line in write_wth()

- Bugfix for read_sol() to handle case when PEDON is less than 10 digits

- Bugfix for write_filex() when missing NOTES, PAREA, PRNO, ...

# DSSAT 0.0.8

- read_output() now handles comma separated value (csv) output from DSSAT-CSM

- Adding function clear_output() to clear \*.OUT, \*.LST, \*.INP and \*.INH files

- Bugfix to properly prefix comments with "!" when writing files

- Overhaul of read_sol() that greatly speeds up reading of large SOL files

- New function for creating FileX template: filex_template()

# DSSAT 0.0.7

- Bugfix in read_tier_data() that prevents column XLAT from being converted to date-time format

- Implementing arguments for write_wth() that allow overriding/adding to values stored in wth argument

- Bugfix in write_wth() that ensures comments are prefixed with an exclamation mark

- Adding testthat tests for read_filex() and header_to_fwf_position()

- Adding DOI to CITATION

# DSSAT 0.0.6

- Bugfix to maintain compatibility with replace_na() from tidyr package. DSSAT version 0.0.5 did not have patch properly applied.

# DSSAT 0.0.5

- Small bugfix to maintain compatibility with replace_na() from tidyr package

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

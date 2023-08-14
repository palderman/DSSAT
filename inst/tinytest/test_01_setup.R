test_data_dir <- file.path(tinytest::get_call_wd(), "test_data")
test_data_files <- list.files(test_data_dir,
                              recursive = TRUE)

extr_regex <- function(regex, x){
  regmatches(x, regexpr(regex, x, perl = TRUE))
}

zip_test_data_file <- function(src_rel_path, src_root, dest_dir){
  prev_wd <- getwd()
  on.exit({setwd(prev_wd)})
  # Change to directory of source file
  setwd(file.path(src_root, dirname(src_rel_path)))
  # Extract file name
  file_name <- basename(src_rel_path)
  # Build zipfile name
  zip_file_name <- paste0(gsub("\\.", "_", file_name), ".zip")
  # Build zipfile path
  zip_file_path <- file.path(dest_dir, dirname(src_rel_path), zip_file_name)
  # Create test_data directories
  if(!dir.exists(dirname(zip_file_path))){
    dir.create(dirname(zip_file_path), recursive = TRUE)
  }
  invisible(zip(zip_file_path, file_name))
}

raw_to_rds <- function(src_rel_path, src_root, dest_dir){
  # Extract file name
  file_name <- basename(src_rel_path)
  # Build rds file name
  rds_file_name <- paste0(gsub("\\.", "_", file_name), ".rds")
  # Build rds file path
  rds_file_path <- file.path(dest_dir, dirname(src_rel_path), rds_file_name)
  # Create test_data directories
  if(!dir.exists(dirname(rds_file_path))){
    dir.create(dirname(rds_file_path), recursive = TRUE)
  }
  src_path <- file.path(src_root, src_rel_path)
  if(!file.exists(rds_file_path) ||
     file.mtime(src_path) > file.mtime(rds_file_path)){
    cat(paste0("Reading ", basename(src_path), "\n"))
    if(extr_regex("[^.]+$", src_path) == "R"){
      tmp_data <- dget(src_path)
    }else{
      tmp_data <- readLines(src_path)
    }
    cat(paste0("Writing ", basename(rds_file_path), "\n"))
    saveRDS(tmp_data, rds_file_path)
  }
}

for(f in test_data_files){
  raw_to_rds(src_rel_path = f,
             src_root = test_data_dir,
             dest_dir = file.path(tinytest::get_call_wd(), "inst", "tinytest", "test_data"))
}

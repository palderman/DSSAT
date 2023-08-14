update_test_data_path <- function(file_name){
  raw_file <- readRDS(file_name)
  # Find the system.file() lines
  sys_file_lines <- grep("^ +input_file <- system\\.file", raw_file)
  # Extract the file path
  sys_file_path <- gsub(".*\"([^\"]+)\".*", "\\1", raw_file[sys_file_lines])
  # Extract the file name
  sys_file_name <- basename(sys_file_path)
  # Replace tinytest with tinytest in the file path
  sys_file_path <- gsub("tinytest", "tinytest", sys_file_path)
  # Convert original file path to zipfile path
  sys_file_path <- paste0(gsub("\\.", "_", sys_file_path), ".zip")
  gsub("(^.*)system\\.file\\(\".*\"(.*)",
       paste0("\\\\1",
              "",
              sys_file_path,
              "\"\\\\2"),
    raw_file[sys_file_lines]
  )
}

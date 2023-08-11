add_arg_commas <- function(arg_list){

  n_args <-length(arg_list)

  # Add commas between each argument
  for(i in seq_along(arg_list)){
    if(i != n_args){
      arg_len <- length(arg_list[[i]])
      # Add comma
      arg_list[[i]][arg_len] <- paste0(arg_list[[i]][arg_len], ",")
    }
  }

  return(arg_list)
}

create_test_arg <- function(arg_name, value, max_width = 58L){

  # Create indent
  width_indent <- nchar(arg_name) + 7
  indent <- paste0(rep(" ", width_indent), collapse = "")

  # Deparse argument value
  width_cutoff <- max_width - width_indent
  test_arg <- deparse(value, width.cutoff = width_cutoff)

  # Indent all lines except first
  if(length(test_arg) > 1){
    test_arg[2:length(test_arg)] <- paste0(indent, test_arg[2:length(test_arg)])
  }

  # Add argument name to first line
  test_arg[1] <- paste0("`", arg_name, "`", " = ", test_arg[1])

  return(test_arg)

}

create_example_val_arg <- function(test_df){

  arg_names <- colnames(test_df)

  width_indent <- nchar("expected_vals = list(")
  indent <- paste0(rep(" ", width_indent), collapse = "")

  max_width = 60L - width_indent

  arg_list <- vector(mode = "list", length = ncol(test_df))
  for(i in seq_along(arg_list)){

    # Determine indent for column i
    if(is.list(test_df[[i]])){
      width_arg_indent <- nchar(arg_names[i]) + 8
    }else{
      width_arg_indent <- nchar(arg_names[i]) + 5
    }
    arg_indent <- paste0(rep(" ", width_arg_indent), collapse = "")

    # Deparse column i
    arg_tmp <- create_test_arg(arg_names[i],
                               test_df[[i]],
                               max_width = max_width)

    # Insert newlines after each list element
    arg_tmp <- gsub(x = arg_tmp,
                    pattern = "\\), *([^ ]+.*)",
                    replacement = "),\n  \\1")
    # Split at inserted newlines
    arg_tmp <- unlist(
      strsplit(x = arg_tmp,
               split = "\n")
    )

    # Replace leading spaces with correct indentation
    arg_tmp <- gsub(x = arg_tmp,
                    pattern = "^ +",
                    replacement = arg_indent)

    # Assign to argument list
    arg_list[[i]] <- arg_tmp
  }

  arg_list <- add_arg_commas(arg_list)

  arg_vec <- unlist(arg_list)

  arg_vec[1] <- paste0("expected_vals = list(", arg_vec[1])
  arg_vec[length(arg_vec)] <- paste0(arg_vec[length(arg_vec)], ")")

  return(arg_vec)
}

create_call_test_cols_check <- function(data_name, test_df){

  # Create list of character columns
  char_cols <- sapply(test_df, function(.x) is.character(unlist(.x)))

  if(any(char_cols)){
    char_cols_arg <- create_test_arg("char_cols",
                                     colnames(test_df)[char_cols],
                                     max_width = 58L)
  }else{
    char_cols_arg <- NULL
  }

  # Create list of list columns
  list_cols <- sapply(test_df, function(.x) is.list(.x))

  if(any(list_cols)){
    list_cols_arg <- create_test_arg("list_cols",
                                     colnames(test_df)[list_cols],
                                     max_width = 58L)
  }else{
    list_cols_arg <- NULL
  }

  # Create list of date columns
  date_cols <- sapply(test_df, function(.x) if(is.list(.x)){
      any(sapply(.x, function(.y) "POSIXt" %in% class(.y)))
    }else{
      "POSIXt" %in% class(.x)
    }
  )

  if(any(date_cols)){
    date_cols_arg <- create_test_arg("date_cols",
                                     colnames(test_df)[date_cols],
                                     max_width = 58L)
  }else{
    date_cols_arg <- NULL
  }

  example_val_arg <- create_example_val_arg(test_df)

  arg_list <- c(list(data_name),
                list(char_cols_arg),
                list(list_cols_arg),
                list(date_cols_arg),
                list(example_val_arg))

  # Add commas between each argument
  arg_list <- add_arg_commas(arg_list)

  call_test_cols <- c(
    "DSSAT:::test_cols_check(",
    paste0("  ", unlist(arg_list)),
    ")"
    )

  return(call_test_cols)

}

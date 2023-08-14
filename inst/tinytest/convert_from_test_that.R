create_cols_check <- function(){

  return(
'  # Check for all missing variables
  for(nm in names(actual)){
    if("missing" %in% objects() && nm %in% missing){
      if(exists("char_cols") && nm %in% char_cols){
        na_val <- NA_character_
      }else if("date_cols" %in% objects() && !is.null(date_cols) && nm == date_cols){
        na_val <- as.POSIXct(NA, tz=\"UTC\")
      }else{
        na_val <- NA_real_
      }
      if("list_cols" %in% objects() && !is.null(list_cols) && nm %in% list_cols){
        expect_equal(unlist(actual[[nm]]),
                               rep(na_val, length(unlist(actual[[nm]]))),
                               info = paste0(info_prefix, \": \", nm))
      }else{
        expect_equal(actual[[nm]],
                     rep(na_val, nrow(actual)),
                     info = paste0(info_prefix, \": \", nm))
      }
    }
  }

  # Check for specific expected values
  if("expected_vals" %in% objects() && !is.null(expected_vals)){
    for(nm in names(expected_vals)){
        expect_equal(actual[[nm]],
                     expected_vals[[nm]],
                     info = paste0(info_prefix, ": ", nm))
    }
  }

  # Check list column type and dimensions
  if("list_cols" %in% objects() && !is.null(list_cols)){
    for(nm in list_cols){
        expect_true(is.list(actual[[nm]]),
                    info = paste0(info_prefix, ": ", nm))
      if(exists("list_col_length") && !is.null(list_col_length)){
        if(length(list_col_length) == 1){
          list_col_length <- rep(list_col_length, length(actual[[nm]]))
        }
        for(i in 1:length(actual[[nm]])){
            expect_equal(length(unlist(actual[[nm]][i])),
                       list_col_length[i],
                       info = paste0(info_prefix, nm))
        }
      }
      if("list_col_groups" %in% objects() && !is.null(list_col_groups)){
        for(i in 1:nrow(actual)){
          for(g in 1:length(list_col_groups)){
            length_range <- range(
              sapply(actual[i,][list_col_groups[[g]]],
                     function(x)length(unlist(x)))
              )
            lbl = paste0(paste0(list_col_groups[[g]],collapse = ", ")," - row ", i)
              expect_equal(length_range[1],
                         length_range[2],
                         info = paste0(info_prefix, ": ", lbl))
          }
        }
      }
    }
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    if(arg %in% objects()) rm(list = arg)
  }
'
  )

}

convert_expect_function <- function(new_test, test_lines, end_lines, labels){
  expect_lines <- grep("^ *expect_", new_test)
  for(i in seq_along(labels)){
    replace_lines <- expect_lines[expect_lines >= test_lines[i] & expect_lines <= end_lines[i]]
    new_test[replace_lines] <- gsub("\\)$", ",", new_test[replace_lines])
    indent <- gsub('.', ' ',
                   gsub("^( *expect_[a-z]+\\().*",
                        "\\1",
                        new_test[replace_lines]))
    new_test[replace_lines] <- paste0(new_test[replace_lines], "\n", indent, "info = ", labels[i], ")")
  }
  return(new_test)
}

convert_test_cols_check <- function(new_test, labels, actual_name = "actual,"){
  test_cols_lines <- grep("(^|([ :]*))test_cols_check\\(", new_test)
  indent <- extract_string(' +', new_test[test_cols_lines])
  actual_lines <- nearest_end(new_test, test_cols_lines, actual_name, before = FALSE)
  if(actual_name == "actual,"){
    new_test[actual_lines] <- ""
  }else{
    new_test[actual_lines] <- paste0(
      extract_string('^ +', new_test[actual_lines]),
      "actual <- ",
      extract_string(actual_name, new_test[actual_lines]))
  }
  for(arg in c("char_cols", "list_cols", "date_cols",
               "missing", "list_col_length",
               "list_col_groups", "expected_vals")){
    arg_regex <- paste0("(^ *`*", arg, "`*) = ")
    arg_lines <- nearest_end(new_test, test_cols_lines, arg_regex, before = FALSE)
    new_test[arg_lines] <- gsub(arg_regex, "\\1 <- ", new_test[arg_lines])
    new_test[arg_lines] <- gsub("(char_cols` <- .*\\)), *$", "\\1", new_test[arg_lines])
  }
  last_lines <- nearest_end(new_test, test_cols_lines, "^  \\)", before = FALSE)
  new_test[last_lines] <- paste0("\n", create_cols_check())
  new_test[test_cols_lines] <- paste0(indent, "info_prefix <- ", labels)
  return(new_test)
}

nearest_end <- function(new_test, test_lines, regex = "^\\}\\)", before = TRUE){
  end_lines <- grep(regex, new_test)
  end_lines <- unlist(lapply(test_lines,
                      \(.i){
                        .j <- end_lines - .i
                        if(before){
                          end_out <- end_lines[.j < 0][which.max(.j[.j < 0])]
                        }else{
                          end_out <- end_lines[.j > 0][which.min(.j[.j > 0])]
                        }
                        return(end_out)
                      }))
  return(end_lines)
}

extract_string <- function(pattern, string){
  regmatches(string, regexpr(pattern, string, perl = TRUE))
}

replace_with_file <- function(lines_in){
  withr_lines <- grep("^ *withr::with_file\\(", lines_in)
  file_name <- extract_string('(?<=")[^"]+(?=")', lines_in[withr_lines])
  tmp_file_name <- tolower(gsub("\\.", "_", file_name))
  file_name <- gsub("\\.", "\\\\.", file_name)
  withr_end <- nearest_end(lines_in, c(withr_lines[-1], length(lines_in)), regex = "^ +\\}\\)")
  withr_all <- unlist(mapply(\(.x, .y){.x:.y}, withr_lines, withr_end))
  for(.i in seq_along(withr_lines)){
    lines_in[withr_lines[.i]:withr_end[.i]] <- gsub(
      paste0('"',file_name[.i],'"'),
      tmp_file_name[.i],
      lines_in[withr_lines[.i]:withr_end[.i]]
      )
    lines_in[withr_lines[.i]] <- gsub(
      '^( +)withr::with_file.*',
      paste0("\\1", tmp_file_name[.i], " <- tempfile()\n"),
      lines_in[withr_lines[.i]]
      )
  }
  if(length(withr_end) > 0) lines_in[withr_end] <- paste0("file.remove(", tmp_file_name, ")")
  return(lines_in)
}

fix_call_test_cols_check <- function(lines_in){
  gsub("DSSAT:::(test_cols_check)", "\\1", lines_in)
}

convert_from_test_that <- function(file_name,
                                   expect = TRUE,
                                   test_cols = FALSE,
                                   actual_name = "actual,"){
  new_test <- readRDS(file_name)
  test_lines <- grep("^ *test_that", new_test)
  labels <- gsub("(test_that\\()|(, *\\{$)", "", new_test[test_lines])
  end_lines <- nearest_end(new_test, c(test_lines[-1], length(new_test)))
  new_test[test_lines] <- paste0("# ", labels)
  if(expect){
    new_test <- convert_expect_function(new_test, test_lines, end_lines, labels)
  }
  if(test_cols){
    new_test <- convert_test_cols_check(new_test, labels,
                                        actual_name = actual_name)
  }
  new_test <- fix_call_test_cols_check(new_test[-end_lines])
  return(new_test)
}

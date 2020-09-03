#' @export
#'
as_dssat_expmt_tbl <- function(tbl_in){
  UseMethod("as_dssat_expmt_tbl")
}

#' @export
#'
as_dssat_expmt_tbl.default <- function(tbl_in){
  if(class(tbl_in)[1] != 'dssat_expmt_tbl'){
    tbl_out <- tbl_in
    class(tbl_out) <- c('dssat_expmt_tbl',class(tbl_in))
  }else{
    tbl_out <- tbl_in
  }
  return(tbl_out)
}

#' @export
#'
add_expmt <- function(.expmt_tbl,...){

  .expmt_tbl <- create_expmt(...) %>%
      full_join(.expmt_table,.,by='filex') %>%
      as_dssat_expmt_tbl()

  return(.expmt_tbl)

}

#' @export
#'
join_filea_filet <- function(filea=NULL,filet=NULL){
  if(!is.null(filea)){
    filea <- filea %>%
      mutate(DATE = as.POSIXct('0001001',format='%Y%j',tz='UTC'))
  }
  if(!is.null(filet) & !is.null(filea)){
    joined_data <- full_join(filea,filet)
  }else if(!is.null(filet)){
    joined_data <- filet
  }else{
    joined_data <- filea
  }
  return(joined_data)
}

#' @export
#'
get_pdate <- function(filex){

  pdate <- filex$TREATMENTS %>%
    select(N,MP) %>%
    rename(TRNO=N) %>%
    left_join(filex$`PLANTING DETAILS`,by = c("MP"="P")) %>%
    select(TRNO,PDATE)

  return(pdate)

}

#' @export
#'
dat_to_dap <- function(pdate,.data){

  dat_cols <- map_lgl(.data,~is.POSIXct(.)) & !str_detect(colnames(.data),'^DATE$')

  if(any(dat_cols)){
    dat_cnames <- colnames(.data)[dat_cols]
    .data <- .data %>%
      left_join(pdate) %>%
      mutate_if(.,
                colnames(.) %in% dat_cnames,
                ~{as.numeric(difftime(.,PDATE,units='days'))}) %>%
      select(-PDATE)

    cnames <- colnames(.data)

    cnames[cnames %in% dat_cnames] <- cnames[cnames %in% dat_cnames] %>%
      str_replace('T$','P')

    colnames(.data) <- cnames
  }

  return(.data)
}

#' @export
#'
#' @importFrom tibble tibble
#' @importFrom dplyr "%>%" group_by group_map bind_rows
#' @importFrom purrr map
#'
create_expmt_tbl <- function(filex_name, trno=NULL, data_types=NULL,
                             rewrite_filex=FALSE){
  if(is.null(trno)){
    filex_trno_tbl <- tibble(filex_name = filex_name,
                             trno = map(filex_name,~{NULL}))
  }else{
    filex_trno_tbl <- tibble(filex_name = filex_name,
                             trno = trno)
  }
  expmt_tbl <- filex_trno_tbl %>%
    group_by(filex_name) %>%
    group_map(~create_dssat_expmt(filex_name = .y$filex_name,
                                  trno = .x$trno[[1]],
                                  data_types = data_types,
                                  rewrite_filex = rewrite_filex)) %>%
    bind_rows()
  return(expmt_tbl)
}

#' @export
#'
#'
#' @importFrom dplyr "%>%" filter mutate select
#' @importFrom stringr str_replace str_detect
#' @importFrom tibble tibble
#' @importFrom tidyr pivot_longer
#'
create_dssat_expmt <- function(filex_name, trno=NULL, data_types=NULL,
                               rewrite_filex = FALSE){

  if(is.null(trno)){
    filex <- read_filex(filex_name)
    trno <- filex %>%
    {.$TREATMENTS} %>%
    {.$N}
  }

  filea_name <- filex_name %>%
    str_replace('X$','A')
  if(file.exists(filea_name)){
    filea <- read_filea(filea_name)
    filea_col_names <- filea %>%
      colnames() %>%
      {.[! . %in% c('TRNO','DATE')]}
    if(any(str_detect(colnames(filea),'DAT$'))){
      if(!exists('filex', envir = environment(fun = NULL))){
        filex <- read_filex(filex_name)
      }
      pdate <- get_pdate(filex)
      filea <- dat_to_dap(pdate,filea)
    }else{
      pdate <- tibble(TRNO=numeric(),PDATE=numeric()) %>%
        mutate(PDATE = as.POSIXct(PDATE,origin='1970-01-01',tz='UTC'))
    }
  }else{
    filea <- NULL
    filea_col_names <- NULL
  }

  filet_name <- filex_name %>%
    str_replace('X$','T')
  if(file.exists(filet_name)){
    filet <- read_filet(filet_name)
    filet_col_names <- filet %>%
      colnames() %>%
      {.[! . %in% c('TRNO','DATE')]}
  }else{
      filet <- NULL
      filet_col_names <- NULL
  }

  if(is.null(data_types)){
    data_types <- c(filea_col_names,filet_col_names) %>%
      unique()
  }

  if(rewrite_filex){
    if(!exists('filex', envir = environment(fun = NULL))){
      filex <- read_filex(filex_name)
    }
    write_filex(filex,basename(filex_name))
  }else{
    file.copy(filex_name,basename(filex_name))
  }

  filex_name <- basename(filex_name)

  joined_data <- join_filea_filet(filea,filet) %>%
    filter(TRNO %in% trno) %>%
    tidyr::pivot_longer(names_to='variable',values_to = 'obs',cols=c(-TRNO,-DATE)) %>%
    mutate(EXPERIMENT=str_sub(filex_name,1,8)) %>%
    select(EXPERIMENT,TRNO,DATE,everything()) %>%
    filter(!is.na(obs))

  sim_data_template <- joined_data %>%
    select(EXPERIMENT,TRNO,DATE,variable)

  sim_template <- tibble(data_template = list(sim_data_template),
                         pdate = list(pdate))

  if(!exists('filex', envir = environment(fun = NULL))){
    filex <- NULL
  }

  expmt <- tibble(filex_name = filex_name, filex = list(filex),
                  obs_data = list(joined_data), trno = list(trno),
                  data_types = list(data_types), sim_template = list(sim_template)) %>%
    add_output_tbl() %>%
    as_dssat_expmt_tbl()

  return(expmt)

}

#' @export
#'
write_dssbatch.dssat_expmt_tbl <- function(expmt_tbl){

  expmt_tbl %>%
    select(filex_name,trno) %>%
    unnest(trno) %>%
    {write_dssbatch.default(x = .$filex_name, trtno = .$trno)}

}

#' @export
as_dssat_prm_tbl <- function(tbl_in){
  UseMethod("as_dssat_prm_tbl")
}

#' @export
 as_dssat_prm_tbl.default <- function(tbl_in){

  if(class(tbl_in)[1] != 'dssat_prm_tbl'){

    tbl_out <- as_tibble(tbl_in)
    class(tbl_out) <- c('dssat_prm_tbl',class(tbl_in))

  }else{

    tbl_out <- tbl_in

  }
  return(tbl_out)
}

#' @export
create_dssat_prm <- function(pname, pfile,
                             pmin = -Inf,
                             pmax = Inf,
                             pmu = NA,
                             psigma = NA,
                             pdist = "unif",
                             ptier = as.character(NA),
                             pkey = as.character(NA),
                             plev = as.numeric(NA),
                             pind = as.numeric(NA)){

  if(any(is.null(pname) | is.na(pname))) warning("pname cannot be NULL or missing")
  if(any(is.null(pfile) | is.na(pfile))) warning("pfile cannot be NULL or missing")

  if(all(is.null(pmin))) pmin = -Inf
  if(all(is.null(pmax))) pmax = Inf
  if(all(is.null(pmu))) pmu = NA
  if(all(is.null(psigma))) psigma = NA
  if(all(is.null(pdist))) pdist = "unif"
  if(all(is.null(ptier))) ptier = as.character(NA)
  if(all(is.null(pkey))) pkey = as.character(NA)
  if(all(is.null(plev))) plev = as.numeric(NA)
  if(all(is.null(pind))) pind = as.numeric(NA)

  prm <- tibble(pname = pname, pmin = pmin, pmax = pmax, pmu = pmu, psigma = psigma,
                pdist = pdist, pfile = pfile, ptier = ptier, pkey = pkey, plev = plev,
                pind = pind) %>%
    as_dssat_prm_tbl()

  return(prm)

}

#' @export
#'
#' @importFrom readr read_csv
#' @importFrom dplyr "%>%" pull
import_prm_tbl_csv <- function(file_name){

  prm_tbl_csv <- read_csv(file_name)

  pname <- prm_tbl_csv %>%
    pull(pname) %>%
    as.character()

  pfile <- prm_tbl_csv %>%
    pull(pfile) %>%
    as.character()

  if('pmin' %in% colnames(prm_tbl_csv)){
    pmin <- prm_tbl_csv %>%
      pull(pmin) %>%
      as.numeric()
  }else{
    pmin <- -Inf
  }

  if('pmax' %in% colnames(prm_tbl_csv)){
    pmax <- prm_tbl_csv %>%
      pull(pmax) %>%
      as.numeric()
  }else{
    pmax <- Inf
  }

  if('pmu' %in% colnames(prm_tbl_csv)){
    pmu <- prm_tbl_csv %>%
      pull(pmu) %>%
      as.numeric()
  }else{
    pmu <- NA
  }

  if('psigma' %in% colnames(prm_tbl_csv)){
    psigma <- prm_tbl_csv %>%
      pull(psigma) %>%
      as.numeric()
  }else{
    psigma <- NA
  }

  if('pdist' %in% colnames(prm_tbl_csv)){
    pdist <- prm_tbl_csv %>%
      pull(pdist) %>%
      as.character()
  }else{
    pdist <- "unif"
  }

  if('ptier' %in% colnames(prm_tbl_csv)){
    ptier <- prm_tbl_csv %>%
      pull(ptier) %>%
      as.character()
  }else{
    ptier <- as.character(NA)
  }

  if('pkey' %in% colnames(prm_tbl_csv)){
    pkey <- prm_tbl_csv %>%
      pull(pkey) %>%
      as.character()
  }else{
    pkey <- as.character(NA)
  }

  if('plev' %in% colnames(prm_tbl_csv)){
    plev <- prm_tbl_csv %>%
      pull(plev) %>%
      as.numeric()
  }else{
    plev <- as.numeric(NA)
  }

  if('pind' %in% colnames(prm_tbl_csv)){
    pind <- prm_tbl_csv %>%
      pull(pind) %>%
      as.numeric()
  }else{
    pind <- as.numeric(NA)
  }

  prm_tbl <- create_dssat_prm(pname = pname,
                              pfile = pfile,
                              pmin = pmin,
                              pmax = pmax,
                              pmu = pmu,
                              psigma = psigma,
                              pdist = pdist,
                              ptier = ptier,
                              pkey = pkey,
                              plev = plev,
                              pind = pind)

  return(prm_tbl)

}

#' @export
#'
add_dssat_prm <- function(.prm_tbl, ...){

  .prm_tbl <- create_dssat_prm(...) %>%
    full_join(.prm_tbl,.) %>%
    as_dssat_prm_tbl()

  return(.prm_tbl)
}

#' @export
#'
add_pfmt <- function(.prm_tbl, input_tbl){

  v_fmt <- group_by(input_tbl,file_name) %>%
    group_map(~attr(.$file_processed[[1]],'v_fmt'))

  names(v_fmt) <- input_tbl$file_name

  .prm_tbl <- .prm_tbl %>%
    rowwise() %>%
    mutate(pfmt = v_fmt[[pfile]][pname])

  return(.prm_tbl)

}

generate_pregex <- function(widths){

  for(i in 1:1000){
    pregex <- stringi::stri_rand_strings(length(widths),widths)
    found = FALSE
    for(j in 1:length(pregex)){
      if(!found){
        found = any(str_detect(pregex[-j],pregex[j]))
      }else{
        break
      }
    }
    if(!found) break
  }

  return(pregex)

}

#' @export
#'
add_pregex <- function(.prm_tbl){

  widths <- .prm_tbl$pfmt %>%
    str_extract('(?<=%)-*[0-9]+') %>%
    str_remove('-') %>%
    as.numeric()

 .prm_tbl <- .prm_tbl %>%
    ungroup() %>%
    mutate(pregex = generate_pregex(widths))

  return(.prm_tbl)

}

#' @export
as_dssat_input_tbl <- function(tbl_in){
  UseMethod("as_dssat_input_tbl")
}

#' @export
as_dssat_input_tbl.default <- function(tbl_in){

  if(class(tbl_in)[1] != 'dssat_input_tbl'){

    tbl_out <- as_tibble(tbl_in)
    class(tbl_out) <- c('dssat_input_tbl',class(tbl_in))

  }else{

    tbl_out <- tbl_in

  }
  return(tbl_out)
}

#' @export
#'
create_dssat_input <- function(file_path, ...){

  file_name <- basename(file_path)

  if(file.exists(file_name)) file_path <- file_name

  if(!file.exists(file_path)){
    file_path <- options()$DSSAT.CSM %>%
      dirname() %>%
      list.files(path = ., pattern = file_name, recursive = TRUE, full.names = TRUE)
    if(length(file_path) > 1){
      if(str_detect(file_name,'(CUL$)|(ECO$)|(SPE$)') & any(str_detect(file_path,'Genotype'))){
        file_path <- str_subset(file_path,'Genotype')
      }else{
        file_path <- file_path[1]
        warning(str_c("File path for ",file_name," set to ",file_path))
      }
    }
    if(!file.exists(file_path)) stop(str_c("File ",file_name," could not be found."))
  }

  if(str_detect(file_name,'\\.CUL$')){
    file_processed <- read_cul(file_path, ...)
  }else if(str_detect(file_name,'\\.ECO$')){
    file_processed <- read_eco(file_path, ...)
  }

  input_tbl <- tibble(file_name = file_name, file_processed = list(file_processed)) %>%
    as_dssat_input_tbl()

  return(input_tbl)

}

#' @export
#'
add_dssat_input <- function(.input_tbl,...){

  .input_tbl <- create_dssat_input(...) %>%
    bind_rows(.input_tbl,.) %>%
    as_dssat_prm_tbl()

  return(.input_tbl)
}

#' @export
#'
modify_vfmt <- function(.input,pname,pfmt){

  v_fmt <- attr(.input,'v_fmt')

  widths <- pfmt %>%
    str_extract('(?<=%)-*[0-9]+') %>%
    str_remove('-') %>%
    as.numeric()

  v_fmt[pname] <- str_c('%',widths,'s')

  return(v_fmt)

}

#' @export
#'
generate_file_template <- function(file_name,file_processed){

  tmp_con <- textConnection('file_template',open='w',local=TRUE)

  if(str_detect(file_name,'\\.CUL$')){
    write_cul(file_processed,tmp_con)
  }else if(str_detect(file_name,'\\.ECO$')){
    write_eco(file_processed,tmp_con)
  }

  return(list(file_template))

}

#' @export
#'
#' @importFrom dplyr "%>%" filter group_by group_modify mutate ungroup select
#' @importFrom stringr str_replace_all
#'
add_input_template <- function(.input_tbl,.prm_tbl){

  .input_tbl <- .input_tbl %>%
    group_by(file_name) %>%
    group_modify(~{
      pt <- filter(.prm_tbl, pfile == .y$file_name) %>%
        mutate(pfmt = str_replace_all(pfmt,'(\\..*)|([a-z])','s'))
      if(nrow(pt) > 0){
        fp <- .x$file_processed[[1]]
        for(i in 1:nrow(pt)){
          fp <- mutate(fp,!!pt$pname[i] := sprintf(pt$pfmt[i],!!as.name(pt$pname[i])))
          if(str_detect(.y$file_name,'\\.CUL')){
            fp <- mutate_cond(fp,`VAR#` == pt$pkey[i], !!pt$pname[i] := !!pt$pregex[i])
          }else if(str_detect(.y$file_name,'\\.ECO')){
            fp <- mutate_cond(fp,`ECO#` == pt$pkey[i], !!pt$pname[i] := !!pt$pregex[i])
          }
          attr(fp,'v_fmt') <- modify_vfmt(fp,pt$pname[i],pt$pfmt[i])
        }
        .x$file_processed[[1]] <- fp
      }
      return(.x)
    }) %>%
    mutate(file_template = generate_file_template(file_name,file_processed[[1]])) %>%
    ungroup() %>%
    select(-file_processed)

  return(.input_tbl)
}

#' @export
#'
generate_prm_replace <- function(pvals,.prm_tbl){

  prm_replace <- .prm_tbl$pfmt %>%
    sprintf(pvals)

  names(prm_replace) <- .prm_tbl$pregex

  return(prm_replace)

}

#' @export
#'
write_inputs <- function(.input_tbl,.prm_tbl,pvals){

  prm_replace <- generate_prm_replace(pvals,.prm_tbl)

  .input_tbl %>%
  group_by(file_name) %>%
    group_walk(~{str_replace_all(.x$file_template[[1]],prm_replace) %>%
        write(.y$file_name)
        })
  return(invisible())
}

#' @export
#'
write_exmpt_filex <- function(.expmt_tbl){

  .expmt_tbl %>%
    group_by(filex_name) %>%
    group_walk(~{
      if('VBOSE' %in% colnames(.x$filex[[1]]$`SIMULATION CONTROLS`)){
        .x$filex[[1]]$`SIMULATION CONTROLS`$VBOSE <- 'N'
      }else if('LONG' %in% colnames(.x$filex[[1]]$`SIMULATION CONTROLS`)){
        .x$filex[[1]]$`SIMULATION CONTROLS`$LONG <- 'N'
      }
      write_filex(.x$filex[[1]],.y$filex_name)})

}

#' @export
#'
find_output_variables <- function(.expmt){

  out_tbl <- list.files(pattern = '\\.OUT') %>%
  {names(.) <- .; .} %>%
    map(~try(suppressWarnings(read_output(.)), silent = TRUE)) %>%
    {.[map_lgl(.,~{ ! 'try-error' %in% class(.) })]} %>%
    {.[map_lgl(.,~{ any(colnames(.) %in% unlist(.expmt$data_types)) })]} %>%
    {tibble(file_name = names(.), col_names = map(.,colnames),
            data_types = list(unlist(.expmt$data_types)))} %>%
    rowwise() %>%
    mutate(dtype_check = list(intersect(data_types,col_names)),
           nvars = length(unlist(dtype_check))) %>%
    ungroup() %>%
    arrange(nvars)

  for(i in 1:nrow(out_tbl)){
    if(i < nrow(out_tbl)){
      out_tbl$col_names[i] <- setdiff(out_tbl$dtype_check[[i]],
                                       unlist(out_tbl$dtype_check[-1:-i])) %>%
        list()
    }else{
      out_tbl$col_names[i] <- out_tbl$dtype_check[i]
    }
  }

  missing_data_types <- setdiff(unlist(.expmt$data_types),unlist(out_tbl$col_names))

  if(length(missing_data_types) > 0){
    err_msg <- str_c(missing_data_types,collapse = ', ') %>%
      str_c('The following data types were not found in any output file:\n',
            .,
            '\n Please check variable names or output options within File X.')
    warning(err_msg)
  }

  out_tbl <- filter(out_tbl,map_lgl(col_names,~{length(.) > 0})) %>%
    select(file_name,col_names)

  return(out_tbl)

}

#' @export
#'
#' @importFrom dplyr "%>%" group_by mutate group_modify
#'
add_output_tbl <- function(.expmt){

  write_dssbatch(x=.expmt$filex_name,trtno=.expmt$trno[[1]])

  run_dssat(suppress_output = TRUE)

  .expmt <- .expmt %>%
    group_by(filex_name) %>%
    group_modify(~mutate(.x,out_tbl = list(find_output_variables(.x))))

  return(.expmt)

}

#' @export
#'
#' @importFrom dplyr "%>%" group_by mutate filter full_join left_join group_map
#' @importFrom purrr reduce
#' @importFrom tibble add_column
#' @importFrom stringr str_detect
#' @importFrom tidyr gather
#'
read_sim_data <- function(sim_template,out_tbl){

  if(is.list(out_tbl) & !is.data.frame(out_tbl)){
    out_tbl <- out_tbl %>%
      map(~unnest(.,cols=col_names)) %>%
      reduce(full_join)
  }else{
    out_tbl <- out_tbl %>%
      unnest(.,cols=col_names)
  }

  if(is.list(sim_template) & !is.data.frame(sim_template)){
      sim_template <- sim_template %>%
        map(~full_join(.$data_template[[1]],.$pdate[[1]])) %>%
        reduce(full_join)
  }else{
    sim_template <- full_join(sim_template$data_template[[1]],
                              sim_template$pdate[[1]])
  }

  run_expmt <- sim_template %>%
    group_by(EXPERIMENT,TRNO) %>%
    summarize() %>%
    ungroup() %>%
    mutate(RUN = 1:n(),
           RUNNO = RUN)

  out <- out_tbl %>%
    group_by(file_name) %>%
    group_map(~{
      read_output(.y$file_name,read_only = c('TRNO','DATE','RUN','RUNNO',.x$col_names[[1]])) %>%
        {
          if( ! 'DATE' %in% names(.)){
            . <- add_column(.,DATE = as.POSIXct('0001001',format='%Y%j',tz='UTC'))
          }
          .
        } %>%
        filter(TRNO %in% sim_template$TRNO &
               DATE %in% sim_template$DATE)
    }) %>%
    reduce(full_join) %>%
    full_join(run_expmt) %>%
    select(-RUN, -RUNNO) %>%
    pivot_longer(names_to = "variable", values_to = "sim", cols = c(-EXPERIMENT,-TRNO, -DATE)) %>%
    left_join(sim_template,.) %>%
    mutate(sim = ifelse(str_detect(variable,'DAT$'),
                        as.numeric(difftime(as.POSIXct(sim,tz='UTC',origin='1970-01-01'),
                                            PDATE,
                                            units="days")),
                        sim)) %>%
    select(-PDATE)

  return(out)
}

#' @export
#'
#' @importFrom dplyr "%>%" is_grouped_df group_by select group_map
#' @importFrom tidyr crossing unnest
#'
get_model_outputs <- function(expmt_tbl){

  if(!is_grouped_df(expmt_tbl)) expmt_tbl <- expmt_tbl %>% group_by(filex_name)

  outputs <- expmt_tbl %>%
    select(filex_name,sim_template,trno,out_tbl) %>%
    group_map(~{crossing(.y,.x) %>%
                  select(filex_name,trno) %>%
                  unnest(cols=trno) %>%
                  {write_dssbatch(x = .$filex_name, trtno = .$trno)}
                run_dssat(suppress_output = TRUE)
                read_sim_data(.x$sim_template,.x$out_tbl)
                }) %>%
    bind_rows()

  return(outputs)
}

#' @export
#'
check_sim_data <- function(obs_sim){

  if(any(is.na(obs_sim$sim))){
    warn_out <- obs_sim %>%
      filter(is.na(sim)) %>%
      {capture.output(print(.))} %>%
      c("Missing values present in simulated output.",
        "The following were excluded from objective function evaluation:",
        .) %>%
      str_c('\n')
    warning(warn_out)
  }

  return(obs_sim)
}

#' @export
#'
SSE_fun <- function(obs_tbl,sim_tbl){

  SSE <- obs_tbl %>%
    full_join(sim_tbl) %>%
    check_sim_data() %>%
    mutate(sq_err=(obs-sim)^2) %>%
    filter(!is.na(sq_err)) %>%
    summarize(sum_sq_err=sum(sq_err)) %>%
    {.$sum_sq_err}

  return(SSE)
}

#' @export
#'
construct_prmest <- function(expmt_tbl,input_tbl,prm_tbl,stat_fun){

  prmest <- list(expmt_tbl = expmt_tbl,
                 input_tbl = input_tbl,
                 prm_tbl = prm_tbl,
                 stat_fun = stat_fun)

  return(prmest)
}
#
# import_parameter_estimation <- function(expmt_file_name,prm_file_name){
#
# }

#' @export
#'
est_obj_fun <- function(pvals,prmest){

  write_inputs(prmest$input_tbl,prmest$prm_tbl,pvals)

  sim_tbl <- get_model_outputs(prmest$expmt_tbl) %>%
    bind_rows()

  stat <- prmest$stat_fun(obs_tbl,sim_tbl)

  return(stat)

}

#' @export
#'
run_optim_estimation <- function(prmest,method='L-BFGS-B',control=list()){

  par_init <- runif(nrow(prmest$prm_tbl),min=prmest$prm_tbl$pmin,max=prmest$prm_tbl$pmax)

  names(par_init) <- prmest$prm_tbl$pname

  est_out <- optim(par=par_init,
                   fn = est_obj_fun,
                   prmest = prmest,
                   method = method,
                   lower = prmest$prm_tbl$pmin,
                   upper = prmest$prm_tbl$pmax,
                   control = control)

  return(est_out)

}

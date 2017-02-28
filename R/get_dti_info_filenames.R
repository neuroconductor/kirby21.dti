#' @rdname dti_info
#' @title Get DTI Information Filenames
#'
#' @description Return the filenames for the files for DTI analysis,
#' such as gradient files or b-values
#' @param ids ID to return
#' @param visits Vector of scan indices to return (1 or 2 or both)
#' @param type type of file to obtain (gradient or b-values)
#' @return Data.frame of filenames
#' 
#' @examples
#' get_dti_info_filenames()
#' @importFrom kirby21.base get_ids
#' @importFrom tools file_ext
#' @export
get_dti_info_filenames = function(
  ids = kirby21.base::get_ids(), 
  visits = c(1,2),
  type = c("grad", "b")
){
  
  # type = match.arg(type)
  ##########################################
  # Make the data.frames
  ##########################################
  modalities = "DTI"
  visits = as.numeric(visits)
  visits = sprintf("%02.0f", visits)
  v_ids = c(outer(ids, visits, paste, sep = "-"))
  fnames = c(outer(v_ids, modalities, paste, sep = "-"))
  fnames = paste0(fnames, ".")
  fnames = c(outer(fnames, type, paste, sep = ""))
  
  df = data.frame(fname = fnames, stringsAsFactors = FALSE)
  ss = strsplit(df$fname, "-")
  df$id = sapply(ss, `[`, 1)
  df$visit = as.numeric(sapply(ss, `[`, 2))
  nii.stub = function(x){
    nx = names(x)
    x = path.expand(x)
    stub = gsub("\\.grad$", "", x)
    stub = gsub("\\.b$", "", stub)    
    names(stub) = nx
    return(stub)    
  }
  df$modality = nii.stub(sapply(ss, `[`, 3))
  df$type = tools::file_ext(df$fname)
  df$fname = file.path(paste0("visit_", df$visit), df$id, df$fname)
  df$id = NULL
  ##########################################
  # Set the package names
  ##########################################
  df$package = "kirby21.dti"
  
  df$fname = system.file( df$fname, package = "kirby21.dti")
  df = df[ !(df$fname %in% ""), , drop = FALSE]

  # filenames = system.file( df$fname, package = "kirby21")
  return(df)
}

#' @rdname dti_info
#' @param ... arguments passed to \code{\link{get_dti_info_filenames}}
#' @export
get_grad_filenames = function(
  ...){
  df = get_dti_info_filenames(..., type = "grad")
  return(df$fname)
}

#' @rdname dti_info
#' @export
get_b_filenames = function(
  ...){
  df = get_dti_info_filenames(..., type = "b")
  return(df$fname)
}

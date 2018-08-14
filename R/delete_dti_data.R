#' @title Delete DTI Image Filenames
#'
#' @description Delete the files for the DTI images
#' @param ... arguments to pass to \code{\link{delete_kirby21_data}},
#' \code{modalities = "DTI"} so it cannot be specified
#' @return Nothing is returned
#' 
#' @export
#' @importFrom kirby21.base delete_kirby21_data all_modalities
delete_dti_data =  function(...) {  
  x = kirby21.base::delete_kirby21_data(modality = "DTI", ...)
  return(x)
}


#' @title Download DTI Image Filenames
#'
#' @description Download the files for the DTI images
#' @param ... arguments to pass to \code{\link{download_kirby21_data}},
#' \code{modalities = "DTI"} so it cannot be specified
#' @return Indicator if the data is downloaded.
#' 
#' @export
#' @importFrom kirby21.base download_kirby21_data all_modalities
download_dti_data =  function(...) {  
  x = kirby21.base::download_kirby21_data(modality = "DTI", ...)
  return(x)
}


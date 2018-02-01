#' @title Get DTI Image Filenames
#'
#' @description Return the filenames for the DTI images
#' @param ... arguments to pass to \code{\link{get_image_filenames}},
#' \code{modalities = "DTI"} so it cannot be specified
#' @return Vector of filenames
#' 
#' @examples
#' get_dti_filenames()
#' @export
#' @importFrom kirby21.base get_image_filenames
get_dti_filenames = function(...) {
  x = kirby21.base::get_image_filenames(modalities = "DTI", ...)
  return(x)
}

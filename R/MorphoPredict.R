#' MorphoPredict
#' 
#'  MorphoPredict is the primary command of this package. It utilizes a trained model to 
#'  predict whether an input image contains the following stages: 
#'  AST, QN, Rings, Trophs, and Schizs.
#'  
#' @param img.path Absoulte path to an input image file.
#' @param yolo.opts Additional YOLO CLI options (optional).
#' @param show.image Logical value indicating whether to display the predicted image. If set to FALSE,
#'   the image will not be displayed. Default is TRUE.
#'   
#' @details This function calls the YOLO CLI via a system command and requires that the YOLO CLI is
#' installed and accessible in the system path. It depends on a global variable \code{PATH2Model}, which is
#' initialised in the package's \code{.onLoad} function (located in the util file) to point to the model file.
#' The package also utilises the \code{magick} package for image reading and plotting.
#' 
#' @return A data frame containing detection results, with columns such as \code{class}, \code{x_center},
#'   \code{y_center}, \code{width}, \code{height}, and \code{confidence}.
#' 
#' @export
#' 
#' @examples
#' # Example with image display (default):
#' MorphoPredict(img.path = "inst/pics/malaria_sample.png")
#' 
#' # Example without image display:
#' MorphoPredict(img.path = "inst/pics/malaria_sample.png", show.image = FALSE)
#' 
MorphoPredict <- function(img.path, yolo.opts=NULL, show.image=TRUE){
  message("==== MorphoTreat ==== \nby slphyx@outlook.com\n=====================\n")
  
  temp_output <- file.path(tempdir(), "yolo_output")
  result_folder <- file.path(temp_output, "result")
  label_folder <- file.path(result_folder, "labels")
  
  result_img <- file.path(result_folder, basename(img.path))
  label_file <- file.path(label_folder, paste0(tools::file_path_sans_ext(basename(img.path)), ".txt"))
  
  if (file.exists(label_file)) {
    unlink(label_file)
  }
  
  dir.create(result_folder, showWarnings = FALSE, recursive = TRUE)
  
  message("using model file: ", PATH2Model)
  model <- paste0("model=",PATH2Model)
  
  cmd <- paste(
    "yolo detect predict", 
    model, 
    paste0("source=", shQuote(img.path)), 
    paste0("project=", shQuote(temp_output)),
    paste0("name=result"),
    "exist_ok=True",
    "save=True",
    "save_txt=True",
    "save_conf=True"
  )
  
  message("running command: ",cmd)
  
  system(cmd)
  
  if (!file.exists(result_img)) {
    stop("Error: YOLO did not generate output image.")
  }
  
  if (show.image) {
    ShowPredict(img.name = basename(img.path), output.path = result_folder)
  }
  
  df <- read_yolo_labels(label_file)
  return(df)
  
}

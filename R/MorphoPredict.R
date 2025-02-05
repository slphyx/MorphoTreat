#' MorphoPredict
#' 
#'  MorphoPredict is the primary command of this package. It utilizes a trained model to 
#'  predict whether an input image contains the following stages: 
#'  AST, QN, Rings, Trophs, and Schizs.
#'  
#' @param img.path Absoulte path to an input image file.
#' @param yolo.opts Additional YOLO CLI options (optional).
#' 
#' @export
#' 
#' @examples
#' MorphoPredict(img.path = "d:/data/images/my_slides.jpg)
#' 
MorphoPredict <- function(img.path, yolo.opts=NULL){
  message("==== MorphoTreat ==== \nby slphyx@outlook.com\n=====================\n")
  
  temp_output <- file.path(tempdir(), "yolo_output")
  result_folder <- file.path(temp_output, "result")
  
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
    "save=True"
  )
  
  message("running command: ",cmd)
  
  system(cmd)
  
  result_img <- file.path(result_folder, basename(img.path))
  
  if (!file.exists(result_img)) {
    stop("Error: YOLO did not generate output image.")
  }
  
  ShowPredict(img.name = basename(img.path), output.path = result_folder)
  
}



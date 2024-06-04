#' MorphoPredict
#' 
#'  MorphoPredict is the primary command of this package. It utilizes a trained model to 
#'  predict whether an input image contains the following stages: 
#'  AST, QN, Rings, Trophs, and Schizs.
#'  
#' @param img.path Absoulte path to an input image file.
#' @param yolo.opts Additional options for YOLO command.
#' 
#' @export
#' 
#' @examples
#' MorphoPredict(img.path = "d:/data/images/my_slides.jpg)
#' 
MorphoPredict <- function(img.path, yolo.opts=NULL){
  message("==== MorphoTreat ==== \nby slphyx@outlook.com\n=====================\n")
  
  message("using model file: ", PATH2Model)
  model <- paste0("model=",PATH2Model)
  
  cmd <- paste("yolo predict",model,"source=", img.path, yolo.opts)
  message("running command: ",cmd)
  
  system(cmd)
  
}



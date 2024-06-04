#' ShowPredict
#' 
#' ShowPredict shows the image of the predict result.
#' 
#' @param img.name the input image file name
#' @param output.path the YOLO output path
#' 
#' @export
#' 
#' @examples
#' ShowPredict(img.name = "myrbcslide.jpg, output.path = "runs/detect/predict2")
#' 
ShowPredict <- function(img.name, output.path){
  fn <- basename(img.name)
  path2img <- file.path(output.path,img.name)
  img <- image_read(path2img)
  plot(img)
}
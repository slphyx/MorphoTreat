#' @noRd
ShowPredict <- function(img.name, output.path){
  fn <- basename(img.name)
  path2img <- file.path(output.path,img.name)
  img <- image_read(path2img)
  plot(img)
}
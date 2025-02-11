#' Read YOLO Prediction Labels
#'
#' Reads YOLO output `.txt` file and converts it into a data frame.
#'
#' @param label_path Path to the label file (txt)
#' @return A data frame containing detected objects (class, x_center, y_center, width, height, confidence)
#' @noRd
read_yolo_labels <- function(label_path) {
  if (!file.exists(label_path)) {
    warning("Label file not found: ", label_path)
    return(data.frame())
  }
  
  # Read YOLO label file (space-separated values)
  df <- read.table(label_path, col.names = c("class", "x_center", "y_center", "width", "height", "confidence"))
  
  return(df)
}
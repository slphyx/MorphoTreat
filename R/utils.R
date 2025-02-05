.onLoad <- function(libname, pkgname) {
  PATH2Model <<- system.file("YOLO", "yl11n-14-Jan25.pt", package = pkgname)
}

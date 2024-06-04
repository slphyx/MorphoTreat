
PATH2Model <- paste0(system.file(package='MorphoTreat'),"/YOLO/rbc04062567.pt")



MorphoPredict <- function(file.path){
  model <- paste0("model=",PATH2Model)
  cmd <- paste0("yolo predict ",model," source=",file.path)
  system(cmd)
}
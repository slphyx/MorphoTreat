% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MorphoPredict.R
\name{MorphoPredict}
\alias{MorphoPredict}
\title{MorphoPredict}
\usage{
MorphoPredict(img.path, yolo.opts = NULL)
}
\arguments{
\item{img.path}{Absoulte path to an input image file.}

\item{yolo.opts}{Additional options for YOLO command.}
}
\description{
MorphoPredict is the primary command of this package. It utilizes a trained model to 
 predict whether an input image contains the following stages: 
 AST, QN, Rings, Trophs, and Schizs.
}

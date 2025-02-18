% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save.R
\name{save}
\alias{save}
\title{Save elements from forester}
\usage{
save(
  train,
  list = "all",
  name = NULL,
  path = NULL,
  verbose = TRUE,
  return_name = FALSE
)
}
\arguments{
\item{train}{The return from `train` function.}

\item{list}{The list of names of elements from train. By default `all` save every element.}

\item{name}{A name of the file. By default `forester_{timestamp}`.}

\item{path}{A path to save the file. By default current working directory.}

\item{verbose}{A logical value, if set to TRUE, provides all information about
training process, if FALSE gives none.}

\item{return_name}{A logical value, if set to TRUE, function returns \
full path and name of the saved file.}
}
\description{
Save elements from forester
}
\examples{
train <- train(iris[1:100, ], 'Sepal.Width')
save(train)
}

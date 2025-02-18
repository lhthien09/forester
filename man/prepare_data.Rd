% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/prepare_data.R
\name{prepare_data}
\alias{prepare_data}
\title{Prepare data into format correct for the selected model engine}
\usage{
prepare_data(
  data,
  y,
  engine = c("ranger", "xgboost", "decision_tree", "lightgbm", "catboost"),
  predict = FALSE,
  train = NULL
)
}
\arguments{
\item{data}{A data source, that is one of the major R formats: data.table, data.frame,
matrix and so on.}

\item{y}{A string that indicates a target column name.}

\item{engine}{A vector of tree-based models that shall be created. Possible
values are: `ranger`, `xgboost`, `lightgbm`, `catboost`, `decision_tree`.
Determines which models will be later learnt.}

\item{predict}{A logical value, determines whether the data set will be used
for prediction or training. It is necessary, because lightgbm model can't predict
on training dataset.}

\item{train}{A train data, if predict is TRUE you have to provide training
dataset from split data here.}
}
\value{
A dataset in format proper for the selected engines.
}
\description{
Prepare data into format correct for the selected model engine
}
\examples{
data(iris)
type              <- guess_type(lisbon, 'Price')
preprocessed_data <- preprocessing(lisbon, 'Price', type)
preprocessed_data <- preprocessed_data$data
split_data <-
  train_test_balance(preprocessed_data,
                     'Price',
                     balance = FALSE)
set.seed(123)
train_data <-
  prepare_data(split_data$train,
               'Price',
               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
set.seed(123)
test_data <-
  prepare_data(split_data$test,
               'Price',
               engine = c('ranger', 'xgboost', 'decision_tree','lightgbm', 'catboost'),
               predict = TRUE,
               train = split_data$train)
}

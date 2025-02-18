% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predict_models.R
\name{predict_models}
\alias{predict_models}
\title{Predict models depending on the engine}
\usage{
predict_models(models, data, y, engine, type, probability = FALSE)
}
\arguments{
\item{models}{A list of models trained by `train_models()` function.}

\item{data}{A test data for models created by `prepare_data()` function.}

\item{y}{A string that indicates a target column name.}

\item{engine}{A vector of tree-based models that shall be created. Possible
values are: `ranger`, `xgboost`, `decision tree`, `lightgbm`, `catboost`.}

\item{type}{A string that determines if Machine Learning task is the
`binary_clf` or `regression` task.}

\item{probability}{A logical value that determines whether the output for
classification task should be 0/1 or described by probability.}
}
\value{
A list of predictions for every engine.
}
\description{
As all Machine Learning models have different predicting pipelines, we have to
provide a helpful tool for normalization of making predictions.
}
\examples{
data(iris)
iris_bin          <- iris[1:100, ]
type              <- guess_type(iris_bin, 'Species')
preprocessed_data <- preprocessing(iris_bin, 'Species', type)
preprocessed_data <- preprocessed_data$data
split_data <-
  train_test_balance(preprocessed_data,
                     'Species',
                     balance = FALSE)
train_data <-
  prepare_data(split_data$train,
               'Species',
               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
test_data <-
  prepare_data(split_data$test,
               'Species',
               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
               predict = TRUE,
               train = split_data$train)

model <-
  train_models(train_data,
               'Species',
               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
               type = type)
predictions <-
  predict_models(model,
                 test_data,
                 'Species',
                 engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
                 type = type)

}

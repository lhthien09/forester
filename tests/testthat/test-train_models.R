test_that('test-train_models', {
  # Iris dataset for classification.
  iris_bin          <- iris[1:100, ]
  type              <- guess_type(iris_bin, 'Species')
  preprocessed_data <- preprocessing(iris_bin, 'Species', type = type)
  preprocessed_data <- preprocessed_data$data
  split_data <-
    train_test_balance(preprocessed_data,
                       y = 'Species',
                       balance = FALSE)
  train_data <-
    prepare_data(split_data$train,
                 y = 'Species',
                 engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
  suppressWarnings(
    model <-
      train_models(train_data,
                   y = 'Species',
                   engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
                   type)
  )


  expect_true(length(model) == 5)
  expect_true(class(model$ranger_model) == 'ranger')
  expect_true(class(model$xgboost) == 'xgb.Booster')
  expect_true(identical(class(model$decision_tree), c('constparty', 'party')))
  expect_true(class(model$lightgbm_model)[1] == 'lgb.Booster')
  expect_true(class(model$catboost_model) == 'catboost.Model')

  # Compas dataset for classification.
  type              <- guess_type(compas, 'Two_yr_Recidivism')
  preprocessed_data <- preprocessing(compas, 'Two_yr_Recidivism', type = type)
  preprocessed_data <- preprocessed_data$data
  split_data <-
    train_test_balance(preprocessed_data,
                       y = 'Two_yr_Recidivism',
                       balance = FALSE)
  suppressWarnings(
    train_data <-
      prepare_data(split_data$train,
                   y = 'Two_yr_Recidivism',
                   engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
  )
  suppressWarnings(
    model <-
      train_models(train_data,
                   y = 'Two_yr_Recidivism',
                   engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
                   type)
  )

  expect_true(length(model) == 5)
  expect_true(class(model$ranger_model) == 'ranger')
  expect_true(class(model$xgboost) == 'xgb.Booster')
  expect_true(identical(class(model$decision_tree), c('constparty', 'party')))
  expect_true(class(model$lightgbm_model)[1] == 'lgb.Booster')
  expect_true(class(model$catboost_model) == 'catboost.Model')


  # Lisbon dataset for regression.
  type                <- guess_type(lisbon, 'Price')
  suppressWarnings(
    preprocessed_data <- preprocessing(lisbon, 'Price', type = type)
  )
  preprocessed_data   <- preprocessed_data$data
  split_data <-
    train_test_balance(preprocessed_data,
                       y = 'Price',
                       balance = FALSE)
  suppressWarnings(
    train_data <- prepare_data(split_data$train,
                               y = 'Price',
                               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
  )
  suppressWarnings(
    model <- train_models(train_data,
                          y = 'Price',
                          engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
                          type)
  )


  expect_true(length(model) == 5)
  expect_true(class(model$ranger_model) == 'ranger')
  expect_true(class(model$xgboost) == 'xgb.Booster')
  expect_true(identical(class(model$decision_tree), c('constparty', 'party')))
  expect_true(class(model$lightgbm_model)[1] == 'lgb.Booster')
  expect_true(class(model$catboost_model) == 'catboost.Model')


  # Test for regression.
  type              <- guess_type(testing_data, 'y')
  preprocessed_data <- preprocessing(testing_data, 'y', type = type)
  preprocessed_data <- preprocessed_data$data
  split_data <-
    train_test_balance(preprocessed_data,
                       y = 'y',
                       balance = FALSE)
  suppressWarnings(
    train_data <- prepare_data(split_data$train,
                               y = 'y',
                               engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'))
  )
  suppressWarnings(
    model <- train_models(train_data,
                          y = 'y',
                          engine = c('ranger', 'xgboost', 'decision_tree', 'lightgbm', 'catboost'),
                          type)
  )

  expect_true(length(model) == 5)
  expect_true(class(model$ranger_model) == 'ranger')
  expect_true(class(model$xgboost) == 'xgb.Booster')
  expect_true(identical(class(model$decision_tree), c('constparty', 'party')))
  expect_true(class(model$lightgbm_model)[1] == 'lgb.Booster')
  expect_true(class(model$catboost_model) == 'catboost.Model')
})

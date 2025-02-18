test_that('test-check_data', {
  df_iris   <- iris[1:100, ]
  df_lisbon <- lisbon
  df_compas <- compas
  df_iris2  <- iris
  df_adult  <- adult[1:1000, ]
  df_test   <- testing_data

  y_iris   <- 'Species'
  y_lisbon <- 'Price'
  y_compas <- 'Two_yr_Recidivism'
  y_iris2  <- 'Species'
  y_adult  <- 'salary'
  y_test   <- 'y'

  expect_output(check_data(df_iris, y_iris))
  suppressWarnings(expect_output(check_data(df_lisbon, y_lisbon)))
  expect_output(check_data(df_compas, y_compas))
  expect_output(check_data(df_iris2, y_iris2))
  expect_output(check_data(df_adult, y_adult))
  expect_output(check_data(df_test, y_test))

  expect_equal(length(basic_info(df_iris, y_iris, verbose = FALSE)), 6)
  expect_equal(length(basic_info(df_lisbon, y_lisbon, verbose = FALSE)), 6)
  expect_equal(length(basic_info(df_compas, y_compas, verbose = FALSE)), 6)
  expect_equal(length(basic_info(df_iris2, y_iris2, verbose = FALSE)), 6)
  expect_equal(length(basic_info(df_adult, y_adult, verbose = FALSE)), 6)
  expect_equal(length(basic_info(df_test, y_test, verbose = FALSE)), 6)

  no_static     <- '<U\\+2714> No static columns.'
  static_lisbon <- '<U\\+2716> Static columns are: Country; District; Municipality; \nWith dominating values: Portugal; Lisboa; Lisboa;'

  expect_output(check_static(df_iris), no_static)
  expect_equal(length(check_static(df_lisbon, verbose = FALSE)), 5)
  expect_output(check_static(df_compas), no_static)
  expect_output(check_static(df_iris2), no_static)
  expect_output(check_static(df_adult), no_static)
  expect_output(check_static(df_test), no_static)

  no_duplicate     <- '<U\\+2714> No duplicate columns.'
  duplicate_lisbon <- '<U\\+2716> These column pairs are duplicate:\n District - Municipality; \n'

  expect_output(check_duplicate_col(df_iris), no_duplicate)
  expect_output(check_duplicate_col(df_lisbon), duplicate_lisbon)
  expect_output(check_duplicate_col(df_compas), no_duplicate)
  expect_output(check_duplicate_col(df_iris2), no_duplicate)
  expect_output(check_duplicate_col(df_adult), no_duplicate)
  expect_output(check_duplicate_col(df_test), no_duplicate)

  no_missing   <- '<U\\+2714> No target values are missing. \n\n<U\\+2714> No predictor values are missing. \n'
  missing_test <- '<U\\+2714> No target values are missing. \n\n<U\\+2716> 943 observations have missing fields.\n'

  expect_output(check_missing(df_iris, y_iris), no_missing)
  expect_output(check_missing(df_lisbon, y_lisbon), no_missing)
  expect_output(check_missing(df_compas, y_compas), no_missing)
  expect_output(check_missing(df_iris2, y_iris2), no_missing)
  expect_output(check_missing(df_adult, y_adult), no_missing)
  expect_output(check_missing(df_test, y_test), missing_test)

  df_test       <- manage_missing(df_test, y_test)

  no_dim_issues <- '<U\\+2714> No issues with dimensionality.'

  expect_output(check_dim(df_iris), no_dim_issues)
  expect_output(check_dim(df_lisbon), no_dim_issues)
  expect_output(check_dim(df_compas), no_dim_issues)
  expect_output(check_dim(df_iris2), no_dim_issues)
  expect_output(check_dim(df_adult), no_dim_issues)
  expect_output(check_dim(df_test), no_dim_issues)

  no_cor     <- '<U\\+2714> No strongly correlated, by Spearman rank, pairs of numerical values. \n\n<U\\+2714> No strongly correlated, by Crammer\'s V rank, pairs of categorical values. \n'
  cor_iris   <- '<U\\+2716> Strongly correlated, by Spearman rank, pairs of numerical values are: \n \n Sepal.Length - Petal.Length: 0.81;\n Sepal.Length - Petal.Width: 0.79;\n Petal.Length - Petal.Width: 0.98;\n'
  cor_lisbon <- '<U\\+2716> Strongly correlated, by Spearman rank, pairs of numerical values are: \n \n Bedrooms - AreaNet: 0.77;\n Bedrooms - AreaGross: 0.77;\n Bathrooms - AreaNet: 0.78;\n Bathrooms - AreaGross: 0.78;\n AreaNet - AreaGross: 1;\n\n<U\\+2716> Strongly correlated, by Crammer\'s V rank, pairs of categorical values are: \n PropertyType - PropertySubType: 1;\n'
  cor_iris2  <- '<U\\+2716> Strongly correlated, by Spearman rank, pairs of numerical values are: \n \n Sepal.Length - Petal.Length: 0.87;\n Sepal.Length - Petal.Width: 0.82;\n Petal.Length - Petal.Width: 0.96;\n'
  cor_test   <- '<U\\+2714> No strongly correlated, by Spearman rank, pairs of numerical values.'

  expect_output(check_cor(df_iris, y_iris), cor_iris)
  expect_output(check_cor(df_lisbon, y_lisbon), cor_lisbon)
  expect_output(check_cor(df_compas, y_compas), no_cor)
  expect_output(check_cor(df_iris2, y_iris2), cor_iris2)
  expect_output(check_cor(df_test, y_test), cor_test)

  no_outliers  <- '<U\\+2714> No outliers in the dataset.'
  out_lisbon   <- '<U\\+2716> These observations migth be outliers due to their numerical columns values: \n 145 146 196 44 5 51 57 58 59 60 61 62 63 64 69 75 76 77 78 ;'
  out_over_50  <- '<U\\+2716> There are more than 50 possible outliers in the data set, so we are not printing them. They are returned in the output as a vector.'
  out_iris2    <- '<U\\+2716> These observations migth be outliers due to their numerical columns values: \n 16 ;'
  out_test     <- '<U\\+2716> These observations migth be outliers due to their numerical columns values: \n 160 209 365 369 395 434 481 491 559 6 791 795 796 804 82 ;'

  expect_output(check_outliers(df_iris), no_outliers)
  expect_output(check_outliers(df_lisbon), out_lisbon)
  expect_output(check_outliers(df_compas), out_over_50)
  expect_output(check_outliers(df_iris2), out_iris2)
  expect_output(check_outliers(df_adult), out_over_50)
  expect_output(check_outliers(df_test), out_test)

  balanced       <- '<U\\+2714> Dataset is balanced.'
  balance_lisbon <- '<U\\+2716> Target data is not evenly distributed with quantile bins: 0.25 0.35 0.14 0.26'
  multi_balance  <- '<U\\+2716> Multilabel classification is not supported yet.'
  balance_adult  <- '<U\\+2716> Dataset is unbalanced with: 3.310345 proportion with <=50K being a dominating class.\n'
  balance_test   <- '<U\\+2714> Target data is evenly distributed.'

  expect_output(check_y_balance(df_iris, y_iris), balanced)
  expect_output(check_y_balance(df_lisbon, y_lisbon), balance_lisbon)
  expect_output(check_y_balance(df_compas, y_compas), balanced)
  expect_output(check_y_balance(df_iris2, y_iris2), multi_balance)
  expect_output(check_y_balance(df_adult, y_adult), balance_adult)
  expect_output(check_y_balance(df_test, y_test), balance_test)

  no_id     <- '<U\\+2714> Columns names suggest that none of them are IDs. \n\n<U\\+2714> Columns data suggest that none of them are IDs. \n'
  id_lisbon <- '<U\\+2716> Columns names suggest that some of them are IDs, removing them can improve the model.\n Suspicious columns are: Id .\n\n<U\\+2716> Columns data suggest that some of them are IDs, removing them can improve the model.\n Suspicious columns are: Id .\n'

  expect_output(detect_id_columns(df_iris), no_id)
  suppressWarnings(expect_output(detect_id_columns(df_lisbon), id_lisbon))
  expect_output(detect_id_columns(df_compas), no_id)
  expect_output(detect_id_columns(df_iris2), no_id)
  expect_output(detect_id_columns(df_adult), no_id)
  suppressWarnings(expect_output(detect_id_columns(df_test), no_id))
})

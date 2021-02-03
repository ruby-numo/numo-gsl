[{:func_name=>"gsl_fit_linear",
  :func_type=>"int",
  :args=>
   [["const double *", "x"],
    ["const size_t", "xstride"],
    ["const double *", "y"],
    ["const size_t", "ystride"],
    ["size_t", "n"],
    ["double *", "c0"],
    ["double *", "c1"],
    ["double *", "cov00"],
    ["double *", "cov01"],
    ["double *", "cov11"],
    ["double *", "sumsq"]],
  :desc=>
   "This function computes the best-fit linear regression coefficients\n" +
   "(c0,c1) of the model Y = c_0 + c_1 X for the dataset\n" +
   "(x, y), two vectors of length n with strides\n" +
   "xstride and ystride.  The errors on y are assumed unknown so \n" +
   "the variance-covariance matrix for the\n" +
   "parameters (c0, c1) is estimated from the scatter of the\n" +
   "points around the best-fit line and returned via the parameters\n" +
   "(cov00, cov01, cov11).   \n" +
   "The sum of squares of the residuals from the best-fit line is returned\n" +
   "in sumsq.  Note: the correlation coefficient of the data can be computed using gsl_stats_correlation (Correlation), it does not depend on the fit."},
 {:func_name=>"gsl_fit_linear_est",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "c0"],
    ["double", "c1"],
    ["double", "cov00"],
    ["double", "cov01"],
    ["double", "cov11"],
    ["double *", "y"],
    ["double *", "y_err"]],
  :desc=>
   "This function uses the best-fit linear regression coefficients\n" +
   "c0, c1 and their covariance\n" +
   "cov00, cov01, cov11 to compute the fitted function\n" +
   "y and its standard deviation y_err for the model Y =\n" +
   "c_0 + c_1 X at the point x."},
 {:func_name=>"gsl_fit_mul",
  :func_type=>"int",
  :args=>
   [["const double *", "x"],
    ["const size_t", "xstride"],
    ["const double *", "y"],
    ["const size_t", "ystride"],
    ["size_t", "n"],
    ["double *", "c1"],
    ["double *", "cov11"],
    ["double *", "sumsq"]],
  :desc=>
   "This function computes the best-fit linear regression coefficient\n" +
   "c1 of the model Y = c_1 X for the datasets (x,\n" +
   "y), two vectors of length n with strides xstride and\n" +
   "ystride.  The errors on y are assumed unknown so the \n" +
   "variance of the parameter c1 is estimated from\n" +
   "the scatter of the points around the best-fit line and returned via the\n" +
   "parameter cov11.  The sum of squares of the residuals from the\n" +
   "best-fit line is returned in sumsq."},
 {:func_name=>"gsl_fit_mul_est",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "c1"],
    ["double", "cov11"],
    ["double *", "y"],
    ["double *", "y_err"]],
  :desc=>
   "This function uses the best-fit linear regression coefficient c1\n" +
   "and its covariance cov11 to compute the fitted function\n" +
   "y and its standard deviation y_err for the model Y =\n" +
   "c_1 X at the point x."},
 {:func_name=>"gsl_fit_wlinear",
  :func_type=>"int",
  :args=>
   [["const double *", "x"],
    ["const size_t", "xstride"],
    ["const double *", "w"],
    ["const size_t", "wstride"],
    ["const double *", "y"],
    ["const size_t", "ystride"],
    ["size_t", "n"],
    ["double *", "c0"],
    ["double *", "c1"],
    ["double *", "cov00"],
    ["double *", "cov01"],
    ["double *", "cov11"],
    ["double *", "chisq"]],
  :desc=>
   "This function computes the best-fit linear regression coefficients\n" +
   "(c0,c1) of the model Y = c_0 + c_1 X for the weighted\n" +
   "dataset (x, y), two vectors of length n with strides\n" +
   "xstride and ystride.  The vector w, of length n\n" +
   "and stride wstride, specifies the weight of each datapoint. The\n" +
   "weight is the reciprocal of the variance for each datapoint in y.\n" +
   "\n" +
   "The covariance matrix for the parameters (c0, c1) is\n" +
   "computed using the weights and returned via the parameters\n" +
   "(cov00, cov01, cov11).  The weighted sum of squares\n" +
   "of the residuals from the best-fit line, \\chi^2, is returned in\n" +
   "chisq."},
 {:func_name=>"gsl_fit_wmul",
  :func_type=>"int",
  :args=>
   [["const double *", "x"],
    ["const size_t", "xstride"],
    ["const double *", "w"],
    ["const size_t", "wstride"],
    ["const double *", "y"],
    ["const size_t", "ystride"],
    ["size_t", "n"],
    ["double *", "c1"],
    ["double *", "cov11"],
    ["double *", "sumsq"]],
  :desc=>
   "This function computes the best-fit linear regression coefficient\n" +
   "c1 of the model Y = c_1 X for the weighted datasets\n" +
   "(x, y), two vectors of length n with strides\n" +
   "xstride and ystride.  The vector w, of length n\n" +
   "and stride wstride, specifies the weight of each datapoint. The\n" +
   "weight is the reciprocal of the variance for each datapoint in y.\n" +
   "\n" +
   "The variance of the parameter c1 is computed using the weights\n" +
   "and returned via the parameter cov11.  The weighted sum of\n" +
   "squares of the residuals from the best-fit line, \\chi^2, is\n" +
   "returned in chisq."}]

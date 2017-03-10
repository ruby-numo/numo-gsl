[{:func_name=>"gsl_rstat_alloc",
  :func_type=>"gsl_rstat_workspace *",
  :args=>[["", "void"]],
  :desc=>
   "This function allocates a workspace for computing running statistics.\n" +
   "The size of the workspace is O(1)."},
 {:func_name=>"gsl_rstat_free",
  :func_type=>"void",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>"This function frees the memory associated with the workspace w."},
 {:func_name=>"gsl_rstat_reset",
  :func_type=>"int",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function resets the workspace w to its initial state,\n" +
   "so it can begin working on a new set of data."},
 {:func_name=>"gsl_rstat_add",
  :func_type=>"int",
  :args=>[["const double", "x"], ["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function adds the data point x to the statistical\n" +
   "accumulator, updating calculations of the mean, variance,\n" +
   "standard deviation, skewness, kurtosis, and median."},
 {:func_name=>"gsl_rstat_n",
  :func_type=>"size_t",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the number of data so far added to the accumulator."},
 {:func_name=>"gsl_rstat_min",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>"This function returns the minimum value added to the accumulator."},
 {:func_name=>"gsl_rstat_max",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>"This function returns the maximum value added to the accumulator."},
 {:func_name=>"gsl_rstat_mean",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the mean of all data added to the accumulator,\n" +
   "defined as\n" +
   "\n" +
   "\\Hat\\mu = (1/N) \\sum x_i\n"},
 {:func_name=>"gsl_rstat_variance",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the variance of all data added to the accumulator,\n" +
   "defined as\n" +
   "\n" +
   "\\Hat\\sigma^2 = (1/(N-1)) \\sum (x_i - \\Hat\\mu)^2\n"},
 {:func_name=>"gsl_rstat_sd",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the standard deviation of all data added to the\n" +
   "accumulator, defined as the square root of the variance given above."},
 {:func_name=>"gsl_rstat_skew",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the skewness of all data added to the accumulator,\n" +
   "defined as\n" +
   "\n" +
   "skew = (1/N) \\sum ((x_i - \\Hat\\mu)/\\Hat\\sigma)^3\n"},
 {:func_name=>"gsl_rstat_kurtosis",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns the kurtosis of all data added to the accumulator,\n" +
   "defined as\n" +
   "\n" +
   "kurtosis = ((1/N) \\sum ((x_i - \\Hat\\mu)/\\Hat\\sigma)^4)  - 3\n"},
 {:func_name=>"gsl_rstat_median",
  :func_type=>"double",
  :args=>[["gsl_rstat_workspace *", "w"]],
  :desc=>
   "This function returns an estimate of the median of the data added to\n" +
   "the accumulator."},
 {:func_name=>"gsl_rstat_quantile_alloc",
  :func_type=>"gsl_rstat_quantile_workspace *",
  :args=>[["const double", "p"]],
  :desc=>
   "This function allocates a workspace for the dynamic estimation of\n" +
   "p-quantiles, where p is between 0 and 1.\n" +
   "The median corresponds to p = 0.5. The size of the workspace\n" +
   "is O(1)."},
 {:func_name=>"gsl_rstat_quantile_free",
  :func_type=>"void",
  :args=>[["gsl_rstat_quantile_workspace *", "w"]],
  :desc=>"This function frees the memory associated with the workspace w."},
 {:func_name=>"gsl_rstat_quantile_add",
  :func_type=>"int",
  :args=>[["const double", "x"], ["gsl_rstat_quantile_workspace *", "w"]],
  :desc=>
   "This function updates the estimate of the p-quantile with\n" +
   "the new data point x."},
 {:func_name=>"gsl_rstat_quantile_get",
  :func_type=>"double",
  :args=>[["gsl_rstat_quantile_workspace *", "w"]],
  :desc=>"This function returns the current estimate of the p-quantile."}]

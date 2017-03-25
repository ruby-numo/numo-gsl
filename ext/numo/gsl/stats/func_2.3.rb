[{:func_name=>"gsl_stats_mean",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the arithmetic mean of data, a dataset of\n" +
   "length n with stride stride.  The arithmetic mean, or\n" +
   "sample mean, is denoted by \\Hat\\mu and defined as,\n" +
   "\n" +
   "\\Hat\\mu = (1/N) \\sum x_i\n" +
   "\n" +
   "where x_i are the elements of the dataset data.  For\n" +
   "samples drawn from a gaussian distribution the variance of\n" +
   "\\Hat\\mu is \\sigma^2 / N."},
 {:func_name=>"gsl_stats_variance",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the estimated, or sample, variance of\n" +
   "data, a dataset of length n with stride stride.  The\n" +
   "estimated variance is denoted by \\Hat\\sigma^2 and is defined by,\n" +
   "\n" +
   "\\Hat\\sigma^2 = (1/(N-1)) \\sum (x_i - \\Hat\\mu)^2\n" +
   "\n" +
   "where x_i are the elements of the dataset data.  Note that\n" +
   "the normalization factor of 1/(N-1) results from the derivation\n" +
   "of \\Hat\\sigma^2 as an unbiased estimator of the population\n" +
   "variance \\sigma^2.  For samples drawn from a Gaussian distribution\n" +
   "the variance of \\Hat\\sigma^2 itself is 2 \\sigma^4 / N.\n" +
   "\n" +
   "This function computes the mean via a call to gsl_stats_mean.  If\n" +
   "you have already computed the mean then you can pass it directly to\n" +
   "gsl_stats_variance_m."},
 {:func_name=>"gsl_stats_variance_m",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "This function returns the sample variance of data relative to the\n" +
   "given value of mean.  The function is computed with \\Hat\\mu\n" +
   "replaced by the value of mean that you supply,\n" +
   "\n" +
   "\\Hat\\sigma^2 = (1/(N-1)) \\sum (x_i - mean)^2"},
 {:func_name=>"gsl_stats_sd",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "The standard deviation is defined as the square root of the variance.\n" +
   "These functions return the square root of the corresponding variance\n" +
   "functions above."},
 {:func_name=>"gsl_stats_sd_m",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "The standard deviation is defined as the square root of the variance.\n" +
   "These functions return the square root of the corresponding variance\n" +
   "functions above."},
 {:func_name=>"gsl_stats_tss",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "These functions return the total sum of squares (TSS) of data about\n" +
   "the mean.  For gsl_stats_tss_m the user-supplied value of\n" +
   "mean is used, and for gsl_stats_tss it is computed using\n" +
   "gsl_stats_mean.\n" +
   "\n" +
   "TSS =  \\sum (x_i - mean)^2"},
 {:func_name=>"gsl_stats_tss_m",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "These functions return the total sum of squares (TSS) of data about\n" +
   "the mean.  For gsl_stats_tss_m the user-supplied value of\n" +
   "mean is used, and for gsl_stats_tss it is computed using\n" +
   "gsl_stats_mean.\n" +
   "\n" +
   "TSS =  \\sum (x_i - mean)^2"},
 {:func_name=>"gsl_stats_variance_with_fixed_mean",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "This function computes an unbiased estimate of the variance of\n" +
   "data when the population mean mean of the underlying\n" +
   "distribution is known a priori.  In this case the estimator for\n" +
   "the variance uses the factor 1/N and the sample mean\n" +
   "\\Hat\\mu is replaced by the known population mean \\mu,\n" +
   "\n" +
   "\\Hat\\sigma^2 = (1/N) \\sum (x_i - \\mu)^2"},
 {:func_name=>"gsl_stats_sd_with_fixed_mean",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "This function calculates the standard deviation of data for a\n" +
   "fixed population mean mean.  The result is the square root of the\n" +
   "corresponding variance function."},
 {:func_name=>"gsl_stats_absdev",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function computes the absolute deviation from the mean of\n" +
   "data, a dataset of length n with stride stride.  The\n" +
   "absolute deviation from the mean is defined as,\n" +
   "\n" +
   "absdev  = (1/N) \\sum |x_i - \\Hat\\mu|\n" +
   "\n" +
   "where x_i are the elements of the dataset data.  The\n" +
   "absolute deviation from the mean provides a more robust measure of the\n" +
   "width of a distribution than the variance.  This function computes the\n" +
   "mean of data via a call to gsl_stats_mean."},
 {:func_name=>"gsl_stats_absdev_m",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"]],
  :desc=>
   "This function computes the absolute deviation of the dataset data\n" +
   "relative to the given value of mean,\n" +
   "\n" +
   "absdev  = (1/N) \\sum |x_i - mean|\n" +
   "\n" +
   "This function is useful if you have already computed the mean of\n" +
   "data (and want to avoid recomputing it), or wish to calculate the\n" +
   "absolute deviation relative to another value (such as zero, or the\n" +
   "median)."},
 {:func_name=>"gsl_stats_skew",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function computes the skewness of data, a dataset of length\n" +
   "n with stride stride.  The skewness is defined as,\n" +
   "\n" +
   "skew = (1/N) \\sum ((x_i - \\Hat\\mu)/\\Hat\\sigma)^3\n" +
   "\n" +
   "where x_i are the elements of the dataset data.  The skewness\n" +
   "measures the asymmetry of the tails of a distribution.\n" +
   "\n" +
   "The function computes the mean and estimated standard deviation of\n" +
   "data via calls to gsl_stats_mean and gsl_stats_sd."},
 {:func_name=>"gsl_stats_skew_m_sd",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"],
    ["double", "sd"]],
  :desc=>
   "This function computes the skewness of the dataset data using the\n" +
   "given values of the mean mean and standard deviation sd,\n" +
   "\n" +
   "skew = (1/N) \\sum ((x_i - mean)/sd)^3\n" +
   "\n" +
   "These functions are useful if you have already computed the mean and\n" +
   "standard deviation of data and want to avoid recomputing them."},
 {:func_name=>"gsl_stats_kurtosis",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function computes the kurtosis of data, a dataset of length\n" +
   "n with stride stride.  The kurtosis is defined as,\n" +
   "\n" +
   "kurtosis = ((1/N) \\sum ((x_i - \\Hat\\mu)/\\Hat\\sigma)^4)  - 3\n" +
   "\n" +
   "The kurtosis measures how sharply peaked a distribution is, relative to\n" +
   "its width.  The kurtosis is normalized to zero for a Gaussian\n" +
   "distribution."},
 {:func_name=>"gsl_stats_kurtosis_m_sd",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "mean"],
    ["double", "sd"]],
  :desc=>
   "This function computes the kurtosis of the dataset data using the\n" +
   "given values of the mean mean and standard deviation sd,\n" +
   "\n" +
   "kurtosis = ((1/N) \\sum ((x_i - mean)/sd)^4) - 3\n" +
   "\n" +
   "This function is useful if you have already computed the mean and\n" +
   "standard deviation of data and want to avoid recomputing them."},
 {:func_name=>"gsl_stats_lag1_autocorrelation",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["const size_t", "stride"],
    ["const size_t", "n"]],
  :desc=>
   "This function computes the lag-1 autocorrelation of the dataset data.\n" +
   "\n" +
   "a_1 = @{\\sum_@{i = 2@}^@{n@} (x_@{i@} - \\Hat\\mu) (x_@{i-1@} - \\Hat\\mu)\n" +
   "       \\over\n" +
   "       \\sum_@{i = 1@}^@{n@} (x_@{i@} - \\Hat\\mu) (x_@{i@} - \\Hat\\mu)@}"},
 {:func_name=>"gsl_stats_lag1_autocorrelation_m",
  :func_type=>"double",
  :args=>
   [["const double", "data[]"],
    ["const size_t", "stride"],
    ["const size_t", "n"],
    ["const double", "mean"]],
  :desc=>
   "This function computes the lag-1 autocorrelation of the dataset\n" +
   "data using the given value of the mean mean.\n"},
 {:func_name=>"gsl_stats_covariance",
  :func_type=>"double",
  :args=>
   [["const double", "data1[]"],
    ["const size_t", "stride1"],
    ["const double", "data2[]"],
    ["const size_t", "stride2"],
    ["const size_t", "n"]],
  :desc=>
   "This function computes the covariance of the datasets data1 and\n" +
   "data2 which must both be of the same length n.\n" +
   "\n" +
   "covar = (1/(n - 1)) \\sum_@{i = 1@}^@{n@} (x_i - \\Hat x) (y_i - \\Hat y)"},
 {:func_name=>"gsl_stats_covariance_m",
  :func_type=>"double",
  :args=>
   [["const double", "data1[]"],
    ["const size_t", "stride1"],
    ["const double", "data2[]"],
    ["const size_t", "stride2"],
    ["const size_t", "n"],
    ["const double", "mean1"],
    ["const double", "mean2"]],
  :desc=>
   "This function computes the covariance of the datasets data1 and\n" +
   "data2 using the given values of the means, mean1 and\n" +
   "mean2.  This is useful if you have already computed the means of\n" +
   "data1 and data2 and want to avoid recomputing them."},
 {:func_name=>"gsl_stats_correlation",
  :func_type=>"double",
  :args=>
   [["const double", "data1[]"],
    ["const size_t", "stride1"],
    ["const double", "data2[]"],
    ["const size_t", "stride2"],
    ["const size_t", "n"]],
  :desc=>
   "This function efficiently computes the Pearson correlation coefficient\n" +
   "between the datasets data1 and data2 which must both be of\n" +
   "the same length n.\n" +
   "r = cov(x, y) / (\\Hat\\sigma_x \\Hat\\sigma_y)\n" +
   "  = @{1/(n-1) \\sum (x_i - \\Hat x) (y_i - \\Hat y)\n" +
   "     \\over\n" +
   "     \\sqrt@{1/(n-1) \\sum (x_i - \\Hat x)^2@} \\sqrt@{1/(n-1) \\sum (y_i - \\Hat y)^2@}\n" +
   "    @}"},
 {:func_name=>"gsl_stats_spearman",
  :func_type=>"double",
  :args=>
   [["const double", "data1[]"],
    ["const size_t", "stride1"],
    ["const double", "data2[]"],
    ["const size_t", "stride2"],
    ["const size_t", "n"],
    ["double", "work[]"]],
  :desc=>
   "This function computes the Spearman rank correlation coefficient between\n" +
   "the datasets data1 and data2 which must both be of the same\n" +
   "length n. Additional workspace of size 2*n is required in\n" +
   "work. The Spearman rank correlation between vectors x and\n" +
   "y is equivalent to the Pearson correlation between the ranked\n" +
   "vectors x_R and y_R, where ranks are defined to be the\n" +
   "average of the positions of an element in the ascending order of the values."},
 {:func_name=>"gsl_stats_wmean",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function returns the weighted mean of the dataset data with\n" +
   "stride stride and length n, using the set of weights w\n" +
   "with stride wstride and length n.  The weighted mean is defined as,\n" +
   "\n" +
   "\\Hat\\mu = (\\sum w_i x_i) / (\\sum w_i)"},
 {:func_name=>"gsl_stats_wvariance",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function returns the estimated variance of the dataset data\n" +
   "with stride stride and length n, using the set of weights\n" +
   "w with stride wstride and length n.  The estimated\n" +
   "variance of a weighted dataset is calculated as,\n" +
   "\n" +
   "\\Hat\\sigma^2 = ((\\sum w_i)/((\\sum w_i)^2 - \\sum (w_i^2))) \n" +
   "                \\sum w_i (x_i - \\Hat\\mu)^2\n" +
   "\n" +
   "Note that this expression reduces to an unweighted variance with the\n" +
   "familiar 1/(N-1) factor when there are N equal non-zero\n" +
   "weights."},
 {:func_name=>"gsl_stats_wvariance_m",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"]],
  :desc=>
   "This function returns the estimated variance of the weighted dataset\n" +
   "data using the given weighted mean wmean."},
 {:func_name=>"gsl_stats_wsd",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "The standard deviation is defined as the square root of the variance.\n" +
   "This function returns the square root of the corresponding variance\n" +
   "function gsl_stats_wvariance above."},
 {:func_name=>"gsl_stats_wsd_m",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"]],
  :desc=>
   "This function returns the square root of the corresponding variance\n" +
   "function gsl_stats_wvariance_m above."},
 {:func_name=>"gsl_stats_wvariance_with_fixed_mean",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["const double", "mean"]],
  :desc=>
   "This function computes an unbiased estimate of the variance of the weighted\n" +
   "dataset data when the population mean mean of the underlying\n" +
   "distribution is known a priori.  In this case the estimator for\n" +
   "the variance replaces the sample mean \\Hat\\mu by the known\n" +
   "population mean \\mu,\n" +
   "\n" +
   "\\Hat\\sigma^2 = (\\sum w_i (x_i - \\mu)^2) / (\\sum w_i)"},
 {:func_name=>"gsl_stats_wsd_with_fixed_mean",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["const double", "mean"]],
  :desc=>
   "The standard deviation is defined as the square root of the variance.\n" +
   "This function returns the square root of the corresponding variance\n" +
   "function above."},
 {:func_name=>"gsl_stats_wtss",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["const size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "These functions return the weighted total sum of squares (TSS) of\n" +
   "data about the weighted mean.  For gsl_stats_wtss_m the\n" +
   "user-supplied value of wmean is used, and for gsl_stats_wtss\n" +
   "it is computed using gsl_stats_wmean.\n" +
   "\n" +
   "TSS =  \\sum w_i (x_i - wmean)^2"},
 {:func_name=>"gsl_stats_wtss_m",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["const size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"]],
  :desc=>
   "These functions return the weighted total sum of squares (TSS) of\n" +
   "data about the weighted mean.  For gsl_stats_wtss_m the\n" +
   "user-supplied value of wmean is used, and for gsl_stats_wtss\n" +
   "it is computed using gsl_stats_wmean.\n" +
   "\n" +
   "TSS =  \\sum w_i (x_i - wmean)^2"},
 {:func_name=>"gsl_stats_wabsdev",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function computes the weighted absolute deviation from the weighted\n" +
   "mean of data.  The absolute deviation from the mean is defined as,\n" +
   "\n" +
   "absdev = (\\sum w_i |x_i - \\Hat\\mu|) / (\\sum w_i)"},
 {:func_name=>"gsl_stats_wabsdev_m",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"]],
  :desc=>
   "This function computes the absolute deviation of the weighted dataset\n" +
   "data about the given weighted mean wmean."},
 {:func_name=>"gsl_stats_wskew",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function computes the weighted skewness of the dataset data.\n" +
   "\n" +
   "skew = (\\sum w_i ((x_i - \\Hat x)/\\Hat \\sigma)^3) / (\\sum w_i)"},
 {:func_name=>"gsl_stats_wskew_m_sd",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"],
    ["double", "wsd"]],
  :desc=>
   "This function computes the weighted skewness of the dataset data\n" +
   "using the given values of the weighted mean and weighted standard\n" +
   "deviation, wmean and wsd."},
 {:func_name=>"gsl_stats_wkurtosis",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function computes the weighted kurtosis of the dataset data.\n" +
   "\n" +
   "kurtosis = ((\\sum w_i ((x_i - \\Hat x)/\\Hat \\sigma)^4) / (\\sum w_i)) - 3"},
 {:func_name=>"gsl_stats_wkurtosis_m_sd",
  :func_type=>"double",
  :args=>
   [["const double", "w[]"],
    ["size_t", "wstride"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "wmean"],
    ["double", "wsd"]],
  :desc=>
   "This function computes the weighted kurtosis of the dataset data\n" +
   "using the given values of the weighted mean and weighted standard\n" +
   "deviation, wmean and wsd."},
 {:func_name=>"gsl_stats_max",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the maximum value in data, a dataset of\n" +
   "length n with stride stride.  The maximum value is defined\n" +
   "as the value of the element x_i which satisfies $x_i \\ge x_j$\n" +
   "x_i >= x_j for all j.\n" +
   "\n" +
   "If you want instead to find the element with the largest absolute\n" +
   "magnitude you will need to apply fabs or abs to your data\n" +
   "before calling this function."},
 {:func_name=>"gsl_stats_min",
  :func_type=>"double",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the minimum value in data, a dataset of\n" +
   "length n with stride stride.  The minimum value is defined\n" +
   "as the value of the element x_i which satisfies $x_i \\le x_j$\n" +
   "x_i <= x_j for all j.\n" +
   "\n" +
   "If you want instead to find the element with the smallest absolute\n" +
   "magnitude you will need to apply fabs or abs to your data\n" +
   "before calling this function."},
 {:func_name=>"gsl_stats_minmax",
  :func_type=>"void",
  :args=>
   [["double *", "min"],
    ["double *", "max"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function finds both the minimum and maximum values min,\n" +
   "max in data in a single pass."},
 {:func_name=>"gsl_stats_max_index",
  :func_type=>"size_t",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the index of the maximum value in data, a\n" +
   "dataset of length n with stride stride.  The maximum value is\n" +
   "defined as the value of the element x_i which satisfies \n" +
   "$x_i \\ge x_j$\n" +
   "x_i >= x_j for all j.  When there are several equal maximum\n" +
   "elements then the first one is chosen."},
 {:func_name=>"gsl_stats_min_index",
  :func_type=>"size_t",
  :args=>[["const double", "data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the index of the minimum value in data, a\n" +
   "dataset of length n with stride stride.  The minimum value\n" +
   "is defined as the value of the element x_i which satisfies\n" +
   "$x_i \\ge x_j$\n" +
   "x_i >= x_j for all j.  When there are several equal\n" +
   "minimum elements then the first one is chosen."},
 {:func_name=>"gsl_stats_minmax_index",
  :func_type=>"void",
  :args=>
   [["size_t *", "min_index"],
    ["size_t *", "max_index"],
    ["const double", "data[]"],
    ["size_t", "stride"],
    ["size_t", "n"]],
  :desc=>
   "This function returns the indexes min_index, max_index of\n" +
   "the minimum and maximum values in data in a single pass."},
 {:func_name=>"gsl_stats_median_from_sorted_data",
  :func_type=>"double",
  :args=>
   [["const double", "sorted_data[]"], ["size_t", "stride"], ["size_t", "n"]],
  :desc=>
   "This function returns the median value of sorted_data, a dataset\n" +
   "of length n with stride stride.  The elements of the array\n" +
   "must be in ascending numerical order.  There are no checks to see\n" +
   "whether the data are sorted, so the function gsl_sort should\n" +
   "always be used first.\n" +
   "\n" +
   "When the dataset has an odd number of elements the median is the value\n" +
   "of element (n-1)/2.  When the dataset has an even number of\n" +
   "elements the median is the mean of the two nearest middle values,\n" +
   "elements (n-1)/2 and n/2.  Since the algorithm for\n" +
   "computing the median involves interpolation this function always returns\n" +
   "a floating-point number, even for integer data types."},
 {:func_name=>"gsl_stats_quantile_from_sorted_data",
  :func_type=>"double",
  :args=>
   [["const double", "sorted_data[]"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["double", "f"]],
  :desc=>
   "This function returns a quantile value of sorted_data, a\n" +
   "double-precision array of length n with stride stride.  The\n" +
   "elements of the array must be in ascending numerical order.  The\n" +
   "quantile is determined by the f, a fraction between 0 and 1.  For\n" +
   "example, to compute the value of the 75th percentile f should have\n" +
   "the value 0.75.\n" +
   "\n" +
   "There are no checks to see whether the data are sorted, so the function\n" +
   "gsl_sort should always be used first.\n" +
   "\n" +
   "The quantile is found by interpolation, using the formula\n" +
   "\n" +
   "quantile = (1 - \\delta) x_i + \\delta x_@{i+1@}\n" +
   "\n" +
   "where i is floor((n - 1)f) and \\delta is\n" +
   "(n-1)f - i.\n" +
   "\n" +
   "Thus the minimum value of the array (data[0*stride]) is given by\n" +
   "f equal to zero, the maximum value (data[(n-1)*stride]) is\n" +
   "given by f equal to one and the median value is given by f\n" +
   "equal to 0.5.  Since the algorithm for computing quantiles involves\n" +
   "interpolation this function always returns a floating-point number, even\n" +
   "for integer data types."}]

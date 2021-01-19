[{:func_name=>"gsl_histogram2d_accumulate",
  :func_type=>"int",
  :args=>
   [["gsl_histogram2d *", "h"],
    ["double", "x"],
    ["double", "y"],
    ["double", "weight"]],
  :desc=>
   "This function is similar to gsl_histogram2d_increment but increases\n" +
   "the value of the appropriate bin in the histogram h by the\n" +
   "floating-point number weight."},
 {:func_name=>"gsl_histogram2d_add",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h1"], ["const gsl_histogram2d *", "h2"]],
  :desc=>
   "This function adds the contents of the bins in histogram h2 to the\n" +
   "corresponding bins of histogram h1,\n" +
   "i.e. h'_1(i,j) = h_1(i,j) + h_2(i,j).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram2d_alloc",
  :func_type=>"gsl_histogram2d *",
  :args=>[["size_t", "nx"], ["size_t", "ny"]],
  :desc=>
   "This function allocates memory for a two-dimensional histogram with\n" +
   "nx bins in the x direction and ny bins in the y direction.\n" +
   "The function returns a pointer to a newly created :type:`gsl_histogram2d`\n" +
   "struct. If insufficient memory is available a null pointer is returned\n" +
   "and the error handler is invoked with an error code of\n" +
   "GSL_ENOMEM. The bins and ranges must be initialized with one of\n" +
   "the functions below before the histogram is ready for use."},
 {:func_name=>"gsl_histogram2d_clone",
  :func_type=>"gsl_histogram2d *",
  :args=>[["const gsl_histogram2d *", "src"]],
  :desc=>
   "This function returns a pointer to a newly created histogram which is an\n" +
   "exact copy of the histogram src."},
 {:func_name=>"gsl_histogram2d_cov",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the covariance of the histogrammed x and y\n" +
   "variables, where the histogram is regarded as a probability\n" +
   "distribution. Negative bin values are ignored for the purposes of this\n" +
   "calculation."},
 {:func_name=>"gsl_histogram2d_div",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h1"], ["const gsl_histogram2d *", "h2"]],
  :desc=>
   "This function divides the contents of the bins of histogram h1\n" +
   "by the contents of the corresponding bins in histogram h2,\n" +
   "i.e. h'_1(i,j) = h_1(i,j) / h_2(i,j).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram2d_equal_bins_p",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram2d *", "h1"], ["const gsl_histogram2d *", "h2"]],
  :desc=>
   "This function returns 1 if all the individual bin ranges of the two\n" +
   "histograms are identical, and 0 otherwise."},
 {:func_name=>"gsl_histogram2d_find",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram2d *", "h"],
    ["double", "x"],
    ["double", "y"],
    ["size_t *", "i"],
    ["size_t *", "j"]],
  :desc=>
   "This function finds and sets the indices i and j to\n" +
   "the bin which covers the coordinates (x, y). The bin is\n" +
   "located using a binary search.  The search includes an optimization for\n" +
   "histograms with uniform ranges, and will return the correct bin immediately\n" +
   "in this case. If (x,y) is found then the function sets the\n" +
   "indices (i, j) and returns GSL_SUCCESS.  If\n" +
   "(x,y) lies outside the valid range of the histogram then the\n" +
   "function returns GSL_EDOM and the error handler is invoked."},
 {:func_name=>"gsl_histogram2d_fprintf",
  :func_type=>"int",
  :args=>
   [["FILE *", "stream"],
    ["const gsl_histogram2d *", "h"],
    ["const char *", "range_format"],
    ["const char *", "bin_format"]],
  :desc=>
   "This function writes the ranges and bins of the histogram h\n" +
   "line-by-line to the stream stream using the format specifiers\n" +
   "range_format and bin_format.  These should be one of the\n" +
   "%g, %e or %f formats for floating point\n" +
   "numbers.  The function returns 0 for success and GSL_EFAILED if\n" +
   "there was a problem writing to the file.  The histogram output is\n" +
   "formatted in five columns, and the columns are separated by spaces,\n" +
   "like this::\n" +
   "Each line contains the lower and upper limits of the bin and the\n" +
   "contents of the bin.  Since the upper limits of the each bin are the\n" +
   "lower limits of the neighboring bins there is duplication of these\n" +
   "values but this allows the histogram to be manipulated with\n" +
   "line-oriented tools."},
 {:func_name=>"gsl_histogram2d_fread",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["gsl_histogram2d *", "h"]],
  :desc=>
   "This function reads into the histogram h from the stream\n" +
   "stream in binary format.  The histogram h must be\n" +
   "preallocated with the correct size since the function uses the number of\n" +
   "x and y bins in h to determine how many bytes to read.  The return\n" +
   "value is 0 for success and GSL_EFAILED if there was a problem\n" +
   "reading from the file.  The data is assumed to have been written in the\n" +
   "native binary format on the same architecture."},
 {:func_name=>"gsl_histogram2d_free",
  :func_type=>"void",
  :args=>[["gsl_histogram2d *", "h"]],
  :desc=>
   "This function frees the 2D histogram h and all of the memory\n" +
   "associated with it."},
 {:func_name=>"gsl_histogram2d_fscanf",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["gsl_histogram2d *", "h"]],
  :desc=>
   "This function reads formatted data from the stream stream into the\n" +
   "histogram h.  The data is assumed to be in the five-column format\n" +
   "used by gsl_histogram2d_fprintf.  The histogram h must be\n" +
   "preallocated with the correct lengths since the function uses the sizes\n" +
   "of h to determine how many numbers to read.  The function returns 0\n" +
   "for success and GSL_EFAILED if there was a problem reading from\n" +
   "the file."},
 {:func_name=>"gsl_histogram2d_fwrite",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function writes the ranges and bins of the histogram h to the\n" +
   "stream stream in binary format.  The return value is 0 for success\n" +
   "and GSL_EFAILED if there was a problem writing to the file.  Since\n" +
   "the data is written in the native binary format it may not be portable\n" +
   "between different architectures."},
 {:func_name=>"gsl_histogram2d_get",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"], ["size_t", "i"], ["size_t", "j"]],
  :desc=>
   "This function returns the contents of the (i, j)-th bin of the\n" +
   "histogram h.  If (i, j) lies outside the valid range of\n" +
   "indices for the histogram then the error handler is called with an error\n" +
   "code of GSL_EDOM and the function returns 0."},
 {:func_name=>"gsl_histogram2d_get_xrange",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram2d *", "h"],
    ["size_t", "i"],
    ["double *", "xlower"],
    ["double *", "xupper"]],
  :desc=>
   "These functions find the upper and lower range limits of the i-th\n" +
   "and j-th bins in the x and y directions of the histogram h.\n" +
   "The range limits are stored in xlower and xupper or\n" +
   "ylower and yupper.  The lower limits are inclusive\n" +
   "(i.e. events with these coordinates are included in the bin) and the\n" +
   "upper limits are exclusive (i.e. events with the value of the upper\n" +
   "limit are not included and fall in the neighboring higher bin, if it\n" +
   "exists).  The functions return 0 to indicate success.  If i or\n" +
   "j lies outside the valid range of indices for the histogram then\n" +
   "the error handler is called with an error code of GSL_EDOM."},
 {:func_name=>"gsl_histogram2d_get_yrange",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram2d *", "h"],
    ["size_t", "j"],
    ["double *", "ylower"],
    ["double *", "yupper"]],
  :desc=>
   "These functions find the upper and lower range limits of the i-th\n" +
   "and j-th bins in the x and y directions of the histogram h.\n" +
   "The range limits are stored in xlower and xupper or\n" +
   "ylower and yupper.  The lower limits are inclusive\n" +
   "(i.e. events with these coordinates are included in the bin) and the\n" +
   "upper limits are exclusive (i.e. events with the value of the upper\n" +
   "limit are not included and fall in the neighboring higher bin, if it\n" +
   "exists).  The functions return 0 to indicate success.  If i or\n" +
   "j lies outside the valid range of indices for the histogram then\n" +
   "the error handler is called with an error code of GSL_EDOM."},
 {:func_name=>"gsl_histogram2d_increment",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h"], ["double", "x"], ["double", "y"]],
  :desc=>
   "This function updates the histogram h by adding one (1.0) to the\n" +
   "bin whose x and y ranges contain the coordinates (x, y).\n" +
   "If the point (x,y) lies inside the valid ranges of the\n" +
   "histogram then the function returns zero to indicate success.  If\n" +
   "(x,y) lies outside the limits of the histogram then the\n" +
   "function returns GSL_EDOM, and none of the bins are modified.  The\n" +
   "error handler is not called, since it is often necessary to compute\n" +
   "histograms for a small range of a larger dataset, ignoring any\n" +
   "coordinates outside the range of interest."},
 {:func_name=>"gsl_histogram2d_max_bin",
  :func_type=>"void",
  :args=>
   [["const gsl_histogram2d *", "h"], ["size_t *", "i"], ["size_t *", "j"]],
  :desc=>
   "This function finds the indices of the bin containing the maximum value\n" +
   "in the histogram h and stores the result in (i, j). In\n" +
   "the case where several bins contain the same maximum value the first bin\n" +
   "found is returned."},
 {:func_name=>"gsl_histogram2d_max_val",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the maximum value contained in the histogram bins."},
 {:func_name=>"gsl_histogram2d_memcpy",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "dest"], ["const gsl_histogram2d *", "src"]],
  :desc=>
   "This function copies the histogram src into the pre-existing\n" +
   "histogram dest, making dest into an exact copy of src.\n" +
   "The two histograms must be of the same size."},
 {:func_name=>"gsl_histogram2d_min_bin",
  :func_type=>"void",
  :args=>
   [["const gsl_histogram2d *", "h"], ["size_t *", "i"], ["size_t *", "j"]],
  :desc=>
   "This function finds the indices of the bin containing the minimum value\n" +
   "in the histogram h and stores the result in (i, j). In\n" +
   "the case where several bins contain the same maximum value the first bin\n" +
   "found is returned."},
 {:func_name=>"gsl_histogram2d_min_val",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the minimum value contained in the histogram bins."},
 {:func_name=>"gsl_histogram2d_mul",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h1"], ["const gsl_histogram2d *", "h2"]],
  :desc=>
   "This function multiplies the contents of the bins of histogram h1\n" +
   "by the contents of the corresponding bins in histogram h2,\n" +
   "i.e. h'_1(i,j) = h_1(i,j) * h_2(i,j).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram2d_nx",
  :func_type=>"size_t",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_ny",
  :func_type=>"size_t",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_pdf_alloc",
  :func_type=>"gsl_histogram2d_pdf *",
  :args=>[["size_t", "nx"], ["size_t", "ny"]],
  :desc=>
   "This function allocates memory for a two-dimensional probability\n" +
   "distribution of size nx-by-ny and returns a pointer to a\n" +
   "newly initialized :type:`gsl_histogram2d_pdf` struct. If insufficient\n" +
   "memory is available a null pointer is returned and the error handler is\n" +
   "invoked with an error code of GSL_ENOMEM."},
 {:func_name=>"gsl_histogram2d_pdf_free",
  :func_type=>"void",
  :args=>[["gsl_histogram2d_pdf *", "p"]],
  :desc=>
   "This function frees the two-dimensional probability distribution\n" +
   "function p and all of the memory associated with it."},
 {:func_name=>"gsl_histogram2d_pdf_init",
  :func_type=>"int",
  :args=>[["gsl_histogram2d_pdf *", "p"], ["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function initializes the two-dimensional probability distribution\n" +
   "calculated p from the histogram h.  If any of the bins of\n" +
   "h are negative then the error handler is invoked with an error\n" +
   "code of GSL_EDOM because a probability distribution cannot\n" +
   "contain negative values."},
 {:func_name=>"gsl_histogram2d_pdf_sample",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram2d_pdf *", "p"],
    ["double", "r1"],
    ["double", "r2"],
    ["double *", "x"],
    ["double *", "y"]],
  :desc=>
   "This function uses two uniform random numbers between zero and one,\n" +
   "r1 and r2, to compute a single random sample from the\n" +
   "two-dimensional probability distribution p."},
 {:func_name=>"gsl_histogram2d_reset",
  :func_type=>"void",
  :args=>[["gsl_histogram2d *", "h"]],
  :desc=>"This function resets all the bins of the histogram h to zero."},
 {:func_name=>"gsl_histogram2d_scale",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h"], ["double", "scale"]],
  :desc=>
   "This function multiplies the contents of the bins of histogram h\n" +
   "by the constant scale, i.e.\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo"},
 {:func_name=>"gsl_histogram2d_set_ranges",
  :func_type=>"int",
  :args=>
   [["gsl_histogram2d *", "h"],
    ["const double", "xrange[]"],
    ["size_t", "xsize"],
    ["const double", "yrange[]"],
    ["size_t", "ysize"]],
  :desc=>
   "This function sets the ranges of the existing histogram h using\n" +
   "the arrays xrange and yrange of size xsize and\n" +
   "ysize respectively.  The values of the histogram bins are reset to\n" +
   "zero."},
 {:func_name=>"gsl_histogram2d_set_ranges_uniform",
  :func_type=>"int",
  :args=>
   [["gsl_histogram2d *", "h"],
    ["double", "xmin"],
    ["double", "xmax"],
    ["double", "ymin"],
    ["double", "ymax"]],
  :desc=>
   "This function sets the ranges of the existing histogram h to cover\n" +
   "the ranges xmin to xmax and ymin to ymax\n" +
   "uniformly.  The values of the histogram bins are reset to zero."},
 {:func_name=>"gsl_histogram2d_shift",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h"], ["double", "offset"]],
  :desc=>
   "This function shifts the contents of the bins of histogram h\n" +
   "by the constant offset, i.e.\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo"},
 {:func_name=>"gsl_histogram2d_sub",
  :func_type=>"int",
  :args=>[["gsl_histogram2d *", "h1"], ["const gsl_histogram2d *", "h2"]],
  :desc=>
   "This function subtracts the contents of the bins in histogram h2 from the\n" +
   "corresponding bins of histogram h1,\n" +
   "i.e. h'_1(i,j) = h_1(i,j) - h_2(i,j).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram2d_sum",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the sum of all bin values. Negative bin values\n" +
   "are included in the sum."},
 {:func_name=>"gsl_histogram2d_xmax",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_xmean",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the mean of the histogrammed x variable, where the\n" +
   "histogram is regarded as a probability distribution. Negative bin values\n" +
   "are ignored for the purposes of this calculation."},
 {:func_name=>"gsl_histogram2d_xmin",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_xsigma",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the standard deviation of the histogrammed\n" +
   "x variable, where the histogram is regarded as a probability\n" +
   "distribution. Negative bin values are ignored for the purposes of this\n" +
   "calculation."},
 {:func_name=>"gsl_histogram2d_ymax",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_ymean",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the mean of the histogrammed y variable, where the\n" +
   "histogram is regarded as a probability distribution. Negative bin values\n" +
   "are ignored for the purposes of this calculation."},
 {:func_name=>"gsl_histogram2d_ymin",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins for the x and y directions of the histogram\n" +
   "h.  They provide a way of determining these values without\n" +
   "accessing the :type:`gsl_histogram2d` struct directly."},
 {:func_name=>"gsl_histogram2d_ysigma",
  :func_type=>"double",
  :args=>[["const gsl_histogram2d *", "h"]],
  :desc=>
   "This function returns the standard deviation of the histogrammed\n" +
   "y variable, where the histogram is regarded as a probability\n" +
   "distribution. Negative bin values are ignored for the purposes of this\n" +
   "calculation."},
 {:func_name=>"gsl_histogram_accumulate",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h"], ["double", "x"], ["double", "weight"]],
  :desc=>
   "This function is similar to gsl_histogram_increment but increases\n" +
   "the value of the appropriate bin in the histogram h by the\n" +
   "floating-point number weight."},
 {:func_name=>"gsl_histogram_add",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h1"], ["const gsl_histogram *", "h2"]],
  :desc=>
   "This function adds the contents of the bins in histogram h2 to the\n" +
   "corresponding bins of histogram h1,  i.e. h'_1(i) = h_1(i) + h_2(i).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram_alloc",
  :func_type=>"gsl_histogram *",
  :args=>[["size_t", "n"]],
  :desc=>
   "This function allocates memory for a histogram with n bins, and\n" +
   "returns a pointer to a newly created :type:`gsl_histogram` struct.  If\n" +
   "insufficient memory is available a null pointer is returned and the\n" +
   "error handler is invoked with an error code of GSL_ENOMEM. The\n" +
   "bins and ranges are not initialized, and should be prepared using one of\n" +
   "the range-setting functions below in order to make the histogram ready\n" +
   "for use."},
 {:func_name=>"gsl_histogram_bins",
  :func_type=>"size_t",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins of the histogram h.  They provide a way of\n" +
   "determining these values without accessing the :type:`gsl_histogram`\n" +
   "struct directly."},
 {:func_name=>"gsl_histogram_clone",
  :func_type=>"gsl_histogram *",
  :args=>[["const gsl_histogram *", "src"]],
  :desc=>
   "This function returns a pointer to a newly created histogram which is an\n" +
   "exact copy of the histogram src."},
 {:func_name=>"gsl_histogram_div",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h1"], ["const gsl_histogram *", "h2"]],
  :desc=>
   "This function divides the contents of the bins of histogram h1 by\n" +
   "the contents of the corresponding bins in histogram h2,\n" +
   "i.e. h'_1(i) = h_1(i) / h_2(i).  The two histograms must have\n" +
   "identical bin ranges."},
 {:func_name=>"gsl_histogram_equal_bins_p",
  :func_type=>"int",
  :args=>[["const gsl_histogram *", "h1"], ["const gsl_histogram *", "h2"]],
  :desc=>
   "This function returns 1 if the all of the individual bin\n" +
   "ranges of the two histograms are identical, and 0\n" +
   "otherwise."},
 {:func_name=>"gsl_histogram_find",
  :func_type=>"int",
  :args=>[["const gsl_histogram *", "h"], ["double", "x"], ["size_t *", "i"]],
  :desc=>
   "This function finds and sets the index i to the bin number which\n" +
   "covers the coordinate x in the histogram h.  The bin is\n" +
   "located using a binary search. The search includes an optimization for\n" +
   "histograms with uniform range, and will return the correct bin\n" +
   "immediately in this case.  If x is found in the range of the\n" +
   "histogram then the function sets the index i and returns\n" +
   "GSL_SUCCESS.  If x lies outside the valid range of the\n" +
   "histogram then the function returns GSL_EDOM and the error\n" +
   "handler is invoked."},
 {:func_name=>"gsl_histogram_fprintf",
  :func_type=>"int",
  :args=>
   [["FILE *", "stream"],
    ["const gsl_histogram *", "h"],
    ["const char *", "range_format"],
    ["const char *", "bin_format"]],
  :desc=>
   "This function writes the ranges and bins of the histogram h\n" +
   "line-by-line to the stream stream using the format specifiers\n" +
   "range_format and bin_format.  These should be one of the\n" +
   "%g, %e or %f formats for floating point\n" +
   "numbers.  The function returns 0 for success and GSL_EFAILED if\n" +
   "there was a problem writing to the file.  The histogram output is\n" +
   "formatted in three columns, and the columns are separated by spaces,\n" +
   "like this::\n" +
   "The values of the ranges are formatted using range_format and the\n" +
   "value of the bins are formatted using bin_format.  Each line\n" +
   "contains the lower and upper limit of the range of the bins and the\n" +
   "value of the bin itself.  Since the upper limit of one bin is the lower\n" +
   "limit of the next there is duplication of these values between lines but\n" +
   "this allows the histogram to be manipulated with line-oriented tools."},
 {:func_name=>"gsl_histogram_fread",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["gsl_histogram *", "h"]],
  :desc=>
   "This function reads into the histogram h from the open stream\n" +
   "stream in binary format.  The histogram h must be\n" +
   "preallocated with the correct size since the function uses the number of\n" +
   "bins in h to determine how many bytes to read.  The return value is\n" +
   "0 for success and GSL_EFAILED if there was a problem reading from\n" +
   "the file.  The data is assumed to have been written in the native binary\n" +
   "format on the same architecture."},
 {:func_name=>"gsl_histogram_free",
  :func_type=>"void",
  :args=>[["gsl_histogram *", "h"]],
  :desc=>
   "This function frees the histogram h and all of the memory\n" +
   "associated with it."},
 {:func_name=>"gsl_histogram_fscanf",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["gsl_histogram *", "h"]],
  :desc=>
   "This function reads formatted data from the stream stream into the\n" +
   "histogram h.  The data is assumed to be in the three-column format\n" +
   "used by gsl_histogram_fprintf.  The histogram h must be\n" +
   "preallocated with the correct length since the function uses the size of\n" +
   "h to determine how many numbers to read.  The function returns 0\n" +
   "for success and GSL_EFAILED if there was a problem reading from\n" +
   "the file."},
 {:func_name=>"gsl_histogram_fwrite",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["const gsl_histogram *", "h"]],
  :desc=>
   "This function writes the ranges and bins of the histogram h to the\n" +
   "stream stream in binary format.  The return value is 0 for success\n" +
   "and GSL_EFAILED if there was a problem writing to the file.  Since\n" +
   "the data is written in the native binary format it may not be portable\n" +
   "between different architectures."},
 {:func_name=>"gsl_histogram_get",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"], ["size_t", "i"]],
  :desc=>
   "This function returns the contents of the i-th bin of the histogram\n" +
   "h.  If i lies outside the valid range of indices for the\n" +
   "histogram then the error handler is called with an error code of\n" +
   "GSL_EDOM and the function returns 0."},
 {:func_name=>"gsl_histogram_get_range",
  :func_type=>"int",
  :args=>
   [["const gsl_histogram *", "h"],
    ["size_t", "i"],
    ["double *", "lower"],
    ["double *", "upper"]],
  :desc=>
   "This function finds the upper and lower range limits of the i-th\n" +
   "bin of the histogram h.  If the index i is valid then the\n" +
   "corresponding range limits are stored in lower and upper.\n" +
   "The lower limit is inclusive (i.e. events with this coordinate are\n" +
   "included in the bin) and the upper limit is exclusive (i.e. events with\n" +
   "the coordinate of the upper limit are excluded and fall in the\n" +
   "neighboring higher bin, if it exists).  The function returns 0 to\n" +
   "indicate success.  If i lies outside the valid range of indices for\n" +
   "the histogram then the error handler is called and the function returns\n" +
   "an error code of GSL_EDOM."},
 {:func_name=>"gsl_histogram_increment",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h"], ["double", "x"]],
  :desc=>
   "This function updates the histogram h by adding one (1.0) to the\n" +
   "bin whose range contains the coordinate x. \n" +
   "If x lies in the valid range of the histogram then the function\n" +
   "returns zero to indicate success.  If x is less than the lower\n" +
   "limit of the histogram then the function returns GSL_EDOM, and\n" +
   "none of bins are modified.  Similarly, if the value of x is greater\n" +
   "than or equal to the upper limit of the histogram then the function\n" +
   "returns GSL_EDOM, and none of the bins are modified.  The error\n" +
   "handler is not called, however, since it is often necessary to compute\n" +
   "histograms for a small range of a larger dataset, ignoring the values\n" +
   "outside the range of interest."},
 {:func_name=>"gsl_histogram_max",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins of the histogram h.  They provide a way of\n" +
   "determining these values without accessing the :type:`gsl_histogram`\n" +
   "struct directly."},
 {:func_name=>"gsl_histogram_max_bin",
  :func_type=>"size_t",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the index of the bin containing the maximum\n" +
   "value. In the case where several bins contain the same maximum value the\n" +
   "smallest index is returned."},
 {:func_name=>"gsl_histogram_max_val",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the maximum value contained in the histogram bins."},
 {:func_name=>"gsl_histogram_mean",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the mean of the histogrammed variable, where the\n" +
   "histogram is regarded as a probability distribution. Negative bin values\n" +
   "are ignored for the purposes of this calculation.  The accuracy of the\n" +
   "result is limited by the bin width."},
 {:func_name=>"gsl_histogram_memcpy",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "dest"], ["const gsl_histogram *", "src"]],
  :desc=>
   "This function copies the histogram src into the pre-existing\n" +
   "histogram dest, making dest into an exact copy of src.\n" +
   "The two histograms must be of the same size."},
 {:func_name=>"gsl_histogram_min",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "These functions return the maximum upper and minimum lower range limits\n" +
   "and the number of bins of the histogram h.  They provide a way of\n" +
   "determining these values without accessing the :type:`gsl_histogram`\n" +
   "struct directly."},
 {:func_name=>"gsl_histogram_min_bin",
  :func_type=>"size_t",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the index of the bin containing the minimum\n" +
   "value. In the case where several bins contain the same maximum value the\n" +
   "smallest index is returned."},
 {:func_name=>"gsl_histogram_min_val",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the minimum value contained in the histogram bins."},
 {:func_name=>"gsl_histogram_mul",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h1"], ["const gsl_histogram *", "h2"]],
  :desc=>
   "This function multiplies the contents of the bins of histogram h1\n" +
   "by the contents of the corresponding bins in histogram h2,\n" +
   "i.e. h'_1(i) = h_1(i) * h_2(i).  The two histograms must have\n" +
   "identical bin ranges."},
 {:func_name=>"gsl_histogram_pdf_alloc",
  :func_type=>"gsl_histogram_pdf *",
  :args=>[["size_t", "n"]],
  :desc=>
   "This function allocates memory for a probability distribution with\n" +
   "n bins and returns a pointer to a newly initialized\n" +
   ":type:`gsl_histogram_pdf` struct. If insufficient memory is available a\n" +
   "null pointer is returned and the error handler is invoked with an error\n" +
   "code of GSL_ENOMEM."},
 {:func_name=>"gsl_histogram_pdf_free",
  :func_type=>"void",
  :args=>[["gsl_histogram_pdf *", "p"]],
  :desc=>
   "This function frees the probability distribution function p and\n" +
   "all of the memory associated with it."},
 {:func_name=>"gsl_histogram_pdf_init",
  :func_type=>"int",
  :args=>[["gsl_histogram_pdf *", "p"], ["const gsl_histogram *", "h"]],
  :desc=>
   "This function initializes the probability distribution p with\n" +
   "the contents of the histogram h. If any of the bins of h are\n" +
   "negative then the error handler is invoked with an error code of\n" +
   "GSL_EDOM because a probability distribution cannot contain\n" +
   "negative values."},
 {:func_name=>"gsl_histogram_pdf_sample",
  :func_type=>"double",
  :args=>[["const gsl_histogram_pdf *", "p"], ["double", "r"]],
  :desc=>
   "This function uses r, a uniform random number between zero and\n" +
   "one, to compute a single random sample from the probability distribution\n" +
   "p.  The algorithm used to compute the sample s is given by\n" +
   "the following formula,\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo\n" +
   "where i is the index which satisfies \n" +
   "sum[i] \\le  r < sum[i+1]\n" +
   "and delta is \n" +
   "(r - sum[i])/(sum[i+1] - sum[i])."},
 {:func_name=>"gsl_histogram_reset",
  :func_type=>"void",
  :args=>[["gsl_histogram *", "h"]],
  :desc=>"This function resets all the bins in the histogram h to zero."},
 {:func_name=>"gsl_histogram_scale",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h"], ["double", "scale"]],
  :desc=>
   "This function multiplies the contents of the bins of histogram h\n" +
   "by the constant scale, i.e.\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo"},
 {:func_name=>"gsl_histogram_set_ranges",
  :func_type=>"int",
  :args=>
   [["gsl_histogram *", "h"], ["const double", "range[]"], ["size_t", "size"]],
  :desc=>
   "This function sets the ranges of the existing histogram h using\n" +
   "the array range of size size.  The values of the histogram\n" +
   "bins are reset to zero.  The range array should contain the\n" +
   "desired bin limits.  The ranges can be arbitrary, subject to the\n" +
   "restriction that they are monotonically increasing.\n" +
   "The following example shows how to create a histogram with logarithmic\n" +
   "bins with ranges [1,10), [10,100) and [100,1000)::\n" +
   "Note that the size of the range array should be defined to be one\n" +
   "element bigger than the number of bins.  The additional element is\n" +
   "required for the upper value of the final bin."},
 {:func_name=>"gsl_histogram_set_ranges_uniform",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h"], ["double", "xmin"], ["double", "xmax"]],
  :desc=>
   "This function sets the ranges of the existing histogram h to cover\n" +
   "the range xmin to xmax uniformly.  The values of the\n" +
   "histogram bins are reset to zero.  The bin ranges are shown in the table\n" +
   "below,\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo\n" +
   "where d is the bin spacing, d = (xmax-xmin)/n."},
 {:func_name=>"gsl_histogram_shift",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h"], ["double", "offset"]],
  :desc=>
   "This function shifts the contents of the bins of histogram h by\n" +
   "the constant offset, i.e.\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo"},
 {:func_name=>"gsl_histogram_sigma",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the standard deviation of the histogrammed\n" +
   "variable, where the histogram is regarded as a probability\n" +
   "distribution. Negative bin values are ignored for the purposes of this\n" +
   "calculation. The accuracy of the result is limited by the bin width."},
 {:func_name=>"gsl_histogram_sub",
  :func_type=>"int",
  :args=>[["gsl_histogram *", "h1"], ["const gsl_histogram *", "h2"]],
  :desc=>
   "This function subtracts the contents of the bins in histogram h2\n" +
   "from the corresponding bins of histogram h1, i.e. h'_1(i) = h_1(i) - h_2(i).\n" +
   "The two histograms must have identical bin ranges."},
 {:func_name=>"gsl_histogram_sum",
  :func_type=>"double",
  :args=>[["const gsl_histogram *", "h"]],
  :desc=>
   "This function returns the sum of all bin values. Negative bin values\n" +
   "are included in the sum."}]

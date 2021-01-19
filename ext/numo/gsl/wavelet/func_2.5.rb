[{:func_name=>"gsl_wavelet2d_nstransform",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_direction", "dir"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional wavelet transform in\n" +
   "non-standard form."},
 {:func_name=>"gsl_wavelet2d_nstransform_forward",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional wavelet transform in\n" +
   "non-standard form."},
 {:func_name=>"gsl_wavelet2d_nstransform_inverse",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional wavelet transform in\n" +
   "non-standard form."},
 {:func_name=>"gsl_wavelet2d_nstransform_matrix",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_direction", "dir"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the non-standard form of the two-dimensional\n" +
   "in-place wavelet transform on a matrix m."},
 {:func_name=>"gsl_wavelet2d_nstransform_matrix_forward",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the non-standard form of the two-dimensional\n" +
   "in-place wavelet transform on a matrix m."},
 {:func_name=>"gsl_wavelet2d_nstransform_matrix_inverse",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the non-standard form of the two-dimensional\n" +
   "in-place wavelet transform on a matrix m."},
 {:func_name=>"gsl_wavelet2d_transform",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_direction", "dir"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute two-dimensional in-place forward and inverse\n" +
   "discrete wavelet transforms in standard form on the\n" +
   "array data stored in row-major form with dimensions size1\n" +
   "and size2 and physical row length tda.  The dimensions must\n" +
   "be equal (square matrix) and are restricted to powers of two.  For the\n" +
   "transform version of the function the argument dir can be\n" +
   "either forward (+1) or backward (-1).  A\n" +
   "workspace work of the appropriate size must be provided.  On exit,\n" +
   "the appropriate elements of the array data are replaced by their\n" +
   "two-dimensional wavelet transform.\n" +
   "The functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if size1 and\n" +
   "size2 are not equal and integer powers of 2, or if insufficient\n" +
   "workspace is provided."},
 {:func_name=>"gsl_wavelet2d_transform_forward",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute two-dimensional in-place forward and inverse\n" +
   "discrete wavelet transforms in standard form on the\n" +
   "array data stored in row-major form with dimensions size1\n" +
   "and size2 and physical row length tda.  The dimensions must\n" +
   "be equal (square matrix) and are restricted to powers of two.  For the\n" +
   "transform version of the function the argument dir can be\n" +
   "either forward (+1) or backward (-1).  A\n" +
   "workspace work of the appropriate size must be provided.  On exit,\n" +
   "the appropriate elements of the array data are replaced by their\n" +
   "two-dimensional wavelet transform.\n" +
   "The functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if size1 and\n" +
   "size2 are not equal and integer powers of 2, or if insufficient\n" +
   "workspace is provided."},
 {:func_name=>"gsl_wavelet2d_transform_inverse",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "tda"],
    ["size_t", "size1"],
    ["size_t", "size2"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute two-dimensional in-place forward and inverse\n" +
   "discrete wavelet transforms in standard form on the\n" +
   "array data stored in row-major form with dimensions size1\n" +
   "and size2 and physical row length tda.  The dimensions must\n" +
   "be equal (square matrix) and are restricted to powers of two.  For the\n" +
   "transform version of the function the argument dir can be\n" +
   "either forward (+1) or backward (-1).  A\n" +
   "workspace work of the appropriate size must be provided.  On exit,\n" +
   "the appropriate elements of the array data are replaced by their\n" +
   "two-dimensional wavelet transform.\n" +
   "The functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if size1 and\n" +
   "size2 are not equal and integer powers of 2, or if insufficient\n" +
   "workspace is provided."},
 {:func_name=>"gsl_wavelet2d_transform_matrix",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_direction", "dir"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional in-place wavelet transform\n" +
   "on a matrix m."},
 {:func_name=>"gsl_wavelet2d_transform_matrix_forward",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional in-place wavelet transform\n" +
   "on a matrix m."},
 {:func_name=>"gsl_wavelet2d_transform_matrix_inverse",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["gsl_matrix *", "m"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute the two-dimensional in-place wavelet transform\n" +
   "on a matrix m."},
 {:func_name=>"gsl_wavelet_alloc",
  :func_type=>"gsl_wavelet *",
  :args=>[["const gsl_wavelet_type *", "T"], ["size_t", "k"]],
  :desc=>
   "This function allocates and initializes a wavelet object of type\n" +
   "T.  The parameter k selects the specific member of the\n" +
   "wavelet family.  A null pointer is returned if insufficient memory is\n" +
   "available or if a unsupported member is selected."},
 {:func_name=>"gsl_wavelet_free",
  :func_type=>"void",
  :args=>[["gsl_wavelet *", "w"]],
  :desc=>"This function frees the wavelet object w."},
 {:func_name=>"gsl_wavelet_name",
  :func_type=>"const char *",
  :args=>[["const gsl_wavelet *", "w"]],
  :desc=>
   "This function returns a pointer to the name of the wavelet family for\n" +
   "w."},
 {:func_name=>"gsl_wavelet_transform",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["gsl_wavelet_direction", "dir"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute in-place forward and inverse discrete wavelet\n" +
   "transforms of length n with stride stride on the array\n" +
   "data. The length of the transform n is restricted to powers\n" +
   "of two.  For the transform version of the function the argument\n" +
   "dir can be either forward (+1) or backward\n" +
   "(-1).  A workspace work of length n must be provided.\n" +
   "For the forward transform, the elements of the original array are \n" +
   "replaced by the discrete wavelet\n" +
   "transform f_i \\rightarrow w_{j,k}\n" +
   "in a packed triangular storage layout, \n" +
   "where j is the index of the level \n" +
   "j = 0 \\dots J-1\n" +
   "and\n" +
   "k is the index of the coefficient within each level,\n" +
   "k = 0 \\dots 2^j - 1.\n" +
   "The total number of levels is J = \\log_2(n).  The output data\n" +
   "has the following form,\n" +
   ".. math:: (s_{-1,0}, d_{0,0}, d_{1,0}, d_{1,1}, d_{2,0},\\cdots, d_{j,k},\\cdots, d_{J-1,2^{J-1} - 1}) \n" +
   "where the first element is the smoothing coefficient s_{-1,0},\n" +
   "followed by the detail coefficients d_{j,k}\n" +
   "for each level\n" +
   "j.  The backward transform inverts these coefficients to obtain \n" +
   "the original data.\n" +
   "These functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if n is not an integer\n" +
   "power of 2 or if insufficient workspace is provided."},
 {:func_name=>"gsl_wavelet_transform_forward",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute in-place forward and inverse discrete wavelet\n" +
   "transforms of length n with stride stride on the array\n" +
   "data. The length of the transform n is restricted to powers\n" +
   "of two.  For the transform version of the function the argument\n" +
   "dir can be either forward (+1) or backward\n" +
   "(-1).  A workspace work of length n must be provided.\n" +
   "For the forward transform, the elements of the original array are \n" +
   "replaced by the discrete wavelet\n" +
   "transform f_i \\rightarrow w_{j,k}\n" +
   "in a packed triangular storage layout, \n" +
   "where j is the index of the level \n" +
   "j = 0 \\dots J-1\n" +
   "and\n" +
   "k is the index of the coefficient within each level,\n" +
   "k = 0 \\dots 2^j - 1.\n" +
   "The total number of levels is J = \\log_2(n).  The output data\n" +
   "has the following form,\n" +
   ".. math:: (s_{-1,0}, d_{0,0}, d_{1,0}, d_{1,1}, d_{2,0},\\cdots, d_{j,k},\\cdots, d_{J-1,2^{J-1} - 1}) \n" +
   "where the first element is the smoothing coefficient s_{-1,0},\n" +
   "followed by the detail coefficients d_{j,k}\n" +
   "for each level\n" +
   "j.  The backward transform inverts these coefficients to obtain \n" +
   "the original data.\n" +
   "These functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if n is not an integer\n" +
   "power of 2 or if insufficient workspace is provided."},
 {:func_name=>"gsl_wavelet_transform_inverse",
  :func_type=>"int",
  :args=>
   [["const gsl_wavelet *", "w"],
    ["double *", "data"],
    ["size_t", "stride"],
    ["size_t", "n"],
    ["gsl_wavelet_workspace *", "work"]],
  :desc=>
   "These functions compute in-place forward and inverse discrete wavelet\n" +
   "transforms of length n with stride stride on the array\n" +
   "data. The length of the transform n is restricted to powers\n" +
   "of two.  For the transform version of the function the argument\n" +
   "dir can be either forward (+1) or backward\n" +
   "(-1).  A workspace work of length n must be provided.\n" +
   "For the forward transform, the elements of the original array are \n" +
   "replaced by the discrete wavelet\n" +
   "transform f_i \\rightarrow w_{j,k}\n" +
   "in a packed triangular storage layout, \n" +
   "where j is the index of the level \n" +
   "j = 0 \\dots J-1\n" +
   "and\n" +
   "k is the index of the coefficient within each level,\n" +
   "k = 0 \\dots 2^j - 1.\n" +
   "The total number of levels is J = \\log_2(n).  The output data\n" +
   "has the following form,\n" +
   ".. math:: (s_{-1,0}, d_{0,0}, d_{1,0}, d_{1,1}, d_{2,0},\\cdots, d_{j,k},\\cdots, d_{J-1,2^{J-1} - 1}) \n" +
   "where the first element is the smoothing coefficient s_{-1,0},\n" +
   "followed by the detail coefficients d_{j,k}\n" +
   "for each level\n" +
   "j.  The backward transform inverts these coefficients to obtain \n" +
   "the original data.\n" +
   "These functions return a status of GSL_SUCCESS upon successful\n" +
   "completion.  GSL_EINVAL is returned if n is not an integer\n" +
   "power of 2 or if insufficient workspace is provided."},
 {:func_name=>"gsl_wavelet_workspace_alloc",
  :func_type=>"gsl_wavelet_workspace *",
  :args=>[["size_t", "n"]],
  :desc=>
   "This function allocates a workspace for the discrete wavelet transform.\n" +
   "To perform a one-dimensional transform on n elements, a workspace\n" +
   "of size n must be provided.  For two-dimensional transforms of\n" +
   "n-by-n matrices it is sufficient to allocate a workspace of\n" +
   "size n, since the transform operates on individual rows and\n" +
   "columns. A null pointer is returned if insufficient memory is available."},
 {:func_name=>"gsl_wavelet_workspace_free",
  :func_type=>"void",
  :args=>[["gsl_wavelet_workspace *", "work"]],
  :desc=>"This function frees the allocated workspace work."}]

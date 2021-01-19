[{:func_name=>"gsl_interp2d_alloc",
  :func_type=>"gsl_interp2d *",
  :args=>
   [["const gsl_interp2d_type *", "T"],
    ["const size_t", "xsize"],
    ["const size_t", "ysize"]],
  :desc=>
   "This function returns a pointer to a newly allocated interpolation\n" +
   "object of type T for xsize grid points in the x\n" +
   "direction and ysize grid points in the y direction."},
 {:func_name=>"gsl_interp2d_eval",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value of z for a given\n" +
   "point (x, y), using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_x",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial z / \\partial x for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_x_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial z / \\partial x for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_xx",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial x^2 for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_xx_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial x^2 for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_xy",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial x \\partial y for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_xy_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial x \\partial y for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_y",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial z / \\partial y for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_y_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial z / \\partial y for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_yy",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial y^2 for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_deriv_yy_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the interpolated value d\n" +
   "= \\partial^2 z / \\partial y^2 for a given point (x, y),\n" +
   "using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "z"]],
  :desc=>
   "These functions return the interpolated value of z for a given\n" +
   "point (x, y), using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc.  When x is outside the range of xa or y\n" +
   "is outside the range of ya, the error code\n" +
   "GSL_EDOM is returned."},
 {:func_name=>"gsl_interp2d_eval_extrap",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>
   "These functions return the interpolated value of z for a given\n" +
   "point (x, y), using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc. The functions perform no bounds checking, so\n" +
   "when x is outside the range of xa or y\n" +
   "is outside the range of ya, extrapolation is performed."},
 {:func_name=>"gsl_interp2d_eval_extrap_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "z"]],
  :desc=>
   "These functions return the interpolated value of z for a given\n" +
   "point (x, y), using the interpolation object interp, data\n" +
   "arrays xa, ya, and za and the accelerators xacc\n" +
   "and yacc. The functions perform no bounds checking, so\n" +
   "when x is outside the range of xa or y\n" +
   "is outside the range of ya, extrapolation is performed."},
 {:func_name=>"gsl_interp2d_free",
  :func_type=>"void",
  :args=>[["gsl_interp2d *", "interp"]],
  :desc=>"This function frees the interpolation object interp."},
 {:func_name=>"gsl_interp2d_get",
  :func_type=>"double",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const double", "za[]"],
    ["const size_t", "i"],
    ["const size_t", "j"]],
  :desc=>
   "This function returns the value z_{ij} for grid point\n" +
   "(i, j) stored in the array za."},
 {:func_name=>"gsl_interp2d_idx",
  :func_type=>"size_t",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["const size_t", "i"],
    ["const size_t", "j"]],
  :desc=>
   "This function returns the index corresponding to the grid point\n" +
   "(i, j). The index is given by j*xsize + i."},
 {:func_name=>"gsl_interp2d_init",
  :func_type=>"int",
  :args=>
   [["gsl_interp2d *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["const size_t", "xsize"],
    ["const size_t", "ysize"]],
  :desc=>
   "This function initializes the interpolation object interp for the\n" +
   "data (xa, ya, za) where xa and ya are arrays of\n" +
   "the x and y grid points of size xsize and ysize\n" +
   "respectively, and za is an array of function values of size\n" +
   "xsize*ysize.  The interpolation object (:type:`gsl_interp2d`) does\n" +
   "not save the data arrays xa, ya, and za and only stores the\n" +
   "static state computed from the data. The xa and ya data arrays\n" +
   "are always assumed to be strictly ordered, with increasing x,y values; \n" +
   "the behavior for other arrangements is not defined."},
 {:func_name=>"gsl_interp2d_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_interp2d *", "interp"]],
  :desc=>
   "These functions return the minimum number of points required by the\n" +
   "interpolation object interp or interpolation type T.  For\n" +
   "example, bicubic interpolation requires a minimum of 4 points."},
 {:func_name=>"gsl_interp2d_name",
  :func_type=>"const char *",
  :args=>[["const gsl_interp2d *", "interp"]],
  :desc=>
   "This function returns the name of the interpolation type used by interp.\n" +
   "For example::\n" +
   "would print something like::"},
 {:func_name=>"gsl_interp2d_set",
  :func_type=>"int",
  :args=>
   [["const gsl_interp2d *", "interp"],
    ["double", "za[]"],
    ["const size_t", "i"],
    ["const size_t", "j"],
    ["const double", "z"]],
  :desc=>
   "This function sets the value z_{ij} for grid point\n" +
   "(i, j) of the array za to z."},
 {:func_name=>"gsl_interp2d_type_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_interp2d_type *", "T"]],
  :desc=>
   "These functions return the minimum number of points required by the\n" +
   "interpolation object interp or interpolation type T.  For\n" +
   "example, bicubic interpolation requires a minimum of 4 points."},
 {:func_name=>"gsl_interp_accel_alloc",
  :func_type=>"gsl_interp_accel *",
  :args=>[["", "void"]],
  :desc=>
   "This function returns a pointer to an accelerator object, which is a\n" +
   "kind of iterator for interpolation lookups.  It tracks the state of\n" +
   "lookups, thus allowing for application of various acceleration\n" +
   "strategies."},
 {:func_name=>"gsl_interp_accel_find",
  :func_type=>"size_t",
  :args=>
   [["gsl_interp_accel *", "a"],
    ["const double", "x_array[]"],
    ["size_t", "size"],
    ["double", "x"]],
  :desc=>
   "This function performs a lookup action on the data array x_array\n" +
   "of size size, using the given accelerator a.  This is how\n" +
   "lookups are performed during evaluation of an interpolation.  The\n" +
   "function returns an index i such that x_array[i] <= x < x_array[i+1].\n" +
   "|inlinefn|"},
 {:func_name=>"gsl_interp_accel_free",
  :func_type=>"void",
  :args=>[["gsl_interp_accel*", "acc"]],
  :desc=>"This function frees the accelerator object acc."},
 {:func_name=>"gsl_interp_accel_reset",
  :func_type=>"int",
  :args=>[["gsl_interp_accel *", "acc"]],
  :desc=>
   "This function reinitializes the accelerator object acc.  It\n" +
   "should be used when the cached information is no longer\n" +
   "applicable---for example, when switching to a new dataset."},
 {:func_name=>"gsl_interp_alloc",
  :func_type=>"gsl_interp *",
  :args=>[["const gsl_interp_type *", "T"], ["size_t", "size"]],
  :desc=>
   "This function returns a pointer to a newly allocated interpolation\n" +
   "object of type T for size data-points."},
 {:func_name=>"gsl_interp_bsearch",
  :func_type=>"size_t",
  :args=>
   [["const double", "x_array[]"],
    ["double", "x"],
    ["size_t", "index_lo"],
    ["size_t", "index_hi"]],
  :desc=>
   "This function returns the index i of the array x_array such\n" +
   "that x_array[i] <= x < x_array[i+1].  The index is searched for\n" +
   "in the range [index_lo, index_hi]. |inlinefn|"},
 {:func_name=>"gsl_interp_eval",
  :func_type=>"double",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>
   "These functions return the interpolated value of y for a given\n" +
   "point x, using the interpolation object interp, data\n" +
   "arrays xa and ya and the accelerator acc.  When\n" +
   "x is outside the range of xa, the error code\n" +
   "GSL_EDOM is returned with a value of GSL_NAN for\n" +
   "y."},
 {:func_name=>"gsl_interp_eval_deriv",
  :func_type=>"double",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>
   "These functions return the derivative d of an interpolated\n" +
   "function for a given point x, using the interpolation object\n" +
   "interp, data arrays xa and ya and the accelerator\n" +
   "acc. "},
 {:func_name=>"gsl_interp_eval_deriv2",
  :func_type=>"double",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>
   "These functions return the second derivative d2 of an interpolated\n" +
   "function for a given point x, using the interpolation object\n" +
   "interp, data arrays xa and ya and the accelerator\n" +
   "acc. "},
 {:func_name=>"gsl_interp_eval_deriv2_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "d2"]],
  :desc=>
   "These functions return the second derivative d2 of an interpolated\n" +
   "function for a given point x, using the interpolation object\n" +
   "interp, data arrays xa and ya and the accelerator\n" +
   "acc. "},
 {:func_name=>"gsl_interp_eval_deriv_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "d"]],
  :desc=>
   "These functions return the derivative d of an interpolated\n" +
   "function for a given point x, using the interpolation object\n" +
   "interp, data arrays xa and ya and the accelerator\n" +
   "acc. "},
 {:func_name=>"gsl_interp_eval_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "y"]],
  :desc=>
   "These functions return the interpolated value of y for a given\n" +
   "point x, using the interpolation object interp, data\n" +
   "arrays xa and ya and the accelerator acc.  When\n" +
   "x is outside the range of xa, the error code\n" +
   "GSL_EDOM is returned with a value of GSL_NAN for\n" +
   "y."},
 {:func_name=>"gsl_interp_eval_integ",
  :func_type=>"double",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "a"],
    ["double", "b"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>
   "These functions return the numerical integral result of an\n" +
   "interpolated function over the range [a, b], using the\n" +
   "interpolation object interp, data arrays xa and ya and\n" +
   "the accelerator acc."},
 {:func_name=>"gsl_interp_eval_integ_e",
  :func_type=>"int",
  :args=>
   [["const gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["double", "a"],
    ["double", "b"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "result"]],
  :desc=>
   "These functions return the numerical integral result of an\n" +
   "interpolated function over the range [a, b], using the\n" +
   "interpolation object interp, data arrays xa and ya and\n" +
   "the accelerator acc."},
 {:func_name=>"gsl_interp_free",
  :func_type=>"void",
  :args=>[["gsl_interp *", "interp"]],
  :desc=>"This function frees the interpolation object interp."},
 {:func_name=>"gsl_interp_init",
  :func_type=>"int",
  :args=>
   [["gsl_interp *", "interp"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["size_t", "size"]],
  :desc=>
   "This function initializes the interpolation object interp for the\n" +
   "data (xa, ya) where xa and ya are arrays of size\n" +
   "size.  The interpolation object (:type:`gsl_interp`) does not save\n" +
   "the data arrays xa and ya and only stores the static state\n" +
   "computed from the data.  The xa data array is always assumed to be\n" +
   "strictly ordered, with increasing x values; \n" +
   "the behavior for other arrangements is not defined."},
 {:func_name=>"gsl_interp_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_interp *", "interp"]],
  :desc=>
   "These functions return the minimum number of points required by the\n" +
   "interpolation object interp or interpolation type T.  For\n" +
   "example, Akima spline interpolation requires a minimum of 5 points."},
 {:func_name=>"gsl_interp_name",
  :func_type=>"const char *",
  :args=>[["const gsl_interp *", "interp"]],
  :desc=>
   "This function returns the name of the interpolation type used by interp.\n" +
   "For example::\n" +
   "would print something like::"},
 {:func_name=>"gsl_interp_type_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_interp_type *", "T"]],
  :desc=>
   "These functions return the minimum number of points required by the\n" +
   "interpolation object interp or interpolation type T.  For\n" +
   "example, Akima spline interpolation requires a minimum of 5 points."},
 {:func_name=>"gsl_spline2d_alloc",
  :func_type=>"gsl_spline2d *",
  :args=>
   [["const gsl_interp2d_type *", "T"],
    ["size_t", "xsize"],
    ["size_t", "ysize"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_x",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_x_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_xx",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_xx_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_xy",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_xy_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_y",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_y_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_yy",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_deriv_yy_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_eval_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "x"],
    ["const double", "y"],
    ["gsl_interp_accel *", "xacc"],
    ["gsl_interp_accel *", "yacc"],
    ["double *", "z"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_free",
  :func_type=>"void",
  :args=>[["gsl_spline2d *", "spline"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_get",
  :func_type=>"double",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["const double", "za[]"],
    ["const size_t", "i"],
    ["const size_t", "j"]],
  :desc=>
   "This function returns the value z_{ij} for grid point\n" +
   "(i, j) stored in the array za."},
 {:func_name=>"gsl_spline2d_init",
  :func_type=>"int",
  :args=>
   [["gsl_spline2d *", "spline"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "za[]"],
    ["size_t", "xsize"],
    ["size_t", "ysize"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_spline2d *", "spline"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_name",
  :func_type=>"const char *",
  :args=>[["const gsl_spline2d *", "spline"]],
  :desc=>""},
 {:func_name=>"gsl_spline2d_set",
  :func_type=>"int",
  :args=>
   [["const gsl_spline2d *", "spline"],
    ["double", "za[]"],
    ["const size_t", "i"],
    ["const size_t", "j"],
    ["const double", "z"]],
  :desc=>""},
 {:func_name=>"gsl_spline_alloc",
  :func_type=>"gsl_spline *",
  :args=>[["const gsl_interp_type *", "T"], ["size_t", "size"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval",
  :func_type=>"double",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_deriv",
  :func_type=>"double",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_deriv2",
  :func_type=>"double",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_deriv2_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "d2"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_deriv_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "d"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "x"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "y"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_integ",
  :func_type=>"double",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "a"],
    ["double", "b"],
    ["gsl_interp_accel *", "acc"]],
  :desc=>""},
 {:func_name=>"gsl_spline_eval_integ_e",
  :func_type=>"int",
  :args=>
   [["const gsl_spline *", "spline"],
    ["double", "a"],
    ["double", "b"],
    ["gsl_interp_accel *", "acc"],
    ["double *", "result"]],
  :desc=>""},
 {:func_name=>"gsl_spline_free",
  :func_type=>"void",
  :args=>[["gsl_spline *", "spline"]],
  :desc=>""},
 {:func_name=>"gsl_spline_init",
  :func_type=>"int",
  :args=>
   [["gsl_spline *", "spline"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["size_t", "size"]],
  :desc=>""},
 {:func_name=>"gsl_spline_min_size",
  :func_type=>"unsigned int",
  :args=>[["const gsl_spline *", "spline"]],
  :desc=>""},
 {:func_name=>"gsl_spline_name",
  :func_type=>"const char *",
  :args=>[["const gsl_spline *", "spline"]],
  :desc=>""}]

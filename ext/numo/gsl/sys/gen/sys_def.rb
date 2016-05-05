[{:func_name=>"gsl_isnan",
  :func_type=>"int",
  :args=>[["const double", "x"]],
  :desc=>"This function returns 1 if x is not-a-number."},
 {:func_name=>"gsl_isinf",
  :func_type=>"int",
  :args=>[["const double", "x"]],
  :desc=>
   "This function returns +1 if x is positive infinity,\n-1 if x is negative infinity and 0\notherwise.Note that the C99 standard only requires the\nsystem isinf function to return a non-zero value, without the\nsign of the infinity.  The implementation in some earlier versions of\nGSL used the system isinf function and may have this behavior\non some platforms.  Therefore, it is advisable to test the sign of\nx separately, if needed, rather than relying the sign of the\nreturn value from gsl_isinf()."},
 {:func_name=>"gsl_finite",
  :func_type=>"int",
  :args=>[["const double", "x"]],
  :desc=>
   "This function returns 1 if x is a real number, and 0 if it is\ninfinite or not-a-number."},
 {:func_name=>"gsl_log1p",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "This function computes the value of \\log(1+x) in a way that is\naccurate for small x. It provides an alternative to the BSD math\nfunction log1p(x)."},
 {:func_name=>"gsl_expm1",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "This function computes the value of \\exp(x)-1 in a way that is\naccurate for small x. It provides an alternative to the BSD math\nfunction expm1(x)."},
 {:func_name=>"gsl_hypot",
  :func_type=>"double",
  :args=>[["const double", "x"], ["const double", "y"]],
  :desc=>
   "This function computes the value of\n$\\sqrt{x^2 + y^2}$\n\\sqrt@{x^2 + y^2@} in a way that avoids overflow. It provides an\nalternative to the BSD math function hypot(x,y)."},
 {:func_name=>"gsl_hypot3",
  :func_type=>"double",
  :args=>[["const double", "x"], ["const double", "y"], ["const double", "z"]],
  :desc=>
   "This function computes the value of\n$\\sqrt{x^2 + y^2 + z^2}$\n\\sqrt@{x^2 + y^2 + z^2@} in a way that avoids overflow."},
 {:func_name=>"gsl_acosh",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "This function computes the value of \\arccosh(x). It provides an\nalternative to the standard math function acosh(x)."},
 {:func_name=>"gsl_asinh",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "This function computes the value of \\arcsinh(x). It provides an\nalternative to the standard math function asinh(x)."},
 {:func_name=>"gsl_atanh",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "This function computes the value of \\arctanh(x). It provides an\nalternative to the standard math function atanh(x)."},
 {:func_name=>"gsl_ldexp",
  :func_type=>"double",
  :args=>[["double", "x"], ["int", "e"]],
  :desc=>
   "This function computes the value of x * 2^e. It provides an\nalternative to the standard math function ldexp(x,e)."},
 {:func_name=>"gsl_frexp",
  :func_type=>"double",
  :args=>[["double", "x"], ["int *", "e"]],
  :desc=>
   "This function splits the number x into its normalized fraction\nf and exponent e, such that x = f * 2^e and\n$0.5 \\le f < 1$\n0.5 <= f < 1. The function returns f and stores the\nexponent in e. If x is zero, both f and e\nare set to zero. This function provides an alternative to the standard\nmath function frexp(x, e)."},
 {:func_name=>"gsl_pow_int",
  :func_type=>"double",
  :args=>[["double", "x"], ["int", "n"]],
  :desc=>
   "These routines computes the power x^n for integer n.  The\npower is computed efficiently---for example, x^8 is computed as\n((x^2)^2)^2, requiring only 3 multiplications.  A version of this\nfunction which also computes the numerical error in the result is\navailable as gsl_sf_pow_int_e."},
 {:func_name=>"gsl_pow_uint",
  :func_type=>"double",
  :args=>[["double", "x"], ["unsigned int", "n"]],
  :desc=>
   "These routines computes the power x^n for integer n.  The\npower is computed efficiently---for example, x^8 is computed as\n((x^2)^2)^2, requiring only 3 multiplications.  A version of this\nfunction which also computes the numerical error in the result is\navailable as gsl_sf_pow_int_e."},
 {:func_name=>"gsl_pow_2",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_3",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_4",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_5",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_6",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_7",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_8",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"gsl_pow_9",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These functions can be used to compute small integer powers x^2,\nx^3, etc. efficiently. The functions will be inlined when \nHAVE_INLINE is defined, so that use of these functions \nshould be as efficient as explicitly writing the corresponding \nproduct expression."},
 {:func_name=>"GSL_MAX_DBL",
  :func_type=>"extern inline double",
  :args=>[["double", "a"], ["double", "b"]],
  :desc=>
   "This function returns the maximum of the double precision numbers\na and b using an inline function. The use of a function\nallows for type checking of the arguments as an extra safety feature. On\nplatforms where inline functions are not available the macro\nGSL_MAX will be automatically substituted."},
 {:func_name=>"GSL_MIN_DBL",
  :func_type=>"extern inline double",
  :args=>[["double", "a"], ["double", "b"]],
  :desc=>
   "This function returns the minimum of the double precision numbers\na and b using an inline function. The use of a function\nallows for type checking of the arguments as an extra safety feature. On\nplatforms where inline functions are not available the macro\nGSL_MIN will be automatically substituted."},
 {:func_name=>"GSL_MAX_INT",
  :func_type=>"extern inline int",
  :args=>[["int", "a"], ["int", "b"]],
  :desc=>
   "These functions return the maximum or minimum of the integers a\nand b using an inline function.  On platforms where inline\nfunctions are not available the macros GSL_MAX or GSL_MIN\nwill be automatically substituted."},
 {:func_name=>"GSL_MIN_INT",
  :func_type=>"extern inline int",
  :args=>[["int", "a"], ["int", "b"]],
  :desc=>
   "These functions return the maximum or minimum of the integers a\nand b using an inline function.  On platforms where inline\nfunctions are not available the macros GSL_MAX or GSL_MIN\nwill be automatically substituted."},
 {:func_name=>"GSL_MAX_LDBL",
  :func_type=>"extern inline long double",
  :args=>[["long double", "a"], ["long double", "b"]],
  :desc=>
   "These functions return the maximum or minimum of the long doubles a\nand b using an inline function.  On platforms where inline\nfunctions are not available the macros GSL_MAX or GSL_MIN\nwill be automatically substituted."},
 {:func_name=>"GSL_MIN_LDBL",
  :func_type=>"extern inline long double",
  :args=>[["long double", "a"], ["long double", "b"]],
  :desc=>
   "These functions return the maximum or minimum of the long doubles a\nand b using an inline function.  On platforms where inline\nfunctions are not available the macros GSL_MAX or GSL_MIN\nwill be automatically substituted."},
 {:func_name=>"gsl_fcmp",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "y"], ["double", "epsilon"]],
  :desc=>
   "This function determines whether x and y are approximately\nequal to a relative accuracy epsilon.\n\nThe relative accuracy is measured using an interval of size 2\n\\delta, where \\delta = 2^k \\epsilon and k is the\nmaximum base-2 exponent of x and y as computed by the\nfunction frexp.  \n\nIf x and y lie within this interval, they are considered\napproximately equal and the function returns 0. Otherwise if x <\ny, the function returns -1, or if x > y, the function returns\n+1.\n\nNote that x and y are compared to relative accuracy, so\nthis function is not suitable for testing whether a value is\napproximately zero. \n\nThe implementation is based on the package fcmp by T.C. Belding."}]

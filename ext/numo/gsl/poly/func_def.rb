[{:func_name=>"gsl_poly_eval",
  :func_type=>"double",
  :args=>
   [["const double", "c[]"], ["const int", "len"], ["const double", "x"]],
  :desc=>
   "This function evaluates a polynomial with real coefficients for the real variable x."},
 {:func_name=>"gsl_poly_complex_eval",
  :func_type=>"gsl_complex",
  :args=>
   [["const double", "c[]"], ["const int", "len"], ["const gsl_complex", "z"]],
  :desc=>
   "This function evaluates a polynomial with real coefficients for the complex variable z."},
 {:func_name=>"gsl_complex_poly_complex_eval",
  :func_type=>"gsl_complex",
  :args=>
   [["const gsl_complex", "c[]"],
    ["const int", "len"],
    ["const gsl_complex", "z"]],
  :desc=>
   "This function evaluates a polynomial with complex coefficients for the complex variable z."},
 {:func_name=>"gsl_poly_eval_derivs",
  :func_type=>"int",
  :args=>
   [["const double", "c[]"],
    ["const size_t", "lenc"],
    ["const double", "x"],
    ["double", "res[]"],
    ["const size_t", "lenres"]],
  :desc=>
   "This function evaluates a polynomial and its derivatives storing the\n" +
   "results in the array res of size lenres.  The output array\n" +
   "contains the values of d^k P/d x^k for the specified value of\n" +
   "x starting with k = 0."},
 {:func_name=>"gsl_poly_dd_init",
  :func_type=>"int",
  :args=>
   [["double", "dd[]"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["size_t", "size"]],
  :desc=>
   "This function computes a divided-difference representation of the\n" +
   "interpolating polynomial for the points (x, y) stored in\n" +
   "the arrays xa and ya of length size.  On output the\n" +
   "divided-differences of (xa,ya) are stored in the array\n" +
   "dd, also of length size. Using the notation above,\n" +
   "dd[k] = [x_0,x_1,...,x_k]."},
 {:func_name=>"gsl_poly_dd_eval",
  :func_type=>"double",
  :args=>
   [["const double", "dd[]"],
    ["const double", "xa[]"],
    ["const size_t", "size"],
    ["const double", "x"]],
  :desc=>
   "This function evaluates the polynomial stored in divided-difference form\n" +
   "in the arrays dd and xa of length size at the point\n" +
   "x.  "},
 {:func_name=>"gsl_poly_dd_taylor",
  :func_type=>"int",
  :args=>
   [["double", "c[]"],
    ["double", "xp"],
    ["const double", "dd[]"],
    ["const double", "xa[]"],
    ["size_t", "size"],
    ["double", "w[]"]],
  :desc=>
   "This function converts the divided-difference representation of a\n" +
   "polynomial to a Taylor expansion.  The divided-difference representation\n" +
   "is supplied in the arrays dd and xa of length size.\n" +
   "On output the Taylor coefficients of the polynomial expanded about the\n" +
   "point xp are stored in the array c also of length\n" +
   "size.  A workspace of length size must be provided in the\n" +
   "array w."},
 {:func_name=>"gsl_poly_dd_hermite_init",
  :func_type=>"int",
  :args=>
   [["double", "dd[]"],
    ["double", "za[]"],
    ["const double", "xa[]"],
    ["const double", "ya[]"],
    ["const double", "dya[]"],
    ["const size_t", "size"]],
  :desc=>
   "This function computes a divided-difference representation of the\n" +
   "interpolating Hermite polynomial for the points (x, y) stored in\n" +
   "the arrays xa and ya of length size. Hermite interpolation\n" +
   "constructs polynomials which also match first derivatives dy/dx which are\n" +
   "provided in the array dya also of length size. The first derivatives can be\n" +
   "incorported into the usual divided-difference algorithm by forming a new\n" +
   "dataset z = \\{x_0,x_0,x_1,x_1,...\\}, which is stored in the array\n" +
   "za of length 2*size on output. On output the\n" +
   "divided-differences of the Hermite representation are stored in the array\n" +
   "dd, also of length 2*size. Using the notation above,\n" +
   "dd[k] = [z_0,z_1,...,z_k]. The resulting Hermite polynomial\n" +
   "can be evaluated by calling gsl_poly_dd_eval and using\n" +
   "za for the input argument xa."},
 {:func_name=>"gsl_poly_solve_quadratic",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["double *", "x0"],
    ["double *", "x1"]],
  :desc=>
   "This function finds the real roots of the quadratic equation,\n" +
   "\n" +
   "a x^2 + b x + c = 0\n" +
   "\n" +
   "The number of real roots (either zero, one or two) is returned, and\n" +
   "their locations are stored in x0 and x1.  If no real roots\n" +
   "are found then x0 and x1 are not modified.  If one real root\n" +
   "is found (i.e. if a=0) then it is stored in x0.  When two\n" +
   "real roots are found they are stored in x0 and x1 in\n" +
   "ascending order.  The case of coincident roots is not considered\n" +
   "special.  For example (x-1)^2=0 will have two roots, which happen\n" +
   "to have exactly equal values.\n" +
   "\n" +
   "The number of roots found depends on the sign of the discriminant\n" +
   "b^2 - 4 a c.  This will be subject to rounding and cancellation\n" +
   "errors when computed in double precision, and will also be subject to\n" +
   "errors if the coefficients of the polynomial are inexact.  These errors\n" +
   "may cause a discrete change in the number of roots.  However, for\n" +
   "polynomials with small integer coefficients the discriminant can always\n" +
   "be computed exactly.\n"},
 {:func_name=>"gsl_poly_complex_solve_quadratic",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["gsl_complex *", "z0"],
    ["gsl_complex *", "z1"]],
  :desc=>
   "\n" +
   "This function finds the complex roots of the quadratic equation,\n" +
   "\n" +
   "a z^2 + b z + c = 0\n" +
   "\n" +
   "The number of complex roots is returned (either one or two) and the\n" +
   "locations of the roots are stored in z0 and z1.  The roots\n" +
   "are returned in ascending order, sorted first by their real components\n" +
   "and then by their imaginary components.  If only one real root is found\n" +
   "(i.e. if a=0) then it is stored in z0.\n"},
 {:func_name=>"gsl_poly_solve_cubic",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["double *", "x0"],
    ["double *", "x1"],
    ["double *", "x2"]],
  :desc=>
   "\n" +
   "This function finds the real roots of the cubic equation,\n" +
   "\n" +
   "x^3 + a x^2 + b x + c = 0\n" +
   "\n" +
   "with a leading coefficient of unity.  The number of real roots (either\n" +
   "one or three) is returned, and their locations are stored in x0,\n" +
   "x1 and x2.  If one real root is found then only x0\n" +
   "is modified.  When three real roots are found they are stored in\n" +
   "x0, x1 and x2 in ascending order.  The case of\n" +
   "coincident roots is not considered special.  For example, the equation\n" +
   "(x-1)^3=0 will have three roots with exactly equal values.  As\n" +
   "in the quadratic case, finite precision may cause equal or\n" +
   "closely-spaced real roots to move off the real axis into the complex\n" +
   "plane, leading to a discrete change in the number of real roots."},
 {:func_name=>"gsl_poly_complex_solve_cubic",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["gsl_complex *", "z0"],
    ["gsl_complex *", "z1"],
    ["gsl_complex *", "z2"]],
  :desc=>
   "\n" +
   "This function finds the complex roots of the cubic equation,\n" +
   "\n" +
   "z^3 + a z^2 + b z + c = 0\n" +
   "\n" +
   "The number of complex roots is returned (always three) and the locations\n" +
   "of the roots are stored in z0, z1 and z2.  The roots\n" +
   "are returned in ascending order, sorted first by their real components\n" +
   "and then by their imaginary components.\n"},
 {:func_name=>"gsl_poly_complex_workspace_alloc",
  :func_type=>"gsl_poly_complex_workspace *",
  :args=>[["size_t", "n"]],
  :desc=>
   "This function allocates space for a gsl_poly_complex_workspace\n" +
   "struct and a workspace suitable for solving a polynomial with n\n" +
   "coefficients using the routine gsl_poly_complex_solve.\n" +
   "\n" +
   "The function returns a pointer to the newly allocated\n" +
   "gsl_poly_complex_workspace if no errors were detected, and a null\n" +
   "pointer in the case of error."},
 {:func_name=>"gsl_poly_complex_workspace_free",
  :func_type=>"void",
  :args=>[["gsl_poly_complex_workspace *", "w"]],
  :desc=>
   "This function frees all the memory associated with the workspace\n" +
   "w."},
 {:func_name=>"gsl_poly_complex_solve",
  :func_type=>"int",
  :args=>
   [["const double *", "a"],
    ["size_t", "n"],
    ["gsl_poly_complex_workspace *", "w"],
    ["gsl_complex_packed_ptr", "z"]],
  :desc=>
   "This function computes the roots of the general polynomial \n" +
   "$P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_{n-1} x^{n-1}$ \n" +
   "P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_@{n-1@} x^@{n-1@} using \n" +
   "balanced-QR reduction of the companion matrix.  The parameter n\n" +
   "specifies the length of the coefficient array.  The coefficient of the\n" +
   "highest order term must be non-zero.  The function requires a workspace\n" +
   "w of the appropriate size.  The n-1 roots are returned in\n" +
   "the packed complex array z of length 2(n-1), alternating\n" +
   "real and imaginary parts.\n" +
   "\n" +
   "The function returns GSL_SUCCESS if all the roots are found. If\n" +
   "the QR reduction does not converge, the error handler is invoked with\n" +
   "an error code of GSL_EFAILED.  Note that due to finite precision,\n" +
   "roots of higher multiplicity are returned as a cluster of simple roots\n" +
   "with reduced accuracy.  The solution of polynomials with higher-order\n" +
   "roots requires specialized algorithms that take the multiplicity\n" +
   "structure into account (see e.g. Z. Zeng, Algorithm 835, ACM\n" +
   "Transactions on Mathematical Software, Volume 30, Issue 2 (2004), pp\n" +
   "218--236)."}]

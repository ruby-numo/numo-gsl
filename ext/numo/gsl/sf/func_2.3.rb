[{:func_name=>"gsl_sf_log",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the logarithm of x, \\log(x), for\n" +
   "x > 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of x, \\log(x), for\n" +
   "x > 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_abs",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the logarithm of the magnitude of x,\n" +
   "\\log(|x|), for x \\ne 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_abs_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the magnitude of x,\n" +
   "\\log(|x|), for x \\ne 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_complex_log_e",
  :func_type=>"int",
  :args=>
   [["double", "zr"],
    ["double", "zi"],
    ["gsl_sf_result *", "lnr"],
    ["gsl_sf_result *", "theta"]],
  :desc=>
   "This routine computes the complex logarithm of z = z_r + i\n" +
   "z_i. The results are returned as lnr, theta such that\n" +
   "\\exp(lnr + i \\theta) = z_r + i z_i, where \\theta lies in\n" +
   "the range [-\\pi,\\pi].\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_1plusx",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute \\log(1 + x) for x > -1 using an\n" +
   "algorithm that is accurate for small x.\n" +
   "Domain: x > -1.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_1plusx_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\log(1 + x) for x > -1 using an\n" +
   "algorithm that is accurate for small x.\n" +
   "Domain: x > -1.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_1plusx_mx",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute \\log(1 + x) - x for x > -1 using an\n" +
   "algorithm that is accurate for small x.\n" +
   "Domain: x > -1.0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_log_1plusx_mx_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\log(1 + x) - x for x > -1 using an\n" +
   "algorithm that is accurate for small x.\n" +
   "Domain: x > -1.0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_sin",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the sine function \\sin(x).\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_sin_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the sine function \\sin(x).\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_cos",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the cosine function \\cos(x).\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_cos_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the cosine function \\cos(x).\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_hypot",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "y"]],
  :desc=>
   "These routines compute the hypotenuse function $\\sqrt{x^2 + y^2}$\n" +
   "\\sqrt@{x^2 + y^2@} avoiding overflow and underflow.\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_hypot_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "y"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the hypotenuse function $\\sqrt{x^2 + y^2}$\n" +
   "\\sqrt@{x^2 + y^2@} avoiding overflow and underflow.\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_sinc",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute \\sinc(x) = \\sin(\\pi x) / (\\pi x) for any\n" +
   "value of x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_sinc_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\sinc(x) = \\sin(\\pi x) / (\\pi x) for any\n" +
   "value of x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_complex_sin_e",
  :func_type=>"int",
  :args=>
   [["double", "zr"],
    ["double", "zi"],
    ["gsl_sf_result *", "szr"],
    ["gsl_sf_result *", "szi"]],
  :desc=>
   "This function computes the complex sine, \\sin(z_r + i z_i) storing\n" +
   "the real and imaginary parts in szr, szi.\n" +
   "Exceptional Return Values: GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_complex_cos_e",
  :func_type=>"int",
  :args=>
   [["double", "zr"],
    ["double", "zi"],
    ["gsl_sf_result *", "czr"],
    ["gsl_sf_result *", "czi"]],
  :desc=>
   "This function computes the complex cosine, \\cos(z_r + i z_i) storing\n" +
   "the real and imaginary parts in czr, czi.\n" +
   "Exceptional Return Values: GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_complex_logsin_e",
  :func_type=>"int",
  :args=>
   [["double", "zr"],
    ["double", "zi"],
    ["gsl_sf_result *", "lszr"],
    ["gsl_sf_result *", "lszi"]],
  :desc=>
   "This function computes the logarithm of the complex sine,\n" +
   "\\log(\\sin(z_r + i z_i)) storing the real and imaginary parts in\n" +
   "lszr, lszi.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_lnsinh",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute \\log(\\sinh(x)) for x > 0.\n" +
   "Domain: x > 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_lnsinh_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\log(\\sinh(x)) for x > 0.\n" +
   "Domain: x > 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_lncosh",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute \\log(\\cosh(x)) for any x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_lncosh_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\log(\\cosh(x)) for any x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_polar_to_rect",
  :func_type=>"int",
  :args=>
   [["double", "r"],
    ["double", "theta"],
    ["gsl_sf_result *", "x"],
    ["gsl_sf_result *", "y"]],
  :desc=>
   "This function converts the polar coordinates (r,theta) to\n" +
   "rectilinear coordinates (x,y), x = r\\cos(\\theta),\n" +
   "y = r\\sin(\\theta).\n" +
   "Exceptional Return Values: GSL_ELOSS"},
 {:func_name=>"gsl_sf_rect_to_polar",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["gsl_sf_result *", "r"],
    ["gsl_sf_result *", "theta"]],
  :desc=>
   "This function converts the rectilinear coordinates (x,y) to\n" +
   "polar coordinates (r,theta), such that x =\n" +
   "r\\cos(\\theta), y = r\\sin(\\theta).  The argument theta\n" +
   "lies in the range [-\\pi, \\pi].\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_angle_restrict_symm",
  :func_type=>"double",
  :args=>[["double", "theta"]],
  :desc=>
   "These routines force the angle theta to lie in the range\n" +
   "(-\\pi,\\pi].  \n" +
   "\n" +
   "Note that the mathematical value of \\pi is slightly greater\n" +
   "than M_PI, so the machine numbers M_PI and -M_PI\n" +
   "are included in the range.\n" +
   "Exceptional Return Values: GSL_ELOSS"},
 {:func_name=>"gsl_sf_angle_restrict_symm_e",
  :func_type=>"int",
  :args=>[["double *", "theta"]],
  :desc=>
   "These routines force the angle theta to lie in the range\n" +
   "(-\\pi,\\pi].  \n" +
   "\n" +
   "Note that the mathematical value of \\pi is slightly greater\n" +
   "than M_PI, so the machine numbers M_PI and -M_PI\n" +
   "are included in the range.\n" +
   "Exceptional Return Values: GSL_ELOSS"},
 {:func_name=>"gsl_sf_angle_restrict_pos",
  :func_type=>"double",
  :args=>[["double", "theta"]],
  :desc=>
   "These routines force the angle theta to lie in the range [0,\n" +
   "2\\pi). \n" +
   "\n" +
   "Note that the mathematical value of 2\\pi is slightly greater\n" +
   "than 2*M_PI, so the machine number 2*M_PI is included in\n" +
   "the range.\n" +
   "\n" +
   "Exceptional Return Values: GSL_ELOSS"},
 {:func_name=>"gsl_sf_angle_restrict_pos_e",
  :func_type=>"int",
  :args=>[["double *", "theta"]],
  :desc=>
   "These routines force the angle theta to lie in the range [0,\n" +
   "2\\pi). \n" +
   "\n" +
   "Note that the mathematical value of 2\\pi is slightly greater\n" +
   "than 2*M_PI, so the machine number 2*M_PI is included in\n" +
   "the range.\n" +
   "\n" +
   "Exceptional Return Values: GSL_ELOSS"},
 {:func_name=>"gsl_sf_sin_err_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "dx"], ["gsl_sf_result *", "result"]],
  :desc=>
   "This routine computes the sine of an angle x with an associated \n" +
   "absolute error dx,\n" +
   "$\\sin(x \\pm dx)$\n" +
   "\\sin(x \\pm dx).  Note that this function is provided in the error-handling form only since\n" +
   "its purpose is to compute the propagated error."},
 {:func_name=>"gsl_sf_cos_err_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "dx"], ["gsl_sf_result *", "result"]],
  :desc=>
   "This routine computes the cosine of an angle x with an associated\n" +
   "absolute error dx, \n" +
   "$\\cos(x \\pm dx)$\n" +
   "\\cos(x \\pm dx).  Note that this function is provided in the error-handling form only since\n" +
   "its purpose is to compute the propagated error."},
 {:func_name=>"gsl_sf_gamma",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Gamma function \\Gamma(x), subject to x\n" +
   "not being a negative integer or zero.  The function is computed using the real\n" +
   "Lanczos method. The maximum value of x such that \\Gamma(x) is not\n" +
   "considered an overflow is given by the macro GSL_SF_GAMMA_XMAX\n" +
   "and is 171.0.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EROUND"},
 {:func_name=>"gsl_sf_gamma_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Gamma function \\Gamma(x), subject to x\n" +
   "not being a negative integer or zero.  The function is computed using the real\n" +
   "Lanczos method. The maximum value of x such that \\Gamma(x) is not\n" +
   "considered an overflow is given by the macro GSL_SF_GAMMA_XMAX\n" +
   "and is 171.0.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EROUND"},
 {:func_name=>"gsl_sf_lngamma",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the logarithm of the Gamma function,\n" +
   "\\log(\\Gamma(x)), subject to x not being a negative\n" +
   "integer or zero.  For x<0 the real part of \\log(\\Gamma(x)) is\n" +
   "returned, which is equivalent to \\log(|\\Gamma(x)|).  The function\n" +
   "is computed using the real Lanczos method.\n" +
   "exceptions: GSL_EDOM, GSL_EROUND"},
 {:func_name=>"gsl_sf_lngamma_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the Gamma function,\n" +
   "\\log(\\Gamma(x)), subject to x not being a negative\n" +
   "integer or zero.  For x<0 the real part of \\log(\\Gamma(x)) is\n" +
   "returned, which is equivalent to \\log(|\\Gamma(x)|).  The function\n" +
   "is computed using the real Lanczos method.\n" +
   "exceptions: GSL_EDOM, GSL_EROUND"},
 {:func_name=>"gsl_sf_lngamma_sgn_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_sf_result *", "result_lg"], ["double *", "sgn"]],
  :desc=>
   "This routine computes the sign of the gamma function and the logarithm of\n" +
   "its magnitude, subject to x not being a negative integer or zero.  The\n" +
   "function is computed using the real Lanczos method.  The value of the\n" +
   "gamma function and its error can be reconstructed using the relation \n" +
   "\\Gamma(x) = sgn * \\exp(result\\_lg), taking into account the two \n" +
   "components of result_lg.\n" +
   "exceptions: GSL_EDOM, GSL_EROUND"},
 {:func_name=>"gsl_sf_gammastar",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regulated Gamma Function \\Gamma^*(x)\n" +
   "for x > 0. The regulated gamma function is given by,\n" +
   "\n" +
   "\\Gamma^*(x) = \\Gamma(x)/(\\sqrt@{2\\pi@} x^@{(x-1/2)@} \\exp(-x))\n" +
   "            = (1 + (1/12x) + ...)  for x \\to \\infty\n" +
   "and is a useful suggestion of Temme.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gammastar_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regulated Gamma Function \\Gamma^*(x)\n" +
   "for x > 0. The regulated gamma function is given by,\n" +
   "\n" +
   "\\Gamma^*(x) = \\Gamma(x)/(\\sqrt@{2\\pi@} x^@{(x-1/2)@} \\exp(-x))\n" +
   "            = (1 + (1/12x) + ...)  for x \\to \\infty\n" +
   "and is a useful suggestion of Temme.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gammainv",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the reciprocal of the gamma function,\n" +
   "1/\\Gamma(x) using the real Lanczos method.\n" +
   "exceptions: GSL_EUNDRFLW, GSL_EROUND"},
 {:func_name=>"gsl_sf_gammainv_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the reciprocal of the gamma function,\n" +
   "1/\\Gamma(x) using the real Lanczos method.\n" +
   "exceptions: GSL_EUNDRFLW, GSL_EROUND"},
 {:func_name=>"gsl_sf_lngamma_complex_e",
  :func_type=>"int",
  :args=>
   [["double", "zr"],
    ["double", "zi"],
    ["gsl_sf_result *", "lnr"],
    ["gsl_sf_result *", "arg"]],
  :desc=>
   "This routine computes \\log(\\Gamma(z)) for complex z=z_r+i\n" +
   "z_i and z not a negative integer or zero, using the complex Lanczos\n" +
   "method.  The returned parameters are lnr = \\log|\\Gamma(z)| and\n" +
   "arg = \\arg(\\Gamma(z)) in (-\\pi,\\pi].  Note that the phase\n" +
   "part (arg) is not well-determined when |z| is very large,\n" +
   "due to inevitable roundoff in restricting to (-\\pi,\\pi].  This\n" +
   "will result in a GSL_ELOSS error when it occurs.  The absolute\n" +
   "value part (lnr), however, never suffers from loss of precision.\n" +
   "exceptions: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_fact",
  :func_type=>"double",
  :args=>[["unsigned int", "n"]],
  :desc=>
   "These routines compute the factorial n!.  The factorial is\n" +
   "related to the Gamma function by n! = \\Gamma(n+1).\n" +
   "The maximum value of n such that n! is not\n" +
   "considered an overflow is given by the macro GSL_SF_FACT_NMAX\n" +
   "and is 170.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fact_e",
  :func_type=>"int",
  :args=>[["unsigned int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the factorial n!.  The factorial is\n" +
   "related to the Gamma function by n! = \\Gamma(n+1).\n" +
   "The maximum value of n such that n! is not\n" +
   "considered an overflow is given by the macro GSL_SF_FACT_NMAX\n" +
   "and is 170.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_doublefact",
  :func_type=>"double",
  :args=>[["unsigned int", "n"]],
  :desc=>
   "These routines compute the double factorial n!! = n(n-2)(n-4) \\dots. \n" +
   "The maximum value of n such that n!! is not\n" +
   "considered an overflow is given by the macro GSL_SF_DOUBLEFACT_NMAX\n" +
   "and is 297.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_doublefact_e",
  :func_type=>"int",
  :args=>[["unsigned int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the double factorial n!! = n(n-2)(n-4) \\dots. \n" +
   "The maximum value of n such that n!! is not\n" +
   "considered an overflow is given by the macro GSL_SF_DOUBLEFACT_NMAX\n" +
   "and is 297.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_lnfact",
  :func_type=>"double",
  :args=>[["unsigned int", "n"]],
  :desc=>
   "These routines compute the logarithm of the factorial of n,\n" +
   "\\log(n!).  The algorithm is faster than computing\n" +
   "\\ln(\\Gamma(n+1)) via gsl_sf_lngamma for n < 170,\n" +
   "but defers for larger n.\n" +
   "exceptions: none"},
 {:func_name=>"gsl_sf_lnfact_e",
  :func_type=>"int",
  :args=>[["unsigned int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the factorial of n,\n" +
   "\\log(n!).  The algorithm is faster than computing\n" +
   "\\ln(\\Gamma(n+1)) via gsl_sf_lngamma for n < 170,\n" +
   "but defers for larger n.\n" +
   "exceptions: none"},
 {:func_name=>"gsl_sf_lndoublefact",
  :func_type=>"double",
  :args=>[["unsigned int", "n"]],
  :desc=>
   "These routines compute the logarithm of the double factorial of n,\n" +
   "\\log(n!!).\n" +
   "exceptions: none"},
 {:func_name=>"gsl_sf_lndoublefact_e",
  :func_type=>"int",
  :args=>[["unsigned int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the double factorial of n,\n" +
   "\\log(n!!).\n" +
   "exceptions: none"},
 {:func_name=>"gsl_sf_choose",
  :func_type=>"double",
  :args=>[["unsigned int", "n"], ["unsigned int", "m"]],
  :desc=>
   "These routines compute the combinatorial factor n choose m\n" +
   "= n!/(m!(n-m)!)\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_choose_e",
  :func_type=>"int",
  :args=>
   [["unsigned int", "n"],
    ["unsigned int", "m"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the combinatorial factor n choose m\n" +
   "= n!/(m!(n-m)!)\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_lnchoose",
  :func_type=>"double",
  :args=>[["unsigned int", "n"], ["unsigned int", "m"]],
  :desc=>
   "These routines compute the logarithm of n choose m.  This is\n" +
   "equivalent to the sum \\log(n!) - \\log(m!) - \\log((n-m)!).\n" +
   "exceptions: GSL_EDOM "},
 {:func_name=>"gsl_sf_lnchoose_e",
  :func_type=>"int",
  :args=>
   [["unsigned int", "n"],
    ["unsigned int", "m"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of n choose m.  This is\n" +
   "equivalent to the sum \\log(n!) - \\log(m!) - \\log((n-m)!).\n" +
   "exceptions: GSL_EDOM "},
 {:func_name=>"gsl_sf_taylorcoeff",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the Taylor coefficient x^n / n! for \n" +
   "$x \\ge 0$\n" +
   "x >= 0, \n" +
   "$n \\ge 0$\n" +
   "n >= 0.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_taylorcoeff_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Taylor coefficient x^n / n! for \n" +
   "$x \\ge 0$\n" +
   "x >= 0, \n" +
   "$n \\ge 0$\n" +
   "n >= 0.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_poch",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines compute the Pochhammer symbol (a)_x = \\Gamma(a +\n" +
   "x)/\\Gamma(a).  The Pochhammer symbol is also known as the Apell symbol and\n" +
   "sometimes written as (a,x).  When a and a+x \n" +
   "are negative integers or zero, the limiting value of the ratio is returned. \n" +
   "exceptions:  GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_poch_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Pochhammer symbol (a)_x = \\Gamma(a +\n" +
   "x)/\\Gamma(a).  The Pochhammer symbol is also known as the Apell symbol and\n" +
   "sometimes written as (a,x).  When a and a+x \n" +
   "are negative integers or zero, the limiting value of the ratio is returned. \n" +
   "exceptions:  GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_lnpoch",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines compute the logarithm of the Pochhammer symbol,\n" +
   "\\log((a)_x) = \\log(\\Gamma(a + x)/\\Gamma(a)).\n" +
   "exceptions:  GSL_EDOM"},
 {:func_name=>"gsl_sf_lnpoch_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the Pochhammer symbol,\n" +
   "\\log((a)_x) = \\log(\\Gamma(a + x)/\\Gamma(a)).\n" +
   "exceptions:  GSL_EDOM"},
 {:func_name=>"gsl_sf_lnpoch_sgn_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "x"],
    ["gsl_sf_result *", "result"],
    ["double *", "sgn"]],
  :desc=>
   "These routines compute the sign of the Pochhammer symbol and the\n" +
   "logarithm of its magnitude.  The computed parameters are result =\n" +
   "\\log(|(a)_x|) with a corresponding error term,  \n" +
   "and sgn = \\sgn((a)_x) where (a)_x =\n" +
   "\\Gamma(a + x)/\\Gamma(a).\n" +
   "exceptions:  GSL_EDOM"},
 {:func_name=>"gsl_sf_pochrel",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines compute the relative Pochhammer symbol ((a)_x -\n" +
   "1)/x where (a)_x = \\Gamma(a + x)/\\Gamma(a).\n" +
   "exceptions:  GSL_EDOM"},
 {:func_name=>"gsl_sf_pochrel_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the relative Pochhammer symbol ((a)_x -\n" +
   "1)/x where (a)_x = \\Gamma(a + x)/\\Gamma(a).\n" +
   "exceptions:  GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These functions compute the unnormalized incomplete Gamma Function\n" +
   "$\\Gamma(a,x) = \\int_x^\\infty dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "\\Gamma(a,x) = \\int_x^\\infty dt t^@{a-1@} \\exp(-t)\n" +
   "for a real and $x \\ge 0$\n" +
   "x >= 0.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions compute the unnormalized incomplete Gamma Function\n" +
   "$\\Gamma(a,x) = \\int_x^\\infty dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "\\Gamma(a,x) = \\int_x^\\infty dt t^@{a-1@} \\exp(-t)\n" +
   "for a real and $x \\ge 0$\n" +
   "x >= 0.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc_Q",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines compute the normalized incomplete Gamma Function\n" +
   "$Q(a,x) = 1/\\Gamma(a) \\int_x^\\infty dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "Q(a,x) = 1/\\Gamma(a) \\int_x^\\infty dt t^@{a-1@} \\exp(-t)\n" +
   "for a > 0, $x \\ge 0$\n" +
   "x >= 0.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc_Q_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the normalized incomplete Gamma Function\n" +
   "$Q(a,x) = 1/\\Gamma(a) \\int_x^\\infty dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "Q(a,x) = 1/\\Gamma(a) \\int_x^\\infty dt t^@{a-1@} \\exp(-t)\n" +
   "for a > 0, $x \\ge 0$\n" +
   "x >= 0.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc_P",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines compute the complementary normalized incomplete Gamma Function\n" +
   "$P(a,x) = 1 - Q(a,x) = 1/\\Gamma(a) \\int_0^x dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "P(a,x) = 1 - Q(a,x) = 1/\\Gamma(a) \\int_0^x dt t^@{a-1@} \\exp(-t)\n" +
   "for a > 0, $x \\ge 0$\n" +
   "x >= 0. \n" +
   "\n" +
   "Note that Abramowitz & Stegun call P(a,x) the incomplete gamma\n" +
   "function (section 6.5).\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_gamma_inc_P_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complementary normalized incomplete Gamma Function\n" +
   "$P(a,x) = 1 - Q(a,x) = 1/\\Gamma(a) \\int_0^x dt\\, t^{(a-1)} \\exp(-t)$\n" +
   "P(a,x) = 1 - Q(a,x) = 1/\\Gamma(a) \\int_0^x dt t^@{a-1@} \\exp(-t)\n" +
   "for a > 0, $x \\ge 0$\n" +
   "x >= 0. \n" +
   "\n" +
   "Note that Abramowitz & Stegun call P(a,x) the incomplete gamma\n" +
   "function (section 6.5).\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_beta",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"]],
  :desc=>
   "These routines compute the Beta Function, B(a,b) =\n" +
   "\\Gamma(a)\\Gamma(b)/\\Gamma(a+b) subject to a and b not\n" +
   "being negative integers.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_beta_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "b"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Beta Function, B(a,b) =\n" +
   "\\Gamma(a)\\Gamma(b)/\\Gamma(a+b) subject to a and b not\n" +
   "being negative integers.\n" +
   "exceptions: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_lnbeta",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"]],
  :desc=>
   "These routines compute the logarithm of the Beta Function, \\log(B(a,b))\n" +
   "subject to a and b not\n" +
   "being negative integers.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_lnbeta_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "b"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the Beta Function, \\log(B(a,b))\n" +
   "subject to a and b not\n" +
   "being negative integers.\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_beta_inc",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "x"]],
  :desc=>
   "These routines compute the normalized incomplete Beta function\n" +
   "I_x(a,b)=B_x(a,b)/B(a,b) where $B_x(a,b) = \\int_0^x t^{a-1} (1-t)^{b-1} dt$\n" +
   "B_x(a,b) = \\int_0^x t^@{a-1@} (1-t)^@{b-1@} dt\n" +
   "for $0 \\le x \\le 1$\n" +
   "0 <= x <= 1.   For a > 0, b > 0 the value is computed using\n" +
   "a continued fraction expansion.  For all other values it is computed using \n" +
   "the relation $I_x(a,b,x) = (1/a) x^a {}_2F_1(a,1-b,a+1,x)/B(a,b)$\n" +
   "I_x(a,b,x) = (1/a) x^a 2F1(a,1-b,a+1,x)/B(a,b)."},
 {:func_name=>"gsl_sf_beta_inc_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the normalized incomplete Beta function\n" +
   "I_x(a,b)=B_x(a,b)/B(a,b) where $B_x(a,b) = \\int_0^x t^{a-1} (1-t)^{b-1} dt$\n" +
   "B_x(a,b) = \\int_0^x t^@{a-1@} (1-t)^@{b-1@} dt\n" +
   "for $0 \\le x \\le 1$\n" +
   "0 <= x <= 1.   For a > 0, b > 0 the value is computed using\n" +
   "a continued fraction expansion.  For all other values it is computed using \n" +
   "the relation $I_x(a,b,x) = (1/a) x^a {}_2F_1(a,1-b,a+1,x)/B(a,b)$\n" +
   "I_x(a,b,x) = (1/a) x^a 2F1(a,1-b,a+1,x)/B(a,b)."},
 {:func_name=>"gsl_sf_transport_2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the transport function J(2,x).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_transport_2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the transport function J(2,x).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_transport_3",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the transport function J(3,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_transport_3_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the transport function J(3,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_transport_4",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the transport function J(4,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_transport_4_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the transport function J(4,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_transport_5",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the transport function J(5,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_transport_5_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the transport function J(5,x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_ellint_Kcomp",
  :func_type=>"double",
  :args=>[["double", "k"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the complete elliptic integral K(k) to\n" +
   "the accuracy specified by the mode variable mode.  \n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_Kcomp_e",
  :func_type=>"int",
  :args=>
   [["double", "k"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete elliptic integral K(k) to\n" +
   "the accuracy specified by the mode variable mode.  \n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_Ecomp",
  :func_type=>"double",
  :args=>[["double", "k"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the complete elliptic integral E(k) to the\n" +
   "accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_Ecomp_e",
  :func_type=>"int",
  :args=>
   [["double", "k"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete elliptic integral E(k) to the\n" +
   "accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_Pcomp",
  :func_type=>"double",
  :args=>[["double", "k"], ["double", "n"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the complete elliptic integral \\Pi(k,n) to the\n" +
   "accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameters m = k^2 and \\sin^2(\\alpha) = k^2, with the\n" +
   "change of sign n \\to -n.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_Pcomp_e",
  :func_type=>"int",
  :args=>
   [["double", "k"],
    ["double", "n"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete elliptic integral \\Pi(k,n) to the\n" +
   "accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameters m = k^2 and \\sin^2(\\alpha) = k^2, with the\n" +
   "change of sign n \\to -n.\n" +
   "Exceptional Return Values:  GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_F",
  :func_type=>"double",
  :args=>[["double", "phi"], ["double", "k"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral F(\\phi,k)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_F_e",
  :func_type=>"int",
  :args=>
   [["double", "phi"],
    ["double", "k"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral F(\\phi,k)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_E",
  :func_type=>"double",
  :args=>[["double", "phi"], ["double", "k"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral E(\\phi,k)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_E_e",
  :func_type=>"int",
  :args=>
   [["double", "phi"],
    ["double", "k"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral E(\\phi,k)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameter m = k^2.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_P",
  :func_type=>"double",
  :args=>
   [["double", "phi"],
    ["double", "k"],
    ["double", "n"],
    ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral \\Pi(\\phi,k,n)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameters m = k^2 and \\sin^2(\\alpha) = k^2, with the\n" +
   "change of sign n \\to -n.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_P_e",
  :func_type=>"int",
  :args=>
   [["double", "phi"],
    ["double", "k"],
    ["double", "n"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral \\Pi(\\phi,k,n)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Note that Abramowitz & Stegun define this function in terms of the\n" +
   "parameters m = k^2 and \\sin^2(\\alpha) = k^2, with the\n" +
   "change of sign n \\to -n.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_D",
  :func_type=>"double",
  :args=>[["double", "phi"], ["double", "k"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These functions compute the incomplete elliptic integral\n" +
   "D(\\phi,k) which is defined through the Carlson form RD(x,y,z)\n" +
   "by the following relation, \n" +
   "\n" +
   "D(\\phi,k) = (1/3)(\\sin(\\phi))^3 RD (1-\\sin^2(\\phi), 1-k^2 \\sin^2(\\phi), 1).\n" +
   "\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_D_e",
  :func_type=>"int",
  :args=>
   [["double", "phi"],
    ["double", "k"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions compute the incomplete elliptic integral\n" +
   "D(\\phi,k) which is defined through the Carlson form RD(x,y,z)\n" +
   "by the following relation, \n" +
   "\n" +
   "D(\\phi,k) = (1/3)(\\sin(\\phi))^3 RD (1-\\sin^2(\\phi), 1-k^2 \\sin^2(\\phi), 1).\n" +
   "\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RC",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "y"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RC(x,y)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RC_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RC(x,y)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RD",
  :func_type=>"double",
  :args=>
   [["double", "x"], ["double", "y"], ["double", "z"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RD(x,y,z)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RD_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["double", "z"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RD(x,y,z)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RF",
  :func_type=>"double",
  :args=>
   [["double", "x"], ["double", "y"], ["double", "z"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RF(x,y,z)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RF_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["double", "z"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RF(x,y,z)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RJ",
  :func_type=>"double",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["double", "z"],
    ["double", "p"],
    ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RJ(x,y,z,p)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_ellint_RJ_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "y"],
    ["double", "z"],
    ["double", "p"],
    ["gsl_mode_t", "mode"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete elliptic integral RJ(x,y,z,p)\n" +
   "to the accuracy specified by the mode variable mode.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_expint_E1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the exponential integral E_1(x),\n" +
   "\n" +
   "E_1(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_E1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the exponential integral E_1(x),\n" +
   "\n" +
   "E_1(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_E2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the second-order exponential integral E_2(x),\n" +
   "\n" +
   "E_2(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t^2.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_E2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the second-order exponential integral E_2(x),\n" +
   "\n" +
   "E_2(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t^2.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_En",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the exponential integral E_n(x) of order n, \n" +
   "\n" +
   "E_n(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t^n.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_En_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the exponential integral E_n(x) of order n, \n" +
   "\n" +
   "E_n(x) := \\Re \\int_1^\\infty dt \\exp(-xt)/t^n.\n" +
   "\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_Ei",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the exponential integral $\\hbox{Ei}(x)$\n" +
   "Ei(x),\n" +
   "\n" +
   "Ei(x) := - PV(\\int_@{-x@}^\\infty dt \\exp(-t)/t)\n" +
   "\n" +
   "where PV denotes the principal value of the integral.\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_Ei_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the exponential integral $\\hbox{Ei}(x)$\n" +
   "Ei(x),\n" +
   "\n" +
   "Ei(x) := - PV(\\int_@{-x@}^\\infty dt \\exp(-t)/t)\n" +
   "\n" +
   "where PV denotes the principal value of the integral.\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_Shi",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the integral $\\hbox{Shi}(x) = \\int_0^x dt \\sinh(t)/t$\n" +
   "Shi(x) = \\int_0^x dt \\sinh(t)/t.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_Shi_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the integral $\\hbox{Shi}(x) = \\int_0^x dt \\sinh(t)/t$\n" +
   "Shi(x) = \\int_0^x dt \\sinh(t)/t.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_Chi",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the integral $\\hbox{Chi}(x) := \\Re[ \\gamma_E + \\log(x) + \\int_0^x dt (\\cosh(t)-1)/t]$\n" +
   " Chi(x) := \\Re[ \\gamma_E + \\log(x) + \\int_0^x dt (\\cosh(t)-1)/t] , \n" +
   "where \\gamma_E is the Euler constant (available as the macro M_EULER).\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_Chi_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the integral $\\hbox{Chi}(x) := \\Re[ \\gamma_E + \\log(x) + \\int_0^x dt (\\cosh(t)-1)/t]$\n" +
   " Chi(x) := \\Re[ \\gamma_E + \\log(x) + \\int_0^x dt (\\cosh(t)-1)/t] , \n" +
   "where \\gamma_E is the Euler constant (available as the macro M_EULER).\n" +
   "Domain: x != 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expint_3",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the third-order exponential integral ${\\rm Ei}_3(x) = \\int_0^xdt \\exp(-t^3)$\n" +
   "Ei_3(x) = \\int_0^xdt \\exp(-t^3) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_expint_3_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the third-order exponential integral ${\\rm Ei}_3(x) = \\int_0^xdt \\exp(-t^3)$\n" +
   "Ei_3(x) = \\int_0^xdt \\exp(-t^3) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_Si",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These routines compute the Sine integral $\\hbox{Si}(x) = \\int_0^x dt \\sin(t)/t$\n" +
   "Si(x) = \\int_0^x dt \\sin(t)/t.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_Si_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Sine integral $\\hbox{Si}(x) = \\int_0^x dt \\sin(t)/t$\n" +
   "Si(x) = \\int_0^x dt \\sin(t)/t.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_Ci",
  :func_type=>"double",
  :args=>[["const double", "x"]],
  :desc=>
   "These routines compute the Cosine integral $\\hbox{Ci}(x) = -\\int_x^\\infty dt \\cos(t)/t$\n" +
   "Ci(x) = -\\int_x^\\infty dt \\cos(t)/t for x > 0.  \n" +
   "Domain: x > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_Ci_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Cosine integral $\\hbox{Ci}(x) = -\\int_x^\\infty dt \\cos(t)/t$\n" +
   "Ci(x) = -\\int_x^\\infty dt \\cos(t)/t for x > 0.  \n" +
   "Domain: x > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_atanint",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Arctangent integral, which is defined as $\\hbox{AtanInt}(x) = \\int_0^x dt \\arctan(t)/t$\n" +
   "AtanInt(x) = \\int_0^x dt \\arctan(t)/t.\n" +
   "Domain: \n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_atanint_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Arctangent integral, which is defined as $\\hbox{AtanInt}(x) = \\int_0^x dt \\arctan(t)/t$\n" +
   "AtanInt(x) = \\int_0^x dt \\arctan(t)/t.\n" +
   "Domain: \n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_laguerre_1",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_2",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_3",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "x"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_1_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_2_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_3_e",
  :func_type=>"int",
  :args=>[["double", "a"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_1(x), L^a_2(x), L^a_3(x) using explicit\n" +
   "representations.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_laguerre_n",
  :func_type=>"double",
  :args=>[["const int", "n"], ["const double", "a"], ["const double", "x"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_n(x) for a > -1, \n" +
   "$n \\ge 0$\n" +
   "n >= 0.\n" +
   "\n" +
   "Domain: a > -1.0, n >= 0\n" +
   "Evaluate generalized Laguerre polynomials.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_laguerre_n_e",
  :func_type=>"int",
  :args=>
   [["int", "n"],
    ["double", "a"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines evaluate the generalized Laguerre polynomials\n" +
   "L^a_n(x) for a > -1, \n" +
   "$n \\ge 0$\n" +
   "n >= 0.\n" +
   "\n" +
   "Domain: a > -1.0, n >= 0\n" +
   "Evaluate generalized Laguerre polynomials.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_gegenpoly_1",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_2",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_3",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_1_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_2_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_3_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) using explicit\n" +
   "representations for n =1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_gegenpoly_n",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "lambda"], ["double", "x"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomial $C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) for a specific value of n,\n" +
   "lambda, x subject to \\lambda > -1/2, $n \\ge 0$\n" +
   "n >= 0.\n" +
   "Domain: lambda > -1/2, n >= 0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_gegenpoly_n_e",
  :func_type=>"int",
  :args=>
   [["int", "n"],
    ["double", "lambda"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Gegenbauer polynomial $C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) for a specific value of n,\n" +
   "lambda, x subject to \\lambda > -1/2, $n \\ge 0$\n" +
   "n >= 0.\n" +
   "Domain: lambda > -1/2, n >= 0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_gegenpoly_array",
  :func_type=>"int",
  :args=>
   [["int", "nmax"],
    ["double", "lambda"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This function computes an array of Gegenbauer polynomials\n" +
   "$C^{(\\lambda)}_n(x)$ \n" +
   "C^@{(\\lambda)@}_n(x) for n = 0, 1, 2, \\dots, nmax, subject\n" +
   "to \\lambda > -1/2, $nmax \\ge 0$\n" +
   "nmax >= 0.\n" +
   "Conditions: n = 0, 1, 2, ... nmax\n" +
   "Domain: lambda > -1/2, nmax >= 0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_elljac_e",
  :func_type=>"int",
  :args=>
   [["double", "u"],
    ["double", "m"],
    ["double *", "sn"],
    ["double *", "cn"],
    ["double *", "dn"]],
  :desc=>
   "This function computes the Jacobian elliptic functions sn(u|m),\n" +
   "cn(u|m), dn(u|m) by descending Landen\n" +
   "transformations.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_coupling_3j",
  :func_type=>"double",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_ma"],
    ["int", "two_mb"],
    ["int", "two_mc"]],
  :desc=>
   "These routines compute the Wigner 3-j coefficient, \n" +
   "\n" +
   "(ja jb jc\n" +
   " ma mb mc)\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_coupling_3j_e",
  :func_type=>"int",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_ma"],
    ["int", "two_mb"],
    ["int", "two_mc"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Wigner 3-j coefficient, \n" +
   "\n" +
   "(ja jb jc\n" +
   " ma mb mc)\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_coupling_6j",
  :func_type=>"double",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_jd"],
    ["int", "two_je"],
    ["int", "two_jf"]],
  :desc=>
   "These routines compute the Wigner 6-j coefficient, \n" +
   "\n" +
   "@{ja jb jc\n" +
   " jd je jf@}\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_coupling_6j_e",
  :func_type=>"int",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_jd"],
    ["int", "two_je"],
    ["int", "two_jf"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Wigner 6-j coefficient, \n" +
   "\n" +
   "@{ja jb jc\n" +
   " jd je jf@}\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_coupling_9j",
  :func_type=>"double",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_jd"],
    ["int", "two_je"],
    ["int", "two_jf"],
    ["int", "two_jg"],
    ["int", "two_jh"],
    ["int", "two_ji"]],
  :desc=>
   "These routines compute the Wigner 9-j coefficient, \n" +
   "\n" +
   "@{ja jb jc\n" +
   " jd je jf\n" +
   " jg jh ji@}\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_coupling_9j_e",
  :func_type=>"int",
  :args=>
   [["int", "two_ja"],
    ["int", "two_jb"],
    ["int", "two_jc"],
    ["int", "two_jd"],
    ["int", "two_je"],
    ["int", "two_jf"],
    ["int", "two_jg"],
    ["int", "two_jh"],
    ["int", "two_ji"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Wigner 9-j coefficient, \n" +
   "\n" +
   "@{ja jb jc\n" +
   " jd je jf\n" +
   " jg jh ji@}\n" +
   "\n" +
   "where the arguments are given in half-integer units, ja =\n" +
   "two_ja/2, ma = two_ma/2, etc.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_psi_int",
  :func_type=>"double",
  :args=>[["int", "n"]],
  :desc=>
   "These routines compute the digamma function \\psi(n) for positive\n" +
   "integer n.  The digamma function is also called the Psi function.\n" +
   "Domain: n integer, n > 0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_psi_int_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the digamma function \\psi(n) for positive\n" +
   "integer n.  The digamma function is also called the Psi function.\n" +
   "Domain: n integer, n > 0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_psi",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the digamma function \\psi(x) for general\n" +
   "x, x \\ne 0.\n" +
   "Domain: x != 0.0, -1.0, -2.0, ...\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_psi_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the digamma function \\psi(x) for general\n" +
   "x, x \\ne 0.\n" +
   "Domain: x != 0.0, -1.0, -2.0, ...\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_psi_1piy",
  :func_type=>"double",
  :args=>[["double", "y"]],
  :desc=>
   "These routines compute the real part of the digamma function on the line\n" +
   "1+i y, \\Re[\\psi(1 + i y)].\n" +
   "exceptions: none\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_psi_1piy_e",
  :func_type=>"int",
  :args=>[["double", "y"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the real part of the digamma function on the line\n" +
   "1+i y, \\Re[\\psi(1 + i y)].\n" +
   "exceptions: none\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_psi_1_int",
  :func_type=>"double",
  :args=>[["int", "n"]],
  :desc=>
   "These routines compute the Trigamma function \\psi'(n) for\n" +
   "positive integer n.\n" +
   "Domain: n integer, n > 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_psi_1_int_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Trigamma function \\psi'(n) for\n" +
   "positive integer n.\n" +
   "Domain: n integer, n > 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_psi_1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Trigamma function \\psi'(x) for\n" +
   "general x.\n" +
   "Domain: x != 0.0, -1.0, -2.0, ...\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_psi_1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Trigamma function \\psi'(x) for\n" +
   "general x.\n" +
   "Domain: x != 0.0, -1.0, -2.0, ...\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_ELOSS"},
 {:func_name=>"gsl_sf_psi_n",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the polygamma function $\\psi^{(n)}(x)$\n" +
   "\\psi^@{(n)@}(x) for\n" +
   "$n \\ge 0$\n" +
   "n >= 0, x > 0.  \n" +
   "Domain: n >= 0, x > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_psi_n_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the polygamma function $\\psi^{(n)}(x)$\n" +
   "\\psi^@{(n)@}(x) for\n" +
   "$n \\ge 0$\n" +
   "n >= 0, x > 0.  \n" +
   "Domain: n >= 0, x > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_debye_1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the first-order Debye function \n" +
   "D_1(x) = (1/x) \\int_0^x dt (t/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_debye_1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the first-order Debye function \n" +
   "D_1(x) = (1/x) \\int_0^x dt (t/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_debye_2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the second-order Debye function \n" +
   "D_2(x) = (2/x^2) \\int_0^x dt (t^2/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the second-order Debye function \n" +
   "D_2(x) = (2/x^2) \\int_0^x dt (t^2/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_3",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the third-order Debye function \n" +
   "D_3(x) = (3/x^3) \\int_0^x dt (t^3/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_3_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the third-order Debye function \n" +
   "D_3(x) = (3/x^3) \\int_0^x dt (t^3/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_4",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the fourth-order Debye function \n" +
   "D_4(x) = (4/x^4) \\int_0^x dt (t^4/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_4_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the fourth-order Debye function \n" +
   "D_4(x) = (4/x^4) \\int_0^x dt (t^4/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_5",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the fifth-order Debye function \n" +
   "D_5(x) = (5/x^5) \\int_0^x dt (t^5/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_5_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the fifth-order Debye function \n" +
   "D_5(x) = (5/x^5) \\int_0^x dt (t^5/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_6",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the sixth-order Debye function \n" +
   "D_6(x) = (6/x^6) \\int_0^x dt (t^6/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_debye_6_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the sixth-order Debye function \n" +
   "D_6(x) = (6/x^6) \\int_0^x dt (t^6/(e^t - 1)).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_erf",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the error function $\\erf(x)$\n" +
   "erf(x), where\n" +
   "$\\erf(x) = (2/\\sqrt{\\pi}) \\int_0^x dt \\exp(-t^2)$\n" +
   "erf(x) = (2/\\sqrt(\\pi)) \\int_0^x dt \\exp(-t^2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_erf_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the error function $\\erf(x)$\n" +
   "erf(x), where\n" +
   "$\\erf(x) = (2/\\sqrt{\\pi}) \\int_0^x dt \\exp(-t^2)$\n" +
   "erf(x) = (2/\\sqrt(\\pi)) \\int_0^x dt \\exp(-t^2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_erfc",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complementary error function \n" +
   "$\\erfc(x) = 1 - \\erf(x) = (2/\\sqrt{\\pi}) \\int_x^\\infty \\exp(-t^2)$\n" +
   "erfc(x) = 1 - erf(x) = (2/\\sqrt(\\pi)) \\int_x^\\infty \\exp(-t^2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_erfc_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complementary error function \n" +
   "$\\erfc(x) = 1 - \\erf(x) = (2/\\sqrt{\\pi}) \\int_x^\\infty \\exp(-t^2)$\n" +
   "erfc(x) = 1 - erf(x) = (2/\\sqrt(\\pi)) \\int_x^\\infty \\exp(-t^2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_log_erfc",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the logarithm of the complementary error function\n" +
   "\\log(\\erfc(x)).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_log_erfc_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the complementary error function\n" +
   "\\log(\\erfc(x)).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_erf_Z",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Gaussian probability density function \n" +
   "$Z(x) = (1/\\sqrt{2\\pi}) \\exp(-x^2/2)$ \n" +
   "Z(x) = (1/\\sqrt@{2\\pi@}) \\exp(-x^2/2).  "},
 {:func_name=>"gsl_sf_erf_Z_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Gaussian probability density function \n" +
   "$Z(x) = (1/\\sqrt{2\\pi}) \\exp(-x^2/2)$ \n" +
   "Z(x) = (1/\\sqrt@{2\\pi@}) \\exp(-x^2/2).  "},
 {:func_name=>"gsl_sf_erf_Q",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the upper tail of the Gaussian probability\n" +
   "function \n" +
   "$Q(x) = (1/\\sqrt{2\\pi}) \\int_x^\\infty dt \\exp(-t^2/2)$\n" +
   "Q(x) = (1/\\sqrt@{2\\pi@}) \\int_x^\\infty dt \\exp(-t^2/2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_erf_Q_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the upper tail of the Gaussian probability\n" +
   "function \n" +
   "$Q(x) = (1/\\sqrt{2\\pi}) \\int_x^\\infty dt \\exp(-t^2/2)$\n" +
   "Q(x) = (1/\\sqrt@{2\\pi@}) \\int_x^\\infty dt \\exp(-t^2/2).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_hazard",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the hazard function for the normal distribution.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_hazard_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the hazard function for the normal distribution.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_multiply_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "y"], ["gsl_sf_result *", "result"]],
  :desc=>
   "This function multiplies x and y storing the product and its\n" +
   "associated error in result.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_multiply_err_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "dx"],
    ["double", "y"],
    ["double", "dy"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "This function multiplies x and y with associated absolute\n" +
   "errors dx and dy.  The product \n" +
   "$xy \\pm xy \\sqrt{(dx/x)^2 +(dy/y)^2}$ \n" +
   "xy +/- xy \\sqrt((dx/x)^2 +(dy/y)^2) \n" +
   "is stored in result.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines provide an exponential function \\exp(x) using GSL\n" +
   "semantics and error checking.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines provide an exponential function \\exp(x) using GSL\n" +
   "semantics and error checking.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_e10_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This function computes the exponential \\exp(x) using the\n" +
   "gsl_sf_result_e10 type to return a result with extended range.\n" +
   "This function may be useful if the value of \\exp(x) would\n" +
   "overflow the  numeric range of double.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_mult",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "y"]],
  :desc=>
   "These routines exponentiate x and multiply by the factor y\n" +
   "to return the product y \\exp(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_mult_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "y"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines exponentiate x and multiply by the factor y\n" +
   "to return the product y \\exp(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_mult_e10_e",
  :func_type=>"int",
  :args=>
   [["const double", "x"],
    ["const double", "y"],
    ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This function computes the product y \\exp(x) using the\n" +
   "gsl_sf_result_e10 type to return a result with extended numeric\n" +
   "range.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_expm1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the quantity \\exp(x)-1 using an algorithm\n" +
   "that is accurate for small x.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_expm1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the quantity \\exp(x)-1 using an algorithm\n" +
   "that is accurate for small x.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_exprel",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the quantity (\\exp(x)-1)/x using an\n" +
   "algorithm that is accurate for small x.  For small x the\n" +
   "algorithm is based on the expansion (\\exp(x)-1)/x = 1 + x/2 +\n" +
   "x^2/(2*3) + x^3/(2*3*4) + \\dots.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_exprel_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the quantity (\\exp(x)-1)/x using an\n" +
   "algorithm that is accurate for small x.  For small x the\n" +
   "algorithm is based on the expansion (\\exp(x)-1)/x = 1 + x/2 +\n" +
   "x^2/(2*3) + x^3/(2*3*4) + \\dots.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_exprel_2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the quantity 2(\\exp(x)-1-x)/x^2 using an\n" +
   "algorithm that is accurate for small x.  For small x the\n" +
   "algorithm is based on the expansion 2(\\exp(x)-1-x)/x^2 = \n" +
   "1 + x/3 + x^2/(3*4) + x^3/(3*4*5) + \\dots.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_exprel_2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the quantity 2(\\exp(x)-1-x)/x^2 using an\n" +
   "algorithm that is accurate for small x.  For small x the\n" +
   "algorithm is based on the expansion 2(\\exp(x)-1-x)/x^2 = \n" +
   "1 + x/3 + x^2/(3*4) + x^3/(3*4*5) + \\dots.\n" +
   "Exceptional Return Values:  GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_exprel_n",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the N-relative exponential, which is the\n" +
   "n-th generalization of the functions gsl_sf_exprel and\n" +
   "gsl_sf_exprel_2.  The N-relative exponential is given by,\n" +
   "\n" +
   "exprel_N(x) = N!/x^N (\\exp(x) - \\sum_@{k=0@}^@{N-1@} x^k/k!)\n" +
   "            = 1 + x/(N+1) + x^2/((N+1)(N+2)) + ...\n" +
   "            = 1F1 (1,1+N,x)\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_exprel_n_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the N-relative exponential, which is the\n" +
   "n-th generalization of the functions gsl_sf_exprel and\n" +
   "gsl_sf_exprel_2.  The N-relative exponential is given by,\n" +
   "\n" +
   "exprel_N(x) = N!/x^N (\\exp(x) - \\sum_@{k=0@}^@{N-1@} x^k/k!)\n" +
   "            = 1 + x/(N+1) + x^2/((N+1)(N+2)) + ...\n" +
   "            = 1F1 (1,1+N,x)\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_exp_err_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "dx"], ["gsl_sf_result *", "result"]],
  :desc=>
   "This function exponentiates x with an associated absolute error\n" +
   "dx.\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_exp_err_e10_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["double", "dx"], ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This function exponentiates a quantity x with an associated absolute \n" +
   "error dx using the gsl_sf_result_e10 type to return a result with\n" +
   "extended range.\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_exp_mult_err_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "dx"],
    ["double", "y"],
    ["double", "dy"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "This routine computes the product y \\exp(x) for the quantities\n" +
   "x, y with associated absolute errors dx, dy.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_exp_mult_err_e10_e",
  :func_type=>"int",
  :args=>
   [["double", "x"],
    ["double", "dx"],
    ["double", "y"],
    ["double", "dy"],
    ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This routine computes the product y \\exp(x) for the quantities\n" +
   "x, y with associated absolute errors dx, dy using the\n" +
   "gsl_sf_result_e10 type to return a result with extended range.\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_dawson",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the value of Dawson's integral for x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_dawson_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the value of Dawson's integral for x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_pow_int",
  :func_type=>"double",
  :args=>[["double", "x"], ["int", "n"]],
  :desc=>
   "These routines compute the power x^n for integer n.  The\n" +
   "power is computed using the minimum number of multiplications. For\n" +
   "example, x^8 is computed as ((x^2)^2)^2, requiring only 3\n" +
   "multiplications.  For reasons of efficiency, these functions do not\n" +
   "check for overflow or underflow conditions."},
 {:func_name=>"gsl_sf_pow_int_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the power x^n for integer n.  The\n" +
   "power is computed using the minimum number of multiplications. For\n" +
   "example, x^8 is computed as ((x^2)^2)^2, requiring only 3\n" +
   "multiplications.  For reasons of efficiency, these functions do not\n" +
   "check for overflow or underflow conditions."},
 {:func_name=>"gsl_sf_synchrotron_1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the first synchrotron function \n" +
   "$x \\int_x^\\infty dt K_{5/3}(t)$\n" +
   "x \\int_x^\\infty dt K_@{5/3@}(t) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Domain: x >= 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_synchrotron_1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the first synchrotron function \n" +
   "$x \\int_x^\\infty dt K_{5/3}(t)$\n" +
   "x \\int_x^\\infty dt K_@{5/3@}(t) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Domain: x >= 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_synchrotron_2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the second synchrotron function \n" +
   "$x K_{2/3}(x)$\n" +
   "x K_@{2/3@}(x) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Domain: x >= 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_synchrotron_2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the second synchrotron function \n" +
   "$x K_{2/3}(x)$\n" +
   "x K_@{2/3@}(x) for $x \\ge 0$\n" +
   "x >= 0.\n" +
   "Domain: x >= 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_mathieu_alloc",
  :func_type=>"gsl_sf_mathieu_workspace *",
  :args=>[["size_t", "n"], ["double", "qmax"]],
  :desc=>
   "This function returns a workspace for the array versions of the\n" +
   "Mathieu routines.  The arguments n and qmax specify the\n" +
   "maximum order and q-value of Mathieu functions which can be\n" +
   "computed with this workspace.  \n" +
   "\n" +
   "This is required in order to properly\n" +
   "terminate the infinite eigenvalue matrix for high precision solutions.\n" +
   "The characteristic values for all orders 0 \\to n are stored in\n" +
   "the work structure array element work->char_value."},
 {:func_name=>"gsl_sf_mathieu_free",
  :func_type=>"void",
  :args=>[["gsl_sf_mathieu_workspace *", "work"]],
  :desc=>"This function frees the workspace work."},
 {:func_name=>"gsl_sf_mathieu_a",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"]],
  :desc=>
   "These routines compute the characteristic values a_n(q),\n" +
   "b_n(q) of the Mathieu functions ce_n(q,x) and\n" +
   "se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_a_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the characteristic values a_n(q),\n" +
   "b_n(q) of the Mathieu functions ce_n(q,x) and\n" +
   "se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_b",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"]],
  :desc=>
   "These routines compute the characteristic values a_n(q),\n" +
   "b_n(q) of the Mathieu functions ce_n(q,x) and\n" +
   "se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_b_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the characteristic values a_n(q),\n" +
   "b_n(q) of the Mathieu functions ce_n(q,x) and\n" +
   "se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_a_array",
  :func_type=>"int",
  :args=>
   [["int", "order_min"],
    ["int", "order_max"],
    ["double", "q"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of Mathieu characteristic values\n" +
   "a_n(q), b_n(q) for n from order_min to\n" +
   "order_max inclusive, storing the results in the array result_array."},
 {:func_name=>"gsl_sf_mathieu_b_array",
  :func_type=>"int",
  :args=>
   [["int", "order_min"],
    ["int", "order_max"],
    ["double", "q"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of Mathieu characteristic values\n" +
   "a_n(q), b_n(q) for n from order_min to\n" +
   "order_max inclusive, storing the results in the array result_array."},
 {:func_name=>"gsl_sf_mathieu_ce",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"], ["double", "x"]],
  :desc=>
   "These routines compute the angular Mathieu functions ce_n(q,x)\n" +
   "and se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_ce_e",
  :func_type=>"int",
  :args=>
   [["int", "n"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the angular Mathieu functions ce_n(q,x)\n" +
   "and se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_se",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "q"], ["double", "x"]],
  :desc=>
   "These routines compute the angular Mathieu functions ce_n(q,x)\n" +
   "and se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_se_e",
  :func_type=>"int",
  :args=>
   [["int", "n"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the angular Mathieu functions ce_n(q,x)\n" +
   "and se_n(q,x), respectively."},
 {:func_name=>"gsl_sf_mathieu_ce_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of the angular Mathieu functions\n" +
   "ce_n(q,x) and se_n(q,x) of order n from\n" +
   "nmin to nmax inclusive, storing the results in the array\n" +
   "result_array."},
 {:func_name=>"gsl_sf_mathieu_se_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of the angular Mathieu functions\n" +
   "ce_n(q,x) and se_n(q,x) of order n from\n" +
   "nmin to nmax inclusive, storing the results in the array\n" +
   "result_array."},
 {:func_name=>"gsl_sf_mathieu_Mc",
  :func_type=>"int",
  :args=>[["int", "j"], ["int", "n"], ["double", "q"], ["double", "x"]],
  :desc=>
   "These routines compute the radial j-th kind Mathieu functions\n" +
   "$Mc_n^{(j)}(q,x)$\n" +
   "Mc_n^@{(j)@}(q,x) and \n" +
   "$Ms_n^{(j)}(q,x)$\n" +
   "Ms_n^@{(j)@}(q,x) of order n.\n" +
   "\n" +
   "The allowed values of j are 1 and 2.\n" +
   "The functions for j = 3,4 can be computed as \n" +
   "$M_n^{(3)} = M_n^{(1)} + iM_n^{(2)}$\n" +
   "M_n^@{(3)@} = M_n^@{(1)@} + iM_n^@{(2)@} and \n" +
   "$M_n^{(4)} = M_n^{(1)} - iM_n^{(2)}$\n" +
   "M_n^@{(4)@} = M_n^@{(1)@} - iM_n^@{(2)@},\n" +
   "where \n" +
   "$M_n^{(j)} = Mc_n^{(j)}$\n" +
   "M_n^@{(j)@} = Mc_n^@{(j)@} or \n" +
   "$Ms_n^{(j)}$\n" +
   "Ms_n^@{(j)@}."},
 {:func_name=>"gsl_sf_mathieu_Mc_e",
  :func_type=>"int",
  :args=>
   [["int", "j"],
    ["int", "n"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the radial j-th kind Mathieu functions\n" +
   "$Mc_n^{(j)}(q,x)$\n" +
   "Mc_n^@{(j)@}(q,x) and \n" +
   "$Ms_n^{(j)}(q,x)$\n" +
   "Ms_n^@{(j)@}(q,x) of order n.\n" +
   "\n" +
   "The allowed values of j are 1 and 2.\n" +
   "The functions for j = 3,4 can be computed as \n" +
   "$M_n^{(3)} = M_n^{(1)} + iM_n^{(2)}$\n" +
   "M_n^@{(3)@} = M_n^@{(1)@} + iM_n^@{(2)@} and \n" +
   "$M_n^{(4)} = M_n^{(1)} - iM_n^{(2)}$\n" +
   "M_n^@{(4)@} = M_n^@{(1)@} - iM_n^@{(2)@},\n" +
   "where \n" +
   "$M_n^{(j)} = Mc_n^{(j)}$\n" +
   "M_n^@{(j)@} = Mc_n^@{(j)@} or \n" +
   "$Ms_n^{(j)}$\n" +
   "Ms_n^@{(j)@}."},
 {:func_name=>"gsl_sf_mathieu_Ms",
  :func_type=>"int",
  :args=>[["int", "j"], ["int", "n"], ["double", "q"], ["double", "x"]],
  :desc=>
   "These routines compute the radial j-th kind Mathieu functions\n" +
   "$Mc_n^{(j)}(q,x)$\n" +
   "Mc_n^@{(j)@}(q,x) and \n" +
   "$Ms_n^{(j)}(q,x)$\n" +
   "Ms_n^@{(j)@}(q,x) of order n.\n" +
   "\n" +
   "The allowed values of j are 1 and 2.\n" +
   "The functions for j = 3,4 can be computed as \n" +
   "$M_n^{(3)} = M_n^{(1)} + iM_n^{(2)}$\n" +
   "M_n^@{(3)@} = M_n^@{(1)@} + iM_n^@{(2)@} and \n" +
   "$M_n^{(4)} = M_n^{(1)} - iM_n^{(2)}$\n" +
   "M_n^@{(4)@} = M_n^@{(1)@} - iM_n^@{(2)@},\n" +
   "where \n" +
   "$M_n^{(j)} = Mc_n^{(j)}$\n" +
   "M_n^@{(j)@} = Mc_n^@{(j)@} or \n" +
   "$Ms_n^{(j)}$\n" +
   "Ms_n^@{(j)@}."},
 {:func_name=>"gsl_sf_mathieu_Ms_e",
  :func_type=>"int",
  :args=>
   [["int", "j"],
    ["int", "n"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the radial j-th kind Mathieu functions\n" +
   "$Mc_n^{(j)}(q,x)$\n" +
   "Mc_n^@{(j)@}(q,x) and \n" +
   "$Ms_n^{(j)}(q,x)$\n" +
   "Ms_n^@{(j)@}(q,x) of order n.\n" +
   "\n" +
   "The allowed values of j are 1 and 2.\n" +
   "The functions for j = 3,4 can be computed as \n" +
   "$M_n^{(3)} = M_n^{(1)} + iM_n^{(2)}$\n" +
   "M_n^@{(3)@} = M_n^@{(1)@} + iM_n^@{(2)@} and \n" +
   "$M_n^{(4)} = M_n^{(1)} - iM_n^{(2)}$\n" +
   "M_n^@{(4)@} = M_n^@{(1)@} - iM_n^@{(2)@},\n" +
   "where \n" +
   "$M_n^{(j)} = Mc_n^{(j)}$\n" +
   "M_n^@{(j)@} = Mc_n^@{(j)@} or \n" +
   "$Ms_n^{(j)}$\n" +
   "Ms_n^@{(j)@}."},
 {:func_name=>"gsl_sf_mathieu_Mc_array",
  :func_type=>"int",
  :args=>
   [["int", "j"],
    ["int", "nmin"],
    ["int", "nmax"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of the radial Mathieu functions of\n" +
   "kind j, with order from nmin to nmax inclusive, storing the\n" +
   "results in the array result_array."},
 {:func_name=>"gsl_sf_mathieu_Ms_array",
  :func_type=>"int",
  :args=>
   [["int", "j"],
    ["int", "nmin"],
    ["int", "nmax"],
    ["double", "q"],
    ["double", "x"],
    ["gsl_sf_mathieu_workspace *", "work"],
    ["double", "result_array[]"]],
  :desc=>
   "These routines compute a series of the radial Mathieu functions of\n" +
   "kind j, with order from nmin to nmax inclusive, storing the\n" +
   "results in the array result_array."},
 {:func_name=>"gsl_sf_fermi_dirac_m1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of -1. \n" +
   "This integral is given by \n" +
   "$F_{-1}(x) = e^x / (1 + e^x)$\n" +
   "F_@{-1@}(x) = e^x / (1 + e^x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_m1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of -1. \n" +
   "This integral is given by \n" +
   "$F_{-1}(x) = e^x / (1 + e^x)$\n" +
   "F_@{-1@}(x) = e^x / (1 + e^x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of 0. \n" +
   "This integral is given by F_0(x) = \\ln(1 + e^x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of 0. \n" +
   "This integral is given by F_0(x) = \\ln(1 + e^x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of 1,\n" +
   "F_1(x) = \\int_0^\\infty dt (t /(\\exp(t-x)+1)).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index of 1,\n" +
   "F_1(x) = \\int_0^\\infty dt (t /(\\exp(t-x)+1)).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index\n" +
   "of 2,\n" +
   "F_2(x) = (1/2) \\int_0^\\infty dt (t^2 /(\\exp(t-x)+1)).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an index\n" +
   "of 2,\n" +
   "F_2(x) = (1/2) \\int_0^\\infty dt (t^2 /(\\exp(t-x)+1)).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_int",
  :func_type=>"double",
  :args=>[["int", "j"], ["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an integer\n" +
   "index of j,\n" +
   "F_j(x) = (1/\\Gamma(j+1)) \\int_0^\\infty dt (t^j /(\\exp(t-x)+1)).\n" +
   "Complete integral F_j(x) for integer j\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_int_e",
  :func_type=>"int",
  :args=>[["int", "j"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral with an integer\n" +
   "index of j,\n" +
   "F_j(x) = (1/\\Gamma(j+1)) \\int_0^\\infty dt (t^j /(\\exp(t-x)+1)).\n" +
   "Complete integral F_j(x) for integer j\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_mhalf",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{-1/2}(x)$\n" +
   "F_@{-1/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_mhalf_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{-1/2}(x)$\n" +
   "F_@{-1/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_half",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{1/2}(x)$\n" +
   "F_@{1/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_half_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{1/2}(x)$\n" +
   "F_@{1/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_3half",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{3/2}(x)$\n" +
   "F_@{3/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_3half_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the complete Fermi-Dirac integral \n" +
   "$F_{3/2}(x)$\n" +
   "F_@{3/2@}(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_fermi_dirac_inc_0",
  :func_type=>"double",
  :args=>[["double", "x"], ["double", "b"]],
  :desc=>
   "These routines compute the incomplete Fermi-Dirac integral with an index\n" +
   "of zero,\n" +
   "$F_0(x,b) = \\ln(1 + e^{b-x}) - (b-x)$\n" +
   "F_0(x,b) = \\ln(1 + e^@{b-x@}) - (b-x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EDOM"},
 {:func_name=>"gsl_sf_fermi_dirac_inc_0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["double", "b"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the incomplete Fermi-Dirac integral with an index\n" +
   "of zero,\n" +
   "$F_0(x,b) = \\ln(1 + e^{b-x}) - (b-x)$\n" +
   "F_0(x,b) = \\ln(1 + e^@{b-x@}) - (b-x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EDOM"},
 {:func_name=>"gsl_sf_dilog",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the dilogarithm for a real argument. In Lewin's\n" +
   "notation this is Li_2(x), the real part of the dilogarithm of a\n" +
   "real x.  It is defined by the integral representation\n" +
   "Li_2(x) = - \\Re \\int_0^x ds \\log(1-s) / s.  \n" +
   "Note that \\Im(Li_2(x)) = 0 for $x \\le 1$ \n" +
   "x <= 1, and -\\pi\\log(x) for x > 1.\n" +
   "\n" +
   "Note that Abramowitz & Stegun refer to the Spence integral\n" +
   "S(x)=Li_2(1-x) as the dilogarithm rather than Li_2(x)."},
 {:func_name=>"gsl_sf_dilog_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the dilogarithm for a real argument. In Lewin's\n" +
   "notation this is Li_2(x), the real part of the dilogarithm of a\n" +
   "real x.  It is defined by the integral representation\n" +
   "Li_2(x) = - \\Re \\int_0^x ds \\log(1-s) / s.  \n" +
   "Note that \\Im(Li_2(x)) = 0 for $x \\le 1$ \n" +
   "x <= 1, and -\\pi\\log(x) for x > 1.\n" +
   "\n" +
   "Note that Abramowitz & Stegun refer to the Spence integral\n" +
   "S(x)=Li_2(1-x) as the dilogarithm rather than Li_2(x)."},
 {:func_name=>"gsl_sf_complex_dilog_e",
  :func_type=>"int",
  :args=>
   [["double", "r"],
    ["double", "theta"],
    ["gsl_sf_result *", "result_re"],
    ["gsl_sf_result *", "result_im"]],
  :desc=>
   "This function computes the full complex-valued dilogarithm for the\n" +
   "complex argument z = r \\exp(i \\theta). The real and imaginary\n" +
   "parts of the result are returned in result_re, result_im."},
 {:func_name=>"gsl_sf_bessel_J0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of zeroth\n" +
   "order, J_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_J0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of zeroth\n" +
   "order, J_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_J1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of first\n" +
   "order, J_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_J1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of first\n" +
   "order, J_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Jn",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of \n" +
   "order n, J_n(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Jn_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of \n" +
   "order n, J_n(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Jn_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the regular cylindrical Bessel\n" +
   "functions J_n(x) for n from nmin to nmax\n" +
   "inclusive, storing the results in the array result_array.  The\n" +
   "values are computed using recurrence relations for efficiency, and\n" +
   "therefore may differ slightly from the exact values.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Y0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of zeroth\n" +
   "order, Y_0(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Y0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of zeroth\n" +
   "order, Y_0(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Y1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of first\n" +
   "order, Y_1(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Y1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of first\n" +
   "order, Y_1(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Yn",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of \n" +
   "order n, Y_n(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Yn_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of \n" +
   "order n, Y_n(x), for x>0.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Yn_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the irregular cylindrical Bessel\n" +
   "functions Y_n(x) for n from nmin to nmax\n" +
   "inclusive, storing the results in the array result_array.  The\n" +
   "domain of the function is x>0.  The values are computed using\n" +
   "recurrence relations for efficiency, and therefore may differ slightly\n" +
   "from the exact values.\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_I0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of zeroth order, I_0(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_I0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of zeroth order, I_0(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_I1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of first order, I_1(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_I1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of first order, I_1(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of order n, I_n(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular modified cylindrical Bessel function\n" +
   "of order n, I_n(x).\n" +
   "Exceptional Return Values: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the regular modified cylindrical\n" +
   "Bessel functions I_n(x) for n from nmin to\n" +
   "nmax inclusive, storing the results in the array\n" +
   "result_array.  The start of the range nmin must be positive\n" +
   "or zero.  The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: nmin >=0, nmax >= nmin \n" +
   "Conditions: n=nmin,...,nmax, nmin >=0, nmax >= nmin \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_I0_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of zeroth order \\exp(-|x|) I_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_I0_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of zeroth order \\exp(-|x|) I_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_I1_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of first order \\exp(-|x|) I_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_I1_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of first order \\exp(-|x|) I_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In_scaled",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of order n, \\exp(-|x|) I_n(x) \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In_scaled_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified cylindrical Bessel\n" +
   "function of order n, \\exp(-|x|) I_n(x) \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_In_scaled_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the scaled regular cylindrical\n" +
   "Bessel functions \\exp(-|x|) I_n(x) for n from\n" +
   "nmin to nmax inclusive, storing the results in the array\n" +
   "result_array. The start of the range nmin must be positive\n" +
   "or zero.  The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: nmin >=0, nmax >= nmin \n" +
   "Conditions:  n=nmin,...,nmax \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of zeroth order, K_0(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of zeroth order, K_0(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of first order, K_1(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of first order, K_1(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of order n, K_n(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular modified cylindrical Bessel\n" +
   "function of order n, K_n(x), for x > 0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the irregular modified cylindrical\n" +
   "Bessel functions K_n(x) for n from nmin to\n" +
   "nmax inclusive, storing the results in the array\n" +
   "result_array. The start of the range nmin must be positive\n" +
   "or zero. The domain of the function is x>0. The values are\n" +
   "computed using recurrence relations for efficiency, and therefore\n" +
   "may differ slightly from the exact values.\n" +
   "Conditions: n=nmin,...,nmax \n" +
   "Domain: x > 0.0, nmin>=0, nmax >= nmin\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K0_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of zeroth order \\exp(x) K_0(x) for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_K0_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of zeroth order \\exp(x) K_0(x) for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_K1_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of first order \\exp(x) K_1(x) for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_K1_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of first order \\exp(x) K_1(x) for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn_scaled",
  :func_type=>"double",
  :args=>[["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of order n, \\exp(x) K_n(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn_scaled_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified cylindrical Bessel\n" +
   "function of order n, \\exp(x) K_n(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Kn_scaled_array",
  :func_type=>"int",
  :args=>
   [["int", "nmin"],
    ["int", "nmax"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the scaled irregular cylindrical\n" +
   "Bessel functions \\exp(x) K_n(x) for n from nmin to\n" +
   "nmax inclusive, storing the results in the array\n" +
   "result_array. The start of the range nmin must be positive\n" +
   "or zero.  The domain of the function is x>0. The values are\n" +
   "computed using recurrence relations for efficiency, and therefore\n" +
   "may differ slightly from the exact values.\n" +
   "Domain: x > 0.0, nmin >=0, nmax >= nmin \n" +
   "Conditions: n=nmin,...,nmax \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_j0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of zeroth\n" +
   "order, j_0(x) = \\sin(x)/x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_j0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of zeroth\n" +
   "order, j_0(x) = \\sin(x)/x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_j1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of first\n" +
   "order, j_1(x) = (\\sin(x)/x - \\cos(x))/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_j1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of first\n" +
   "order, j_1(x) = (\\sin(x)/x - \\cos(x))/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_j2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of second\n" +
   "order, j_2(x) = ((3/x^2 - 1)\\sin(x) - 3\\cos(x)/x)/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_j2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of second\n" +
   "order, j_2(x) = ((3/x^2 - 1)\\sin(x) - 3\\cos(x)/x)/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_jl",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of \n" +
   "order l, j_l(x), for $l \\geq 0$\n" +
   "l >= 0 and $x \\geq 0$\n" +
   "x >= 0.\n" +
   "Domain: l >= 0, x >= 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_jl_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular spherical Bessel function of \n" +
   "order l, j_l(x), for $l \\geq 0$\n" +
   "l >= 0 and $x \\geq 0$\n" +
   "x >= 0.\n" +
   "Domain: l >= 0, x >= 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_jl_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the regular spherical Bessel\n" +
   "functions j_l(x) for l from 0 to lmax\n" +
   "inclusive  for $lmax \\geq 0$\n" +
   "lmax >= 0 and $x \\geq 0$\n" +
   "x >= 0, storing the results in the array result_array.\n" +
   "The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: lmax >= 0 \n" +
   "Conditions: l=0,1,...,lmax \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_jl_steed_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double *", "result_array"]],
  :desc=>
   "This routine uses Steed's method to compute the values of the regular\n" +
   "spherical Bessel functions j_l(x) for l from 0 to\n" +
   "lmax inclusive for $lmax \\geq 0$\n" +
   "lmax >= 0 and $x \\geq 0$\n" +
   "x >= 0, storing the results in the array\n" +
   "result_array.\n" +
   "The Steed/Barnett algorithm is described in Comp. Phys. Comm. 21,\n" +
   "297 (1981).  Steed's method is more stable than the\n" +
   "recurrence used in the other functions but is also slower.\n" +
   "Domain: lmax >= 0 \n" +
   "Conditions: l=0,1,...,lmax \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_y0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of zeroth\n" +
   "order, y_0(x) = -\\cos(x)/x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_y0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of zeroth\n" +
   "order, y_0(x) = -\\cos(x)/x.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_y1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of first\n" +
   "order, y_1(x) = -(\\cos(x)/x + \\sin(x))/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_y1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of first\n" +
   "order, y_1(x) = -(\\cos(x)/x + \\sin(x))/x.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_y2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of second\n" +
   "order, y_2(x) = (-3/x^3 + 1/x)\\cos(x) - (3/x^2)\\sin(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_y2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of second\n" +
   "order, y_2(x) = (-3/x^3 + 1/x)\\cos(x) - (3/x^2)\\sin(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_yl",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of \n" +
   "order l, y_l(x), for $l \\geq 0$\n" +
   "l >= 0.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_yl_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular spherical Bessel function of \n" +
   "order l, y_l(x), for $l \\geq 0$\n" +
   "l >= 0.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_yl_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the irregular spherical Bessel\n" +
   "functions y_l(x) for l from 0 to lmax\n" +
   "inclusive  for $lmax \\geq 0$\n" +
   "lmax >= 0, storing the results in the array result_array.\n" +
   "The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: lmax >= 0 \n" +
   "Conditions: l=0,1,...,lmax \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_i0_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of zeroth order, \\exp(-|x|) i_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_i0_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of zeroth order, \\exp(-|x|) i_0(x).\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_bessel_i1_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of first order, \\exp(-|x|) i_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_i1_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of first order, \\exp(-|x|) i_1(x).\n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_i2_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of second order,  \\exp(-|x|) i_2(x)  \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_i2_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of second order,  \\exp(-|x|) i_2(x)  \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_il_scaled",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of order l,  \\exp(-|x|) i_l(x) \n" +
   "Domain: l >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_il_scaled_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified spherical Bessel\n" +
   "function of order l,  \\exp(-|x|) i_l(x) \n" +
   "Domain: l >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_il_scaled_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the scaled regular modified\n" +
   "spherical Bessel functions \\exp(-|x|) i_l(x) for l from\n" +
   "0 to lmax inclusive for $lmax \\geq 0$\n" +
   "lmax >= 0, storing the results in\n" +
   "the array result_array. \n" +
   "The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: lmax >= 0 \n" +
   "Conditions: l=0,1,...,lmax \n" +
   "Exceptional Return Values: GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_k0_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of zeroth order, \\exp(x) k_0(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_k0_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of zeroth order, \\exp(x) k_0(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_k1_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of first order, \\exp(x) k_1(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_k1_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of first order, \\exp(x) k_1(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_k2_scaled",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of second order, \\exp(x) k_2(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_k2_scaled_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of second order, \\exp(x) k_2(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_kl_scaled",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of order l, \\exp(x) k_l(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_kl_scaled_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified spherical Bessel\n" +
   "function of order l, \\exp(x) k_l(x), for x>0.\n" +
   "Domain: x > 0.0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_kl_scaled_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double", "result_array[]"]],
  :desc=>
   "This routine computes the values of the scaled irregular modified\n" +
   "spherical Bessel functions \\exp(x) k_l(x) for l from\n" +
   "0 to lmax inclusive for $lmax \\geq 0$\n" +
   "lmax >= 0 and x>0, storing the results in\n" +
   "the array result_array. \n" +
   "The values are computed using recurrence relations for\n" +
   "efficiency, and therefore may differ slightly from the exact values.\n" +
   "Domain: lmax >= 0 \n" +
   "Conditions: l=0,1,...,lmax \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Jnu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of\n" +
   "fractional order \\nu, J_\\nu(x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Jnu_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular cylindrical Bessel function of\n" +
   "fractional order \\nu, J_\\nu(x).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_sequence_Jnu_e",
  :func_type=>"int",
  :args=>
   [["double", "nu"],
    ["gsl_mode_t", "mode"],
    ["size_t", "size"],
    ["double", "v[]"]],
  :desc=>
   "This function computes the regular cylindrical Bessel function of\n" +
   "fractional order \\nu, J_\\nu(x), evaluated at a series of\n" +
   "x values.  The array v of length size contains the\n" +
   "x values.  They are assumed to be strictly ordered and positive.\n" +
   "The array is over-written with the values of J_\\nu(x_i).\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EINVAL"},
 {:func_name=>"gsl_sf_bessel_Ynu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of\n" +
   "fractional order \\nu, Y_\\nu(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_Ynu_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular cylindrical Bessel function of\n" +
   "fractional order \\nu, Y_\\nu(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_Inu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the regular modified Bessel function of\n" +
   "fractional order \\nu, I_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x >= 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_Inu_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular modified Bessel function of\n" +
   "fractional order \\nu, I_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x >= 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_bessel_Inu_scaled",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled regular modified Bessel function of\n" +
   "fractional order \\nu, \\exp(-|x|)I_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   " \\exp(-|x|) I_@{\\nu@}(x)  \n" +
   "Domain: x >= 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_Inu_scaled_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled regular modified Bessel function of\n" +
   "fractional order \\nu, \\exp(-|x|)I_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   " \\exp(-|x|) I_@{\\nu@}(x)  \n" +
   "Domain: x >= 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_Knu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular modified Bessel function of\n" +
   "fractional order \\nu, K_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_Knu_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular modified Bessel function of\n" +
   "fractional order \\nu, K_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_bessel_lnKnu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the logarithm of the irregular modified Bessel\n" +
   "function of fractional order \\nu, \\ln(K_\\nu(x)) for\n" +
   "x>0, \\nu>0. \n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_lnKnu_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the logarithm of the irregular modified Bessel\n" +
   "function of fractional order \\nu, \\ln(K_\\nu(x)) for\n" +
   "x>0, \\nu>0. \n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_Knu_scaled",
  :func_type=>"double",
  :args=>[["double", "nu"], ["double", "x"]],
  :desc=>
   "These routines compute the scaled irregular modified Bessel function of\n" +
   "fractional order \\nu, \\exp(+|x|) K_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_Knu_scaled_e",
  :func_type=>"int",
  :args=>[["double", "nu"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled irregular modified Bessel function of\n" +
   "fractional order \\nu, \\exp(+|x|) K_\\nu(x) for x>0,\n" +
   "\\nu>0.\n" +
   "Domain: x > 0, nu >= 0 \n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_bessel_zero_J0",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_0(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_zero_J0_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_0(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_zero_J1",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_1(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_zero_J1_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_1(x).\n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_zero_Jnu",
  :func_type=>"double",
  :args=>[["double", "nu"], ["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_\\nu(x).  The current implementation does not\n" +
   "support negative values of nu. \n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_bessel_zero_Jnu_e",
  :func_type=>"int",
  :args=>
   [["double", "nu"], ["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th positive zero of\n" +
   "the Bessel function J_\\nu(x).  The current implementation does not\n" +
   "support negative values of nu. \n" +
   "Exceptional Return Values: "},
 {:func_name=>"gsl_sf_hydrogenicR_1",
  :func_type=>"double",
  :args=>[["double", "Z"], ["double", "r"]],
  :desc=>
   "These routines compute the lowest-order normalized hydrogenic bound\n" +
   "state radial wavefunction $R_1 := 2Z \\sqrt{Z} \\exp(-Z r)$\n" +
   "R_1 := 2Z \\sqrt@{Z@} \\exp(-Z r)."},
 {:func_name=>"gsl_sf_hydrogenicR_1_e",
  :func_type=>"int",
  :args=>[["double", "Z"], ["double", "r"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the lowest-order normalized hydrogenic bound\n" +
   "state radial wavefunction $R_1 := 2Z \\sqrt{Z} \\exp(-Z r)$\n" +
   "R_1 := 2Z \\sqrt@{Z@} \\exp(-Z r)."},
 {:func_name=>"gsl_sf_hydrogenicR",
  :func_type=>"double",
  :args=>[["int", "n"], ["int", "l"], ["double", "Z"], ["double", "r"]],
  :desc=>
   "These routines compute the n-th normalized hydrogenic bound state\n" +
   "radial wavefunction,\n" +
   "\n" +
   "R_n := 2 (Z^@{3/2@}/n^2) \\sqrt@{(n-l-1)!/(n+l)!@} \\exp(-Z r/n) (2Zr/n)^l\n" +
   "          L^@{2l+1@}_@{n-l-1@}(2Zr/n).  \n" +
   "\n" +
   "where L^a_b(x) is the generalized Laguerre polynomial (Laguerre Functions).\n" +
   "The normalization is chosen such that the wavefunction \\psi is\n" +
   "given by \n" +
   "$\\psi(n,l,r) = R_n Y_{lm}$\n" +
   "\\psi(n,l,r) = R_n Y_@{lm@}.   "},
 {:func_name=>"gsl_sf_hydrogenicR_e",
  :func_type=>"int",
  :args=>
   [["int", "n"],
    ["int", "l"],
    ["double", "Z"],
    ["double", "r"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the n-th normalized hydrogenic bound state\n" +
   "radial wavefunction,\n" +
   "\n" +
   "R_n := 2 (Z^@{3/2@}/n^2) \\sqrt@{(n-l-1)!/(n+l)!@} \\exp(-Z r/n) (2Zr/n)^l\n" +
   "          L^@{2l+1@}_@{n-l-1@}(2Zr/n).  \n" +
   "\n" +
   "where L^a_b(x) is the generalized Laguerre polynomial (Laguerre Functions).\n" +
   "The normalization is chosen such that the wavefunction \\psi is\n" +
   "given by \n" +
   "$\\psi(n,l,r) = R_n Y_{lm}$\n" +
   "\\psi(n,l,r) = R_n Y_@{lm@}.   "},
 {:func_name=>"gsl_sf_coulomb_wave_FG_e",
  :func_type=>"int",
  :args=>
   [["double", "eta"],
    ["double", "x"],
    ["double", "L_F"],
    ["int", "k"],
    ["gsl_sf_result *", "F"],
    ["gsl_sf_result *", "Fp"],
    ["gsl_sf_result *", "G"],
    ["gsl_sf_result *", "Gp"],
    ["double *", "exp_F"],
    ["double *", "exp_G"]],
  :desc=>
   "This function computes the Coulomb wave functions F_L(\\eta,x),\n" +
   "$G_{L-k}(\\eta,x)$ \n" +
   "G_@{L-k@}(\\eta,x) and their derivatives \n" +
   "F'_L(\\eta,x), \n" +
   "$G'_{L-k}(\\eta,x)$\n" +
   "G'_@{L-k@}(\\eta,x)\n" +
   "with respect to x.  The parameters are restricted to L,\n" +
   "L-k > -1/2, x > 0 and integer k.  Note that L\n" +
   "itself is not restricted to being an integer. The results are stored in\n" +
   "the parameters F, G for the function values and Fp,\n" +
   "Gp for the derivative values.  If an overflow occurs,\n" +
   "GSL_EOVRFLW is returned and scaling exponents are stored in\n" +
   "the modifiable parameters exp_F, exp_G."},
 {:func_name=>"gsl_sf_coulomb_wave_F_array",
  :func_type=>"int",
  :args=>
   [["double", "L_min"],
    ["int", "kmax"],
    ["double", "eta"],
    ["double", "x"],
    ["double", "fc_array[]"],
    ["double *", "F_exponent"]],
  :desc=>
   "This function computes the Coulomb wave function F_L(\\eta,x) for\n" +
   "L = Lmin \\dots Lmin + kmax, storing the results in fc_array.\n" +
   "In the case of overflow the exponent is stored in F_exponent."},
 {:func_name=>"gsl_sf_coulomb_wave_FG_array",
  :func_type=>"int",
  :args=>
   [["double", "L_min"],
    ["int", "kmax"],
    ["double", "eta"],
    ["double", "x"],
    ["double", "fc_array[]"],
    ["double", "gc_array[]"],
    ["double *", "F_exponent"],
    ["double *", "G_exponent"]],
  :desc=>
   "This function computes the functions F_L(\\eta,x),\n" +
   "G_L(\\eta,x) for L = Lmin \\dots Lmin + kmax storing the\n" +
   "results in fc_array and gc_array.  In the case of overflow the\n" +
   "exponents are stored in F_exponent and G_exponent."},
 {:func_name=>"gsl_sf_coulomb_wave_FGp_array",
  :func_type=>"int",
  :args=>
   [["double", "L_min"],
    ["int", "kmax"],
    ["double", "eta"],
    ["double", "x"],
    ["double", "fc_array[]"],
    ["double", "fcp_array[]"],
    ["double", "gc_array[]"],
    ["double", "gcp_array[]"],
    ["double *", "F_exponent"],
    ["double *", "G_exponent"]],
  :desc=>
   "This function computes the functions F_L(\\eta,x),\n" +
   "G_L(\\eta,x) and their derivatives F'_L(\\eta,x),\n" +
   "G'_L(\\eta,x) for L = Lmin \\dots Lmin + kmax storing the\n" +
   "results in fc_array, gc_array, fcp_array and gcp_array.\n" +
   "In the case of overflow the exponents are stored in F_exponent \n" +
   "and G_exponent."},
 {:func_name=>"gsl_sf_coulomb_wave_sphF_array",
  :func_type=>"int",
  :args=>
   [["double", "L_min"],
    ["int", "kmax"],
    ["double", "eta"],
    ["double", "x"],
    ["double", "fc_array[]"],
    ["double", "F_exponent[]"]],
  :desc=>
   "This function computes the Coulomb wave function divided by the argument\n" +
   "F_L(\\eta, x)/x for L = Lmin \\dots Lmin + kmax, storing the\n" +
   "results in fc_array.  In the case of overflow the exponent is\n" +
   "stored in F_exponent. This function reduces to spherical Bessel\n" +
   "functions in the limit \\eta \\to 0."},
 {:func_name=>"gsl_sf_coulomb_CL_e",
  :func_type=>"int",
  :args=>[["double", "L"], ["double", "eta"], ["gsl_sf_result *", "result"]],
  :desc=>
   "This function computes the Coulomb wave function normalization constant\n" +
   "C_L(\\eta) for L > -1."},
 {:func_name=>"gsl_sf_coulomb_CL_array",
  :func_type=>"int",
  :args=>
   [["double", "Lmin"],
    ["int", "kmax"],
    ["double", "eta"],
    ["double", "cl[]"]],
  :desc=>
   "This function computes the Coulomb wave function normalization constant\n" +
   "C_L(\\eta) for L = Lmin \\dots Lmin + kmax, Lmin > -1."},
 {:func_name=>"gsl_sf_airy_Ai",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the Airy function Ai(x) with an accuracy\n" +
   "specified by mode."},
 {:func_name=>"gsl_sf_airy_Ai_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Airy function Ai(x) with an accuracy\n" +
   "specified by mode."},
 {:func_name=>"gsl_sf_airy_Bi",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the Airy function Bi(x) with an accuracy\n" +
   "specified by mode."},
 {:func_name=>"gsl_sf_airy_Bi_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Airy function Bi(x) with an accuracy\n" +
   "specified by mode."},
 {:func_name=>"gsl_sf_airy_Ai_scaled",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute a scaled version of the Airy function\n" +
   "S_A(x) Ai(x).  For x>0 the scaling factor S_A(x) is $\\exp(+(2/3) x^{3/2})$\n" +
   "\\exp(+(2/3) x^(3/2)), \n" +
   "and is 1\n" +
   "for x<0."},
 {:func_name=>"gsl_sf_airy_Ai_scaled_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute a scaled version of the Airy function\n" +
   "S_A(x) Ai(x).  For x>0 the scaling factor S_A(x) is $\\exp(+(2/3) x^{3/2})$\n" +
   "\\exp(+(2/3) x^(3/2)), \n" +
   "and is 1\n" +
   "for x<0."},
 {:func_name=>"gsl_sf_airy_Bi_scaled",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute a scaled version of the Airy function\n" +
   "S_B(x) Bi(x).  For x>0 the scaling factor S_B(x) is $\\exp(-(2/3) x^{3/2})$\n" +
   "exp(-(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_Bi_scaled_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute a scaled version of the Airy function\n" +
   "S_B(x) Bi(x).  For x>0 the scaling factor S_B(x) is $\\exp(-(2/3) x^{3/2})$\n" +
   "exp(-(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_Ai_deriv",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the Airy function derivative Ai'(x) with\n" +
   "an accuracy specified by mode."},
 {:func_name=>"gsl_sf_airy_Ai_deriv_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Airy function derivative Ai'(x) with\n" +
   "an accuracy specified by mode."},
 {:func_name=>"gsl_sf_airy_Bi_deriv",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the Airy function derivative Bi'(x) with\n" +
   "an accuracy specified by mode."},
 {:func_name=>"gsl_sf_airy_Bi_deriv_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Airy function derivative Bi'(x) with\n" +
   "an accuracy specified by mode."},
 {:func_name=>"gsl_sf_airy_Ai_deriv_scaled",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the scaled Airy function derivative \n" +
   "S_A(x) Ai'(x).  \n" +
   "For x>0 the scaling factor S_A(x) is $\\exp(+(2/3) x^{3/2})$\n" +
   "\\exp(+(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_Ai_deriv_scaled_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled Airy function derivative \n" +
   "S_A(x) Ai'(x).  \n" +
   "For x>0 the scaling factor S_A(x) is $\\exp(+(2/3) x^{3/2})$\n" +
   "\\exp(+(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_Bi_deriv_scaled",
  :func_type=>"double",
  :args=>[["double", "x"], ["gsl_mode_t", "mode"]],
  :desc=>
   "These routines compute the scaled Airy function derivative \n" +
   "S_B(x) Bi'(x).\n" +
   "For x>0 the scaling factor S_B(x) is $\\exp(-(2/3) x^{3/2})$\n" +
   "exp(-(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_Bi_deriv_scaled_e",
  :func_type=>"int",
  :args=>
   [["double", "x"], ["gsl_mode_t", "mode"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the scaled Airy function derivative \n" +
   "S_B(x) Bi'(x).\n" +
   "For x>0 the scaling factor S_B(x) is $\\exp(-(2/3) x^{3/2})$\n" +
   "exp(-(2/3) x^(3/2)), and is 1 for x<0."},
 {:func_name=>"gsl_sf_airy_zero_Ai",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function Ai(x)."},
 {:func_name=>"gsl_sf_airy_zero_Ai_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function Ai(x)."},
 {:func_name=>"gsl_sf_airy_zero_Bi",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function Bi(x)."},
 {:func_name=>"gsl_sf_airy_zero_Bi_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function Bi(x)."},
 {:func_name=>"gsl_sf_airy_zero_Ai_deriv",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function derivative Ai'(x)."},
 {:func_name=>"gsl_sf_airy_zero_Ai_deriv_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function derivative Ai'(x)."},
 {:func_name=>"gsl_sf_airy_zero_Bi_deriv",
  :func_type=>"double",
  :args=>[["unsigned int", "s"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function derivative Bi'(x)."},
 {:func_name=>"gsl_sf_airy_zero_Bi_deriv_e",
  :func_type=>"int",
  :args=>[["unsigned int", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the location of the s-th zero of the Airy\n" +
   "function derivative Bi'(x)."},
 {:func_name=>"gsl_sf_zeta_int",
  :func_type=>"double",
  :args=>[["int", "n"]],
  :desc=>
   "These routines compute the Riemann zeta function \\zeta(n) \n" +
   "for integer n,\n" +
   "n \\ne 1.\n" +
   "Domain: n integer, n != 1\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zeta_int_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Riemann zeta function \\zeta(n) \n" +
   "for integer n,\n" +
   "n \\ne 1.\n" +
   "Domain: n integer, n != 1\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zeta",
  :func_type=>"double",
  :args=>[["double", "s"]],
  :desc=>
   "These routines compute the Riemann zeta function \\zeta(s)\n" +
   "for arbitrary s,\n" +
   "s \\ne 1.\n" +
   "Domain: s != 1.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zeta_e",
  :func_type=>"int",
  :args=>[["double", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Riemann zeta function \\zeta(s)\n" +
   "for arbitrary s,\n" +
   "s \\ne 1.\n" +
   "Domain: s != 1.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zetam1_int",
  :func_type=>"double",
  :args=>[["int", "n"]],
  :desc=>
   "These routines compute \\zeta(n) - 1 for integer n,\n" +
   "n \\ne 1.\n" +
   "Domain: n integer, n != 1\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zetam1_int_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\zeta(n) - 1 for integer n,\n" +
   "n \\ne 1.\n" +
   "Domain: n integer, n != 1\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zetam1",
  :func_type=>"double",
  :args=>[["double", "s"]],
  :desc=>
   "These routines compute \\zeta(s) - 1 for arbitrary s,\n" +
   "s \\ne 1.\n" +
   "Domain: s != 1.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_zetam1_e",
  :func_type=>"int",
  :args=>[["double", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute \\zeta(s) - 1 for arbitrary s,\n" +
   "s \\ne 1.\n" +
   "Domain: s != 1.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_hzeta",
  :func_type=>"double",
  :args=>[["double", "s"], ["double", "q"]],
  :desc=>
   "These routines compute the Hurwitz zeta function \\zeta(s,q) for\n" +
   "s > 1, q > 0.\n" +
   "Domain: s > 1.0, q > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_hzeta_e",
  :func_type=>"int",
  :args=>[["double", "s"], ["double", "q"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Hurwitz zeta function \\zeta(s,q) for\n" +
   "s > 1, q > 0.\n" +
   "Domain: s > 1.0, q > 0.0\n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_eta_int",
  :func_type=>"double",
  :args=>[["int", "n"]],
  :desc=>
   "These routines compute the eta function \\eta(n) for integer n.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_eta_int_e",
  :func_type=>"int",
  :args=>[["int", "n"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the eta function \\eta(n) for integer n.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_eta",
  :func_type=>"double",
  :args=>[["double", "s"]],
  :desc=>
   "These routines compute the eta function \\eta(s) for arbitrary s.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_eta_e",
  :func_type=>"int",
  :args=>[["double", "s"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the eta function \\eta(s) for arbitrary s.\n" +
   "Exceptional Return Values: GSL_EUNDRFLW, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_legendre_P1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_P2",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_P3",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_P1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_P2_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_P3_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Legendre polynomials\n" +
   "$P_l(x)$ \n" +
   "P_l(x) using explicit\n" +
   "representations for l=1, 2, 3.\n" +
   "Exceptional Return Values: none"},
 {:func_name=>"gsl_sf_legendre_Pl",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These functions evaluate the Legendre polynomial $P_l(x)$ \n" +
   "P_l(x) for a specific value of l,\n" +
   "x subject to $l \\ge 0$\n" +
   "l >= 0, \n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Pl_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These functions evaluate the Legendre polynomial $P_l(x)$ \n" +
   "P_l(x) for a specific value of l,\n" +
   "x subject to $l \\ge 0$\n" +
   "l >= 0, \n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Pl_array",
  :func_type=>"int",
  :args=>[["int", "lmax"], ["double", "x"], ["double", "result_array[]"]],
  :desc=>
   "\n" +
   "These functions compute arrays of Legendre polynomials\n" +
   "P_l(x) and derivatives dP_l(x)/dx, \n" +
   "for l = 0, \\dots, lmax, \n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Pl_deriv_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "\n" +
   "These functions compute arrays of Legendre polynomials\n" +
   "P_l(x) and derivatives dP_l(x)/dx, \n" +
   "for l = 0, \\dots, lmax, \n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Q0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Legendre function Q_0(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Q0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Legendre function Q_0(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Q1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These routines compute the Legendre function Q_1(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Q1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Legendre function Q_1(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Ql",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "x"]],
  :desc=>
   "These routines compute the Legendre function Q_l(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1 and $l \\ge 0$\n" +
   "l >= 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Ql_e",
  :func_type=>"int",
  :args=>[["int", "l"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Legendre function Q_l(x) for x >\n" +
   "-1, $x \\ne 1$\n" +
   "x != 1 and $l \\ge 0$\n" +
   "l >= 0.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_array",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "polynomials for 0 \\le l \\le lmax and\n" +
   "0 \\le m \\le l for\n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1.\n" +
   "The norm parameter specifies which normalization is used.\n" +
   "The normalized P_l^m(x) values are stored in result_array, whose\n" +
   "minimum size can be obtained from calling gsl_sf_legendre_array_n.\n" +
   "The array index of P_l^m(x) is obtained from calling\n" +
   "gsl_sf_legendre_array_index(l, m). To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_array_e",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["const double", "csphase"],
    ["double", "result_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "polynomials for 0 \\le l \\le lmax and\n" +
   "0 \\le m \\le l for\n" +
   "$|x| \\le 1$\n" +
   "|x| <= 1.\n" +
   "The norm parameter specifies which normalization is used.\n" +
   "The normalized P_l^m(x) values are stored in result_array, whose\n" +
   "minimum size can be obtained from calling gsl_sf_legendre_array_n.\n" +
   "The array index of P_l^m(x) is obtained from calling\n" +
   "gsl_sf_legendre_array_index(l, m). To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv_array",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their first derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x) values and their derivatives\n" +
   "dP_l^m(x)/dx are stored in result_array and\n" +
   "result_deriv_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv_array_e",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["const double", "csphase"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their first derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x) values and their derivatives\n" +
   "dP_l^m(x)/dx are stored in result_array and\n" +
   "result_deriv_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv_alt_array",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their (alternate) first derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The normalized P_l^m(x) values and their derivatives\n" +
   "dP_l^m(\\cos{\\theta})/d\\theta are stored in result_array and\n" +
   "result_deriv_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv_alt_array_e",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["const double", "csphase"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their (alternate) first derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The normalized P_l^m(x) values and their derivatives\n" +
   "dP_l^m(\\cos{\\theta})/d\\theta are stored in result_array and\n" +
   "result_deriv_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv2_array",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"],
    ["double", "result_deriv2_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their first and second derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x), their first derivatives\n" +
   "dP_l^m(x)/dx, and their second derivatives\n" +
   "d^2 P_l^m(x)/dx^2 are stored in result_array,\n" +
   "result_deriv_array, and result_deriv2_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv2_array_e",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["const double", "csphase"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"],
    ["double", "result_deriv2_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their first and second derivatives up to degree lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x), their first derivatives\n" +
   "dP_l^m(x)/dx, and their second derivatives\n" +
   "d^2 P_l^m(x)/dx^2 are stored in result_array,\n" +
   "result_deriv_array, and result_deriv2_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv2_alt_array",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"],
    ["double", "result_deriv2_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their (alternate) first and second derivatives up to degree\n" +
   "lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x), their first derivatives\n" +
   "dP_l^m(\\cos{\\theta})/d\\theta, and their second derivatives\n" +
   "d^2 P_l^m(\\cos{\\theta})/d\\theta^2 are stored in result_array,\n" +
   "result_deriv_array, and result_deriv2_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_deriv2_alt_array_e",
  :func_type=>"int",
  :args=>
   [["const gsl_sf_legendre_t", "norm"],
    ["const size_t", "lmax"],
    ["const double", "x"],
    ["const double", "csphase"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"],
    ["double", "result_deriv2_array[]"]],
  :desc=>
   "These functions calculate all normalized associated Legendre\n" +
   "functions and their (alternate) first and second derivatives up to degree\n" +
   "lmax for\n" +
   "$|x| < 1$\n" +
   "|x| < 1.\n" +
   "The parameter norm specifies the normalization used. The\n" +
   "normalized P_l^m(x), their first derivatives\n" +
   "dP_l^m(\\cos{\\theta})/d\\theta, and their second derivatives\n" +
   "d^2 P_l^m(\\cos{\\theta})/d\\theta^2 are stored in result_array,\n" +
   "result_deriv_array, and result_deriv2_array respectively.\n" +
   "To include or exclude\n" +
   "the Condon-Shortley phase factor of (-1)^m, set the parameter\n" +
   "csphase to either -1 or 1 respectively in the\n" +
   "_e function. This factor is included by default."},
 {:func_name=>"gsl_sf_legendre_array_n",
  :func_type=>"size_t",
  :args=>[["const size_t", "lmax"]],
  :desc=>
   "This function returns the minimum array size for maximum degree lmax\n" +
   "needed for the array versions of the associated Legendre functions.\n" +
   "Size is calculated as the total number of P_l^m(x) functions,\n" +
   "plus extra space for precomputing multiplicative factors used in the\n" +
   "recurrence relations."},
 {:func_name=>"gsl_sf_legendre_array_index",
  :func_type=>"size_t",
  :args=>[["const size_t", "l"], ["const size_t", "m"]],
  :desc=>
   "This function returns the index into result_array,\n" +
   "result_deriv_array, or result_deriv2_array corresponding\n" +
   "to P_l^m(x), P_l^{'m}(x), or P_l^{''m}(x). The\n" +
   "index is given by l(l+1)/2 + m."},
 {:func_name=>"gsl_sf_legendre_Plm",
  :func_type=>"double",
  :args=>[["int", "l"], ["int", "m"], ["double", "x"]],
  :desc=>
   "These routines compute the associated Legendre polynomial\n" +
   "P_l^m(x) for $m \\ge 0$\n" +
   "m >= 0, $l \\ge m$\n" +
   "l >= m, $|x| \\le 1$\n" +
   "|x| <= 1. \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_legendre_Plm_e",
  :func_type=>"int",
  :args=>
   [["int", "l"],
    ["int", "m"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the associated Legendre polynomial\n" +
   "P_l^m(x) for $m \\ge 0$\n" +
   "m >= 0, $l \\ge m$\n" +
   "l >= m, $|x| \\le 1$\n" +
   "|x| <= 1. \n" +
   "Exceptional Return Values: GSL_EDOM, GSL_EOVRFLW"},
 {:func_name=>"gsl_sf_legendre_sphPlm",
  :func_type=>"double",
  :args=>[["int", "l"], ["int", "m"], ["double", "x"]],
  :desc=>
   "These routines compute the normalized associated Legendre polynomial\n" +
   "$\\sqrt{(2l+1)/(4\\pi)} \\sqrt{(l-m)!/(l+m)!} P_l^m(x)$\n" +
   "\\sqrt@{(2l+1)/(4\\pi)@} \\sqrt@{(l-m)!/(l+m)!@} P_l^m(x) suitable\n" +
   "for use in spherical harmonics.  The parameters must satisfy $m \\ge 0$\n" +
   "m >= 0, $l \\ge m$\n" +
   "l >= m, $|x| \\le 1$\n" +
   "|x| <= 1. Theses routines avoid the overflows\n" +
   "that occur for the standard normalization of P_l^m(x).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_sphPlm_e",
  :func_type=>"int",
  :args=>
   [["int", "l"],
    ["int", "m"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the normalized associated Legendre polynomial\n" +
   "$\\sqrt{(2l+1)/(4\\pi)} \\sqrt{(l-m)!/(l+m)!} P_l^m(x)$\n" +
   "\\sqrt@{(2l+1)/(4\\pi)@} \\sqrt@{(l-m)!/(l+m)!@} P_l^m(x) suitable\n" +
   "for use in spherical harmonics.  The parameters must satisfy $m \\ge 0$\n" +
   "m >= 0, $l \\ge m$\n" +
   "l >= m, $|x| \\le 1$\n" +
   "|x| <= 1. Theses routines avoid the overflows\n" +
   "that occur for the standard normalization of P_l^m(x).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_Plm_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["int", "m"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "These functions are now deprecated and will be removed in a future\n" +
   "release; see gsl_sf_legendre_array and\n" +
   "gsl_sf_legendre_deriv_array."},
 {:func_name=>"gsl_sf_legendre_Plm_deriv_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["int", "m"],
    ["double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions are now deprecated and will be removed in a future\n" +
   "release; see gsl_sf_legendre_array and\n" +
   "gsl_sf_legendre_deriv_array."},
 {:func_name=>"gsl_sf_legendre_sphPlm_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["int", "m"],
    ["double", "x"],
    ["double", "result_array[]"]],
  :desc=>
   "These functions are now deprecated and will be removed in a future\n" +
   "release; see gsl_sf_legendre_array and\n" +
   "gsl_sf_legendre_deriv_array."},
 {:func_name=>"gsl_sf_legendre_sphPlm_deriv_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["int", "m"],
    ["double", "x"],
    ["double", "result_array[]"],
    ["double", "result_deriv_array[]"]],
  :desc=>
   "These functions are now deprecated and will be removed in a future\n" +
   "release; see gsl_sf_legendre_array and\n" +
   "gsl_sf_legendre_deriv_array."},
 {:func_name=>"gsl_sf_legendre_array_size",
  :func_type=>"int",
  :args=>[["const int", "lmax"], ["const int", "m"]],
  :desc=>
   "This function is now deprecated and will be removed in a future\n" +
   "release."},
 {:func_name=>"gsl_sf_conicalP_half",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the irregular Spherical Conical Function\n" +
   "$P^{1/2}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{1/2@}_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_half_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the irregular Spherical Conical Function\n" +
   "$P^{1/2}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{1/2@}_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_mhalf",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the regular Spherical Conical Function\n" +
   "$P^{-1/2}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-1/2@}_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_mhalf_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the regular Spherical Conical Function\n" +
   "$P^{-1/2}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-1/2@}_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_0",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the conical function\n" +
   "$P^0_{-1/2 + i \\lambda}(x)$\n" +
   "P^0_@{-1/2 + i \\lambda@}(x)\n" +
   "for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_0_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the conical function\n" +
   "$P^0_{-1/2 + i \\lambda}(x)$\n" +
   "P^0_@{-1/2 + i \\lambda@}(x)\n" +
   "for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_1",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the conical function \n" +
   "$P^1_{-1/2 + i \\lambda}(x)$\n" +
   "P^1_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_1_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the conical function \n" +
   "$P^1_{-1/2 + i \\lambda}(x)$\n" +
   "P^1_@{-1/2 + i \\lambda@}(x) for x > -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_sph_reg",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the Regular Spherical Conical Function\n" +
   "$P^{-1/2-l}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-1/2-l@}_@{-1/2 + i \\lambda@}(x) for x > -1, $l \\ge -1$\n" +
   "l >= -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_sph_reg_e",
  :func_type=>"int",
  :args=>
   [["int", "l"],
    ["double", "lambda"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Regular Spherical Conical Function\n" +
   "$P^{-1/2-l}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-1/2-l@}_@{-1/2 + i \\lambda@}(x) for x > -1, $l \\ge -1$\n" +
   "l >= -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_cyl_reg",
  :func_type=>"double",
  :args=>[["int", "m"], ["double", "lambda"], ["double", "x"]],
  :desc=>
   "These routines compute the Regular Cylindrical Conical Function\n" +
   "$P^{-m}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-m@}_@{-1/2 + i \\lambda@}(x) for x > -1, $m \\ge -1$\n" +
   "m >= -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_conicalP_cyl_reg_e",
  :func_type=>"int",
  :args=>
   [["int", "m"],
    ["double", "lambda"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Regular Cylindrical Conical Function\n" +
   "$P^{-m}_{-1/2 + i \\lambda}(x)$\n" +
   "P^@{-m@}_@{-1/2 + i \\lambda@}(x) for x > -1, $m \\ge -1$\n" +
   "m >= -1.\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_0",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "eta"]],
  :desc=>
   "These routines compute the zeroth radial eigenfunction of the Laplacian on the\n" +
   "3-dimensional hyperbolic space,\n" +
   "$$L^{H3d}_0(\\lambda,\\eta) := {\\sin(\\lambda\\eta) \\over \\lambda\\sinh(\\eta)}$$\n" +
   "L^@{H3d@}_0(\\lambda,\\eta) := \\sin(\\lambda\\eta)/(\\lambda\\sinh(\\eta))\n" +
   "for $\\eta \\ge 0$\n" +
   "\\eta >= 0.\n" +
   "In the flat limit this takes the form\n" +
   "$L^{H3d}_0(\\lambda,\\eta) = j_0(\\lambda\\eta)$\n" +
   "L^@{H3d@}_0(\\lambda,\\eta) = j_0(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_0_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "eta"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the zeroth radial eigenfunction of the Laplacian on the\n" +
   "3-dimensional hyperbolic space,\n" +
   "$$L^{H3d}_0(\\lambda,\\eta) := {\\sin(\\lambda\\eta) \\over \\lambda\\sinh(\\eta)}$$\n" +
   "L^@{H3d@}_0(\\lambda,\\eta) := \\sin(\\lambda\\eta)/(\\lambda\\sinh(\\eta))\n" +
   "for $\\eta \\ge 0$\n" +
   "\\eta >= 0.\n" +
   "In the flat limit this takes the form\n" +
   "$L^{H3d}_0(\\lambda,\\eta) = j_0(\\lambda\\eta)$\n" +
   "L^@{H3d@}_0(\\lambda,\\eta) = j_0(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_1",
  :func_type=>"double",
  :args=>[["double", "lambda"], ["double", "eta"]],
  :desc=>
   "These routines compute the first radial eigenfunction of the Laplacian on\n" +
   "the 3-dimensional hyperbolic space,\n" +
   "$$L^{H3d}_1(\\lambda,\\eta) := {1\\over\\sqrt{\\lambda^2 + 1}} {\\left(\\sin(\\lambda \\eta)\\over \\lambda \\sinh(\\eta)\\right)} \\left(\\coth(\\eta) - \\lambda \\cot(\\lambda\\eta)\\right)$$\n" +
   "L^@{H3d@}_1(\\lambda,\\eta) := 1/\\sqrt@{\\lambda^2 + 1@} \\sin(\\lambda \\eta)/(\\lambda \\sinh(\\eta)) (\\coth(\\eta) - \\lambda \\cot(\\lambda\\eta))\n" +
   "for $\\eta \\ge 0$\n" +
   "\\eta >= 0.\n" +
   "In the flat limit this takes the form \n" +
   "$L^{H3d}_1(\\lambda,\\eta) = j_1(\\lambda\\eta)$\n" +
   "L^@{H3d@}_1(\\lambda,\\eta) = j_1(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_1_e",
  :func_type=>"int",
  :args=>
   [["double", "lambda"], ["double", "eta"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the first radial eigenfunction of the Laplacian on\n" +
   "the 3-dimensional hyperbolic space,\n" +
   "$$L^{H3d}_1(\\lambda,\\eta) := {1\\over\\sqrt{\\lambda^2 + 1}} {\\left(\\sin(\\lambda \\eta)\\over \\lambda \\sinh(\\eta)\\right)} \\left(\\coth(\\eta) - \\lambda \\cot(\\lambda\\eta)\\right)$$\n" +
   "L^@{H3d@}_1(\\lambda,\\eta) := 1/\\sqrt@{\\lambda^2 + 1@} \\sin(\\lambda \\eta)/(\\lambda \\sinh(\\eta)) (\\coth(\\eta) - \\lambda \\cot(\\lambda\\eta))\n" +
   "for $\\eta \\ge 0$\n" +
   "\\eta >= 0.\n" +
   "In the flat limit this takes the form \n" +
   "$L^{H3d}_1(\\lambda,\\eta) = j_1(\\lambda\\eta)$\n" +
   "L^@{H3d@}_1(\\lambda,\\eta) = j_1(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d",
  :func_type=>"double",
  :args=>[["int", "l"], ["double", "lambda"], ["double", "eta"]],
  :desc=>
   "These routines compute the l-th radial eigenfunction of the\n" +
   "Laplacian on the 3-dimensional hyperbolic space $\\eta \\ge 0$\n" +
   "\\eta >= 0, $l \\ge 0$\n" +
   "l >= 0. In the flat limit this takes the form\n" +
   "$L^{H3d}_l(\\lambda,\\eta) = j_l(\\lambda\\eta)$\n" +
   "L^@{H3d@}_l(\\lambda,\\eta) = j_l(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_e",
  :func_type=>"int",
  :args=>
   [["int", "l"],
    ["double", "lambda"],
    ["double", "eta"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the l-th radial eigenfunction of the\n" +
   "Laplacian on the 3-dimensional hyperbolic space $\\eta \\ge 0$\n" +
   "\\eta >= 0, $l \\ge 0$\n" +
   "l >= 0. In the flat limit this takes the form\n" +
   "$L^{H3d}_l(\\lambda,\\eta) = j_l(\\lambda\\eta)$\n" +
   "L^@{H3d@}_l(\\lambda,\\eta) = j_l(\\lambda\\eta).\n" +
   "Exceptional Return Values: GSL_EDOM"},
 {:func_name=>"gsl_sf_legendre_H3d_array",
  :func_type=>"int",
  :args=>
   [["int", "lmax"],
    ["double", "lambda"],
    ["double", "eta"],
    ["double", "result_array[]"]],
  :desc=>
   "This function computes an array of radial eigenfunctions\n" +
   "$L^{H3d}_l( \\lambda, \\eta)$ \n" +
   "L^@{H3d@}_l(\\lambda, \\eta) \n" +
   "for $0 \\le l \\le lmax$\n" +
   "0 <= l <= lmax.\n" +
   "Exceptional Return Values:"},
 {:func_name=>"gsl_sf_hyperg_0F1",
  :func_type=>"double",
  :args=>[["double", "c"], ["double", "x"]],
  :desc=>
   "These routines compute the hypergeometric function ${}_0F_1(c,x)$\n" +
   "0F1(c,x).  \n" +
   "It is related to Bessel functions\n" +
   "0F1[c,x] =\n" +
   "Gamma[c]    x^(1/2(1-c)) I_(c-1)(2 Sqrt[x])\n" +
   "Gamma[c] (-x)^(1/2(1-c)) J_(c-1)(2 Sqrt[-x])\n" +
   "exceptions: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_hyperg_0F1_e",
  :func_type=>"int",
  :args=>[["double", "c"], ["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the hypergeometric function ${}_0F_1(c,x)$\n" +
   "0F1(c,x).  \n" +
   "It is related to Bessel functions\n" +
   "0F1[c,x] =\n" +
   "Gamma[c]    x^(1/2(1-c)) I_(c-1)(2 Sqrt[x])\n" +
   "Gamma[c] (-x)^(1/2(1-c)) J_(c-1)(2 Sqrt[-x])\n" +
   "exceptions: GSL_EOVRFLW, GSL_EUNDRFLW"},
 {:func_name=>"gsl_sf_hyperg_1F1_int",
  :func_type=>"double",
  :args=>[["int", "m"], ["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "${}_1F_1(m,n,x) = M(m,n,x)$\n" +
   "1F1(m,n,x) = M(m,n,x) for integer parameters m, n.\n" +
   "exceptions: "},
 {:func_name=>"gsl_sf_hyperg_1F1_int_e",
  :func_type=>"int",
  :args=>
   [["int", "m"],
    ["int", "n"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "${}_1F_1(m,n,x) = M(m,n,x)$\n" +
   "1F1(m,n,x) = M(m,n,x) for integer parameters m, n.\n" +
   "exceptions: "},
 {:func_name=>"gsl_sf_hyperg_1F1",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "x"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "${}_1F_1(a,b,x) = M(a,b,x)$\n" +
   "1F1(a,b,x) = M(a,b,x) for general parameters a, b.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_1F1_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "${}_1F_1(a,b,x) = M(a,b,x)$\n" +
   "1F1(a,b,x) = M(a,b,x) for general parameters a, b.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_U_int",
  :func_type=>"double",
  :args=>[["int", "m"], ["int", "n"], ["double", "x"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "U(m,n,x) for integer parameters m, n.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_U_int_e",
  :func_type=>"int",
  :args=>
   [["int", "m"],
    ["int", "n"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the confluent hypergeometric function\n" +
   "U(m,n,x) for integer parameters m, n.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_U_int_e10_e",
  :func_type=>"int",
  :args=>
   [["int", "m"],
    ["int", "n"],
    ["double", "x"],
    ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This routine computes the confluent hypergeometric function\n" +
   "U(m,n,x) for integer parameters m, n using the\n" +
   "gsl_sf_result_e10 type to return a result with extended range."},
 {:func_name=>"gsl_sf_hyperg_U",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "x"]],
  :desc=>
   "These routines compute the confluent hypergeometric function U(a,b,x).\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_U_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the confluent hypergeometric function U(a,b,x).\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_U_e10_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "x"],
    ["gsl_sf_result_e10 *", "result"]],
  :desc=>
   "This routine computes the confluent hypergeometric function\n" +
   "U(a,b,x) using the gsl_sf_result_e10 type to return a\n" +
   "result with extended range. \n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "c"], ["double", "x"]],
  :desc=>
   "These routines compute the Gauss hypergeometric function \n" +
   "${}_2F_1(a,b,c,x) = F(a,b,c,x)$\n" +
   "2F1(a,b,c,x) = F(a,b,c,x) for |x| < 1.  \n" +
   "\n" +
   "If the arguments (a,b,c,x) are too close to a singularity then\n" +
   "the function can return the error code GSL_EMAXITER when the\n" +
   "series approximation converges too slowly.  This occurs in the region of\n" +
   "x=1, c - a - b = m for integer m.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Gauss hypergeometric function \n" +
   "${}_2F_1(a,b,c,x) = F(a,b,c,x)$\n" +
   "2F1(a,b,c,x) = F(a,b,c,x) for |x| < 1.  \n" +
   "\n" +
   "If the arguments (a,b,c,x) are too close to a singularity then\n" +
   "the function can return the error code GSL_EMAXITER when the\n" +
   "series approximation converges too slowly.  This occurs in the region of\n" +
   "x=1, c - a - b = m for integer m.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1_conj",
  :func_type=>"double",
  :args=>
   [["double", "aR"], ["double", "aI"], ["double", "c"], ["double", "x"]],
  :desc=>
   "These routines compute the Gauss hypergeometric function\n" +
   "${}_2F_1(a_R + i a_I, aR - i aI, c, x)$\n" +
   "2F1(a_R + i a_I, a_R - i a_I, c, x) with complex parameters \n" +
   "for |x| < 1."},
 {:func_name=>"gsl_sf_hyperg_2F1_conj_e",
  :func_type=>"int",
  :args=>
   [["double", "aR"],
    ["double", "aI"],
    ["double", "c"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the Gauss hypergeometric function\n" +
   "${}_2F_1(a_R + i a_I, aR - i aI, c, x)$\n" +
   "2F1(a_R + i a_I, a_R - i a_I, c, x) with complex parameters \n" +
   "for |x| < 1."},
 {:func_name=>"gsl_sf_hyperg_2F1_renorm",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "c"], ["double", "x"]],
  :desc=>
   "These routines compute the renormalized Gauss hypergeometric function\n" +
   "${}_2F_1(a,b,c,x) / \\Gamma(c)$\n" +
   "2F1(a,b,c,x) / \\Gamma(c) for |x| < 1.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1_renorm_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "c"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the renormalized Gauss hypergeometric function\n" +
   "${}_2F_1(a,b,c,x) / \\Gamma(c)$\n" +
   "2F1(a,b,c,x) / \\Gamma(c) for |x| < 1.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1_conj_renorm",
  :func_type=>"double",
  :args=>
   [["double", "aR"], ["double", "aI"], ["double", "c"], ["double", "x"]],
  :desc=>
   "These routines compute the renormalized Gauss hypergeometric function\n" +
   "${}_2F_1(a_R + i a_I, a_R - i a_I, c, x) / \\Gamma(c)$\n" +
   "2F1(a_R + i a_I, a_R - i a_I, c, x) / \\Gamma(c) for |x| < 1.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F1_conj_renorm_e",
  :func_type=>"int",
  :args=>
   [["double", "aR"],
    ["double", "aI"],
    ["double", "c"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the renormalized Gauss hypergeometric function\n" +
   "${}_2F_1(a_R + i a_I, a_R - i a_I, c, x) / \\Gamma(c)$\n" +
   "2F1(a_R + i a_I, a_R - i a_I, c, x) / \\Gamma(c) for |x| < 1.\n" +
   "exceptions:"},
 {:func_name=>"gsl_sf_hyperg_2F0",
  :func_type=>"double",
  :args=>[["double", "a"], ["double", "b"], ["double", "x"]],
  :desc=>
   "These routines compute the hypergeometric function ${}_2F_0(a,b,x)$\n" +
   "2F0(a,b,x).  The series representation\n" +
   "is a divergent hypergeometric series.  However, for x < 0 we\n" +
   "have \n" +
   "${}_2F_0(a,b,x) = (-1/x)^a U(a,1+a-b,-1/x)$\n" +
   "2F0(a,b,x) = (-1/x)^a U(a,1+a-b,-1/x)\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_hyperg_2F0_e",
  :func_type=>"int",
  :args=>
   [["double", "a"],
    ["double", "b"],
    ["double", "x"],
    ["gsl_sf_result *", "result"]],
  :desc=>
   "These routines compute the hypergeometric function ${}_2F_0(a,b,x)$\n" +
   "2F0(a,b,x).  The series representation\n" +
   "is a divergent hypergeometric series.  However, for x < 0 we\n" +
   "have \n" +
   "${}_2F_0(a,b,x) = (-1/x)^a U(a,1+a-b,-1/x)$\n" +
   "2F0(a,b,x) = (-1/x)^a U(a,1+a-b,-1/x)\n" +
   "exceptions: GSL_EDOM"},
 {:func_name=>"gsl_sf_clausen",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>"These routines compute the Clausen integral Cl_2(x)."},
 {:func_name=>"gsl_sf_clausen_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>"These routines compute the Clausen integral Cl_2(x)."},
 {:func_name=>"gsl_sf_lambert_W0",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These compute the principal branch of the Lambert W function, W_0(x).\n" +
   "exceptions: GSL_EDOM, GSL_EMAXITER"},
 {:func_name=>"gsl_sf_lambert_W0_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These compute the principal branch of the Lambert W function, W_0(x).\n" +
   "exceptions: GSL_EDOM, GSL_EMAXITER"},
 {:func_name=>"gsl_sf_lambert_Wm1",
  :func_type=>"double",
  :args=>[["double", "x"]],
  :desc=>
   "These compute the secondary real-valued branch of the Lambert W function, \n" +
   "$W_{-1}(x)$\n" +
   "W_@{-1@}(x).\n" +
   "exceptions: GSL_EDOM, GSL_EMAXITER"},
 {:func_name=>"gsl_sf_lambert_Wm1_e",
  :func_type=>"int",
  :args=>[["double", "x"], ["gsl_sf_result *", "result"]],
  :desc=>
   "These compute the secondary real-valued branch of the Lambert W function, \n" +
   "$W_{-1}(x)$\n" +
   "W_@{-1@}(x).\n" +
   "exceptions: GSL_EDOM, GSL_EMAXITER"}]

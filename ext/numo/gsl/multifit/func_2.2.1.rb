[{:func_name=>"gsl_multifit_linear",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_vector *", "c"],
    ["gsl_matrix *", "cov"],
    ["double *", "chisq"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function computes the best-fit parameters c of the model\n" +
   "y = X c for the observations y and the matrix of\n" +
   "predictor variables X, using the preallocated workspace provided\n" +
   "in work.  The p-by-p variance-covariance matrix of the model parameters\n" +
   "cov is set to \\sigma^2 (X^T X)^{-1}, where \\sigma is\n" +
   "the standard deviation of the fit residuals.\n" +
   "The sum of squares of the residuals from the best-fit,\n" +
   "\\chi^2, is returned in chisq. If the coefficient of\n" +
   "determination is desired, it can be computed from the expression\n" +
   "R^2 = 1 - \\chi^2 / TSS, where the total sum of squares (TSS) of\n" +
   "the observations y may be computed from gsl_stats_tss.\n" +
   "\n" +
   "The best-fit is found by singular value decomposition of the matrix\n" +
   "X using the modified Golub-Reinsch SVD algorithm, with column\n" +
   "scaling to improve the accuracy of the singular values. Any components\n" +
   "which have zero singular value (to machine precision) are discarded\n" +
   "from the fit."},
 {:func_name=>"gsl_multifit_linear_L_decomp",
  :func_type=>"int",
  :args=>[["gsl_matrix *", "L"], ["gsl_vector *", "tau"]],
  :desc=>
   "This function factors the m-by-p regularization matrix\n" +
   "L into a form needed for the later transformation to standard form. L\n" +
   "may have any number of rows m. If m \\ge p the QR decomposition of\n" +
   "L is computed and stored in L on output. If m < p, the QR decomposition\n" +
   "of L^T is computed and stored in L on output. On output,\n" +
   "the Householder scalars are stored in the vector tau of size MIN(m,p).\n" +
   "These outputs will be used by gsl_multifit_linear_wstdform2 to complete the\n" +
   "transformation to standard form."},
 {:func_name=>"gsl_multifit_linear_Lk",
  :func_type=>"int",
  :args=>[["const size_t", "p"], ["const size_t", "k"], ["gsl_matrix *", "L"]],
  :desc=>
   "This function computes the discrete approximation to the derivative operator L_k of\n" +
   "order k on a regular grid of p points and stores it in L. The dimensions of L are\n" +
   "(p-k)-by-p."},
 {:func_name=>"gsl_multifit_linear_Lsobolev",
  :func_type=>"int",
  :args=>
   [["const size_t", "p"],
    ["const size_t", "kmax"],
    ["const gsl_vector *", "alpha"],
    ["gsl_matrix *", "L"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function computes the regularization matrix L corresponding to the weighted Sobolov norm\n" +
   "||L c||^2 = \\sum_k \\alpha_k^2 ||L_k c||^2 where L_k approximates the derivative\n" +
   "operator of order k. This regularization norm can be useful in applications where\n" +
   "it is necessary to smooth several derivatives of the solution. p is the number of\n" +
   "model parameters, kmax is the highest derivative to include in the summation above, and\n" +
   "alpha is the vector of weights of size kmax + 1, where alpha[k] = \\alpha_k\n" +
   "is the weight assigned to the derivative of order k.  The output matrix L is size\n" +
   "p-by-p and upper triangular."},
 {:func_name=>"gsl_multifit_linear_alloc",
  :func_type=>"gsl_multifit_linear_workspace *",
  :args=>[["const size_t", "n"], ["const size_t", "p"]],
  :desc=>
   "This function allocates a workspace for fitting a model to a maximum of n\n" +
   "observations using a maximum of p parameters. The user may later supply\n" +
   "a smaller least squares system if desired. The size of the workspace is\n" +
   "O(np + p^2)."},
 {:func_name=>"gsl_multifit_linear_applyW",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "WX"],
    ["gsl_vector *", "Wy"]],
  :desc=>
   "For weighted least squares systems with L = I, this function may be used to\n" +
   "convert the system to standard form by applying the weight matrix W = diag(w)\n" +
   "to the least squares matrix X and observation vector y. On output, WX\n" +
   "is equal to W^{1/2} X and Wy is equal to W^{1/2} y. It is allowed\n" +
   "for WX = X and Wy = y for an in-place transform."},
 {:func_name=>"gsl_multifit_linear_bsvd",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"], ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function performs a singular value decomposition of the\n" +
   "matrix X and stores the SVD factors internally in work.\n" +
   "The matrix X is first balanced by applying column scaling\n" +
   "factors to improve the accuracy of the singular values."},
 {:func_name=>"gsl_multifit_linear_est",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "x"],
    ["const gsl_vector *", "c"],
    ["const gsl_matrix *", "cov"],
    ["double *", "y"],
    ["double *", "y_err"]],
  :desc=>
   "This function uses the best-fit multilinear regression coefficients\n" +
   "c and their covariance matrix\n" +
   "cov to compute the fitted function value\n" +
   "y and its standard deviation y_err for the model y = x.c \n" +
   "at the point x."},
 {:func_name=>"gsl_multifit_linear_free",
  :func_type=>"void",
  :args=>[["gsl_multifit_linear_workspace *", "work"]],
  :desc=>"This function frees the memory associated with the workspace w."},
 {:func_name=>"gsl_multifit_linear_genform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_vector *", "cs"],
    ["gsl_vector *", "c"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "After a regularized system has been solved with\n" +
   "L = diag(\\l_0,\\l_1,...,\\l_{p-1}),\n" +
   "this function backtransforms the standard form solution vector cs\n" +
   "to recover the solution vector of the original problem c. The\n" +
   "diagonal matrix elements l_i are provided in\n" +
   "the vector L. It is allowed to have c = cs for an\n" +
   "in-place transform."},
 {:func_name=>"gsl_multifit_linear_genform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["const gsl_vector *", "cs"],
    ["const gsl_matrix *", "M"],
    ["gsl_vector *", "c"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "After a regularized system has been solved with a general rectangular matrix L,\n" +
   "specified by (LQR,Ltau), this function backtransforms the standard form solution cs\n" +
   "to recover the solution vector of the original problem, which is stored in c,\n" +
   "of length p. The original least squares matrix and observation vector are provided in\n" +
   "X and y respectively. M is the matrix computed by\n" +
   "gsl_multifit_linear_stdform2. For weighted fits, the weight vector\n" +
   "w must also be supplied."},
 {:func_name=>"gsl_multifit_linear_lcorner",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "rho"],
    ["const gsl_vector *", "eta"],
    ["size_t *", "idx"]],
  :desc=>
   "This function attempts to locate the corner of the L-curve\n" +
   "(||y - X c||, ||L c||) defined by the rho and eta\n" +
   "input arrays respectively. The corner is defined as the point of maximum\n" +
   "curvature of the L-curve in log-log scale. The rho and eta\n" +
   "arrays can be outputs of gsl_multifit_linear_lcurve. The\n" +
   "algorithm used simply fits a circle to 3 consecutive points on the L-curve\n" +
   "and uses the circle's radius to determine the curvature at\n" +
   "the middle point. Therefore, the input array sizes must be\n" +
   "\\ge 3. With more points provided for the L-curve, a better\n" +
   "estimate of the curvature can be obtained. The array index\n" +
   "corresponding to maximum curvature (ie: the corner) is returned\n" +
   "in idx. If the input arrays contain colinear points,\n" +
   "this function could fail and return GSL_EINVAL."},
 {:func_name=>"gsl_multifit_linear_lcorner2",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "reg_param"],
    ["const gsl_vector *", "eta"],
    ["size_t *", "idx"]],
  :desc=>
   "This function attempts to locate the corner of an alternate L-curve\n" +
   "(\\lambda^2, ||L c||^2) studied by Rezghi and Hosseini, 2009.\n" +
   "This alternate L-curve can provide better estimates of the\n" +
   "regularization parameter for smooth solution vectors. The regularization\n" +
   "parameters \\lambda and solution norms ||L c|| are provided\n" +
   "in the reg_param and eta input arrays respectively. The\n" +
   "corner is defined as the point of maximum curvature of this\n" +
   "alternate L-curve in linear scale. The reg_param and eta\n" +
   "arrays can be outputs of gsl_multifit_linear_lcurve. The\n" +
   "algorithm used simply fits a circle to 3 consecutive points on the L-curve\n" +
   "and uses the circle's radius to determine the curvature at\n" +
   "the middle point. Therefore, the input array sizes must be\n" +
   "\\ge 3. With more points provided for the L-curve, a better\n" +
   "estimate of the curvature can be obtained. The array index\n" +
   "corresponding to maximum curvature (ie: the corner) is returned\n" +
   "in idx. If the input arrays contain colinear points,\n" +
   "this function could fail and return GSL_EINVAL."},
 {:func_name=>"gsl_multifit_linear_lcurve",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "y"],
    ["gsl_vector *", "reg_param"],
    ["gsl_vector *", "rho"],
    ["gsl_vector *", "eta"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function computes the L-curve for a least squares system\n" +
   "using the right hand side vector y and the SVD decomposition\n" +
   "of the least squares matrix X, which must be provided\n" +
   "to gsl_multifit_linear_svd prior to\n" +
   "calling this function. The output vectors reg_param,\n" +
   "rho, and eta must all be the same size, and will\n" +
   "contain the regularization parameters \\lambda_i, residual norms\n" +
   "||y - X c_i||, and solution norms || L c_i ||\n" +
   "which compose the L-curve, where c_i is the regularized\n" +
   "solution vector corresponding to \\lambda_i.\n" +
   "The user may determine the number of points on the L-curve by\n" +
   "adjusting the size of these input arrays. The regularization\n" +
   "parameters \\lambda_i are estimated from the singular values\n" +
   "of X, and chosen to represent the most relevant portion of\n" +
   "the L-curve."},
 {:func_name=>"gsl_multifit_linear_rcond",
  :func_type=>"double",
  :args=>[["const gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function returns the reciprocal condition number of the least squares matrix X,\n" +
   "defined as the ratio of the smallest and largest singular values, rcond = \\sigma_{min}/\\sigma_{max}.\n" +
   "The routine gsl_multifit_linear_svd must first be called to compute the SVD of X."},
 {:func_name=>"gsl_multifit_linear_residuals",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["const gsl_vector *", "c"],
    ["gsl_vector *", "r"]],
  :desc=>
   "This function computes the vector of residuals r = y - X c for\n" +
   "the observations y, coefficients c and matrix of predictor\n" +
   "variables X."},
 {:func_name=>"gsl_multifit_linear_solve",
  :func_type=>"int",
  :args=>
   [["const double", "lambda"],
    ["const gsl_matrix *", "Xs"],
    ["const gsl_vector *", "ys"],
    ["gsl_vector *", "cs"],
    ["double *", "rnorm"],
    ["double *", "snorm"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function computes the regularized best-fit parameters \\tilde{c}\n" +
   "which minimize the cost function\n" +
   "\\chi^2 = || \\tilde{y} - \\tilde{X} \\tilde{c} ||^2 + \\lambda^2 || \\tilde{c} ||^2 which is\n" +
   "in standard form. The least squares system must therefore be converted\n" +
   "to standard form prior to calling this function.\n" +
   "The observation vector \\tilde{y} is provided in ys and the matrix of\n" +
   "predictor variables \\tilde{X} in Xs. The solution vector \\tilde{c} is\n" +
   "returned in cs, which has length min(m,p). The SVD of Xs must be computed prior\n" +
   "to calling this function, using gsl_multifit_linear_svd.\n" +
   "The regularization parameter \\lambda is provided in lambda.\n" +
   "The residual norm || \\tilde{y} - \\tilde{X} \\tilde{c} || = ||y - X c||_W is returned in rnorm.\n" +
   "The solution norm || \\tilde{c} || = ||L c|| is returned in\n" +
   "snorm."},
 {:func_name=>"gsl_multifit_linear_stdform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "These functions define a regularization matrix\n" +
   "L = diag(l_0,l_1,...,l_{p-1}).\n" +
   "The diagonal matrix element l_i is provided by the\n" +
   "ith element of the input vector L.\n" +
   "The n-by-p least squares matrix X and\n" +
   "vector y of length n are then\n" +
   "converted to standard form as described above and the parameters\n" +
   "(\\tilde{X},\\tilde{y}) are stored in Xs and ys\n" +
   "on output.  Xs and ys have the same dimensions as\n" +
   "X and y. Optional data weights may be supplied in the\n" +
   "vector w of length n. In order to apply this transformation,\n" +
   "L^{-1} must exist and so none of the l_i\n" +
   "may be zero. After the standard form system has been solved,\n" +
   "use gsl_multifit_linear_genform1 to recover the original solution vector.\n" +
   "It is allowed to have X = Xs and y = ys for an in-place transform.\n" +
   "In order to perform a weighted regularized fit with L = I, the user may\n" +
   "call gsl_multifit_linear_applyW to convert to standard form."},
 {:func_name=>"gsl_multifit_linear_stdform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_matrix *", "M"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "These functions convert the least squares system (X,y,W,L) to standard\n" +
   "form (\\tilde{X},\\tilde{y}) which are stored in Xs and ys\n" +
   "respectively. The m-by-p regularization matrix L is specified by the inputs\n" +
   "LQR and Ltau, which are outputs from gsl_multifit_linear_L_decomp.\n" +
   "The dimensions of the standard form parameters (\\tilde{X},\\tilde{y})\n" +
   "depend on whether m is larger or less than p. For m \\ge p,\n" +
   "Xs is n-by-p, ys is n-by-1, and M is\n" +
   "not used. For m < p, Xs is (n - p + m)-by-m,\n" +
   "ys is (n - p + m)-by-1, and M is additional n-by-p workspace,\n" +
   "which is required to recover the original solution vector after the system has been\n" +
   "solved (see gsl_multifit_linear_genform2). Optional data weights may be supplied in the\n" +
   "vector w of length n, where W = diag(w)."},
 {:func_name=>"gsl_multifit_linear_svd",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"], ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function performs a singular value decomposition of the\n" +
   "matrix X and stores the SVD factors internally in work."},
 {:func_name=>"gsl_multifit_linear_wgenform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["const gsl_vector *", "cs"],
    ["const gsl_matrix *", "M"],
    ["gsl_vector *", "c"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "After a regularized system has been solved with a general rectangular matrix L,\n" +
   "specified by (LQR,Ltau), this function backtransforms the standard form solution cs\n" +
   "to recover the solution vector of the original problem, which is stored in c,\n" +
   "of length p. The original least squares matrix and observation vector are provided in\n" +
   "X and y respectively. M is the matrix computed by\n" +
   "gsl_multifit_linear_stdform2. For weighted fits, the weight vector\n" +
   "w must also be supplied."},
 {:func_name=>"gsl_multifit_linear_wstdform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "These functions define a regularization matrix\n" +
   "L = diag(l_0,l_1,...,l_{p-1}).\n" +
   "The diagonal matrix element l_i is provided by the\n" +
   "ith element of the input vector L.\n" +
   "The n-by-p least squares matrix X and\n" +
   "vector y of length n are then\n" +
   "converted to standard form as described above and the parameters\n" +
   "(\\tilde{X},\\tilde{y}) are stored in Xs and ys\n" +
   "on output.  Xs and ys have the same dimensions as\n" +
   "X and y. Optional data weights may be supplied in the\n" +
   "vector w of length n. In order to apply this transformation,\n" +
   "L^{-1} must exist and so none of the l_i\n" +
   "may be zero. After the standard form system has been solved,\n" +
   "use gsl_multifit_linear_genform1 to recover the original solution vector.\n" +
   "It is allowed to have X = Xs and y = ys for an in-place transform.\n" +
   "In order to perform a weighted regularized fit with L = I, the user may\n" +
   "call gsl_multifit_linear_applyW to convert to standard form."},
 {:func_name=>"gsl_multifit_linear_wstdform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_matrix *", "M"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "These functions convert the least squares system (X,y,W,L) to standard\n" +
   "form (\\tilde{X},\\tilde{y}) which are stored in Xs and ys\n" +
   "respectively. The m-by-p regularization matrix L is specified by the inputs\n" +
   "LQR and Ltau, which are outputs from gsl_multifit_linear_L_decomp.\n" +
   "The dimensions of the standard form parameters (\\tilde{X},\\tilde{y})\n" +
   "depend on whether m is larger or less than p. For m \\ge p,\n" +
   "Xs is n-by-p, ys is n-by-1, and M is\n" +
   "not used. For m < p, Xs is (n - p + m)-by-m,\n" +
   "ys is (n - p + m)-by-1, and M is additional n-by-p workspace,\n" +
   "which is required to recover the original solution vector after the system has been\n" +
   "solved (see gsl_multifit_linear_genform2). Optional data weights may be supplied in the\n" +
   "vector w of length n, where W = diag(w)."},
 {:func_name=>"gsl_multifit_nlinear_alloc",
  :func_type=>"gsl_multifit_nlinear_workspace *",
  :args=>
   [["const gsl_multifit_nlinear_type *", "T"],
    ["const gsl_multifit_nlinear_parameters *", "params"],
    ["const size_t", "n"],
    ["const size_t", "p"]],
  :desc=>
   "These functions return a pointer to a newly allocated instance of a\n" +
   "derivative solver of type T for n observations and p\n" +
   "parameters. The params input specifies a tunable set of\n" +
   "parameters which will affect important details in each iteration\n" +
   "of the trust region subproblem algorithm. It is recommended to start\n" +
   "with the suggested default parameters (see\n" +
   "gsl_multifit_nlinear_default_parameters and\n" +
   "gsl_multilarge_nlinear_default_parameters) and then tune\n" +
   "the parameters once the code is working correctly. See\n" +
   "Nonlinear Least-Squares Tunable Parameters\n" +
   "for descriptions of the various parameters.\n" +
   "For example, the following code creates an instance of a\n" +
   "Levenberg-Marquardt solver for 100 data points and 3 parameters,\n" +
   "using suggested defaults:\n" +
   "\n" +
   "const gsl_multifit_nlinear_type * T \n" +
   "    = gsl_multifit_nlinear_lm;\n" +
   "gsl_multifit_nlinear_parameters params\n" +
   "    = gsl_multifit_nlinear_default_parameters();\n" +
   "gsl_multifit_nlinear_workspace * w \n" +
   "    = gsl_multifit_nlinear_alloc (T, &params, 100, 3);\n" +
   "\n" +
   "The number of observations n must be greater than or equal to\n" +
   "parameters p.\n" +
   "\n" +
   "If there is insufficient memory to create the solver then the function\n" +
   "returns a null pointer and the error handler is invoked with an error\n" +
   "code of GSL_ENOMEM."},
 {:func_name=>"gsl_multifit_nlinear_covar",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "J"],
    ["const double", "epsrel"],
    ["gsl_matrix *", "covar"]],
  :desc=>
   "This function computes the covariance matrix of best-fit parameters\n" +
   "using the Jacobian matrix J and stores it in covar.\n" +
   "The parameter epsrel is used to remove linear-dependent columns\n" +
   "when J is rank deficient.\n" +
   "\n" +
   "The covariance matrix is given by,\n" +
   "\n" +
   "covar = (J^T J)^@{-1@}\n" +
   "\n" +
   "or in the weighted case,\n" +
   "\n" +
   "covar = (J^T W J)^@{-1@}\n" +
   "\n" +
   "and is computed using the factored form of the Jacobian (Cholesky, QR, or SVD).\n" +
   "Any columns of R which satisfy \n" +
   "\n" +
   "|R_@{kk@}| <= epsrel |R_@{11@}|\n" +
   "\n" +
   "are considered linearly-dependent and are excluded from the covariance\n" +
   "matrix (the corresponding rows and columns of the covariance matrix are\n" +
   "set to zero).\n" +
   "\n" +
   "If the minimisation uses the weighted least-squares function\n" +
   "f_i = (Y(x, t_i) - y_i) / \\sigma_i then the covariance\n" +
   "matrix above gives the statistical error on the best-fit parameters\n" +
   "resulting from the Gaussian errors \\sigma_i on \n" +
   "the underlying data y_i.  This can be verified from the relation \n" +
   "\\delta f = J \\delta c and the fact that the fluctuations in f\n" +
   "from the data y_i are normalised by \\sigma_i and \n" +
   "so satisfy $\\langle \\delta f \\delta f^T \\rangle = I$\n" +
   "<\\delta f \\delta f^T> = I.\n" +
   "\n" +
   "For an unweighted least-squares function f_i = (Y(x, t_i) -\n" +
   "y_i) the covariance matrix above should be multiplied by the variance\n" +
   "of the residuals about the best-fit \\sigma^2 = \\sum (y_i - Y(x,t_i))^2 / (n-p)\n" +
   "to give the variance-covariance\n" +
   "matrix \\sigma^2 C.  This estimates the statistical error on the\n" +
   "best-fit parameters from the scatter of the underlying data.\n" +
   "\n" +
   "For more information about covariance matrices see Fitting Overview."},
 {:func_name=>"gsl_multifit_nlinear_default_parameters",
  :func_type=>"gsl_multifit_nlinear_parameters",
  :args=>[["", "void"]],
  :desc=>
   "These functions return a set of recommended default parameters\n" +
   "for use in solving nonlinear least squares problems. The user\n" +
   "can tune each parameter to improve the performance on their\n" +
   "particular problem, see\n" +
   "Nonlinear Least-Squares Tunable Parameters."},
 {:func_name=>"gsl_multifit_nlinear_free",
  :func_type=>"void",
  :args=>[["gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions free all the memory associated with the workspace w."},
 {:func_name=>"gsl_multifit_nlinear_init",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "x"],
    ["gsl_multifit_nlinear_fdf *", "fdf"],
    ["gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions initialize, or reinitialize, an existing workspace w\n" +
   "to use the system fdf and the initial guess\n" +
   "x. See Nonlinear Least-Squares Function Definition\n" +
   "for a description of the fdf structure.\n" +
   "\n" +
   "Optionally, a weight vector wts can be given to perform\n" +
   "a weighted nonlinear regression. Here, the weighting matrix is\n" +
   "W = diag(w_1,w_2,...,w_n)."},
 {:func_name=>"gsl_multifit_nlinear_iterate",
  :func_type=>"int",
  :args=>[["gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions perform a single iteration of the solver w.  If\n" +
   "the iteration encounters an unexpected problem then an error code will\n" +
   "be returned.  The solver workspace maintains a current estimate of the\n" +
   "best-fit parameters at all times."},
 {:func_name=>"gsl_multifit_nlinear_jac",
  :func_type=>"gsl_matrix *",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "This function returns a pointer to the n-by-p Jacobian matrix for the\n" +
   "current iteration of the solver w. This function is available only for the\n" +
   "gsl_multifit_nlinear interface."},
 {:func_name=>"gsl_multifit_nlinear_name",
  :func_type=>"const char *",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions return a pointer to the name of the solver.  For example,\n" +
   "\n" +
   "printf (\"w is a '%s' solver\\n\", \n" +
   "        gsl_multifit_nlinear_name (w));\n" +
   "\n" +
   "would print something like w is a 'trust-region' solver."},
 {:func_name=>"gsl_multifit_nlinear_niter",
  :func_type=>"size_t",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions return the number of iterations performed so far.\n" +
   "The iteration counter is updated on each call to the\n" +
   "_iterate functions above, and reset to 0 in the\n" +
   "_init functions."},
 {:func_name=>"gsl_multifit_nlinear_position",
  :func_type=>"gsl_vector *",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions return the current position x (i.e. best-fit\n" +
   "parameters) of the solver w."},
 {:func_name=>"gsl_multifit_nlinear_rcond",
  :func_type=>"int",
  :args=>
   [["double *", "rcond"], ["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "This function estimates the reciprocal condition number\n" +
   "of the Jacobian matrix at the current position x and\n" +
   "stores it in rcond. The computed value is only an estimate\n" +
   "to give the user a guideline as to the conditioning of their particular\n" +
   "problem. Its calculation is based on which factorization\n" +
   "method is used (Cholesky, QR, or SVD). \n"},
 {:func_name=>"gsl_multifit_nlinear_residual",
  :func_type=>"gsl_vector *",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions return the current residual vector f(x) of the\n" +
   "solver w.  For weighted systems, the residual vector includes the\n" +
   "weighting factor \\sqrt{W}."},
 {:func_name=>"gsl_multifit_nlinear_test",
  :func_type=>"int",
  :args=>
   [["const double", "xtol"],
    ["const double", "gtol"],
    ["const double", "ftol"],
    ["int *", "info"],
    ["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions test for convergence of the minimization method\n" +
   "using the following criteria:\n" +
   "\n" +
   "\n" +
   "If none of the tests succeed, info is set to 0 and the\n" +
   "function returns GSL_CONTINUE, indicating further iterations\n" +
   "are required.\n"},
 {:func_name=>"gsl_multifit_nlinear_trs_name",
  :func_type=>"const char *",
  :args=>[["const gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions return a pointer to the name of the trust region subproblem\n" +
   "method.  For example,\n" +
   "\n" +
   "printf (\"w is a '%s' solver\\n\", \n" +
   "        gsl_multifit_nlinear_trs_name (w));\n" +
   "\n" +
   "would print something like w is a 'levenberg-marquardt' solver."},
 {:func_name=>"gsl_multifit_nlinear_winit",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "x"],
    ["const gsl_vector *", "wts"],
    ["gsl_multifit_nlinear_fdf *", "fdf"],
    ["gsl_multifit_nlinear_workspace *", "w"]],
  :desc=>
   "These functions initialize, or reinitialize, an existing workspace w\n" +
   "to use the system fdf and the initial guess\n" +
   "x. See Nonlinear Least-Squares Function Definition\n" +
   "for a description of the fdf structure.\n" +
   "\n" +
   "Optionally, a weight vector wts can be given to perform\n" +
   "a weighted nonlinear regression. Here, the weighting matrix is\n" +
   "W = diag(w_1,w_2,...,w_n)."},
 {:func_name=>"gsl_multifit_robust",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_vector *", "c"],
    ["gsl_matrix *", "cov"],
    ["gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function computes the best-fit parameters c of the model\n" +
   "y = X c for the observations y and the matrix of\n" +
   "predictor variables X, attemping to reduce the influence\n" +
   "of outliers using the algorithm outlined above.\n" +
   "The p-by-p variance-covariance matrix of the model parameters\n" +
   "cov is estimated as \\sigma^2 (X^T X)^{-1}, where \\sigma is\n" +
   "an approximation of the residual standard deviation using the theory of robust\n" +
   "regression. Special care must be taken when estimating \\sigma and\n" +
   "other statistics such as R^2, and so these\n" +
   "are computed internally and are available by calling the function\n" +
   "gsl_multifit_robust_statistics.\n" +
   "\n" +
   "If the coefficients do not converge within the maximum iteration\n" +
   "limit, the function returns GSL_EMAXITER. In this case,\n" +
   "the current estimates of the coefficients and covariance matrix\n" +
   "are returned in c and cov and the internal fit statistics\n" +
   "are computed with these estimates."},
 {:func_name=>"gsl_multifit_robust_alloc",
  :func_type=>"gsl_multifit_robust_workspace *",
  :args=>
   [["const gsl_multifit_robust_type *", "T"],
    ["const size_t", "n"],
    ["const size_t", "p"]],
  :desc=>
   "This function allocates a workspace for fitting a model to n\n" +
   "observations using p parameters. The size of the workspace\n" +
   "is O(np + p^2). The type T specifies the\n" +
   "function \\psi and can be selected from the following choices.\n" +
   "\n" +
   "\n" +
   "\n" +
   "\n" +
   "\n"},
 {:func_name=>"gsl_multifit_robust_est",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "x"],
    ["const gsl_vector *", "c"],
    ["const gsl_matrix *", "cov"],
    ["double *", "y"],
    ["double *", "y_err"]],
  :desc=>
   "This function uses the best-fit robust regression coefficients\n" +
   "c and their covariance matrix\n" +
   "cov to compute the fitted function value\n" +
   "y and its standard deviation y_err for the model y = x.c \n" +
   "at the point x."},
 {:func_name=>"gsl_multifit_robust_free",
  :func_type=>"void",
  :args=>[["gsl_multifit_robust_workspace *", "w"]],
  :desc=>"This function frees the memory associated with the workspace w."},
 {:func_name=>"gsl_multifit_robust_maxiter",
  :func_type=>"int",
  :args=>
   [["const size_t", "maxiter"], ["gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function sets the maximum number of iterations in the iteratively\n" +
   "reweighted least squares algorithm to maxiter. By default,\n" +
   "this value is set to 100 by gsl_multifit_robust_alloc."},
 {:func_name=>"gsl_multifit_robust_name",
  :func_type=>"const char *",
  :args=>[["const gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function returns the name of the robust type T specified to gsl_multifit_robust_alloc."},
 {:func_name=>"gsl_multifit_robust_residuals",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["const gsl_vector *", "c"],
    ["gsl_vector *", "r"],
    ["gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function computes the vector of studentized residuals\n" +
   "r_i = {y_i - (X c)_i \\over \\sigma \\sqrt{1 - h_i}} for\n" +
   "the observations y, coefficients c and matrix of predictor\n" +
   "variables X. The routine gsl_multifit_robust must\n" +
   "first be called to compute the statisical leverages h_i of\n" +
   "the matrix X and residual standard deviation estimate \\sigma."},
 {:func_name=>"gsl_multifit_robust_statistics",
  :func_type=>"gsl_multifit_robust_stats",
  :args=>[["const gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function returns a structure containing relevant statistics from a robust regression. The function\n" +
   "gsl_multifit_robust must be called first to perform the regression and calculate these statistics.\n" +
   "The returned gsl_multifit_robust_stats structure contains the following fields."},
 {:func_name=>"gsl_multifit_robust_tune",
  :func_type=>"int",
  :args=>[["const double", "tune"], ["gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function sets the tuning constant t used to adjust the residuals at each iteration to tune.\n" +
   "Decreasing the tuning constant increases the downweight assigned to large residuals, while increasing\n" +
   "the tuning constant decreases the downweight assigned to large residuals."},
 {:func_name=>"gsl_multifit_robust_weights",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "r"],
    ["gsl_vector *", "wts"],
    ["gsl_multifit_robust_workspace *", "w"]],
  :desc=>
   "This function assigns weights to the vector wts using the residual vector r and\n" +
   "previously specified weighting function. The output weights are given by wts_i = w(r_i / (t \\sigma)),\n" +
   "where the weighting functions w are detailed in gsl_multifit_robust_alloc. \\sigma\n" +
   "is an estimate of the residual standard deviation based on the Median-Absolute-Deviation and t\n" +
   "is the tuning constant. This\n" +
   "function is useful if the user wishes to implement their own robust regression rather than using\n" +
   "the supplied gsl_multifit_robust routine below."},
 {:func_name=>"gsl_multifit_wlinear",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_vector *", "c"],
    ["gsl_matrix *", "cov"],
    ["double *", "chisq"],
    ["gsl_multifit_linear_workspace *", "work"]],
  :desc=>
   "This function computes the best-fit parameters c of the weighted\n" +
   "model y = X c for the observations y with weights w\n" +
   "and the matrix of predictor variables X, using the preallocated\n" +
   "workspace provided in work.  The p-by-p covariance matrix of the model\n" +
   "parameters cov is computed as (X^T W X)^{-1}. The weighted\n" +
   "sum of squares of the residuals from the best-fit, \\chi^2, is\n" +
   "returned in chisq. If the coefficient of determination is\n" +
   "desired, it can be computed from the expression R^2 = 1 - \\chi^2\n" +
   "/ WTSS, where the weighted total sum of squares (WTSS) of the\n" +
   "observations y may be computed from gsl_stats_wtss."}]

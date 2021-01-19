[{:func_name=>"gsl_multilarge_linear_L_decomp",
  :func_type=>"int",
  :args=>[["gsl_matrix *", "L"], ["gsl_vector *", "tau"]],
  :desc=>
   "This function calculates the QR decomposition of the m-by-p regularization matrix\n" +
   "L. L must have m \\ge p.  On output,\n" +
   "the Householder scalars are stored in the vector tau of size p.\n" +
   "These outputs will be used by gsl_multilarge_linear_wstdform2 to complete the\n" +
   "transformation to standard form."},
 {:func_name=>"gsl_multilarge_linear_accumulate",
  :func_type=>"int",
  :args=>
   [["gsl_matrix *", "X"],
    ["gsl_vector *", "y"],
    ["gsl_multilarge_linear_workspace *", "w"]],
  :desc=>
   "This function accumulates the standard form block (X,y) into the\n" +
   "current least squares system. X and y have the same number\n" +
   "of rows, which can be arbitrary.  X must have p columns.\n" +
   "For the TSQR method, X and y are destroyed on output.\n" +
   "For the normal equations method, they are both unchanged."},
 {:func_name=>"gsl_multilarge_linear_alloc",
  :func_type=>"gsl_multilarge_linear_workspace *",
  :args=>[["const gsl_multilarge_linear_type *", "T"], ["const size_t", "p"]],
  :desc=>
   "This function allocates a workspace for solving large linear least squares\n" +
   "systems. The least squares matrix X has p columns,\n" +
   "but may have any number of rows. The parameter T specifies\n" +
   "the method to be used for solving the large least squares system\n" +
   "and may be selected from the following choices\n" +
   "\n"},
 {:func_name=>"gsl_multilarge_linear_free",
  :func_type=>"void",
  :args=>[["gsl_multilarge_linear_workspace *", "w"]],
  :desc=>
   "This function frees the memory associated with the\n" + "workspace w."},
 {:func_name=>"gsl_multilarge_linear_genform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_vector *", "cs"],
    ["gsl_vector *", "c"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "After a regularized system has been solved with\n" +
   "L = diag(\\l_0,\\l_1,...,\\l_{p-1}),\n" +
   "this function backtransforms the standard form solution vector cs\n" +
   "to recover the solution vector of the original problem c. The\n" +
   "diagonal matrix elements l_i are provided in\n" +
   "the vector L. It is allowed to have c = cs for an\n" +
   "in-place transform."},
 {:func_name=>"gsl_multilarge_linear_genform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_vector *", "cs"],
    ["gsl_vector *", "c"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "After a regularized system has been solved with a regularization matrix L,\n" +
   "specified by (LQR,Ltau), this function backtransforms the standard form solution cs\n" +
   "to recover the solution vector of the original problem, which is stored in c,\n" +
   "of length p."},
 {:func_name=>"gsl_multilarge_linear_lcurve",
  :func_type=>"int",
  :args=>
   [["gsl_vector *", "reg_param"],
    ["gsl_vector *", "rho"],
    ["gsl_vector *", "eta"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "This function computes the L-curve for a large least squares system\n" +
   "after it has been fully accumulated into the workspace work.\n" +
   "The output vectors reg_param, rho, and eta must all\n" +
   "be the same size, and will contain the regularization parameters\n" +
   "\\lambda_i, residual norms ||y - X c_i||, and solution\n" +
   "norms || L c_i || which compose the L-curve, where c_i\n" +
   "is the regularized solution vector corresponding to \\lambda_i.\n" +
   "The user may determine the number of points on the L-curve by\n" +
   "adjusting the size of these input arrays. For the TSQR method,\n" +
   "the regularization parameters \\lambda_i are estimated from the\n" +
   "singular values of the triangular R factor. For the normal\n" +
   "equations method, they are estimated from the eigenvalues of the\n" +
   "X^T X matrix."},
 {:func_name=>"gsl_multilarge_linear_name",
  :func_type=>"const char *",
  :args=>[["gsl_multilarge_linear_workspace *", "w"]],
  :desc=>
   "This function returns a string pointer to the name\n" +
   "of the multilarge solver."},
 {:func_name=>"gsl_multilarge_linear_rcond",
  :func_type=>"int",
  :args=>
   [["double *", "rcond"], ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "This function computes the reciprocal condition number, stored in\n" +
   "rcond, of the least squares matrix after it has been accumulated\n" +
   "into the workspace work. For the TSQR algorithm, this is\n" +
   "accomplished by calculating the SVD of the R factor, which\n" +
   "has the same singular values as the matrix X. For the normal\n" +
   "equations method, this is done by computing the eigenvalues of\n" +
   "X^T X, which could be inaccurate for ill-conditioned matrices\n" +
   "X."},
 {:func_name=>"gsl_multilarge_linear_reset",
  :func_type=>"int",
  :args=>[["gsl_multilarge_linear_workspace *", "w"]],
  :desc=>
   "This function resets the workspace w so\n" +
   "it can begin to accumulate a new least squares\n" +
   "system."},
 {:func_name=>"gsl_multilarge_linear_solve",
  :func_type=>"int",
  :args=>
   [["const double", "lambda"],
    ["gsl_vector *", "c"],
    ["double *", "rnorm"],
    ["double *", "snorm"],
    ["gsl_multilarge_linear_workspace *", "w"]],
  :desc=>
   "After all blocks (X_i,y_i) have been accumulated into\n" +
   "the large least squares system, this function will compute\n" +
   "the solution vector which is stored in c on output.\n" +
   "The regularization parameter \\lambda is provided in\n" +
   "lambda. On output, rnorm contains the residual norm\n" +
   "||y - X c||_W and snorm contains the solution\n" +
   "norm ||L c||."},
 {:func_name=>"gsl_multilarge_linear_stdform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "These functions define a regularization matrix\n" +
   "L = diag(l_0,l_1,...,l_{p-1}).\n" +
   "The diagonal matrix element l_i is provided by the\n" +
   "ith element of the input vector L.\n" +
   "The block (X,y) is converted to standard form and\n" +
   "the parameters (\\tilde{X},\\tilde{y}) are stored in Xs\n" +
   "and ys on output.  Xs and ys have the same dimensions as\n" +
   "X and y. Optional data weights may be supplied in the\n" +
   "vector w. In order to apply this transformation,\n" +
   "L^{-1} must exist and so none of the l_i\n" +
   "may be zero. After the standard form system has been solved,\n" +
   "use gsl_multilarge_linear_genform1 to recover the original solution vector.\n" +
   "It is allowed to have X = Xs and y = ys for an in-place transform."},
 {:func_name=>"gsl_multilarge_linear_stdform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "These functions convert a block of rows (X,y,w) to standard\n" +
   "form (\\tilde{X},\\tilde{y}) which are stored in Xs and ys\n" +
   "respectively. X, y, and w must all have the same number of rows.\n" +
   "The m-by-p regularization matrix L is specified by the inputs\n" +
   "LQR and Ltau, which are outputs from gsl_multilarge_linear_L_decomp.\n" +
   "Xs and ys have the same dimensions as X and y. After the\n" +
   "standard form system has been solved, use gsl_multilarge_linear_genform2 to\n" +
   "recover the original solution vector. Optional data weights may be supplied in the\n" +
   "vector w, where W = diag(w)."},
 {:func_name=>"gsl_multilarge_linear_wstdform1",
  :func_type=>"int",
  :args=>
   [["const gsl_vector *", "L"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "These functions define a regularization matrix\n" +
   "L = diag(l_0,l_1,...,l_{p-1}).\n" +
   "The diagonal matrix element l_i is provided by the\n" +
   "ith element of the input vector L.\n" +
   "The block (X,y) is converted to standard form and\n" +
   "the parameters (\\tilde{X},\\tilde{y}) are stored in Xs\n" +
   "and ys on output.  Xs and ys have the same dimensions as\n" +
   "X and y. Optional data weights may be supplied in the\n" +
   "vector w. In order to apply this transformation,\n" +
   "L^{-1} must exist and so none of the l_i\n" +
   "may be zero. After the standard form system has been solved,\n" +
   "use gsl_multilarge_linear_genform1 to recover the original solution vector.\n" +
   "It is allowed to have X = Xs and y = ys for an in-place transform."},
 {:func_name=>"gsl_multilarge_linear_wstdform2",
  :func_type=>"int",
  :args=>
   [["const gsl_matrix *", "LQR"],
    ["const gsl_vector *", "Ltau"],
    ["const gsl_matrix *", "X"],
    ["const gsl_vector *", "w"],
    ["const gsl_vector *", "y"],
    ["gsl_matrix *", "Xs"],
    ["gsl_vector *", "ys"],
    ["gsl_multilarge_linear_workspace *", "work"]],
  :desc=>
   "These functions convert a block of rows (X,y,w) to standard\n" +
   "form (\\tilde{X},\\tilde{y}) which are stored in Xs and ys\n" +
   "respectively. X, y, and w must all have the same number of rows.\n" +
   "The m-by-p regularization matrix L is specified by the inputs\n" +
   "LQR and Ltau, which are outputs from gsl_multilarge_linear_L_decomp.\n" +
   "Xs and ys have the same dimensions as X and y. After the\n" +
   "standard form system has been solved, use gsl_multilarge_linear_genform2 to\n" +
   "recover the original solution vector. Optional data weights may be supplied in the\n" +
   "vector w, where W = diag(w)."}]

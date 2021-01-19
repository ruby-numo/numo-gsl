[{:func_name=>"gsl_spblas_dgemm",
  :func_type=>"int",
  :args=>
   [["const double", "alpha"],
    ["const gsl_spmatrix *", "A"],
    ["const gsl_spmatrix *", "B"],
    ["gsl_spmatrix *", "C"]],
  :desc=>
   "This function computes the sparse matrix-matrix product\n" +
   "C = \\alpha A B. The matrices must be in compressed format."},
 {:func_name=>"gsl_spblas_dgemv",
  :func_type=>"int",
  :args=>
   [["const CBLAS_TRANSPOSE_t", "TransA"],
    ["const double", "alpha"],
    ["const gsl_spmatrix *", "A"],
    ["const gsl_vector *", "x"],
    ["const double", "beta"],
    ["gsl_vector *", "y"]],
  :desc=>
   "This function computes the matrix-vector product and sum\n" +
   "y \\leftarrow \\alpha op(A) x + \\beta y, where\n" +
   "op(A) = A, A^T for TransA = CblasNoTrans,\n" +
   "CblasTrans. In-place computations are not supported, so\n" +
   "x and y must be distinct vectors.\n" +
   "The matrix A may be in triplet or compressed format."},
 {:func_name=>"gsl_splinalg_itersolve_alloc",
  :func_type=>"gsl_splinalg_itersolve *",
  :args=>
   [["const gsl_splinalg_itersolve_type *", "T"],
    ["const size_t", "n"],
    ["const size_t", "m"]],
  :desc=>
   "This function allocates a workspace for the iterative solution of\n" +
   "n-by-n sparse matrix systems. The iterative solver type\n" +
   "is specified by T. The argument m specifies the size\n" +
   "of the solution candidate subspace {\\cal K}_m. The dimension\n" +
   "m may be set to 0 in which case a reasonable default value is used."},
 {:func_name=>"gsl_splinalg_itersolve_free",
  :func_type=>"void",
  :args=>[["gsl_splinalg_itersolve *", "w"]],
  :desc=>"This function frees the memory associated with the workspace w."},
 {:func_name=>"gsl_splinalg_itersolve_iterate",
  :func_type=>"int",
  :args=>
   [["const gsl_spmatrix *", "A"],
    ["const gsl_vector *", "b"],
    ["const double", "tol"],
    ["gsl_vector *", "x"],
    ["gsl_splinalg_itersolve *", "w"]],
  :desc=>
   "This function performs one iteration of the iterative method for\n" +
   "the sparse linear system specfied by the matrix A, right hand\n" +
   "side vector b and solution vector x. On input, x\n" +
   "must be set to an initial guess for the solution. On output,\n" +
   "x is updated to give the current solution estimate. The\n" +
   "parameter tol specifies the relative tolerance between the residual\n" +
   "norm and norm of b in order to check for convergence.\n" +
   "When the following condition is satisfied:\n" +
   ".. only:: not texinfo\n" +
   ".. only:: texinfo\n" +
   "the method has converged, the function returns GSL_SUCCESS and\n" +
   "the final solution is provided in x. Otherwise, the function\n" +
   "returns GSL_CONTINUE to signal that more iterations are\n" +
   "required. Here, || \\cdot || represents the Euclidean norm.\n" +
   "The input matrix A may be in triplet or compressed format."},
 {:func_name=>"gsl_splinalg_itersolve_name",
  :func_type=>"const char *",
  :args=>[["const gsl_splinalg_itersolve *", "w"]],
  :desc=>"This function returns a string pointer to the name of the solver."},
 {:func_name=>"gsl_splinalg_itersolve_normr",
  :func_type=>"double",
  :args=>[["const gsl_splinalg_itersolve *", "w"]],
  :desc=>
   "This function returns the current residual norm\n" +
   "||r|| = ||A x - b||, which is updated after each call to\n" +
   "gsl_splinalg_itersolve_iterate."},
 {:func_name=>"gsl_spmatrix_add",
  :func_type=>"int",
  :args=>
   [["gsl_spmatrix *", "c"],
    ["const gsl_spmatrix *", "a"],
    ["const gsl_spmatrix *", "b"]],
  :desc=>
   "This function computes the sum c = a + b. The three matrices must\n" +
   "have the same dimensions.\n" +
   "Input matrix formats supported: :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_add_to_dense",
  :func_type=>"int",
  :args=>[["gsl_matrix *", "a"], ["const gsl_spmatrix *", "b"]],
  :desc=>
   "This function adds the elements of the sparse matrix b to the elements of\n" +
   "the dense matrix a. The result a(i,j) \\leftarrow a(i,j) + b(i,j) is\n" +
   "stored in a and b remains unchanged. The two matrices must have\n" +
   "the same dimensions.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_alloc",
  :func_type=>"gsl_spmatrix *",
  :args=>[["const size_t", "n1"], ["const size_t", "n2"]],
  :desc=>
   "This function allocates a sparse matrix of size n1-by-n2 and\n" +
   "initializes it to all zeros. If the size of the matrix is not known at allocation\n" +
   "time, both n1 and n2 may be set to 1, and they will automatically\n" +
   "grow as elements are added to the matrix. This function sets the\n" +
   "matrix to the triplet representation, which is the easiest for adding\n" +
   "and accessing matrix elements. This function tries to make a reasonable guess\n" +
   "for the number of non-zero elements (nzmax) which will be added to the matrix by\n" +
   "assuming a sparse density of 10\\%. The function\n" +
   "gsl_spmatrix_alloc_nzmax can be used if this number is known more\n" +
   "accurately. The workspace is of size O(nzmax)."},
 {:func_name=>"gsl_spmatrix_alloc_nzmax",
  :func_type=>"gsl_spmatrix *",
  :args=>
   [["const size_t", "n1"],
    ["const size_t", "n2"],
    ["const size_t", "nzmax"],
    ["const size_t", "sptype"]],
  :desc=>
   "This function allocates a sparse matrix of size n1-by-n2 and\n" +
   "initializes it to all zeros. If the size of the matrix is not known at allocation\n" +
   "time, both n1 and n2 may be set to 1, and they will automatically\n" +
   "grow as elements are added to the matrix. The parameter nzmax specifies\n" +
   "the maximum number of non-zero elements which will be added to the matrix.\n" +
   "It does not need to be precisely known in advance, since storage space will \n" +
   "automatically grow using gsl_spmatrix_realloc if nzmax is not\n" +
   "large enough. Accurate knowledge of this parameter reduces the number of\n" +
   "reallocation calls required. The parameter sptype specifies the\n" +
   "storage format of the sparse matrix. Possible values are\n" +
   ".. macro:: GSL_SPMATRIX_COO\n" +
   ".. macro:: GSL_SPMATRIX_CSC\n" +
   ".. macro:: GSL_SPMATRIX_CSR\n" +
   "The allocated :type:`gsl_spmatrix` structure is of size O(nzmax)."},
 {:func_name=>"gsl_spmatrix_compress",
  :func_type=>"gsl_spmatrix *",
  :args=>[["const gsl_spmatrix *", "src"], ["const int", "sptype"]],
  :desc=>
   "This function allocates a new sparse matrix, and stores src into it using the\n" +
   "format specified by sptype. The input sptype can be one of\n" +
   "GSL_SPMATRIX_COO, GSL_SPMATRIX_CSC, or GSL_SPMATRIX_CSR.\n" +
   "A pointer to the newly allocated matrix is returned, and must be freed by the caller\n" +
   "when no longer needed."},
 {:func_name=>"gsl_spmatrix_csc",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function creates a sparse matrix in :ref:`compressed sparse column <sec_spmatrix-csc>`\n" +
   "format from the input sparse matrix src which must be in COO format. The\n" +
   "compressed matrix is stored in dest.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`"},
 {:func_name=>"gsl_spmatrix_csr",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function creates a sparse matrix in :ref:`compressed sparse row <sec_spmatrix-csr>`\n" +
   "format from the input sparse matrix src which must be in COO format. The\n" +
   "compressed matrix is stored in dest.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`"},
 {:func_name=>"gsl_spmatrix_d2sp",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "S"], ["const gsl_matrix *", "A"]],
  :desc=>
   "This function converts the dense matrix A into sparse COO format\n" +
   "and stores the result in S.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`"},
 {:func_name=>"gsl_spmatrix_equal",
  :func_type=>"int",
  :args=>[["const gsl_spmatrix *", "a"], ["const gsl_spmatrix *", "b"]],
  :desc=>
   "This function returns 1 if the matrices a and b are equal (by comparison of\n" +
   "element values) and 0 otherwise. The matrices a and b must be in the same\n" +
   "sparse storage format for comparison.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_fprintf",
  :func_type=>"int",
  :args=>
   [["FILE *", "stream"],
    ["const gsl_spmatrix *", "m"],
    ["const char *", "format"]],
  :desc=>
   "This function writes the elements of the matrix m line-by-line to\n" +
   "the stream stream using the format specifier format, which\n" +
   "should be one of the %g, %e or %f formats for\n" +
   "floating point numbers.  The function returns 0 for success and\n" +
   "GSL_EFAILED if there was a problem writing to the file. The\n" +
   "input matrix m may be in any storage format, and the output file\n" +
   "will be written in MatrixMarket format.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_fread",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["gsl_spmatrix *", "m"]],
  :desc=>
   "This function reads into the matrix m from the open stream\n" +
   "stream in binary format.  The matrix m must be preallocated\n" +
   "with the correct storage format, dimensions and have a sufficiently large nzmax\n" +
   "in order to read in all matrix elements, otherwise GSL_EBADLEN\n" +
   "is returned. The return value is 0 for success and\n" +
   "GSL_EFAILED if there was a problem reading from the file.  The\n" +
   "data is assumed to have been written in the native binary format on the\n" +
   "same architecture.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_free",
  :func_type=>"void",
  :args=>[["gsl_spmatrix *", "m"]],
  :desc=>
   "This function frees the memory associated with the sparse matrix m.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_fscanf",
  :func_type=>"gsl_spmatrix *",
  :args=>[["FILE *", "stream"]],
  :desc=>
   "This function reads sparse matrix data in the MatrixMarket format\n" +
   "from the stream stream and stores it in a newly allocated matrix\n" +
   "which is returned in :ref:`COO <sec_spmatrix-coo>` format.  The function returns 0 for success and\n" +
   "GSL_EFAILED if there was a problem reading from the file. The\n" +
   "user should free the returned matrix when it is no longer needed."},
 {:func_name=>"gsl_spmatrix_fwrite",
  :func_type=>"int",
  :args=>[["FILE *", "stream"], ["const gsl_spmatrix *", "m"]],
  :desc=>
   "This function writes the elements of the matrix m to the stream\n" +
   "stream in binary format.  The return value is 0 for success and\n" +
   "GSL_EFAILED if there was a problem writing to the file.  Since the\n" +
   "data is written in the native binary format it may not be portable\n" +
   "between different architectures.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_get",
  :func_type=>"double",
  :args=>
   [["const gsl_spmatrix *", "m"],
    ["const size_t", "i"],
    ["const size_t", "j"]],
  :desc=>
   "This function returns element (i, j) of the matrix m.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_memcpy",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function copies the elements of the sparse matrix src into\n" +
   "dest. The two matrices must have the same dimensions and be in the\n" +
   "same storage format.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_min_index",
  :func_type=>"int",
  :args=>
   [["const gsl_spmatrix *", "m"], ["size_t *", "imin"], ["size_t *", "jmin"]],
  :desc=>
   "This function returns the indices of the minimum value in the matrix\n" +
   "m, searching only the non-zero values, and storing them in imin and jmin.\n" +
   "When there are several equal minimum elements then the first element found is returned.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_minmax",
  :func_type=>"int",
  :args=>
   [["const gsl_spmatrix *", "m"],
    ["double *", "min_out"],
    ["double *", "max_out"]],
  :desc=>
   "This function returns the minimum and maximum elements of the matrix\n" +
   "m, storing them in min_out and max_out, and searching\n" +
   "only the non-zero values.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_nnz",
  :func_type=>"size_t",
  :args=>[["const gsl_spmatrix *", "m"]],
  :desc=>
   "This function returns the number of non-zero elements in m.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_ptr",
  :func_type=>"double *",
  :args=>
   [["gsl_spmatrix *", "m"], ["const size_t", "i"], ["const size_t", "j"]],
  :desc=>
   "This function returns a pointer to the (i, j) element of the matrix m.\n" +
   "If the (i, j) element is not explicitly stored in the matrix,\n" +
   "a null pointer is returned.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_realloc",
  :func_type=>"int",
  :args=>[["const size_t", "nzmax"], ["gsl_spmatrix *", "m"]],
  :desc=>
   "This function reallocates the storage space for m to accomodate\n" +
   "nzmax non-zero elements. It is typically called internally by\n" +
   "gsl_spmatrix_set if the user wants to add more elements to the\n" +
   "sparse matrix than the previously specified nzmax.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_scale",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "m"], ["const double", "x"]],
  :desc=>
   "This function scales all elements of the matrix m by the constant\n" +
   "factor x. The result m(i,j) \\leftarrow x m(i,j) is stored in m.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_scale_columns",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "A"], ["const gsl_vector *", "x"]],
  :desc=>
   "This function scales the columns of the M-by-N sparse matrix\n" +
   "A by the elements of the vector x, of length N. The\n" +
   "j-th column of A is multiplied by x[j]. This is equivalent to\n" +
   "forming\n" +
   ".. math:: A \\rightarrow A X\n" +
   "where X = \\textrm{diag}(x).\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_scale_rows",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "A"], ["const gsl_vector *", "x"]],
  :desc=>
   "This function scales the rows of the M-by-N sparse matrix\n" +
   "A by the elements of the vector x, of length M. The\n" +
   "i-th row of A is multiplied by x[i]. This is equivalent to\n" +
   "forming\n" +
   ".. math:: A \\rightarrow X A\n" +
   "where X = \\textrm{diag}(x).\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_set",
  :func_type=>"int",
  :args=>
   [["gsl_spmatrix *", "m"],
    ["const size_t", "i"],
    ["const size_t", "j"],
    ["const double", "x"]],
  :desc=>
   "This function sets element (i, j) of the matrix m to\n" +
   "the value x.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`"},
 {:func_name=>"gsl_spmatrix_set_zero",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "m"]],
  :desc=>
   "This function sets (or resets) all the elements of the matrix m to zero.\n" +
   "For CSC and CSR matrices, the cost of this operation is O(1). For\n" +
   "COO matrices, the binary tree structure must be dismantled, so the cost is\n" +
   "O(nz).\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_sp2d",
  :func_type=>"int",
  :args=>[["gsl_matrix *", "A"], ["const gsl_spmatrix *", "S"]],
  :desc=>
   "This function converts the sparse matrix S into a dense matrix and\n" +
   "stores the result in A.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_transpose",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "m"]],
  :desc=>
   "This function replaces the matrix m by its transpose, but\n" +
   "changes the storage format for compressed matrix inputs. Since\n" +
   "compressed column storage is the transpose of compressed row storage,\n" +
   "this function simply converts a CSC matrix to CSR and vice versa.\n" +
   "This is the most efficient way to transpose a compressed storage\n" +
   "matrix, but the user should note that the storage format of their\n" +
   "compressed matrix will change on output. For COO matrix inputs,\n" +
   "the output matrix is also in COO storage.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_transpose_memcpy",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function copies the transpose of the sparse matrix src into\n" +
   "dest. The dimensions of dest must match the transpose of the\n" +
   "matrix src. Also, both matrices must use the same sparse storage\n" +
   "format.\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"},
 {:func_name=>"gsl_spmatrix_type",
  :func_type=>"const char *",
  :args=>[["const gsl_spmatrix *", "m"]],
  :desc=>
   "This function returns a string describing the sparse storage format of\n" +
   "the matrix m. For example::\n" +
   "would print something like::\n" +
   "Input matrix formats supported: :ref:`COO <sec_spmatrix-coo>`, :ref:`CSC <sec_spmatrix-csc>`, :ref:`CSR <sec_spmatrix-csr>`"}]

[{:func_name=>"gsl_spmatrix_alloc",
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
   "The allocated gsl_spmatrix structure is of size O(nzmax)."},
 {:func_name=>"gsl_spmatrix_realloc",
  :func_type=>"int",
  :args=>[["const size_t", "nzmax"], ["gsl_spmatrix *", "m"]],
  :desc=>
   "This function reallocates the storage space for m to accomodate\n" +
   "nzmax non-zero elements. It is typically called internally by\n" +
   "gsl_spmatrix_set if the user wants to add more elements to the\n" +
   "sparse matrix than the previously specified nzmax."},
 {:func_name=>"gsl_spmatrix_free",
  :func_type=>"void",
  :args=>[["gsl_spmatrix *", "m"]],
  :desc=>
   "This function frees the memory associated with the sparse matrix m."},
 {:func_name=>"gsl_spmatrix_get",
  :func_type=>"double",
  :args=>
   [["const gsl_spmatrix *", "m"],
    ["const size_t", "i"],
    ["const size_t", "j"]],
  :desc=>
   "This function returns element (i,j) of the matrix m.\n" +
   "The matrix may be in triplet or compressed format."},
 {:func_name=>"gsl_spmatrix_set",
  :func_type=>"int",
  :args=>
   [["gsl_spmatrix *", "m"],
    ["const size_t", "i"],
    ["const size_t", "j"],
    ["const double", "x"]],
  :desc=>
   "This function sets element (i,j) of the matrix m to\n" +
   "the value x. The matrix must be in triplet representation."},
 {:func_name=>"gsl_spmatrix_set_zero",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "m"]],
  :desc=>
   "This function sets (or resets) all the elements of the matrix m to zero."},
 {:func_name=>"gsl_spmatrix_memcpy",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function copies the elements of the sparse matrix src into\n" +
   "dest. The two matrices must have the same dimensions and be in the\n" +
   "same storage format."},
 {:func_name=>"gsl_spmatrix_transpose_memcpy",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "dest"], ["const gsl_spmatrix *", "src"]],
  :desc=>
   "This function copies the transpose of the sparse matrix src into\n" +
   "dest. The dimensions of dest must match the transpose of the\n" +
   "matrix src. Also, both matrices must use the same sparse storage\n" +
   "format."},
 {:func_name=>"gsl_spmatrix_add",
  :func_type=>"int",
  :args=>
   [["gsl_spmatrix *", "c"],
    ["const gsl_spmatrix *", "a"],
    ["const gsl_spmatrix *", "b"]],
  :desc=>
   "This function computes the sum c = a + b. The three matrices must\n" +
   "have the same dimensions and be stored in compressed column format."},
 {:func_name=>"gsl_spmatrix_scale",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "m"], ["const double", "x"]],
  :desc=>
   "This function scales all elements of the matrix m by the constant\n" +
   "factor x. The result m(i,j) \\leftarrow x m(i,j) is stored in m."},
 {:func_name=>"gsl_spmatrix_nnz",
  :func_type=>"size_t",
  :args=>[["const gsl_spmatrix *", "m"]],
  :desc=>"This function returns the number of non-zero elements in m."},
 {:func_name=>"gsl_spmatrix_equal",
  :func_type=>"int",
  :args=>[["const gsl_spmatrix *", "a"], ["const gsl_spmatrix *", "b"]],
  :desc=>
   "This function returns 1 if the matrices a and b are equal (by comparison of\n" +
   "element values) and 0 otherwise. The matrices a and b must be either\n" +
   "both triplet format or both compressed format for comparison."},
 {:func_name=>"gsl_spmatrix_minmax",
  :func_type=>"int",
  :args=>
   [["const gsl_spmatrix *", "m"],
    ["double *", "min_out"],
    ["double *", "max_out"]],
  :desc=>
   "This function returns the minimum and maximum elements of the matrix\n" +
   "m, storing them in min_out and max_out, and searching\n" +
   "only the non-zero values."},
 {:func_name=>"gsl_spmatrix_compcol",
  :func_type=>"gsl_spmatrix *",
  :args=>[["const gsl_spmatrix *", "T"]],
  :desc=>
   "This function creates a sparse matrix in compressed column format\n" +
   "from the input sparse matrix T which must be in triplet format.\n" +
   "A pointer to a newly allocated matrix is returned. The calling function\n" +
   "should free the newly allocated matrix when it is no longer needed."},
 {:func_name=>"gsl_spmatrix_d2sp",
  :func_type=>"int",
  :args=>[["gsl_spmatrix *", "S"], ["const gsl_matrix *", "A"]],
  :desc=>
   "This function converts the dense matrix A into sparse triplet format\n" +
   "and stores the result in S."},
 {:func_name=>"gsl_spmatrix_sp2d",
  :func_type=>"int",
  :args=>[["gsl_matrix *", "A"], ["const gsl_spmatrix *", "S"]],
  :desc=>
   "This function converts the sparse matrix S into a dense matrix and\n" +
   "stores the result in A. S must be in triplet format."},
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
 {:func_name=>"gsl_spblas_dgemm",
  :func_type=>"int",
  :args=>
   [["const double", "alpha"],
    ["const gsl_spmatrix *", "A"],
    ["const gsl_spmatrix *", "B"],
    ["gsl_spmatrix *", "C"]],
  :desc=>
   "This function computes the sparse matrix-matrix product\n" +
   "C = \\alpha A B. The matrices must be in compressed format."}]

<%
set singleton: true
%>
/*
  @overload <%=name%>(trans_a, alpha, a, x, beta, y)
  @param  [Integer]             trans_a = NO_TRANS | TRANS
  @param  [Float]               alpha
  @param  [Numo::GSL::SpMatrix] a (sparse matrix)
  @param  [Numo::DFloat]        x (vector)
  @param  [Float]               beta
  @param  [Numo::DFloat]        y (vector)
  @return [Numo::DFloat]        result (or y)

  <%= description %>
*/
static VALUE
<%=c_func(6)%>(VALUE mod, VALUE vTransA, VALUE valpha, VALUE va, VALUE vx, VALUE vbeta, VALUE vy)
{
    // y = alpha A x + beta y
    CBLAS_TRANSPOSE_t TransA;
    double alpha;
    gsl_spmatrix *A;
    gsl_vector *x;
    double beta;
    gsl_vector *y;

    TransA = NUM2INT(vTransA);
    alpha = NUM2DBL(valpha);
    beta = NUM2DBL(vbeta);
    TypedData_Get_Struct(va, <%=struct%>, &<%=data_type_var%>, A);

    vx = cast_1d_contiguous(vx, cDF);
    ALLOCA_GSLVECTOR_FROM_NARRAY(vx, x);
    vy = cast_1d_contiguous(vy, cDF);
    if (!TEST_INPLACE(vy)) {
        vy = na_copy(vy);
    }
    ALLOCA_GSLVECTOR_FROM_NARRAY(vy, y);

    <%=func_name%>(TransA, alpha, A, x, beta, y);
    RB_GC_GUARD(vx);
    return vy;
}

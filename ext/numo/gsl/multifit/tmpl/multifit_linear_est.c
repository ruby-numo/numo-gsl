static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    gsl_vector x;
    gsl_vector c;
    gsl_matrix cov;
    double   y, yerr;

    SET_GSL_VECTOR_FROM_LOOPT(lp,0,x);
    SET_GSL_VECTOR_FROM_LOOPT(lp,1,c);
    SET_GSL_MATRIX_FROM_LOOPT(lp,2,cov);

    <%=func_name%>(&x, &c, &cov, &y, &yerr);

    *(double*)NDL_PTR(lp,3) = y;
    *(double*)NDL_PTR(lp,4) = yerr;
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[0][1]%> (input vector) observations
  @param  [DFloat]    <%=args[1][1]%> (input vector) solusions
  @param  [DFloat]    <%=args[2][1]%> (input matrix) covariance
  @return [[DFloat,DFloat]] array of (<%=args[3][1]%>, <%=args[4][1]%>).

  <%=desc%>

*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE v1, VALUE v2, VALUE v3)
{
    ndfunc_arg_in_t ain[3] = {{cDF,1},{cDF,1},{cDF,2}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, NO_LOOP|NDF_EXTRACT,
                     3, 2, ain, aout };
    narray_t *x, *c, *cov;

    GetNArray(v1,x);
    GetNArray(v2,c);
    GetNArray(v3,cov);
    CHECK_1D(x);
    CHECK_1D(c);
    CHECK_2D(cov);
    CHECK_SIZE_EQ(VEC_SIZE(x),VEC_SIZE(c),"x size does not match c size");
    CHECK_SIZE_EQ(MAT_SIZE1(cov),MAT_SIZE2(cov),"cov is not square matrix");
    CHECK_SIZE_EQ(VEC_SIZE(c),MAT_SIZE1(cov),"c size does not match cov row size");
    return na_ndloop(&ndf, 3, v1, v2, v3);
}

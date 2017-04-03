static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    gsl_matrix x;
    gsl_vector y;
    gsl_vector c;
    gsl_vector r;

    SET_GSL_MATRIX_FROM_LOOPT(lp,0,x);
    SET_GSL_VECTOR_FROM_LOOPT(lp,1,y);
    SET_GSL_VECTOR_FROM_LOOPT(lp,2,c);
    SET_GSL_VECTOR_FROM_LOOPT(lp,3,r);

    <%=func_name%>(&x, &y, &c, &r);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[0][1]%> (input matrix) design matrix
  @param  [DFloat]    <%=args[1][1]%> (input vector) rhs vector
  @param  [DFloat]    <%=args[2][1]%> (input vector) fit coefficients
  @return [DFloat]    returns <%=args[3][1]%>

  <%=desc%>

*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE v1, VALUE v2, VALUE v3)
{
    size_t shape[1];
    ndfunc_arg_in_t ain[3] = {{cDF,2},{cDF,1},{cDF,1}};
    ndfunc_arg_out_t aout[1] = {{cDF,1,shape}};
    ndfunc_t ndf = { iter_<%=c_func%>, NO_LOOP|NDF_EXTRACT,
                     3, 1, ain, aout };
    narray_t *x, *y, *c;

    GetNArray(v1,x);
    GetNArray(v2,y);
    GetNArray(v3,c);
    CHECK_GE_2D(x);
    CHECK_GE_1D(y);
    CHECK_GE_1D(c);
    CHECK_SIZE_EQ(MAT_SIZE1(x),VEC_SIZE(y),"y size does not match x row size");
    CHECK_SIZE_EQ(MAT_SIZE2(x),VEC_SIZE(c),"c size does not match x column size");
    shape[0] = VEC_SIZE(y);
    return na_ndloop(&ndf, 3, v1, v2, v3);
}

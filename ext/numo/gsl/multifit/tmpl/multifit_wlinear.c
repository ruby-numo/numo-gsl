static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    gsl_matrix X;
    gsl_vector y;
    gsl_vector w;
    gsl_vector c;
    gsl_matrix cov;
    double *chisq;
    <%=struct%> *ws = (<%=struct%>*)(lp->opt_ptr);

    SET_GSL_MATRIX_FROM_LOOPT(lp,0,X);
    SET_GSL_VECTOR_FROM_LOOPT(lp,1,y);
    SET_GSL_VECTOR_FROM_LOOPT(lp,2,w);
    SET_GSL_VECTOR_FROM_LOOPT(lp,3,c);
    SET_GSL_MATRIX_FROM_LOOPT(lp,4,cov);
    chisq = (double*)NDL_PTR(lp,5);

    <%=func_name%>(&X,&y,&w,&c,&cov,chisq,ws);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[0][1]%> (input matrix) predictor variables
  @param  [DFloat]    <%=args[1][1]%> (input vector) observations
  @param  [DFloat]    <%=args[2][1]%> (input vector) weights
  @return [GSL::Multifit::LinearResult] result Struct with members: <%=args[3][1]%>, <%=args[4][1]%>, <%=args[5][1]%>.

  <%=desc%>

*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE v1, VALUE v2, VALUE v3)
{
    size_t c_shape[1], cov_shape[2];
    ndfunc_arg_in_t ain[3] = {{cDF,2},{cDF,1},{cDF,1}};
    ndfunc_arg_out_t aout[3] = {{cDF,1,c_shape},{cDF,2,cov_shape},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, NO_LOOP|NDF_EXTRACT,
                     3, 3, ain, aout };
    VALUE vws, r, result;
    narray_t *X, *y, *w;
    size_t n, p;
    <%=struct%> *ws;

    GetNArray(v1,X);
    GetNArray(v2,y);
    GetNArray(v3,w);
    if (X->ndim < 2) {
        rb_raise(nary_eDimensionError,"X must be a matrix");
    }
    if (y->ndim < 1) {
        rb_raise(nary_eDimensionError,"y must be a vector");
    }
    if (w->ndim < 1) {
        rb_raise(nary_eDimensionError,"w must be a vector");
    }
    n = X->shape[X->ndim-2];
    p = X->shape[X->ndim-1];
    if (n != y->shape[y->ndim-1]) {
        rb_raise(nary_eShapeError,
                 "y size along last axis does not match matrix");
    }
    if (n != w->shape[w->ndim-1]) {
        rb_raise(nary_eShapeError,
                 "w size along last axis does not match matrix");
    }
    c_shape[0] = cov_shape[0] = cov_shape[1] = p;

    ws = gsl_multifit_linear_alloc(n,p);
    if (!ws)
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    vws = TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)ws);

    r = na_ndloop3(&ndf, ws, 3, v1, v2, v3);

    result = rb_class_new_instance(3, RARRAY_PTR(r), cLinearResult);

    RB_GC_GUARD(vws);
    RB_GC_GUARD(r);
    return result;
}

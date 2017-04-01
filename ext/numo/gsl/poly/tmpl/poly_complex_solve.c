static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    double  *a;
    gsl_complex_packed_ptr z;
    void   **opts;
    gsl_poly_complex_workspace *w;

    opts = (void **)(lp->opt_ptr);
    w    = (gsl_poly_complex_workspace*)(opts[0]);

    n = lp->args[0].shape[0];
    a = (double*)(lp->args[0].ptr + lp->args[0].iter[0].pos);
    z = (gsl_complex_packed_ptr)(lp->args[1].ptr + lp->args[1].iter[0].pos);
    <%=func_name%>(a, n, w, z);
}

/*
  @overload <%=name%>(<%=args[0][1]%>)
  @param  [Numo::DFloat]    <%=args[0][1]%>
  @return [Numo::DComplex]  <%=args[3][1]%> result

  <%= description %>

*/
static VALUE
<%=c_func(1)%>(VALUE mod, VALUE v1)
{
    size_t shape[0];
    ndfunc_arg_in_t ain[1] = {{cDF,1}};
    ndfunc_arg_out_t aout[1] = {{cDC,1,shape}};
    ndfunc_t ndf = {iter_<%=c_func%>, NO_LOOP, 1,1, ain,aout};
    gsl_poly_complex_workspace *w;
    void     *opts[1];
    VALUE     vz, vws;
    size_t    n;
    narray_t *na;

    v1 = rb_funcall(cDF, rb_intern("cast"), 1, v1);
    GetNArray(v1,na);
    if (na->ndim == 0) {
        rb_raise(nary_eDimensionError,"ndim(=%d) should >= %d", na->ndim, 0);
    }
    if (na->shape[na->ndim-1] < 2) {
        rb_raise(nary_eShapeError, "last axis size must be >= 2");
    }
    n = na->shape[na->ndim-1];
    shape[0] = n-1;

    vws = poly_complex_workspace_s_new(cPolyComplexWorkspace, SIZET2NUM(n));
    TypedData_Get_Struct(vws, gsl_poly_complex_workspace, &poly_complex_workspace_data_type, w);
    opts[0] = w;

    vz = na_ndloop3(&ndf, opts, 1, v1);
    RB_GC_GUARD(vws);
    RB_GC_GUARD(v1);
    return vz;
}

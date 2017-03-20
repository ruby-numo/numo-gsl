static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n1, n2;
    double  *p;
    void   **opts;
    <%=struct%> *w;
    gsl_wavelet_workspace *ws;
    int      dir;

    opts = (void **)(lp->opt_ptr);
    w    = (<%=struct%>*)(opts[0]);
    ws   = (gsl_wavelet_workspace*)(opts[1]);
    dir  = *(int*)(opts[2]);

    p = (double*)(lp->args[0].ptr + lp->args[0].iter[0].pos);
    n1 = lp->args[0].shape[0];
    n2 = lp->args[0].shape[1];
    <%=func_name%>(w, p, n2, n1, n2, dir, ws);
}

/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[5][1]%>)
  @param  [DFloat]    <%=args[1][1]%>
  @param  [Integer]   <%=args[5][1]%>
  @return [DFloat]    result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    ndfunc_arg_in_t ain[1] = {{OVERWRITE,2}};
    ndfunc_t ndf = {iter_<%=c_func%>, NO_LOOP, 1,0, ain,0};
    <%=struct%> *w;
    gsl_wavelet_workspace *a;
    size_t    n;
    int       dir;
    void     *opts[3];
    VALUE     vws;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    opts[0] = w;

    v1 = wavelet_array_check(v1, 2, &n);

    vws = wavelet_workspace_s_new(cWaveletWorkspace, SIZET2NUM(n));
    TypedData_Get_Struct(vws, gsl_wavelet_workspace, &wavelet_workspace_data_type, a);
    opts[1] = a;
    dir = NUM2INT(v2);
    opts[2] = &dir;

    na_ndloop3(&ndf, opts, 1, v1);
    RB_GC_GUARD(vws);
    return v1;
}

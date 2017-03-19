static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    double   x, y, z;
    void   **opts;
    <%=struct%> *w;
    gsl_interp_accel *a;

    opts = (void **)(lp->opt_ptr);
    w = (<%=struct%>*)(opts[0]);
    a = (gsl_interp_accel*)(opts[1]);

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        GET_DATA_STRIDE(p2,s2,double,y);
        z = <%=func_name%>(w, x, y, a);
        SET_DATA_STRIDE(p3,s3,double,z);
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[1][1]%>
  @param  [DFloat]    <%=args[2][1]%>
  @return [DFloat]    result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    ndfunc_arg_in_t ain[2] = {{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 2,1, ain,aout};
    <%=struct%> *w;
    gsl_interp_accel *a;
    void *opts[2];
    VALUE vac, v;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    opts[0] = w;
    vac = interp_accel_s_new(cInterpAccel);
    TypedData_Get_Struct(vac, gsl_interp_accel, &interp_accel_data_type, a);
    opts[1] = a;
    v = na_ndloop3(&ndf, opts, 2, v1, v2);
    RB_GC_GUARD(vac);
    return v;
}

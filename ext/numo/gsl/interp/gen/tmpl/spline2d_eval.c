static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    double   x, y, z;
    void   **opts;
    <%=struct%> *w;
    gsl_interp_accel *a1, *a2;

    opts = (void **)(lp->opt_ptr);
    w  = (<%=struct%>*)(opts[0]);
    a1 = (gsl_interp_accel*)(opts[1]);
    a2 = (gsl_interp_accel*)(opts[2]);

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        GET_DATA_STRIDE(p2,s2,double,y);
        z = <%=func_name%>(w, x, y, a1, a2);
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
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    ndfunc_arg_in_t ain[2] = {{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 2,1, ain,aout};
    <%=struct%> *w;
    gsl_interp_accel *a1, *a2;
    void *opts[3];
    VALUE vac1, vac2, v;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    opts[0] = w;
    vac1 = interp_accel_s_new(cInterpAccel);
    TypedData_Get_Struct(vac1, gsl_interp_accel, &interp_accel_data_type, a1);
    opts[1] = a1;
    vac2 = interp_accel_s_new(cInterpAccel);
    TypedData_Get_Struct(vac2, gsl_interp_accel, &interp_accel_data_type, a2);
    opts[2] = a2;
    v = na_ndloop3(&ndf, opts, 2, v1, v2);
    RB_GC_GUARD(vac1);
    RB_GC_GUARD(vac2);
    return v;
}

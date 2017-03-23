static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    double   x, z;
    int      y;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        z = <%=func_name%>(x,&y);
        SET_DATA_STRIDE(p2,s2,double,z);
        SET_DATA_STRIDE(p3,s3,int,y);
    }
}

/*
  @overload <%=name%>(<%=args[0][1]%>)
  @param  [DFloat]   <%=args[0][1]%>
  @return [DFloat]   array of [result, <%=args[1][1]%>]

  <%= description %>
*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v0, VALUE v1)
{
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cInt,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,2, ain,aout};

    return na_ndloop(&ndf, 1, v0);
}

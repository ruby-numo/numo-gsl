static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3, *p4;
    ssize_t  s1, s2, s3, s4;
    double   x1, x2, x3, y;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);
    INIT_PTR(lp, 3, p4, s4);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x1);
        GET_DATA_STRIDE(p2,s2,double,x2);
        GET_DATA_STRIDE(p3,s3,double,x3);
        y = <%=func_name%>(x1,x2,x3);
        SET_DATA_STRIDE(p4,s4,double,y);
    }
}

/*
  @overload <%=name%>(<%=args[0][1]%>, <%=args[1][1]%>, <%=args[2][1]%>)
  @param  [DFloat]   <%=args[0][1]%>
  @param  [DFloat]   <%=args[1][1]%>
  @param  [DFloat]   <%=args[2][1]%>
  @return [DFloat]   result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v0, VALUE v1, VALUE v2)<% set n_arg:3 %>
{
    ndfunc_arg_in_t ain[3] = {{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 3,1, ain,aout};

    return na_ndloop(&ndf, 3, v0, v1, v2);
}

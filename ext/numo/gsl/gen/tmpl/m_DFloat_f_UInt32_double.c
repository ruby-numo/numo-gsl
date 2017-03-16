static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    unsigned int x;
    double   y;
    double   c1;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);

    c1 = *(double*)(lp->opt_ptr);

    for (; i--;) {
        GET_DATA_STRIDE(p1,s1,unsigned int,x);
        y = <%=func_name%>(x, c1);
        SET_DATA_STRIDE(p2,s2,double,y);
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [UInt32]   <%=args[0][1]%>
  @param  [Float]    <%=args[1][1]%> parameter
  @return [DFloat]   result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v0, VALUE v1)<% set n_arg:2 %>
{
    ndfunc_arg_in_t ain[1] = {{numo_cUInt32,0}};
    ndfunc_arg_out_t aout[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,1, ain,aout};
    double c1;

    c1 = NUM2DBL(v1);

    return na_ndloop3(&ndf, &c1, 1, v0);
}

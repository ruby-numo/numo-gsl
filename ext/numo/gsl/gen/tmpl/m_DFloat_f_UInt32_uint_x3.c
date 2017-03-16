static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    unsigned int x;
    double   y;
    unsigned int *opt;
    unsigned int c1, c2, c3;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);

    opt = (unsigned int*)(lp->opt_ptr);
    c1 = opt[0];
    c2 = opt[1];
    c3 = opt[2];

    for (; i--;) {
        GET_DATA_STRIDE(p1,s1,double,x);
        y = <%=func_name%>(x, c1, c2, c3);
        SET_DATA_STRIDE(p2,s2,double,y);
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [UInt32]   <%=args[0][1]%>
  @param  [Integer]  <%=args[1][1]%> parameter
  @param  [Integer]  <%=args[2][1]%> parameter
  @param  [Integer]  <%=args[3][1]%> parameter
  @return [DFloat]   result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v0, VALUE v1, VALUE v2, VALUE v3)<% set n_arg:4 %>
{
    ndfunc_arg_in_t ain[1] = {{numo_cUInt32,0}};
    ndfunc_arg_out_t aout[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,1, ain,aout};
    unsigned int opt[3];

    opt[0] = NUM2UINT(v1);
    opt[1] = NUM2UINT(v2);
    opt[2] = NUM2UINT(v3);

    return na_ndloop3(&ndf, opt, 1, v0);
}

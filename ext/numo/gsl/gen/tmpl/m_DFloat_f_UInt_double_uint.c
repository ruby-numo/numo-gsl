static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    unsigned int x;
    double   y;
    char *opt;
    double c1;
    unsigned int c2;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);

    opt = (char*)(lp->opt_ptr);
    c1 = *(double*)opt;
    c2 = *(unsigned int*)(opt+sizeof(double));

    for (; i--;) {
        GET_DATA_STRIDE(p1,s1,double,x);
        y = <%=func_name%>(x, c1, c2);
        SET_DATA_STRIDE(p2,s2,double,y);
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [UInt]     <%=args[0][1]%>
  @param  [Integer]  <%=args[1][1]%> parameter
  @param  [Float]    <%=args[2][1]%> parameter
  @return [DFloat]   result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v0, VALUE v1, VALUE v2)<% set n_arg:3 %>
{
    ndfunc_arg_in_t ain[1] = {{cUI,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,1, ain,aout};
    char *opt;
    opt = ALLOCA_N(char,sizeof(double)+sizeof(unsigned int));

    *(double*)opt = NUM2DBL(v1);
    *(unsigned int*)(opt+sizeof(double)) = NUM2UINT(v2);

    return na_ndloop3(&ndf, opt, 1, v0);
}

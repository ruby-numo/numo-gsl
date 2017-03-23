static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1,*p2,*p3,*p4,*p5;
    ssize_t  s1, s2, s3, s4, s5;
    double   x,c1,cov11,y,ye;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);
    INIT_PTR(lp, 3, p4, s4);
    INIT_PTR(lp, 4, p5, s5);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        GET_DATA_STRIDE(p2,s2,double,c1);
        GET_DATA_STRIDE(p3,s3,double,cov11);
        <%=func_name%>(x, c1, cov11, &y, &ye);
        SET_DATA_STRIDE(p4,s4,double,y);
        SET_DATA_STRIDE(p5,s5,double,ye);
    }
}

/*
  @overload <%=name%>(<%=args[0][1]%>, mul_result)
  @param  [DFloat]    <%=args[0][1]%>
  @param  [MulResult|WmulResult]  mul_result  Result of GSL::Fit.mul|wmul
  @return [[DFloat,DFloat]] array of [<%=args[3][1]%>,<%=args[4][1]%>]

  <%=desc%>
*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v1, VALUE v2)
{
    ndfunc_arg_in_t ain[3] = {{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_EXTRACT,
                     3, 2, ain, aout };
    VALUE c1, cov11;

    c1 = RSTRUCT_GET(v2,0);
    cov11 = RSTRUCT_GET(v2,1);
    return na_ndloop(&ndf, 3, v1, c1, cov11);
}

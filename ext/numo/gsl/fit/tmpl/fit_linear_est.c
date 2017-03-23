static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1,*p2,*p3,*p4,*p5,*p6,*p7,*p8;
    ssize_t  s1, s2, s3, s4, s5, s6, s7, s8;
    double   x,c0,c1,cov00,cov01,cov11,y,ye;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);
    INIT_PTR(lp, 3, p4, s4);
    INIT_PTR(lp, 4, p5, s5);
    INIT_PTR(lp, 5, p6, s6);
    INIT_PTR(lp, 6, p7, s7);
    INIT_PTR(lp, 7, p8, s8);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        GET_DATA_STRIDE(p2,s2,double,c0);
        GET_DATA_STRIDE(p3,s3,double,c1);
        GET_DATA_STRIDE(p4,s4,double,cov00);
        GET_DATA_STRIDE(p5,s5,double,cov01);
        GET_DATA_STRIDE(p6,s6,double,cov11);
        <%=func_name%>(x, c0, c1, cov00, cov01, cov11, &y, &ye);
        SET_DATA_STRIDE(p7,s7,double,y);
        SET_DATA_STRIDE(p8,s8,double,ye);
    }
}

/*
  @overload <%=name%>(<%=args[0][1]%>,linear_result)
  @param  [DFloat]    <%=args[0][1]%>
  @param  [LinearResult|WlinearResult]  linear_result  Result of GSL::Fit.linear|wlinear
  @return [[DFloat,DFloat]] array of [<%=args[6][1]%>,<%=args[7][1]%>]

  <%=desc%>
*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v1, VALUE v2)
{
    ndfunc_arg_in_t ain[6] = {{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_EXTRACT,
                     6, 2, ain, aout };
    VALUE c0, c1, cov00, cov01, cov11;

    c0 = RSTRUCT_GET(v2,0);
    c1 = RSTRUCT_GET(v2,1);
    cov00 = RSTRUCT_GET(v2,2);
    cov01 = RSTRUCT_GET(v2,3);
    cov11 = RSTRUCT_GET(v2,4);
    return na_ndloop(&ndf, 6, v1, c0, c1, cov00, cov01, cov11);
}

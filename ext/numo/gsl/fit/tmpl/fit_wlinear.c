static VALUE cWlinearResult;

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1,*p2,*p3;
    double  *p4,*p5,*p6,*p7,*p8,*p9;
    ssize_t  s1, s2, s3;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);
    p4 = (double*)GET_PTR(lp,3);
    p5 = (double*)GET_PTR(lp,4);
    p6 = (double*)GET_PTR(lp,5);
    p7 = (double*)GET_PTR(lp,6);
    p8 = (double*)GET_PTR(lp,7);
    p9 = (double*)GET_PTR(lp,8);

    <%=func_name%>((double*)p1,s1/sizeof(double),
                   (double*)p2,s2/sizeof(double),
                   (double*)p3,s3/sizeof(double),
                   n,p4,p5,p6,p7,p8,p9);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[2][1]%>,<%=args[4][1]%>)
  @param  [DFloat]    <%=args[0][1]%>
  @param  [DFloat]    <%=args[2][1]%>
  @param  [DFloat]    <%=args[4][1]%>
  @return [GSL::Fit::WlinearResult] result Struct with members:[<%=args[5][1]%>,<%=args[6][1]%>,<%=args[7][1]%>,<%=args[8][1]%>,<%=args[9][1]%>,<%=args[10][1]%>]

  <%=desc%>
*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE v1, VALUE v2, VALUE v3)
{
    VALUE r, result;
    ndfunc_arg_in_t ain[4] = {{cDF,0},{cDF,0},{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[6] = {{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_EXTRACT,
                     3, 6, ain, aout };

    check_1d(v1);
    check_1d(v2);
    check_1d(v3);
    r = na_ndloop(&ndf, 4, v1, v2, v3, INT2FIX(1));
    result = rb_class_new_instance(6, RARRAY_PTR(r), cWlinearResult);
    RB_GC_GUARD(r);
    return result;
}

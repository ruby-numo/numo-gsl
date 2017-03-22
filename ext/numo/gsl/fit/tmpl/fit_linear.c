static VALUE cLinearResult;

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1,*p2;
    double  *p3,*p4,*p5,*p6,*p7,*p8;
    ssize_t  s1, s2;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    p3 = (double*)GET_PTR(lp,2);
    p4 = (double*)GET_PTR(lp,3);
    p5 = (double*)GET_PTR(lp,4);
    p6 = (double*)GET_PTR(lp,5);
    p7 = (double*)GET_PTR(lp,6);
    p8 = (double*)GET_PTR(lp,7);

    <%=func_name%>((double*)p1,s1/sizeof(double),
                   (double*)p2,s2/sizeof(double),
                   n,p3,p4,p5,p6,p7,p8);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[0][1]%>
  @param  [DFloat]    <%=args[2][1]%>
  @return [GSL::Fit::LinearResult] result Struct with members:[<%=args[5][1]%>,<%=args[6][1]%>,<%=args[7][1]%>,<%=args[8][1]%>,<%=args[9][1]%>,<%=args[10][1]%>]

  <%=desc%>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v1, VALUE v2)<% set n_arg: 2 %>
{
    VALUE r, result;
    ndfunc_arg_in_t ain[3] = {{cDF,0},{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[6] = {{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_EXTRACT,
                     3, 6, ain, aout };

    check_1d(v1);
    check_1d(v2);
    r = na_ndloop(&ndf, 3, v1, v2, INT2FIX(1));
    result = rb_class_new_instance(6, RARRAY_PTR(r), cLinearResult);
    RB_GC_GUARD(r);
    return result;
}

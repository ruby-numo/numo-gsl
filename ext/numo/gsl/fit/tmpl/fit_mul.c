static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1,*p2;
    double  *p3,*p4,*p5;
    ssize_t  s1, s2;

    n = lp->args[0].shape[0];
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    p3 = (double*)GET_PTR(lp,2);
    p4 = (double*)GET_PTR(lp,3);
    p5 = (double*)GET_PTR(lp,4);

    <%=func_name%>((double*)p1,s1/sizeof(double),
                   (double*)p2,s2/sizeof(double),
                   n,p3,p4,p5);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[2][1]%>)
  @param  [DFloat]    <%=args[0][1]%> (input array)
  @param  [DFloat]    <%=args[2][1]%> (input array)
  @return [GSL::Fit::<%=result_class%>] result Struct with members: <%=args[5][1]%>, <%=args[6][1]%>, <%=args[7][1]%>.

  <%=desc%>

*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v1, VALUE v2)
{
    VALUE r, result;
    ndfunc_arg_in_t ain[2] = {{cDF,1},{cDF,1}};
    ndfunc_arg_out_t aout[3] = {{cDF,0},{cDF,0},{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_EXTRACT,
                     2, 3, ain, aout };
    narray_t *x,*y;

    GetNArray(v1,x);
    GetNArray(v2,y);
    CHECK_SAME_SIZE_1D_2NARRAY(x,y)

    r = na_ndloop(&ndf, 2, v1, v2);
    result = rb_class_new_instance(3, RARRAY_PTR(r), c<%=result_class%>);
    RB_GC_GUARD(r);
    return result;
}

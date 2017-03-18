static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2;
    double  *opt = (double*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    p3 = lp->args[2].ptr + lp->args[2].iter[0].pos;

    *(double*)p3 = <%=func_name%>((double*)p1,s1/sizeof(double),
                                 (double*)p2,s2/sizeof(double),n,opt);
}

/*
  <%=desc%>
  @overload <%=name%>(<%=method_args%>,[axis0,axis1,..])
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    VALUE reduce, v, buf = 0;
    narray_t *na;
    double *opt;
    ndfunc_arg_in_t ain[3] = {{cDF,0},{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     3, 1, ain, aout };

    if (argc<2) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=2)",argc);
    }

    GetNArray(argv[0],na);
    opt = ALLOCV_N(double,buf,na->size*2); // todo: get loop size
    reduce = na_reduce_dimension(argc-2, argv+2, 2, argv);
    v = na_ndloop3(&ndf, opt, 3, argv[0], argv[1], reduce);
    ALLOCV_END(buf);
    return v;
}

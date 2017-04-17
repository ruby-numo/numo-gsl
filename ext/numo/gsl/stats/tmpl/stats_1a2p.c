static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1, *p2;
    ssize_t  s1;
    double  *opt = (double*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    p2 = lp->args[1].ptr + lp->args[1].iter[0].pos;

    *(double*)p2 = <%=func_name%>((double*)p1,s1/sizeof(double),n,opt[0],opt[1]);
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
    VALUE reduce;
    double opt[2];
    ndfunc_arg_in_t ain[2] = {{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     2, 1, ain, aout };

    if (argc<3) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=3)",argc);
    }

    opt[0] = NUM2DBL(argv[1]);
    opt[1] = NUM2DBL(argv[2]);

    reduce = na_reduce_dimension(argc-3, argv+3, 1, argv, 0);
    return na_ndloop3(&ndf, opt, 2, argv[0], reduce);
}

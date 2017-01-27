static void
<%=c_iter%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1, *p2, *p3;
    ssize_t  s1;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    p2 = lp->args[1].ptr + lp->args[1].iter[0].pos;
    p3 = lp->args[2].ptr + lp->args[2].iter[0].pos;

    <%=c_method%>((double*)p2,(double*)p3,(double*)p1,s1/sizeof(double),n);
}

/*
  <%=desc%>
  @overload <%=method%>(<%=method_args%>,[axis0,axis1,..])
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    VALUE reduce;
    ndfunc_arg_in_t ain[2] = {{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cDF,0}};
    ndfunc_t ndf = { <%=c_iter%>, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     2, 2, ain, aout };

    if (argc<1) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=1)",argc);
    }
    reduce = na_reduce_dimension(argc-1, argv+1, 1, argv);
    return na_ndloop(&ndf, 2, argv[0], reduce);
}

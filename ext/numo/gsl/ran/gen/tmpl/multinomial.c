static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1, *p2, *p3;

    INIT_COUNTER(lp, n);
    p1 = lp->args[0].ptr + lp->args[0].iter[0].pos;
    p2 = lp->args[1].ptr + lp->args[1].iter[0].pos;
    p3 = lp->args[2].ptr + lp->args[2].iter[0].pos;

    *(double*)p3 = <%=func_name%>(n,(double*)p1,(unsigned int *)p2);
}

/*
  @overload <%=name%>(<%=method_args%>,[axis0,axis1,..])
  <% desc_param.each do |x|%>
  <%=x%><% end %>

  <%=desc%>
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    VALUE reduce;
    ndfunc_arg_in_t ain[3] = {{cDF,0},{cUI,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, NDF_HAS_LOOP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     3, 1, ain, aout };

    if (argc<2) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=2)",argc);
    }

    reduce = na_reduce_dimension(argc-2, argv+2, 2, argv);
    return na_ndloop(&ndf, 3, argv[0], argv[1], reduce);
}

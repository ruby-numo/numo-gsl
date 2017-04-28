static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n;
    char    *p1, *p2;
    ssize_t  s1;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    p2 = lp->args[1].ptr + lp->args[1].iter[0].pos;

    *(double*)p2 = <%=func_name%>((double*)p1,s1/sizeof(double),n);
}

/*
  <%=desc%>
  @overload <%=name%>(<%=method_args%>, axis:nil, keepdims:false)
  <% desc_param.each do |x|%>
  <%=x%><% end %>
  @param [Numeric,Array,Range] axis (keyword) Axes along which the operation is performed.
  @param [TrueClass] keepdims (keyword) If true, the reduced axes are left in the result array as dimensions with size one.
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    VALUE reduce;
    ndfunc_arg_in_t ain[2] = {{cDF,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = { iter_<%=c_func%>, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     2, 1, ain, aout };

    if (argc<1) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=1)",argc);
    }
    reduce = nary_reduce_dimension(argc-1, argv+1, 1, argv, &ndf, 0);
    return na_ndloop(&ndf, 2, *argv, reduce);
}

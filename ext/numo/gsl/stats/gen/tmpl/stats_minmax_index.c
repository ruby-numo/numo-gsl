<% [64,32].each do |i| %>
#define idx_t int<%=i%>_t
static void
<%=c_iter%>_index<%=i%>(na_loop_t *const lp)
{
    size_t   n;
    size_t   min_idx, max_idx;
    char    *d_ptr, *i_ptr;
    ssize_t  d_step, i_step;
    char    *min_ptr, *max_ptr;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, d_ptr, d_step);

    <%=c_method%>(&min_idx,&max_idx,(double*)d_ptr,d_step/sizeof(double),n);

    INIT_PTR(lp, 1, i_ptr, i_step);
    min_ptr = NDL_PTR(lp,2);
    max_ptr = NDL_PTR(lp,3);
    *(idx_t*)min_ptr = *(idx_t*)(i_ptr + i_step * min_idx);
    *(idx_t*)max_ptr = *(idx_t*)(i_ptr + i_step * max_idx);
}
#undef idx_t
<% end %>

/*
 <%=desc%>
  @overload <%=method%>() => [Integer, Integer]
  @overload <%=method%>(axis0,axis1,..) => 2-element array of Integer or Numo::Int32/64
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    narray_t *na;
    VALUE idx, reduce;
    ndfunc_arg_in_t ain[3] = {{cDF,0},{Qnil,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[2] = {{0,0,0},{0,0,0}};
    ndfunc_t ndf = { 0, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT,
                     3,2, ain,aout };

    if (argc<1) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=1)",argc);
    }
    GetNArray(argv[0],na);
    if (na->ndim==0) {
        return INT2FIX(0);
    }
    if (na->size > (~(u_int32_t)0)) {
        aout[0].type = numo_cInt64;
        aout[1].type = numo_cInt64;
        idx = rb_narray_new(numo_cInt64, na->ndim, na->shape);
        ndf.func = <%=c_iter%>_index64;
    } else {
        aout[0].type = numo_cInt32;
        aout[1].type = numo_cInt32;
        idx = rb_narray_new(numo_cInt32, na->ndim, na->shape);
        ndf.func = <%=c_iter%>_index32;
    }
    rb_funcall(idx, rb_intern("seq"), 0);

    reduce = na_reduce_dimension(argc-1, argv+1, 1, argv);

    return na_ndloop(&ndf, 3, argv[0], idx, reduce);
}

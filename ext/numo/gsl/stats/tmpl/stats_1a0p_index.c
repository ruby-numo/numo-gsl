<% [64,32].each do |i| %>
#define idx_t int<%=i%>_t
static void
iter_<%=c_func%>_index<%=i%>(na_loop_t *const lp)
{
    size_t   n, idx;
    char    *d_ptr, *i_ptr, *o_ptr;
    ssize_t  d_step, i_step;

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, d_ptr, d_step);

    idx = <%=func_name%>((double*)d_ptr,d_step/sizeof(double),n);

    INIT_PTR(lp, 1, i_ptr, i_step);
    o_ptr = NDL_PTR(lp,2);
    *(idx_t*)o_ptr = *(idx_t*)(i_ptr + i_step * idx);
}
#undef idx_t
<% end %>

/*
 <%=desc%>
  @overload <%=name%>() => Integer
  @overload <%=name%>(axis0,axis1,..) => Integer or Numo::Int32/64
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE mod)
{
    narray_t *na;
    VALUE idx, reduce;
    ndfunc_arg_in_t ain[3] = {{cDF,0},{Qnil,0},{sym_reduce,0}};
    ndfunc_arg_out_t aout[1] = {{0,0,0}};
    ndfunc_t ndf = {0, STRIDE_LOOP_NIP|NDF_FLAT_REDUCE|NDF_EXTRACT, 3,1, ain,aout};

    if (argc<1) {
        rb_raise(rb_eArgError,"wrong number of argument (%d for >=1)",argc);
    }
    GetNArray(argv[0],na);
    if (na->ndim==0) {
        return INT2FIX(0);
    }
    if (na->size > (~(u_int32_t)0)) {
        aout[0].type = numo_cInt64;
        idx = rb_narray_new(numo_cInt64, na->ndim, na->shape);
        ndf.func = iter_<%=c_func%>_index64;
    } else {
        aout[0].type = numo_cInt32;
        idx = rb_narray_new(numo_cInt32, na->ndim, na->shape);
        ndf.func = iter_<%=c_func%>_index32;
    }
    rb_funcall(idx, rb_intern("seq"), 0);

    reduce = na_reduce_dimension(argc-1, argv+1, 1, argv, 0);

    return na_ndloop(&ndf, 3, argv[0], idx, reduce);
}

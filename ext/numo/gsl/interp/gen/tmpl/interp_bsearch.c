<%
set singleton: true
%>
/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>)
  @param  [DFloat]   <%=args[0][1]%>
  @param  [Float]    <%=args[0][1]%>

  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,range)
  @param  [DFloat]   <%=args[0][1]%>
  @param  [Float]    <%=args[0][1]%>
  @param  [Range]    range

  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>,<%=args[2][1]%>)
  @param  [DFloat]   <%=args[0][1]%>
  @param  [Float]    <%=args[1][1]%>
  @param  [Integer]  <%=args[2][1]%>
  @param  [Integer]  <%=args[3][1]%>

  allocate instance of <%=class_name%> class.

  <%= desc %>
 */
static VALUE
<%=c_func%>(int argc, VALUE *argv, VALUE klass)<% set n_arg:-1 %>
{
    double *p1;
    size_t n1, lo=0, hi=0, idx;
    VALUE  v1, v2, v3, v4;
    long   beg, len;
    double x;
    int    nargs;

    nargs = rb_scan_args(argc, argv, "22", &v1, &v2, &v3, &v4);
    v1 = cast_1d_contiguous(v1, cDF);
    n1 = RNARRAY_SIZE(v1);
    x  = NUM2DBL(v2);
    switch(nargs) {
    case 4:
        v3 = rb_range_new(v3,v4,0);
    case 3:
        if (rb_range_beg_len(v3, &beg, &len, n1, 2) != Qtrue) {
            rb_raise(rb_eRangeError, "range error");
        }
        lo = beg;
        hi = beg+len-1;
        break;
    case 2:
        lo = 0;
        hi = n1-1;
    }
    p1 = (double*)na_get_pointer_for_read(v1);
    idx = <%=func_name%>(p1, x, lo, hi);
    RB_GC_GUARD(v1);

    return SIZET2NUM(idx);
}

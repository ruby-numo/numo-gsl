<%
set name: "new"
set singleton: true
set alloc_func: func_name.sub(/_init$/,"_alloc")
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func(2)%>(VALUE self, const gsl_interp_type *t, VALUE v1, VALUE v2)
{
    <%=struct%> *w;
    double *p1, *p2;
    size_t n1, n2, sz;

    v1 = cast_1d_contiguous(v1, cDF);
    v2 = cast_1d_contiguous(v2, cDF);
    n1 = RNARRAY_SIZE(v1);
    n2 = RNARRAY_SIZE(v2);
    sz = (n1 < n2) ? n1 : n2;
    w  = <%=alloc_func%>(t, sz);
    p1 = (double*)na_get_pointer_for_read(v1);
    p2 = (double*)na_get_pointer_for_read(v2);
    <%=func_name%>(w, p1, p2, sz);
    RB_GC_GUARD(v1);
    RB_GC_GUARD(v2);

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

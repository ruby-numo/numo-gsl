<%
set name: "new"
set singleton: true
set alloc_func: func_name.sub(/_init$/,"_alloc")
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func%>(VALUE self, const gsl_interp2d_type *t, VALUE v1, VALUE v2, VALUE v3)<% set n_arg:3 %>
{
    double *p1, *p2, *p3;
    size_t nx, ny;
    narray_t *na;
    <%=struct%> *w;

    v1 = cast_1d_contiguous(v1, cDF);
    v2 = cast_1d_contiguous(v2, cDF);
    v3 = cast_2d_contiguous(v3, cDF);
    nx = RNARRAY_SIZE(v1);
    ny = RNARRAY_SIZE(v2);
    GetNArray(v3,na);
    if (na->shape[1] != nx || na->shape[0] != ny) {
        rb_raise(nary_eShapeError,"za.shape should be [ya.size,xa.size]");
    }
    w  = <%=alloc_func%>(t, nx, ny);
    p1 = (double*)na_get_pointer_for_read(v1);
    p2 = (double*)na_get_pointer_for_read(v2);
    p3 = (double*)na_get_pointer_for_read(v3);
    <%=func_name%>(w, p1, p2, p3, nx, ny);
    RB_GC_GUARD(v1);
    RB_GC_GUARD(v2);
    RB_GC_GUARD(v3);

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

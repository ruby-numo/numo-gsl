<%
set name: "new"
set singleton: true
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func(1)%>(VALUE self, const gsl_wavelet_type *t, VALUE v1)
{
    <%=struct%> *w;
    size_t k;

    k = NUM2SIZET(v1);
    w = <%=func_name%>(t, k);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

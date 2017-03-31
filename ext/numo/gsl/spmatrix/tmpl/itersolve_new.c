<%
set name: "new"
set singleton: true
define_singleton_method(:define){nil}
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func(:nodef)%>(VALUE self, const gsl_splinalg_itersolve_type *t, VALUE v1, VALUE v2)
{
    <%=struct%> *w;
    size_t n, m;

    n = NUM2SIZET(v1);
    m = NUM2SIZET(v2);
    w = <%=func_name%>(t, n, m);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

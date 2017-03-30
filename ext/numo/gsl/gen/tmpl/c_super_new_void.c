<%
set name: "new"
set singleton: true
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func(1)%>(VALUE self, const <%=type_struct%> *t)
{
    <%=struct%> *w;

    w = <%=func_name%>(t);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

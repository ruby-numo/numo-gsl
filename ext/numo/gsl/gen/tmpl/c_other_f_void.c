/*
  @overload <%=name%>()
  @return [<%=full_class_name%>]

 <%= desc %>
 */
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *x, *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, x);

    w = <%=func_name%>(x);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

<%
set name: "new"
set singleton: true
%>
/*
  @overload new(<%=args[0][1]%>)
  @param [Float] <%=args[0][1]%>

  allocate instance of <%=class_name%> class.

 <%= desc %>
 */
static VALUE
<%=c_func(1)%>(VALUE self, VALUE p)
{
    <%=struct%> *w;
    w = <%=func_name%>(NUM2DBL(p));
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

<%
set name: "new"
set singleton: true
%>
/*
  @overload <%=name%>(<%=args[0][1]%>)
  @param  [Integer]  <%=args[0][1]%> parameter

  allocate instance of <%=class_name%> class.

 <%= desc %>
 */
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    <%=struct%> *w;
    w = <%=func_name%>(NUM2SIZET(v1));
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

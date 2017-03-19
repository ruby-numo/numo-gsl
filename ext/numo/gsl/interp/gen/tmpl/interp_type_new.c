/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]  <%=args[1][1]%>
  @param  [DFloat]  <%=args[2][1]%>

  allocate instance of <%=class_name%> class.

  <%= desc %>
  */
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    return <%=c_interp_new%>(self, <%=interp_type%>, v1, v2);
}

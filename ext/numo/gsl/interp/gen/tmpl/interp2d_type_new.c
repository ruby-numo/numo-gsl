/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]  <%=args[0][1]%>
  @param  [DFloat]  <%=args[1][1]%>
  @param  [DFloat]  <%=args[2][1]%>

  allocate instance of <%=class_name%> class.

  <%= desc %>
  */
static VALUE
<%=c_func(3)%>(VALUE self, VALUE v1, VALUE v2, VALUE v3)
{
    return <%=c_interp_new%>(self, <%=interp_type%>, v1, v2, v3);
}

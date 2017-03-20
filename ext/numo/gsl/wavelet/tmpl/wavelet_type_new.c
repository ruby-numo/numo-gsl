/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]  <%=args[1][1]%>

  generate wavelet type <%=subtype_class%> instance.

  <%= desc %>
  */
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    return <%=c_superclass_new%>(self, <%=subtype%>, v1);
}

/*
  @overload <%=name%>(<%=args[1][1]%>, <%=args[2][1]%>)
  @param  [DFloat]  <%=args[1][1]%>
  @param  [DFloat]  <%=args[2][1]%>

  generate wavelet type <%=subtype_class%> instance.

  <%= desc %>
  */
static VALUE
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    return <%=c_superclass_new%>(self, <%=subtype%>, v1, v2);
}

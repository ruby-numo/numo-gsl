/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [DFloat]  <%=args[0][1]%>
  @param  [DFloat]  <%=args[1][1]%>
  @param  [DFloat]  <%=args[2][1]%>

  Generate an instance of <%=full_class_name%>::<%=subtype_class%> class,
  a subclass of <%=full_class_name%> class with <%=subtype_var%> type.

  <%= desc %>

  */
static VALUE
<%=c_func(3)%>(VALUE self, VALUE v1, VALUE v2, VALUE v3)
{
    return <%=c_superclass_new%>(self, <%=subtype_var%>, v1, v2, v3);
}

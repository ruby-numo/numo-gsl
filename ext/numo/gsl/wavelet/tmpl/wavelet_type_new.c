/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]  <%=args[1][1]%>

  Generate an instance of <%=full_class_name%>::<%=subtype_class%> class,
  a subclass of <%=full_class_name%> class with <%=subtype_var%> type.

  <%= desc %>

  */
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    return <%=c_superclass_new%>(self, <%=subtype_var%>, v1);
}

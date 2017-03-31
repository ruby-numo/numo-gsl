/*
  @overload <%=name%>([seed])
  @param [Integer]  seed  Random seed.

  Generate an instance of <%=full_class_name%>::<%=subtype_class%> class,
  a subclass of <%=full_class_name%> class with <%=subtype_var%> type.

  <%= desc %>
  */
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    return <%=c_superclass_new%>(argc, argv, self, <%=subtype_var%>);
}

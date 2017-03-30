/*
  @overload <%=name%>([seed])
  @param [Integer]  seed  Random seed.

  generate Rng type <%=subtype_class%> instance.

  <%= desc %>
  */
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    return <%=c_superclass_new%>(argc, argv, self, <%=subtype%>);
}

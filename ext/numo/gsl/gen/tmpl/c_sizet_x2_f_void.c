/*
  @overload <%=name%>()
  @return [Array]   array of [<%=args[0][1]%>,<%=args[1][1]%>]

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    size_t i, j;
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%=func_name%>(w, &i, &j);
    return rb_assoc_new(SIZET2NUM(i), SIZET2NUM(j));
}

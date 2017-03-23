/*
  @overload <%=name%>()
  @return [Array]   array of [<%=args[1][1]%>,<%=args[2][1]%>]

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *w;
    double d1, d2;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%=func_name%>(w, &d1, &d2);
    return rb_assoc_new(DBL2NUM(d1),DBL2NUM(d2));
}

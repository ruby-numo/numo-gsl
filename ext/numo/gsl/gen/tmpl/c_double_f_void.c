/*
  @overload <%=name%>
  @return [Float]

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return DBL2NUM(<%=func_name%>(w));
}

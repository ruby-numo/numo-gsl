/*
  @overload <%=name%>

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    <%=func_name%>(w);
    return Qnil;
}

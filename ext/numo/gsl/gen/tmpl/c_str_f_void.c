/*
  @overload <%=name%>
  @return [String]

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return rb_str_new_cstr(<%=func_name%>(w));
}

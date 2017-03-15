/*
  @overload <%=name%>
  @return [Integer]

  returns <%=name%> field in <%=struct%> struct.
*/
static VALUE
<%=c_func%>(VALUE self)<% set n_arg:0 %>
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return SIZET2NUM(w-><%=name%>);
}

/*
  @overload <%=name%>
  @return [Integer]

  returns <%=name%> field in <%=struct%> struct.
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return SIZET2NUM(w-><%=name%>);
}

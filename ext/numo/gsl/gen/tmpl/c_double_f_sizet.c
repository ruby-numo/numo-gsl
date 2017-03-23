/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [Integer]   <%=args[1][1]%>
  @return [Float]     result

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return DBL2NUM(<%=func_name%>(w, NUM2SIZET(v1)));
}

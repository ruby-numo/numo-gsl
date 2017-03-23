/*
  @overload <%=name%>(<%=args[1..-1].map{|a| a[1]}.join(",")%>)
  @param  [Integer]  <%=args[1][1]%>
  @param  [Integer]  <%=args[2][1]%>
  @return [Float]    result

  <%= description %>
*/
static VALUE
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return DBL2NUM(<%=func_name%>(w, NUM2SIZET(v1), NUM2SIZET(v2)));
}

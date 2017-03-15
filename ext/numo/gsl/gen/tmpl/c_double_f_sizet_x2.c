/*
  @overload <%=name%>(<%=args[1..-1].map{|a| a[1]}.join(",")%>)
  @param  [Integer]  <%=args[1][1]%>
  @param  [Integer]  <%=args[2][1]%>
  @return [Float]    result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return DBL2NUM(gsl_<%=c_func%>(w, NUM2SIZET(v1), NUM2SIZET(v2)));
}

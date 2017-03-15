/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [Float]  <%=args[0][1]%>
  @param  [Float]  <%=args[1][1]%>
  @param  [Float]  <%=args[2][1]%>
  @param  [Float]  <%=args[3][1]%>
  @return [Qnil]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2, VALUE v3, VALUE v4)<% set n_arg:4 %>
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    gsl_<%=c_func%>(w, NUM2DBL(v1),NUM2DBL(v2),NUM2DBL(v3),NUM2DBL(v4));
    return Qnil;
}

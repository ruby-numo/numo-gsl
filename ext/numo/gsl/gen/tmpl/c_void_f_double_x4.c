/*
  @overload <%=name%>(<%=args[1..4].map{|a| a[1]}.join(",")%>)
  @param  [Float]  <%=args[1][1]%>
  @param  [Float]  <%=args[2][1]%>
  @param  [Float]  <%=args[3][1]%>
  @param  [Float]  <%=args[4][1]%>
  @return [Qnil]

  <%= description %>
*/
static VALUE
<%=c_func(4)%>(VALUE self, VALUE v1, VALUE v2, VALUE v3, VALUE v4)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%=func_name%>(w, NUM2DBL(v1),NUM2DBL(v2),NUM2DBL(v3),NUM2DBL(v4));
    return Qnil;
}

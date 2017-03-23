/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [Float]  <%=args[0][1]%>
  @return [Qnil]

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%=func_name%>(w, NUM2DBL(v1));
    return Qnil;
}

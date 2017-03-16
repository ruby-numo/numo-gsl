/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [Float]  <%=args[0][1]%>
  @param  [Float]  <%=args[1][1]%>
  @return [Qnil]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%=func_name%>(w, NUM2DBL(v1), NUM2DBL(v2));
    return Qnil;
}

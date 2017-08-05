/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [Float]  <%=args[1][1]%>
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

/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [<%=full_class_name%>]  <%=args[1][1]%> other
  @return [<%=full_class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE other)
{
    <%=struct%> *w, *x;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    TypedData_Get_Struct(other, <%=struct%>, &<%=data_type_var%>, x);
    <%=func_name%>(w,x);
    return self;
}

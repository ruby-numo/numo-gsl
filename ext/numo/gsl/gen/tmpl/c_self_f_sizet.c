/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [Integer]   <%=args[1][1]%>
  @return [<%=full_class_name%>]   self

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    <%=struct%> *w;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <% if get(:postpose) %>
    <%=func_name%>(NUM2SIZET(v1),w);
    <% else %>
    <%=func_name%>(w, NUM2SIZET(v1));
    <% end %>
    return self;
}

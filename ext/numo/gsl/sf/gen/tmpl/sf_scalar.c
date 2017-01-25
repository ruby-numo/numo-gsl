/*
  <%=desc%>
  @overload <%=method%>(<%=method_args%>)
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(<%=cdef_args%>)
{
  <% parsed_args.each do |a| %>
    <%=a.def_var%><% end %>

  <% args_param.each do |a| %>
    <%=a.set_value%><% end %>

  <%=preproc_code%>

    <%=recv%><%=c_method%>(<%=c_args%>);

  <% if args_out.size == 1 %>
    return <%=args_out[0].get_value%>;
  <% else %>
    {
        VALUE va = rb_ary_new();
        <% args_out.each do |a| %>
        <%=a.store_to_array("va")%><% end %>
        return va;
    }
  <% end %>
}

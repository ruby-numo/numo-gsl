/*
  @overload <%=name%>(<%=method_args%>)
  <% desc_param_scalar.each do |x| %>
  <%=  x %><%end%>

  <%=desc%>
*/
static VALUE
<%=c_func%>(<%=cdef_args%>)
{
    <%  @parsed_args.each do |a| %>
    <%=   a.def_var              %><%end%>
    <%  args_param.each do |a|   %>
    <%=   a.set_value            %><%end%>
<%= @preproc_code %>
    <%=recv%><%=func_name%>(<%=c_args%>);
    <%  if args_out.size == 1 %>
    return <%= args_out[0].get_value %>;
    <%  else %>
    {
        VALUE va = rb_ary_new();
        <%  args_out.each do |a|     %>
        <%=   a.store_to_array("va") %><%end%>
        return va;
    }
    <%  end  %>
}

/*
  module definition: <%= full_module_name %>
*/

<%  if module_var != ns_var %>
static VALUE <%=module_var%>;
<%  end %>

<%= method_code %>

/*
  Document-module: <%= full_module_name %>
  <%= description %>
 */
static void
<%=init_func%>()
{
    /* declare <%= full_module_name %> */
    <%  if module_var != ns_var %>
    <%=module_var%> = rb_define_module_under(<%=ns_var%>, "<%=module_name%>");
    <%  end %>
    <% @children.each do |m| %>
    <%= m.define %><% end %>
}

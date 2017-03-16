/*
  module definition: <%= full_module_name %>
*/

<%= method_code %>

/*
  Document-module: <%= full_module_name %>
  <%= description %>
 */
static void
<%=init_func%>()
{
    /* declare <%= full_module_name %> */
    <% @children.each do |m| %>
    <%= m.define %><% end %>
}

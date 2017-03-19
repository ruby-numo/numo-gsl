
    /*
      Document-class: <%= full_class_name %>
      <%= description %>
    */
    {
    <%=class_var%> = rb_define_class_under(<%=ns_var%>, "<%=class_name%>", <%=super_class%>);
    <% @children.each do |m| %>
    <%= m.define %><% end %>
    }

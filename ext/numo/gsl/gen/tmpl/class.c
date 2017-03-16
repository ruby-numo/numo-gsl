/*
  class definition: <%= full_class_name %>
*/

static VALUE <%=class_var%>;

static void
<%=name%>_free(void *ptr)
{
    gsl_<%=name%>_free(ptr);
}

static size_t
<%=name%>_memsize(const void *ptr)
{
    return sizeof(<%=struct%>);
}

static const rb_data_type_t <%=name%>_data_type = {
    "<%=full_class_name%>",
    {NULL, <%=name%>_free, <%=name%>_memsize,},
    0, 0, RUBY_TYPED_FREE_IMMEDIATELY|RUBY_TYPED_WB_PROTECTED
};
<% set data_type_var:name+"_data_type" %>

<%= method_code %>

/*
  Document-class: <%= full_class_name %>
  <%= description %>
 */
static void
<%=init_func%>()
{
    /* declare <%= full_class_name %> */
    <%=class_var%> = rb_define_class_under(<%=ns_var%>, "<%=class_name%>", rb_cObject);
    <% @children.each do |m| %>
    <%= m.define %><% end %>
}

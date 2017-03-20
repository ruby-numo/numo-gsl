/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]    <%=args[1][1]%>
  @return [DFloat]    result

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    int dir;
    VALUE v2;

    <% if /_forward$/ =~ name %>
    dir = gsl_wavelet_forward;
    <% elsif /_inverse$/ =~ name %>
    dir = gsl_wavelet_backward;
    <% end %>
    v2 = INT2FIX(dir);

    return <%=c_func.sub(/_[^_]+$/,"")%>(self, v1, v2);
}

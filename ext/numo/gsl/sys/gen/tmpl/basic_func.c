static void
<%=c_iter%>(na_loop_t *const lp)
{
    <% parsed_args.each do |a| %>
    <%=a.def_var%><% end %>

    <% if n_param > 1 %>
    void **opt = (void**)(lp->opt_ptr);
    <% args_param.each_with_index do |a,i| %>
    <%=a.get_param("opt[#{i}]")%><% end %>
    <% elsif n_param == 1 %>
    void *opt = (void*)(lp->opt_ptr);
    <%=args_param[0].get_param("opt")%>
    <% end %>

    <% args_in.each do |a| %>
    <%=a.get_data("lp")%><% end %>
    <% args_out.each do |a| %>
    <%=a.get_ptr("lp")%><% end %>

    <%=recv%><%=c_method%>(<%=c_args%>);

    <% args_out.each do |a| %>
    <%=a.set_data("lp")%><% end %>
}

/*
  <%=desc%>
  @overload <%=method%>(<%=method_args%>)
  <% desc_param.each do |x|%>
  <%=x%><% end %>
*/
static VALUE
<%=c_func%>(<%=cdef_args%>)
{
    <% args_param.each do |a| %>
    <%=a.def_var%><% end %>

    <% if n_param == 1 %>
    void *opt;
    <% elsif n_param > 1 %>
    void *opt[<%=n_param%>];
    <% end %>

    <% if generate_array %>
    size_t shape[1];
    <% end %>

    ndfunc_arg_in_t ain[<%=n_in%>] = {<%=def_ain%>};
    ndfunc_arg_out_t aout[<%=n_out%>] = {<%=def_aout%>};
    ndfunc_t ndf = {<%=c_iter%>,NO_LOOP|NDF_EXTRACT,<%=n_in%>,<%=n_out%>,ain,aout};

    <% if n_param == 1 %>
    <%=args_param[0].set_param("opt")%>
    <% elsif n_param > 1 %>
    <% args_param.each_with_index do |a,i| %>
    <%=a.set_param("opt[#{i}]")%><% end %>
    <% end %>

<%=preproc_code()%>

    <% if n_param > 0 %>
    return na_ndloop3(&ndf,opt,<%=n_in%>,<%=ndl_args%>);
    <% else %>
    return na_ndloop(&ndf,<%=n_in%>,<%=ndl_args%>);
    <% end %>
}

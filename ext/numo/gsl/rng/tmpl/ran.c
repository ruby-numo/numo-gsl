/*
  @overload <%= name %>(<%@params.each{|x|%><%=x[0]%>,<%}%>[shape])
  <% @params.each do |x|%>
  @param  [<%=x[1]%>]  <%=x[0]%><% end %>
  @param  [Array or Integer]  shape (optional) shape for result NArray
  @return [<%=get(:ret_class)%>]  returns random number

<%= desc %>

 */
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    VALUE vshape, vna;
    size_t i, size;
    int nargs;
    <%=func_type%> *ptr;
    <% @vn.each do |v|%>
    VALUE <%=v%>;<% end %>
    <% @vardef.each do |x|%>
    <%=x%>;<% end %>
    gsl_rng *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    nargs = rb_scan_args(argc, argv, "<%=@params.size%>1" <%@vn.map{|v|%>, &<%=v%><%}%>, &vshape);
    <% @varconv.each do |x|%><%=x%>
    <% end %>
    if (nargs == <%=@params.size%>) {
        <% if func_type == ErbppGsl.uint %>
        return ULONG2NUM(<%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>));
        <% else %>
        return rb_float_new(<%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>));
        <% end %>
    } else {
        vna = create_new_narray(<%=get(:func_type_var)%>,vshape);
        ptr = (<%=func_type%>*)na_get_pointer_for_write(vna);
        size = RNARRAY_SIZE(vna);
        for (i=0; i<size; i++) {
            ptr[i] = <%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>);
        }
        return vna;
    }
}

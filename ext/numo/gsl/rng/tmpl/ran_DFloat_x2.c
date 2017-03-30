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
    VALUE vshape, vx, vy;
    size_t i, size;
    int nargs;
    double x, y;
    double *px, *py;
    <% @vn.each do |v|%>
    VALUE <%=v%>;<% end %>
    <% @vardef.each do |x|%>
    <%=x%>;<% end %>
    gsl_rng *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    nargs = rb_scan_args(argc, argv, "<%=@params.size%>1" <%@vn.map{|v|%>, &<%=v%><%}%>, &vshape);
    <% @varconv.each do |x|%>
    <%=x%><% end %>
    if (nargs == <%=@params.size%>) {
        <%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>, &x, &y);
        return rb_assoc_new(DBL2NUM(x),DBL2NUM(y));
    } else {
        vx = create_new_narray(cDF,vshape);
        vy = create_new_narray(cDF,vshape);
        px = (double*)na_get_pointer_for_write(vx);
        py = (double*)na_get_pointer_for_write(vy);
        size = RNARRAY_SIZE(vx);
        for (i=0; i<size; i++) {
            <%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>, px, py);
            px++; py++;
        }
        return rb_assoc_new(vx,vy);
    }
}

/*
  @overload <%= name %>(<%@params.each{|x|%><%=x[0]%>,<%}%>[shape])
  <% @params.each do |x|%>
  @param  [<%=x[1]%>]  <%=x[0]%><% end %>
  @param  [Array or Integer]  shape (optional) shape for result Numo::NArray
  @return [Array]  returns array of [x,y,z], where x,y,z are Float or Numo::DFloat

<%= desc %>

 */
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    VALUE vshape;
    VALUE v[3];
    size_t i, size;
    int nargs;
    double x, y, z;
    double *px, *py, *pz;
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
        <%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>, &x, &y, &z);
        v[0] = DBL2NUM(x);
        v[1] = DBL2NUM(y);
        v[2] = DBL2NUM(z);
        return rb_ary_new4(3,v);
    } else {
        v[0] = create_new_narray(cDF,vshape);
        v[1] = create_new_narray(cDF,vshape);
        v[2] = create_new_narray(cDF,vshape);
        px = (double*)na_get_pointer_for_write(v[0]);
        py = (double*)na_get_pointer_for_write(v[1]);
        pz = (double*)na_get_pointer_for_write(v[2]);
        size = RNARRAY_SIZE(v[0]);
        for (i=0; i<size; i++) {
            <%=func_name%>(r <%@an.map{|a|%>, <%=a%><%}%>, px, py, pz);
            px++; py++; pz++;
        }
        return rb_ary_new4(3,v);
    }
}

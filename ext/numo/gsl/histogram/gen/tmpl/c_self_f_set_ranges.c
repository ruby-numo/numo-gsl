/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]   <%=args[1][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    <%=struct%> *w;
    double *p1;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    v1 = cast_1d_contiguous(v1, numo_cDFloat);
    p1 = (double*)na_get_pointer_for_read(v1);
    gsl_<%=c_func%>(w, p1, RNARRAY_SIZE(v1));
    RB_GC_GUARD(v1);
    return self;
}

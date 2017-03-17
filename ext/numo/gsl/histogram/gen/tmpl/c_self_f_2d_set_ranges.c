/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[3][1]%>)
  @param  [DFloat]   <%=args[1][1]%>
  @param  [DFloat]   <%=args[3][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;
    double *p1, *p2;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    v1 = cast_1d_contiguous(v1, cDF);
    p1 = (double*)na_get_pointer_for_read(v1);
    v2 = cast_1d_contiguous(v2, cDF);
    p2 = (double*)na_get_pointer_for_read(v2);

    <%=func_name%>(w, p1, RNARRAY_SIZE(v1), p2, RNARRAY_SIZE(v2));
    RB_GC_GUARD(v1);
    RB_GC_GUARD(v2);
    return self;
}

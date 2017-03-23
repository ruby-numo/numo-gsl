/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]   <%=args[1][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    <%=struct%> *w;
    double *p1;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    v1 = cast_1d_contiguous(v1, cDF);
    p1 = (double*)na_get_pointer_for_read(v1);
    <%=func_name%>(w, p1, RNARRAY_SIZE(v1));
    RB_GC_GUARD(v1);
    return self;
}

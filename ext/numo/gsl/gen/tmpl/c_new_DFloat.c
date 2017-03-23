<%
set name: "new"
set singleton: true
%>
/*
  @overload <%=name%>(<%=args[0][1]%>)
  @param  [DFloat]  <%=args[0][1]%>

  allocate instance of <%=class_name%> class.

  <%= desc %>
 */
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    narray_t *na;
    double *d;
    <%=struct%> *w;

    v1 = rb_funcall(cDF,rb_intern("cast"),1,v1);
    GetNArray(v1,na);
    d = (double*)na_get_pointer_for_read(v1);
    w = <%=func_name%>(na->size, d);
    RB_GC_GUARD(v1);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

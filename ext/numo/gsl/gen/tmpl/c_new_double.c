/*
  @overload new(p)
  @param [Float] p

  allocate instance of <%=class_name%> class.
 */
static VALUE
<%=c_func%>(VALUE self, VALUE p)<% set n_arg:1 %>
{
    <%=struct%> *w;
    w = <%=func_name%>(NUM2DBL(p));

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

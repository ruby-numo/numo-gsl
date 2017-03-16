/*
  @overload new

  allocate instance of <%=class_name%> class.
 */
static VALUE
<%=c_func%>(VALUE self)<% set n_arg:0 %>
{
    <%=struct%> *w;
    w = <%=func_name%>();

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

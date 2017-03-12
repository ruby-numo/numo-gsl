/*
  @overload new

  allocate instance of <%=class_name%> class.
 */
static VALUE
<%=c_func%>(VALUE self)<% set n_arg:0 %>
{
    <%=struct%> *w;
    w = gsl_<%=parent.name%>_alloc();

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

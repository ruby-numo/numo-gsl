/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [<%=class_name%>] <%=args[1][1]%>
  @return [Bool]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    int stat;
    <%=struct%> *w, *w1;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    TypedData_Get_Struct(v1, <%=struct%>, &<%=data_type_var%>, w1);

    stat = <%=func_name%>(w, w1);
    return (stat) ? Qtrue: Qfalse;
}

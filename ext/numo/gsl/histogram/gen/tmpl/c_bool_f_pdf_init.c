<%
h_struct = struct.sub(/_pdf/,"")
h_data_type_var = data_type_var.sub(/_pdf/,"")
%>
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
    <%=struct%> *w;
    <%=h_struct%> *w1;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);
    TypedData_Get_Struct(v1, <%=h_struct%>, &<%=h_data_type_var%>, w1);

    stat = gsl_<%=c_func%>(w, w1);
    return (stat) ? Qtrue: Qfalse;
}

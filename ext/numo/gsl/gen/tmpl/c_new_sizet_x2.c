<%
set name: "new"
set singleton: true
%>
/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [Integer]  <%=args[0][1]%> parameter
  @param  [Integer]  <%=args[1][1]%> parameter

  allocate instance of <%=class_name%> class.

<%= desc %>
 */
static VALUE
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    <%=struct%> *w;
    w = <%=func_name%>(NUM2SIZET(v1), NUM2SIZET(v2));
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

<%
set name: "new"
set singleton: true
%>

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,[<%=args[2][1]%>,<%=args[3][1]%>])
  @param  [Integer]  <%=args[0][1]%>
  @param  [Integer]  <%=args[1][1]%>
  @param  [Ingeger]  <%=args[2][1]%>
  @param  [Ingeger]  <%=args[3][1]%>   (default = GSL_SPMATRIX_TRIPLET)

  <%= desc %>
  */
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE klass)
{
    <%=struct%> *w;
    int narg;
    size_t sptype = GSL_SPMATRIX_TRIPLET;
    VALUE  n1, n2, v3, v4;

    narg = rb_scan_args(argc,argv,"22",&n1,&n2,&v3,&v4);
    switch(narg) {
    case 4:
        sptype = NUM2SIZET(v4);
    case 3:
        w = <%=func_name%>(NUM2SIZET(n1),NUM2SIZET(n2),NUM2SIZET(v3),sptype);
        break;
    case 2:
        w = <%=func_name.sub(/_nzmax/,"")%>(NUM2SIZET(n1),NUM2SIZET(n2));
        break;
    default:
        rb_raise(rb_eArgError,"invalid number of argument: %d for 2..4",argc);
    }
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}

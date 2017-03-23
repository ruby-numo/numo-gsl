static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    size_t   x, y;
    double   z;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x,y,z,w" : "w,x,y,z" %>

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,size_t,x);
        GET_DATA_STRIDE(p2,s2,size_t,y);
        GET_DATA_STRIDE(p3,s3,double,z);
        <%=func_name%>(<%=c_args%>);
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[2][1]%>,<%=args[2][1]%>)
  @param  [UInt]      <%=args[1][1]%>
  @param  [UInt]      <%=args[2][1]%>
  @param  [DFloat]    <%=args[3][1]%>
  @return [DFloat]    self

  <%= description %>
*/
static VALUE
<%=c_func(3)%>(VALUE self, VALUE v1, VALUE v2, VALUE v3)
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[3] = {{cSZ,0},{cSZ,0},{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 3,0, ain,0};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    na_ndloop3(&ndf, w, 3, v1, v2, v3);
    return self;
}

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    size_t   x, y;
    double   z;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x,y,w" : "w,x,y" %>

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,size_t,x);
        GET_DATA_STRIDE(p2,s2,size_t,y);
        z = <%=func_name%>(<%=c_args%>);
        SET_DATA_STRIDE(p3,s3,double,z);
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>,<%=args[2][1]%>)
  @param  [UInt]      <%=args[1][1]%>
  @param  [UInt]      <%=args[2][1]%>
  @return [DFloat]    result

  <%= description %>
*/
static VALUE
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[2] = {{cSZ,0},{cSZ,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 2,1, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 2, v1, v2);
}

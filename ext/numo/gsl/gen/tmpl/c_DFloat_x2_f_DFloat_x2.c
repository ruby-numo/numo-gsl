static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2, *p3, *p4;
    ssize_t  s1, s2, s3, s4;
    double   x1, x2, y3, y4;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x1,x2,&y3,&y4,w" : "w,x1,x2,&y3,&y4" %>

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);
    INIT_PTR(lp, 3, p4, s4);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x1);
        GET_DATA_STRIDE(p2,s2,double,x2);
        <%=func_name%>(<%=c_args%>);
        SET_DATA_STRIDE(p3,s3,double,y3);
        SET_DATA_STRIDE(p4,s4,double,y4);
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]   <%=args[1][1]%>
  @param  [DFloat]   <%=args[2][1]%>
  @return [Array]    array of [[DFloat] <%=args[3][1]%>, [DFloat] <%=args[4][1]%>]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[2] = {{cDF,0},{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,0},{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 2,2, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 2, v1, v2);
}

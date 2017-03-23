static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    double   x, y;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x,w" : "w,x" %>

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);

    for (; i--; ) {
        GET_DATA_STRIDE(p1,s1,double,x);
        y = <%=func_name%>(<%=c_args%>);
        SET_DATA_STRIDE(p2,s2,double,y);
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]    <%=args[1][1]%>
  @return [DFloat]    result

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE v1)
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,1, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 1, v1);
}

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    double   x1, x2, x3;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x1,x2,x3,w" : "w,x1,x2,x3" %>

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (i=0; i<n; i++) {
        GET_DATA_STRIDE(p1,s1,double,x1);
        GET_DATA_STRIDE(p2,s2,double,x2);
        GET_DATA_STRIDE(p3,s3,double,x3);
        <%=func_name%>(<%=c_args%>);
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [DFloat]   <%=args[1][1]%>
  @param  [DFloat]   <%=args[2][1]%>
  @param  [DFloat]   <%=args[3][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2, VALUE v3)<% set n_arg:3 %>
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[3] = {{numo_cDFloat,0},{numo_cDFloat,0},{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP, 3,0, ain,0};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    na_ndloop3(&ndf, w, 3, v1, v2, v3);
    return self;
}

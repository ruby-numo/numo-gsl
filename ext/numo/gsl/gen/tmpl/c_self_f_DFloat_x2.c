static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    size_t  *idx1, *idx2;
    double   x, y;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x,y,w" : "w,x,y" %>

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);
    INIT_PTR_IDX(lp, 1, p2, s2, idx2);

    if (idx1) {
        if (idx2) {
            for (i=0; i<n; i++) {
                GET_DATA_INDEX(p1,idx1,double,x);
                GET_DATA_INDEX(p2,idx2,double,y);
                gsl_<%=c_func%>(<%=c_args%>);
            }
        } else {
            for (i=0; i<n; i++) {
                GET_DATA_INDEX(p1,idx1,double,x);
                GET_DATA_STRIDE(p2,s2,double,y);
                gsl_<%=c_func%>(<%=c_args%>);
            }
        }
    } else {
        if (idx2) {
            for (i=0; i<n; i++) {
                GET_DATA_INDEX(p1,idx1,double,x);
                GET_DATA_STRIDE(p2,s2,double,y);
                gsl_<%=c_func%>(<%=c_args%>);
            }
        } else {
            for (i=0; i<n; i++) {
                GET_DATA_STRIDE(p1,s1,double,x);
                GET_DATA_STRIDE(p2,s2,double,y);
                gsl_<%=c_func%>(<%=c_args%>);
            }
        }
    }
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)
  @param  [DFloat]   <%=args[1][1]%>
  @param  [DFloat]   <%=args[2][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[2] = {{numo_cDFloat,0},{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, FULL_LOOP, 2,0, ain,0};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    na_ndloop3(&ndf, w, 2, v1, v2);
    return self;
}

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    size_t  *idx1, *idx2;
    double   x, y;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);
    <% c_args = get(:postpose) ? "x,w" : "w,x" %>

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);
    INIT_PTR_IDX(lp, 1, p2, s2, idx2);

    if (idx1) {
        if (idx2) {
            for (i=0; i<n; i++) {
                GET_DATA_INDEX(p1,idx1,double,x);
                y = gsl_<%=c_func%>(<%=c_args%>);
                SET_DATA_INDEX(p2,idx2,double,y);
            }
        } else {
                GET_DATA_INDEX(p1,idx1,double,x);
                y = gsl_<%=c_func%>(<%=c_args%>);
                SET_DATA_STRIDE(p2,s2,double,y);
        }
    } else {
        if (idx2) {
                GET_DATA_STRIDE(p1,s1,double,x);
                y = gsl_<%=c_func%>(<%=c_args%>);
                SET_DATA_INDEX(p2,idx2,double,y);
        } else {
            for (i=0; i<n; i++) {
                GET_DATA_STRIDE(p1,s1,double,x);
                y = gsl_<%=c_func%>(<%=c_args%>);
                SET_DATA_STRIDE(p2,s2,double,y);
            }
        }
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [DFloat]   <%=args[1][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[1] = {{numo_cDFloat,0}};
    ndfunc_arg_out_t aout[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, FULL_LOOP, 1,1, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 1, v1);
}

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    ssize_t  x1, x2;
    size_t   y1, y2;
    double   y3;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    for (i=0; i<n; i++) {
        GET_DATA_STRIDE(p1,s1,ssize_t,x1);
        GET_DATA_STRIDE(p2,s2,ssize_t,x2);
        if (x1 < 0) {
            y1 = x1 + w->nx;
        } else {
            y1 = x1;
        }
        if (x2 < 0) {
            y2 = x2 + w->ny;
        } else {
            y2 = x2;
        }
        y3 = <%=func_name%>(<%=get(:postpose) ? "y1,y2,w" : "w,y1,y2"%>);
        SET_DATA_STRIDE(p3,s3,double,y3);
    }
}

/*
  @overload <%=name%>(<%=args[1][1]%>, <%=args[2][1]%>)
  @param  [Int32/64]  <%=args[1][1]%>
  @param  [Int32/64]  <%=args[2][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func(2)%>(VALUE self, VALUE v1, VALUE v2)
{
    <%=struct%> *w;
    ndfunc_arg_in_t ain[2] = {{cSSZ,0},{cSSZ,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 2,1, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 2, v1, v2);
}

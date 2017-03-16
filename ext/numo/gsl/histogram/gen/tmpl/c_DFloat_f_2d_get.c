<% c_args = get(:postpose) ? "y1,y2,w" : "w,y1,y2" %>
#define FUNC(w, x1,y1, x2,y2, y3)               \
      {                                         \
        if (x1 < 0) {                           \
            y1 = x1 + w->nx;                    \
        } else {                                \
            y1 = x1;                            \
        }                                       \
        if (x2 < 0) {                           \
            y2 = x2 + w->ny;                    \
        } else {                                \
            y2 = x2;                            \
        }                                       \
        y3 = <%=func_name%>(<%=c_args%>);      \
    }

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    size_t  *idx1, *idx2;
    ssize_t  x1, x2;
    size_t   y1, y2;
    double   y3;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);
    INIT_PTR_IDX(lp, 1, p2, s2, idx2);
    INIT_PTR    (lp, 2, p3, s3);

    if (idx1) {
        if (idx2) {
            for (i=0; i<n; i++) {
                GET_DATA_INDEX(p1,idx1,ssize_t,x1);
                GET_DATA_INDEX(p2,idx2,ssize_t,x2);
                FUNC(w,x1,y1,x2,y2,y3);
                SET_DATA_STRIDE(p3,s3,double,y3);
            }
        } else {
                GET_DATA_INDEX(p1,idx1,ssize_t,x1);
                GET_DATA_STRIDE(p2,s2,ssize_t,x2);
                FUNC(w,x1,y1,x2,y2,y3);
                SET_DATA_STRIDE(p3,s3,double,y3);
        }
    } else {
        if (idx2) {
                GET_DATA_STRIDE(p1,s1,ssize_t,x1);
                GET_DATA_INDEX(p2,idx2,ssize_t,x2);
                FUNC(w,x1,y1,x2,y2,y3);
                SET_DATA_STRIDE(p3,s3,double,y3);
        } else {
            for (i=0; i<n; i++) {
                GET_DATA_STRIDE(p1,s1,ssize_t,x1);
                GET_DATA_STRIDE(p2,s2,ssize_t,x2);
                FUNC(w,x1,y1,x2,y2,y3);
                SET_DATA_STRIDE(p3,s3,double,y3);
            }
        }
    }
}
#undef FUNC

/*
  @overload <%=name%>(<%=args[1][1]%>, <%=args[2][1]%>)
  @param  [Int32/64]  <%=args[1][1]%>
  @param  [Int32/64]  <%=args[2][1]%>
  @return [<%=class_name%>]  self

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1, VALUE v2)<% set n_arg:2 %>
{
    <%=struct%> *w;
#if SIZEOF_SIZE_T == 4
    ndfunc_arg_in_t ain[2] = {{numo_cInt32,0},{numo_cInt32,0}};
#elif SIZEOF_SIZE_T == 8
    ndfunc_arg_in_t ain[2] = {{numo_cInt64,0},{numo_cInt64,0}};
#endif
    ndfunc_arg_out_t aout[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, FULL_LOOP, 2,1, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 2, v1, v2);
}

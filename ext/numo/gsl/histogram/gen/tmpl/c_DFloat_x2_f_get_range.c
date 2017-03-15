<%
c_args = get(:postpose) ? "y1,&y2,&y3,w" : "w,y1,&y2,&y3"
n = case name
    when /_xrange/; "nx"
    when /_yrange/; "ny"
    when /_range/;  "n"
    end
%>
#define FUNC(w, x1,y1, y2,y3)                   \
      {                                         \
          if (x1 < 0) {                         \
              y1 = x1 + w-><%=n%>;              \
          } else {                              \
              y1 = x1;                          \
          }                                     \
          gsl_<%=c_func%>(<%=c_args%>);         \
      }

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1, *p2, *p3;
    ssize_t  s1, s2, s3;
    size_t  *idx1;
    ssize_t  x1;
    size_t   y1;
    double   y2, y3;
    <%=struct%> *w = (<%=struct%>*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);
    INIT_PTR(lp, 1, p2, s2);
    INIT_PTR(lp, 2, p3, s3);

    if (idx1) {
        for (i=0; i<n; i++) {
            GET_DATA_INDEX(p1,idx1,ssize_t,x1);
            FUNC(w,x1,y1,y2,y3);
            SET_DATA_STRIDE(p2,s2,double,y2);
            SET_DATA_STRIDE(p3,s3,double,y3);
        }
    } else {
        for (i=0; i<n; i++) {
            GET_DATA_STRIDE(p1,s1,ssize_t,x1);
            FUNC(w,x1,y1,y2,y3);
            SET_DATA_STRIDE(p2,s2,double,y2);
            SET_DATA_STRIDE(p3,s3,double,y3);
        }
    }
}
#undef FUNC

/*
  @overload <%=name%>(<%=args[1][1]%>)
  @param  [Int32/64]  <%=args[1][1]%>  Int32/64 NArray
  @return [Array]     array of [[DFloat] <%=args[2][1]%>, [DFloat] <%=args[3][1]%>]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v1)<% set n_arg:1 %>
{
    <%=struct%> *w;
#if SIZEOF_SIZE_T == 4
    ndfunc_arg_in_t ain[1] = {{numo_cInt32,0}};
#elif SIZEOF_SIZE_T == 8
    ndfunc_arg_in_t ain[1] = {{numo_cInt64,0}};
#endif
    ndfunc_arg_out_t aout[2] = {{numo_cDFloat,0},{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, FULL_LOOP, 1,2, ain,aout};

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    return na_ndloop3(&ndf, w, 1, v1);
}

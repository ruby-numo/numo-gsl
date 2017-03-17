static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    int c0;
    int c1;
    double c2;
    double *c3;
    int c4;
    void **opt = (void**)(lp->opt_ptr);

    c0 = *(int*)(opt[0]); //<%=args[0][1]%>
    c1 = *(int*)(opt[1]); //<%=args[1][1]%>
    c2 = *(double*)GET_PTR(lp,0); //<%=args[2][1]%>
    c3 = (double*)GET_PTR(lp,1); //<%=args[3][1]%>
    c4 = <%=func_name%>(c0,c1,c2,c3);
    *(int*)GET_PTR(lp,2) = c4; //return
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)

  @param [Integer] <%=args[0][1]%>
  @param [Integer] <%=args[1][1]%>
  @param [Numo::DFloat] <%=args[2][1]%>
  @return [[Numo::DFloat, Numo::Int32]]  array of [<%=args[3][1]%>, return]

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE mod, VALUE v0, VALUE v1, VALUE v2)<% set n_arg:3 %>
{
    int c0;
    int c1;
    size_t shape[1];
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,1,shape},{cI,0}};
    ndfunc_t ndf = {iter_<%=c_func%>,NO_LOOP|NDF_INPLACE|NDF_EXTRACT,1,2,ain,aout};
    void *opt[2];

    c0 = NUM2INT(v0);
    c1 = NUM2INT(v1);
    opt[0] = &c0; //nmin
    opt[1] = &c1; //nmax
    if (c0<0 || c1<0 || c0>c1) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = c1-c0+1;
    return na_ndloop3(&ndf,opt,1,v2);
}

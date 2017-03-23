static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    int c0;
    double c1;
    double *c2;
    int c3;
    void **opt = (void**)(lp->opt_ptr);

    c0 = *(int*)(opt[0]); //<%=args[0][1]%>
    c1 = *(double*)GET_PTR(lp,0); //<%=args[1][1]%>
    c2 = (double*)GET_PTR(lp,1); //<%=args[2][1]%>
    c3 = <%=func_name%>(c0,c1,c2);
    *(int*)GET_PTR(lp,2) = c3; //return
}

/*
  @overload <%=name%>(<%=args.map{|a| a[1]}.join(",")%>)

  @param [Integer] <%=args[0][1]%>
  @param [Numo::DFloat] <%=args[1][1]%>
  @return [[Numo::DFloat, Numo::Int32]]  array of [<%=args[2][1]%>, return]

  <%= description %>
*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v0, VALUE v1)
{
    int c0;
    size_t shape[1];
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[2] = {{cDF,1,shape},{cI,0}};
    ndfunc_t ndf = {iter_<%=c_func%>,STRIDE_LOOP|NDF_EXTRACT,1,2,ain,aout};

    c0 = NUM2INT(v0);
    if (c0 < 0) {
        rb_raise(rb_eArgError,"should be lmax>=0");
    }
    shape[0] = c0 + 1;
    return na_ndloop3(&ndf,&c0,1,v1);
}

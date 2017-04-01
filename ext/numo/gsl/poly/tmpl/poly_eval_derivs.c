static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t lenc, lenres;
    double *c;
    double x;
    double *r;

    assert(lp->args[0].ndim == 1);
    assert(lp->args[2].ndim == 1);
    lenc   = lp->args[0].shape[0];
    lenres = lp->args[2].shape[0];
    c = (double*)GET_PTR(lp,0);
    x = *(double*)GET_PTR(lp,1);
    r = (double*)GET_PTR(lp,2);
    <%=func_name%>(c,lenc,x,r,lenres);
}

/*
  @overload <%=name%>(c,x,lenres)

  @param [Numo::DFloat] c
  @param [Numo::DFloat] x
  @param [Integer]      lenres
  @return [Numo::DFloat]

  <%= description %>

*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE v0, VALUE v1, VALUE v2)
{
    size_t shape[1];
    ndfunc_arg_in_t ain[2] = {{cDF,1},{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,1,shape}};
    ndfunc_t ndf = {iter_<%=c_func%>,NO_LOOP|NDF_INPLACE|NDF_EXTRACT,2,1,ain,aout};

    shape[0] = NUM2SIZET(v2);
    return na_ndloop(&ndf,2,v0,v1);
}

static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    size_t   i;
    char    *p1, *p2;
    ssize_t  s1, s2;
    double   x, y;
    gsl_mode_t c1;

    INIT_COUNTER(lp, i);
    INIT_PTR(lp, 0, p1, s1);
    INIT_PTR(lp, 1, p2, s2);

    c1 = *(gsl_mode_t*)(lp->opt_ptr);

    for (; i--;) {
        GET_DATA_STRIDE(p1,s1,double,x);
        y = <%=func_name%>(x, c1);
        SET_DATA_STRIDE(p2,s2,double,y);
    }
}

/*
  @overload <%=name%>(<%=args[0][1]%>[,<%=args[1][1]%>])
  @param  [DFloat]   <%=args[0][1]%>
  @param  [Integer]  <%=args[1][1]%> The following precision levels are available: Numo::GSL::PREC_DOUBLE, Numo::GSL::PREC_SINGLE, Numo::GSL::PREC_APPROX.
  @return [DFloat]   result

  <%= description %>
*/
static VALUE
<%=c_func(-1)%>(int argc, VALUE *v, VALUE mod)
{
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,0}};
    ndfunc_t ndf = {iter_<%=c_func%>, STRIDE_LOOP|NDF_EXTRACT, 1,1, ain,aout};
    gsl_mode_t c1;

    if (argc==1) {
        c1 = GSL_MODE_DEFAULT;
    } else if (argc==2) {
        c1 = NUM2INT(v[1]);
    } else {
        rb_raise(rb_eArgError,"invalid number of argument: %d for 1..2",argc);
    }
    return na_ndloop3(&ndf, &c1, 1, v[0]);
}

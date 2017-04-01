static inline int is_complex_nary(VALUE v)
{
    VALUE c = CLASS_OF(v);
    if (c == numo_cDComplex || c == numo_cSComplex || c == rb_cComplex)
        return 1;
    else
        return 0;
}
<%
dbl="double"
cmp="gsl_complex"
cDF="cDF"
cDC="cDC"
[
 [dbl,dbl,dbl,cDF,cDF,cDF,"ff","gsl_poly_eval"],
 [dbl,cmp,cmp,cDF,cDC,cDC,"fc","gsl_poly_complex_eval"],
 [cmp,cmp,cmp,cDC,cDC,cDC,"cc","gsl_complex_poly_complex_eval"],
 ].each do |tp0,tp1,tp2,cv0,cv1,cv2,fn,gfn|
%>
static void
iter_<%=fn%>(na_loop_t *const lp)
{
    size_t n;
    <%=tp0%> *c;
    <%=tp1%> x;
    <%=tp2%> y;

    assert(lp->args[0].ndim == 1);
    n = lp->args[0].shape[0];
    c = (<%=tp0%>*)GET_PTR(lp,0);
    x = *(<%=tp1%>*)GET_PTR(lp,1);
    y = <%=gfn%>(c,n,x);
    *(<%=tp2%>*)GET_PTR(lp,2) = y;
}

static VALUE
poly_eval_<%=fn%>(VALUE v0, VALUE v1)
{
    ndfunc_arg_in_t ain[2] = {{<%=cv0%>,1},{<%=cv1%>,0}};
    ndfunc_arg_out_t aout[1] = {{<%=cv2%>,0}};
    ndfunc_t ndf = {iter_<%=fn%>,NO_LOOP|NDF_INPLACE|NDF_EXTRACT,2,1,ain,aout};
    return na_ndloop(&ndf,2,v0,v1);
}
<% end %>

/*
  @overload <%=name%>(c,x)

  @param [Numo::DFloat or DComplex] c
  @param [Numo::DFloat or DComplex] x
  @return [Numo::DFloat or DComplex]

  This function calls gsl_poly_eval or gsl_poly_complex_eval
  or gsl_complex_poly_complex_eval according to
  whether argument is complex or not.

  <%= description %>

*/
static VALUE
<%=c_func(2)%>(VALUE mod, VALUE v0, VALUE v1)
{
    if (is_complex_nary(v0)) {
        return poly_eval_cc(v0,v1);
    } else if (is_complex_nary(v1)) {
        return poly_eval_fc(v0,v1);
    } else {
        return poly_eval_ff(v0,v1);
    }
}

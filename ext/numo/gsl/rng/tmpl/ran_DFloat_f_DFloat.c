/*
  @overload <%=name%>(<%=args[2][1]%>)
  @param  [DFloat]  <%=args[2][1]%>
  @return [DFloat]  <%=args[3][1]%>

<%= desc %>

 */
static VALUE
<%=c_func(1)%>(VALUE self, VALUE valpha)
{
    VALUE   vtheta;
    double *alpha, *theta;
    narray_t *na;
    gsl_rng *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    valpha = cast_1d_contiguous(valpha, cDF);
    GetNArray(valpha,na);
    vtheta = rb_narray_new(cDF,na->ndim,na->shape);
    theta = (double*)na_get_pointer_for_write(vtheta);
    alpha = (double*)na_get_pointer_for_read(valpha);

    <%=func_name%>(r, na->size, alpha, theta);
    RB_GC_GUARD(valpha);
    return vtheta;
}

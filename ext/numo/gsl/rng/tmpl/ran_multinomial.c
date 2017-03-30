/*
  @overload <%=name%>(<%=args[2][1]%>, <%=args[3][1]%>)
  @param  [Integer] <%=args[2][1]%>
  @param  [DFloat]  <%=args[3][1]%>
  @return [UInt]    <%=args[4][1]%>

<%= desc %>

 */
static VALUE
<%=c_func(1)%>(VALUE self, VALUE vN, VALUE vp)
{
    VALUE vn;
    double *p;
    unsigned int *n;
    unsigned int  N;
    narray_t *na;
    gsl_rng *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    N = NUM2UINT(vN);
    vp = cast_1d_contiguous(vp, cDF);
    GetNArray(vp,na);
    p = (double*)na_get_pointer_for_read(vp);
    vn = rb_narray_new(cUInt,na->ndim,na->shape);
    n = (unsigned int*)na_get_pointer_for_write(vn);

    <%=func_name%>(r, na->size, N, p, n);
    RB_GC_GUARD(vp);
    return vn;
}

<%
set singleton: true
%>
/*
  @overload <%=name%>(a, b, tol, x)
  @param  [Numo::GSL::SpMatrix] a (sparse matrix)
  @param  [Numo::DFloat]        b (vector)
  @param  [Float]               tol
  @param  [Numo::DFloat]        x (vector)
  @return [Integer]             returns GSL::CONTINUE=-2 to signal that more iterations are required.

  <%= description %>
*/
static VALUE
<%=c_func(4)%>(VALUE self, VALUE vA, VALUE vb, VALUE vtol, VALUE vx)
{
    gsl_spmatrix *A;
    gsl_vector *b, *x;
    double tol;
    gsl_splinalg_itersolve *w;
    narray_t *na;
    int status;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    TypedData_Get_Struct(vA, <%=sm_struct%>, &<%=sm_data_type_var%>, A);

    vb = cast_1d_contiguous(vb, cDF);
    ALLOCA_GSLVECTOR_FROM_NARRAY(vb, b);
    tol = NUM2DBL(vtol);

    if (CLASS_OF(vx) != cDF) {
        rb_raise(rb_eTypeError, "x should be Numo::DFloat");
    }
    GetNArray(vx,na);
    if (NA_NDIM(na) != 1) {
        rb_raise(nary_eShapeError, "x should be 1-dimensional array");
    }
    if (!RTEST(na_check_contiguous(vx))) {
        rb_raise(nary_eOperationError, "x should be contiguous array");
    }
    ALLOCA_GSLVECTOR_FROM_NARRAY(vx, x);

    status = <%=func_name%>(A, b, tol, x, w);
    RB_GC_GUARD(vb);
    return INT2FIX(status);
}

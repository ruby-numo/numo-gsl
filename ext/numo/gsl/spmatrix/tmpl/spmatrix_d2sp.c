<%
set singleton: true
%>
/*
  @overload <%=name%>(nary)
  @param  [Numo::DFloat]          nary
  @return [<%=full_class_name%>]  result

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE klass, VALUE nary)
{
    <%=struct%> *s;
    gsl_matrix *m;
    narray_t *na;

    nary = cast_2d_contiguous(nary,cDF);
    GetNArray(nary,na);

    ALLOCA_GSL_MATRIX_FROM_NARRAY_R(nary,m);
    s = gsl_spmatrix_alloc(na->shape[0], na->shape[1]);

    <%=func_name%>(s, m);

    RB_GC_GUARD(nary);
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)s);
}

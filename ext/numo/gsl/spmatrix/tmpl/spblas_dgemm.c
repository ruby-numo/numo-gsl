<%
set singleton: true
%>
/*
  @overload <%=name%>(alpha, a, b)
  @param  [Float]               alpha
  @param  [Numo::GSL::SpMatrix] a (sparse matrix)
  @param  [Numo::GSL::SpMatrix] b (sparse matrix)
  @return [Numo::DFloat]        result C = A B

  <%= description %>
*/
static VALUE
<%=c_func(3)%>(VALUE mod, VALUE valpha, VALUE va, VALUE vb)
{
    // C = A B
    double alpha;
    gsl_spmatrix *A;
    gsl_spmatrix *B;
    gsl_spmatrix *C;
    VALUE vc;

    alpha = NUM2DBL(valpha);
    TypedData_Get_Struct(va, <%=struct%>, &<%=data_type_var%>, A);
    TypedData_Get_Struct(vb, <%=struct%>, &<%=data_type_var%>, B);

    C = gsl_spmatrix_alloc_nzmax(A->size1,B->size2,A->nzmax+B->nzmax,A->sptype);
    vc = TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, C);

    <%=func_name%>(alpha, A, B, C);

    RB_GC_GUARD(va);
    RB_GC_GUARD(vb);
    return vc;
}

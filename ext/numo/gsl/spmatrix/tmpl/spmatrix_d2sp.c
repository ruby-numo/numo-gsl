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

    m = ALLOCA_N(gsl_matrix,1);
    m->data  = (double*)na_get_pointer_for_read(nary);
    m->size1 = na->shape[0];
    m->size2 = na->shape[1];
    m->tda   = na->shape[1];
    m->block = 0;
    m->owner = 0;

    s = gsl_spmatrix_alloc(na->shape[0], na->shape[1]);

    <%=func_name%>(s, m);

    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)s);
}

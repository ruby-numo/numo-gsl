/*
  @overload <%=name%>
  @return [DFloat]  result

  <%= description %>
*/
static VALUE
<%=c_func(0)%>(VALUE self)
{
    <%=struct%> *s;
    gsl_matrix *m;
    size_t shape[2];
    VALUE result;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, s);

    shape[0] = s->size1;
    shape[1] = s->size2;
    result = rb_narray_new(cDF, 2, shape);

    ALLOCA_GSL_MATRIX_FROM_NARRAY_W(result,m);

    <%=func_name%>(m,s);
    return result;
}

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

    m = ALLOCA_N(gsl_matrix,1);
    m->data  = (double*)na_get_pointer_for_write(result);
    m->size1 = shape[0];
    m->size2 = shape[1];
    m->tda   = shape[1];
    m->block = 0;
    m->owner = 0;

    <%=func_name%>(m,s);
    return result;
}

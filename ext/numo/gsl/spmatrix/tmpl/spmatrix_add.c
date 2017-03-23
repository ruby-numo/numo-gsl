/*
  @overload <%=name%>(other)
  @param  [<%=full_class_name%>]  other
  @return [<%=full_class_name%>]  result = self + other

  <%= description %>
*/
static VALUE
<%=c_func(1)%>(VALUE self, VALUE other)
{
    <%=struct%> *a, *b, *c;
    VALUE result;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, a);
    TypedData_Get_Struct(other, <%=struct%>, &<%=data_type_var%>, b);

    if (b->size1 != a->size1 || b->size2 != a->size2) {
        rb_raise(nary_eShapeError, "matrices must have same dimensions");
    }
    if (a->sptype != b->sptype || a->sptype != a->sptype) {
        rb_raise(nary_eOperationError, "matrices must have same sparse storage format");
    }

    c = gsl_spmatrix_alloc_nzmax(a->size1, a->size2, a->nzmax+b->nzmax, a->sptype);
    result = TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)c);

    <%=func_name%>(c,a,b);
    return result;
}

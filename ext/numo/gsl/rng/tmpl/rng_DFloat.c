/*
  @overload <%=name%>([shape])
  @param  [Array or Integer]  shape (optional) shape for result NArray
  @return [Float or DFloat]  returns random number

  <%= desc %>
*/
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    VALUE vshape, vna;
    size_t i, size;
    double *ptr;
    <%=struct%> *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    if (rb_scan_args(argc, argv, "01", &vshape) == 0) {
        return rb_float_new(<%=func_name%>(r));
    } else {
        vna = create_new_narray(cDF,vshape);
        ptr = (double*)na_get_pointer_for_write(vna);
        size = RNARRAY_SIZE(vna);
        for (i=0; i<size; i++) {
            ptr[i] = <%=func_name%>(r);
        }
        return vna;
    }
}

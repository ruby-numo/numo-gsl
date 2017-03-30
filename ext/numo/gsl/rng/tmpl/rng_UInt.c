/*
  @overload <%=name%>(n,[shape])
  @param  [Integer]  n
  @param  [Array or Integer]  shape (optional) shape for result NArray
  @return [Integer or UInt32/UInt64]  returns random number

  <%= desc %>
*/
static VALUE
<%=c_func(-1)%>(int argc, VALUE *argv, VALUE self)
{
    VALUE vshape, vna, vn;
    size_t i, size;
    int nargs;
    unsigned long n;
    u_int32_t *p32;
    u_int64_t *p64;
    <%=struct%> *r;

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, r);

    nargs = rb_scan_args(argc, argv, "11", &vn, &vshape);
    n = NUM2ULONG(vn);
    if (nargs == 1) {
        return ULONG2NUM(<%=func_name%>(r, n));
    } else {
        if (n > 4294967295ul) {
            vna = create_new_narray(numo_cUInt64,vshape);
            p64 = (u_int64_t*)na_get_pointer_for_write(vna);
            size = RNARRAY_SIZE(vna);
            for (i=0; i<size; i++) {
                p64[i] = (u_int64_t)<%=func_name%>(r, n);
            }
        } else {
            vna = create_new_narray(numo_cUInt32,vshape);
            p32 = (u_int32_t*)na_get_pointer_for_write(vna);
            size = RNARRAY_SIZE(vna);
            for (i=0; i<size; i++) {
                p32[i] = (u_int32_t)<%=func_name%>(r, n);
            }
        }
        return vna;
    }
}

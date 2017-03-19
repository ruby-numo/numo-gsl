static VALUE
cast_1d_contiguous(VALUE v1, VALUE type)
{
    narray_t *na;

    v1 = rb_funcall(type, rb_intern("cast"), 1, v1);
    GetNArray(v1,na);
    if (NA_NDIM(na) != 1) {
        rb_raise(nary_eShapeError, "argument should be 1-dimensional array");
    }
    if (!RTEST(na_check_contiguous(v1))) {
        v1 = na_copy(v1);
    }
    return v1;
}

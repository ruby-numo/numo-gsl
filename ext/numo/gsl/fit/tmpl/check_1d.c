static void
check_1d(VALUE v)
{
    narray_t *na;
    GetNArray(v,na);
    if (NA_NDIM(na) != 1) {
        rb_raise(nary_eShapeError, "argument should be 1-dimensional array");
    }
}

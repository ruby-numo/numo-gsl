static int
power_of_two(size_t n)
{
    size_t k = 1;

    while (1) {
        if (n == k) return 1;
        k *= 2;
        if (n < k || k==0) break;
    }
    rb_raise(nary_eShapeError,"array size is not 2**n");
    return 0;
}

static VALUE
wavelet_array_check(VALUE v1, int nd, size_t *size)
{
    size_t    n1, n2;
    VALUE     tmp;
    narray_t *na;

    GetNArray(v1,na);
    if (na->ndim < nd) {
        rb_raise(nary_eDimensionError,"ndim(=%d) should >= %d", na->ndim, nd);
    }
    switch(nd) {
    case 2:
        n1 = na->shape[na->ndim-2];
        n2 = na->shape[na->ndim-1];
        if (n1 != n2) {
            rb_raise(nary_eShapeError,"not square 2d array");
        }
        power_of_two(n1);
        power_of_two(n2);
        *size = n2;
        break;
    case 1:
        n2 = na->shape[na->ndim-1];
        power_of_two(n2);
        *size = n2;
        break;
    default:
        rb_bug("invalid value for nd");
    }
    if (TEST_INPLACE(v1)) {
        v1 = rb_funcall(cDF, rb_intern("cast"), 1, v1);
        if (!RTEST(na_check_contiguous(v1))) {
            v1 = na_copy(v1);
        }
    } else {
        tmp = rb_narray_new(cDF, na->ndim, na->shape);
        rb_funcall(tmp, rb_intern("store"), 1, v1);
        v1 = tmp;
    }
    return v1;
}

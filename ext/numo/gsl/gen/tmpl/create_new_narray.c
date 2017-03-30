static VALUE
create_new_narray(VALUE datatype, VALUE vshape)
{
    size_t size, *shape;
    int j, ndim;

    switch(TYPE(vshape)) {
    case T_FIXNUM:
    case T_BIGNUM:
        size = NUM2SIZET(vshape);
        ndim = 1;
        shape = &size;
        break;
    case T_ARRAY:
        ndim = RARRAY_LEN(vshape);
        shape = ALLOCA_N(size_t,ndim);
        size = 1;
        for (j=0; j<ndim; j++) {
            shape[j] = NUM2SIZET(RARRAY_AREF(vshape,j));
        }
        break;
    default:
        rb_raise(rb_eArgError,"invalid argument for shape");
    }
    return rb_narray_new(datatype,ndim,shape);
}

#define ALLOCA_GSLVECTOR_FROM_NARRAY(nary,v)                    \
    {                                                           \
        narray_t *na;                                           \
        GetNArray(nary,na);                                     \
        v = ALLOCA_N(gsl_vector,1);                             \
        v->data   = (double*)na_get_pointer_for_read(nary);     \
        v->size   = na->shape[0];                               \
        v->stride = 1;                                          \
        v->block  = 0;                                          \
        v->owner  = 0;                                          \
    }

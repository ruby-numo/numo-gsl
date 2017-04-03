#ifndef NUMO_GSL_H
#define NUMO_GSL_H

#define GET_PTR(lp,i) NDL_PTR(lp,i)
// (((lp)->args[i]).ptr + ((lp)->args[i].iter[0]).pos)

#if SIZEOF_INT == 4
#define cI numo_cInt32
#define cUI numo_cUInt32
#elif SIZEOF_INT==8
#define cI numo_cInt64
#define cUI numo_cUInt64
#endif

#if SIZEOF_SIZE_T == 4
#define cSZ numo_cUInt32
#define cSSZ numo_cInt32
#elif SIZEOF_SIZE_T == 8
#define cSZ numo_cUInt64
#define cSSZ numo_cInt64
#endif

#define cDF numo_cDFloat
#define cDC numo_cDComplex
#define cInt cI
#define cUInt cUI

#define ALLOCA_GSL_VECTOR_FROM_NARRAY(nary,gvec,mode)               \
    {                                                               \
        narray_t *na;                                               \
        GetNArray(nary,na);                                         \
        gvec = ALLOCA_N(gsl_vector,1);                              \
        gvec->data   = (double*)na_get_pointer_for_##mode(nary);    \
        gvec->size   = na->shape[0];                                \
        gvec->stride = 1;                                           \
        gvec->block  = 0;                                           \
        gvec->owner  = 0;                                           \
    }

#define ALLOCA_GSL_MATRIX_FROM_NARRAY(nary,gmat,mode)           \
    {                                                           \
        narray_t *na;                                           \
        GetNArray(nary,na);                                     \
        gmat = ALLOCA_N(gsl_matrix,1);                          \
        gmat->data  = (double*)na_get_pointer_for_##mode(nary); \
        gmat->size1 = na->shape[0];                             \
        gmat->size2 = na->shape[1];                             \
        gmat->tda   = na->shape[1];                             \
        gmat->block = 0;                                        \
        gmat->owner = 0;                                        \
    }

#define ALLOCA_GSL_VECTOR_FROM_NARRAY_R(nary,gvec)      \
    ALLOCA_GSL_VECTOR_FROM_NARRAY(nary,gvec,read)
#define ALLOCA_GSL_MATRIX_FROM_NARRAY_R(nary,gmat)      \
    ALLOCA_GSL_MATRIX_FROM_NARRAY(nary,gmat,read)
#define ALLOCA_GSL_VECTOR_FROM_NARRAY_W(nary,gvec)      \
    ALLOCA_GSL_VECTOR_FROM_NARRAY(nary,gvec,write)
#define ALLOCA_GSL_MATRIX_FROM_NARRAY_W(nary,gmat)      \
    ALLOCA_GSL_MATRIX_FROM_NARRAY(nary,gmat,write)
#define ALLOCA_GSL_VECTOR_FROM_NARRAY_RW(nary,gvec)     \
    ALLOCA_GSL_VECTOR_FROM_NARRAY(nary,gvec,read_write)
#define ALLOCA_GSL_MATRIX_FROM_NARRAY_RW(nary,gmat)     \
    ALLOCA_GSL_MATRIX_FROM_NARRAY(nary,gmat,read_write)

#define ALLOCA_GSL_MATRIX_FROM_LOOPT(lp,i,gmat) \
    {                                           \
        assert((lp)->args[i].ndim == 2);        \
        gmat = ALLOCA_N(gsl_matrix,1);          \
        gmat->data  = (double*)NDL_PTR(lp,i);   \
        gmat->size1 = (lp)->args[i].shape[0];   \
        gmat->size2 = (lp)->args[i].shape[1];   \
        gmat->tda   = gmat->size2;              \
        gmat->block = 0;                        \
        gmat->owner = 0;                        \
    }

#define ALLOCA_GSL_VECTOR_FROM_LOOPT(lp,i,gvec)         \
    {                                                   \
        assert((lp)->args[i].ndim == 1);                \
        gvec = ALLOCA_N(gsl_vector,1);                  \
        gvec->data   = (double*)NDL_PTR(lp,i);          \
        gvec->size   = (lp)->args[i].shape[0];          \
        gvec->stride = NDL_STP(lp,i)/sizeof(double);    \
        gvec->block  = 0;                               \
        gvec->owner  = 0;                               \
    }

#define SET_GSL_MATRIX_FROM_LOOPT(lp,i,gmat)    \
    {                                           \
        assert((lp)->args[i].ndim == 2);        \
        gmat.data  = (double*)NDL_PTR(lp,i);    \
        gmat.size1 = (lp)->args[i].shape[0];    \
        gmat.size2 = (lp)->args[i].shape[1];    \
        gmat.tda   = gmat.size2;                \
        gmat.block = 0;                         \
        gmat.owner = 0;                         \
    }

#define SET_GSL_VECTOR_FROM_LOOPT(lp,i,gvec)            \
    {                                                   \
        assert((lp)->args[i].ndim == 1);                \
        gvec.data   = (double*)NDL_PTR(lp,i);           \
        gvec.size   = (lp)->args[i].shape[0];           \
        gvec.stride = NDL_STP(lp,i)/sizeof(double);     \
        gvec.block  = 0;                                \
        gvec.owner  = 0;                                \
    }

#define CHECK_SAME_SIZE_1D_2NARRAY(x,y)                                 \
    {                                                                   \
        if (x->ndim < 1) {                                              \
            rb_raise(nary_eDimensionError,"1st argument is non array"); \
        }                                                               \
        if (y->ndim < 1) {                                              \
            rb_raise(nary_eDimensionError,"2nd argument is non array"); \
        }                                                               \
        if (x->shape[x->ndim-1] != y->shape[y->ndim-1]) {               \
            rb_raise(nary_eShapeError,                                  \
                     "array sizes along last axis do not match");       \
        }                                                               \
    }

#define CHECK_SAME_SIZE_1D_3NARRAY(x,y,z)                               \
    {                                                                   \
        if (x->ndim < 1) {                                              \
            rb_raise(nary_eDimensionError,"1st argument is non array"); \
        }                                                               \
        if (y->ndim < 1) {                                              \
            rb_raise(nary_eDimensionError,"2nd argument is non array"); \
        }                                                               \
        if (z->ndim < 1) {                                              \
            rb_raise(nary_eDimensionError,"3rd argument is non array"); \
        }                                                               \
        if (x->shape[x->ndim-1] != y->shape[y->ndim-1] ||               \
            x->shape[x->ndim-1] != z->shape[z->ndim-1]) {               \
            rb_raise(nary_eShapeError,                                  \
                     "array sizes along last axis do not match");       \
        }                                                               \
    }

#define MAT_SIZE1(x) ((x)->shape[(x)->ndim-2])
#define MAT_SIZE2(x) ((x)->shape[(x)->ndim-1])
#define VEC_SIZE(x)  ((x)->shape[(x)->ndim-1])
#define CHECK_1D(x) {if ((x)->ndim < 1) {rb_raise(nary_eDimensionError,#x" dimension must be >= 1");}}
#define CHECK_2D(x) {if ((x)->ndim < 2) {rb_raise(nary_eDimensionError,#x" dimension must be >= 2");}}
#define CHECK_SIZE_EQ(x,y,msg) {if ((x)!=(y)) {rb_raise(nary_eShapeError,msg);}}

#endif /* ifndef NUMO_GSL_H */

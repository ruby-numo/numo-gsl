#include <ruby.h>
#include <gsl/gsl_errno.h>

VALUE numo_eGslError;

static void
numo_gsl_err_hdl(const char *reason, const char *file, int line, int gsl_errno)
{
    rb_raise(numo_eGslError,"%s:%d: %s",file,line,reason);
}

void
Init_err(void)
{
    VALUE mNumo, mGSL;

    mNumo = rb_define_module("Numo");
    mGSL = rb_define_module_under(mNumo, "GSL");
    numo_eGslError = rb_define_class_under(mGSL, "GslError", rb_eStandardError);

    gsl_set_error_handler(&numo_gsl_err_hdl);
}

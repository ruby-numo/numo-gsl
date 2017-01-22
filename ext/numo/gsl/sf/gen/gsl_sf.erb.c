/*
  gsl_sf.c
  Numerical Array Extension for Ruby
    (C) Copyright 1999-2007,2013-2016 by Masahiro TANAKA

  This program is free software.
  You can distribute/modify this program
  under the same terms as Ruby itself.
  NO WARRANTY.
*/

#include <ruby.h>
#include "numo/narray.h"
#include "numo/template.h"
#include <gsl/gsl_sf.h>

typedef double dtype;

<%
mod_var "mSf"
m_prefix "gsl_sf_"

load_sf_def "gen/func_def.rb"
%>

#define GET_PTR(lp,i) (((lp)->args[i]).ptr + ((lp)->args[i].iter[0]).pos)
#define cDF numo_cDFloat
#define cSZ numo_cUInt64
#if SIZEOF_INT == 4
#define cI numo_cInt32
#define cUI numo_cUInt32
#elif SIZEOF_INT==8
#define cI numo_cInt64
#define cUI numo_cUInt64
#endif

static VALUE cWorkspace;

static const rb_data_type_t mathieuws_type = {
    "Numo::GSL::SF::MathieuWorkspace",
    {0, (void (*)(void*))gsl_sf_mathieu_free, 0,},
    0, 0,
    RUBY_TYPED_FREE_IMMEDIATELY,
};

static VALUE
sf_mathieu_alloc(VALUE klass)
{
    return TypedData_Wrap_Struct(klass, &mathieuws_type, 0);
}

/*
  Function: gsl_sf_mathieu_workspace * gsl_sf_mathieu_alloc (size_t n, double qmax)

  creates a workspace for the array versions of the Mathieu routines.
  The arguments n and qmax specify the maximum order and q-value of
  Mathieu functions which can be computed with this workspace.
  @overload initialize(n,q)
     @param [Integer] n  Maximum order.
     @param [Float] q  q-value.
*/
static VALUE
sf_mathieu_init(VALUE self, VALUE n, VALUE q)
{
    gsl_sf_mathieu_workspace *w;
    w = gsl_sf_mathieu_alloc(NUM2SIZET(n), NUM2DBL(q));
    if (!w) {
        DATA_PTR(self) = w;
    }
    rb_call_super(0, 0);
    return self;
}


<% Function.codes.each do |x| %>
<%= x %><% end %>

void
Init_sf()
{
    VALUE mNumo, mG, mSf, mL;

    mNumo = rb_const_get(rb_cObject, rb_intern("Numo"));
    mG = rb_define_module_under(mNumo, "GSL");
    mSf = rb_define_module_under(mG, "Sf");

    rb_define_const(mG,"PREC_DOUBLE",INT2FIX(GSL_PREC_DOUBLE));
    rb_define_const(mG,"PREC_SINGLE",INT2FIX(GSL_PREC_SINGLE));
    rb_define_const(mG,"PREC_APPROX",INT2FIX(GSL_PREC_APPROX));

    mL = rb_define_module_under(mSf, "Legendre");
    rb_define_const(mL,"SCHMIDT",INT2FIX(GSL_SF_LEGENDRE_SCHMIDT));
    rb_define_const(mL,"SPHARM",INT2FIX(GSL_SF_LEGENDRE_SPHARM));
    rb_define_const(mL,"FULL",INT2FIX(GSL_SF_LEGENDRE_FULL));
    rb_define_const(mL,"NONE",INT2FIX(GSL_SF_LEGENDRE_NONE));

    cWorkspace = rb_define_class_under(mSf, "MathieuWorkspace", rb_cData);
    rb_define_alloc_func(cWorkspace, sf_mathieu_alloc);
    rb_define_method(cWorkspace, "initialize", sf_mathieu_init, 2);

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>

    <% IdVar.assignment.each do |x| %>
    <%= x %><% end %>
}

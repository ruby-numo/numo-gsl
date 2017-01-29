/*
  gsl_ran.c
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
#include <gsl/gsl_randist.h>

typedef double dtype;

<%
mod_var "mRan"
m_prefix "gsl_ran_"
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

static void
ran_discrete_free(gsl_ran_discrete_t *g)
{
    if (g) {
        if (g->K > 0) {
            gsl_ran_discrete_free(g);
        }
    }
}

/* :nodoc: */
static VALUE
ran_discrete_s_alloc(VALUE klass)
{
    gsl_ran_discrete_t *g;

    g = ALLOC(gsl_ran_discrete_t);
    MEMZERO(g, gsl_ran_discrete_t, 1);
    return Data_Wrap_Struct(klass, 0, ran_discrete_free, g);
}

static VALUE
ran_discrete_init(VALUE self, VALUE v)
{
    narray_t *na;
    double *d;
    gsl_ran_discrete_t *g1, *g2;

    v = rb_funcall(cDF,rb_intern("cast"),1,v);
    GetNArray(v,na);
    d = (double*)na_get_pointer_for_read(v);
    g2 = gsl_ran_discrete_preproc(na->size, d);

    Data_Get_Struct(self, gsl_ran_discrete_t, g1);
    MEMCPY(g1, g2, gsl_ran_discrete_t, 1);
    free(g2);
    return self;
}

static VALUE
ran_discrete_pdf(VALUE self, VALUE k)
{
    gsl_ran_discrete_t *g;

    Data_Get_Struct(self, gsl_ran_discrete_t, g);
    return rb_float_new(gsl_ran_discrete_pdf(NUM2SIZET(k), g));
}

<% Function.codes.each do |x| %>
<%= x %><% end %>

void
Init_ran()
{
    VALUE mNumo, mG, mRan, cDisc;

    mNumo = rb_define_module("Numo");
    mG = rb_define_module_under(mNumo, "GSL");
    mRan = rb_define_module_under(mG, "Ran");

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>

    <% IdVar.assignment.each do |x| %>
    <%= x %><% end %>

    cDisc = rb_define_class_under(mRan, "Discrete", rb_cObject);
    rb_define_alloc_func(cDisc, ran_discrete_s_alloc);
    rb_define_method(cDisc, "initialize", ran_discrete_init, 1);
    rb_define_method(cDisc, "pdf", ran_discrete_pdf, 1);
}

/*
  gsl_sys.c
  Ruby/Numo: Numerical Array Module for Ruby
    (C) Copyright 2013-2016 by Masahiro TANAKA

  This program is free software.
  You can distribute/modify this program
  under the same terms as Ruby itself.
  NO WARRANTY.
*/

#include <ruby.h>
#include "numo/narray.h"
#include <gsl/gsl_sys.h>
#include <gsl/gsl_math.h>
#include <gsl/gsl_pow_int.h>

typedef double dtype;

#define GET_PTR(lp,i) (((lp)->args[i]).ptr + ((lp)->iter[i]).pos)
#define cDF numo_cDFloat
#define cSZ numo_cUInt64
#if SIZEOF_INT == 4
#define cI numo_cInt32
#define cUI numo_cUInt32
#elif SIZEOF_INT==8
#define cI numo_cInt64
#define cUI numo_cUInt64
#endif

<%
mod_var "mG"
m_prefix "gsl_"

load_sys_def "gen/func_def.rb"
load_const_def "gen/const_def.rb"
%>

static VALUE
sf_extract(VALUE v)
{
    long i, n;
    VALUE x, y;
    narray_t *na;

    if (IsNArray(v)){
        GetNArray(v,na);
        if (NA_NDIM(na)==0) {
            return rb_funcall(v, rb_intern("extract"), 0);
        }
    } else if (RTEST(rb_obj_is_kind_of(v, rb_cArray))) {
        n = RARRAY_LEN(v);
        for (i=0; i<n; i++) {
            x = RARRAY_AREF(v,i);
            y = sf_extract(x);
            if (x != y) {
                RARRAY_ASET(v,i,y);
            }
        }
    }
    return v;
}

<% Function.codes.each do |x| %>
<%= x %><% end %>

void
Init_sys()
{
    VALUE mNumo, mG;

    mNumo = rb_const_get(rb_cObject, rb_intern("Numo"));
    mG = rb_define_module_under(mNumo, "GSL");

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>

    <% IdVar.assignment.each do |x| %>
    <%= x %><% end %>
}

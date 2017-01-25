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

<%
mod_var "mG"
m_prefix "gsl_"
%>

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

/*
  gsl_cdf.c
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
#include <gsl/gsl_cdf.h>

typedef double dtype;

<%
mod_var "mCdf"
m_prefix "gsl_cdf_"
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

<% Function.codes.each do |x| %>
<%= x %><% end %>

void
Init_cdf()
{
    VALUE mNumo, mG, mCdf;

    mNumo = rb_define_module("Numo");
    mG = rb_define_module_under(mNumo, "GSL");
    mCdf = rb_define_module_under(mG, "Cdf");

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>

    <% IdVar.assignment.each do |x| %>
    <%= x %><% end %>
}

/*
  gsl_stats.c
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
#include <gsl/gsl_statistics.h>

typedef double dtype;

<%
mod_var "mStats"
m_prefix "gsl_stats_"
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
Init_stats()
{
    VALUE mNumo, mGSL, mStats;

    mNumo = rb_define_module("Numo");
    mGSL = rb_define_module_under(mNumo, "GSL");
    mStats = rb_define_module_under(mGSL, "Stats");

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>

    <% IdVar.assignment.each do |x| %>
    <%= x %><% end %>
}

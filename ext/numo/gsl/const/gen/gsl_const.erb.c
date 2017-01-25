/*
  gsl_const.c
  Ruby/Numo: Numerical Array Module for Ruby
    (C) Copyright 2013-2016 by Masahiro TANAKA

  This program is free software.
  You can distribute/modify this program
  under the same terms as Ruby itself.
  NO WARRANTY.
*/

#include <ruby.h>
#include "numo/narray.h"
#include <gsl/gsl_const.h>

<%
mod_var "mC"
#m_prefix "gsl_"
%>

void
Init_const()
{
    VALUE mNumo, mG, mC;

    mNumo = rb_const_get(rb_cObject, rb_intern("Numo"));
    mG = rb_define_module_under(mNumo, "GSL");
    mC = rb_define_module_under(mG, "Const");

    <% Function.definitions.each do |x| %>
    <%= x %><% end %>
}

/*
  <%= file_name %>
  Ruby/Numo::GSL - GSL wrapper for Ruby/Numo::NArray

  created on: 2017-03-11
  Copyright (C) 2017 Masahiro Tanaka
*/

#include <ruby.h>
#include <assert.h>
#include "numo/narray.h"
#include "numo/template.h"
#include "../numo_gsl.h"
<% include_files.each do |f| %>
#include <<%=f%>>
<% end %>

static VALUE <%=ns_var%>;

<% id_decl.each do |x| %>
<%= x %><% end %>

<% children.each do |c|%>
<%= c.result %>

<% end %>

void
Init_<%=lib_name%>(void)
{
    VALUE mN;
    mN = rb_define_module("Numo");
    <%=ns_var%> = rb_define_module_under(mN, "GSL");

    <% id_assign.each do |x| %>
    <%= x %><% end %>

<% children.each do |c| %>
<%= c.init_def %>
<% end %>
}

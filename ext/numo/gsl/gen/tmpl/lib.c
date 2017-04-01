/*
  <%= file_name %>
  Ruby/Numo::GSL - GSL wrapper for Ruby/Numo::NArray

  created on: 2017-03-11
  Copyright (C) 2017 Masahiro Tanaka
*/

#include <ruby.h>
#include "numo/narray.h"
#include "numo/template.h"
<% include_files.each do |f| %>
#include <<%=f%>>
<% end %>

#define GET_PTR(lp,i) (((lp)->args[i]).ptr + ((lp)->args[i].iter[0]).pos)

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

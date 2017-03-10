/*
  gsl_rstat.c
  Ruby/Numo::GSL - GSL wrapper for Ruby/Numo::NArray
    (C) Copyright 1999-2007,2013-2017 by Masahiro TANAKA

  This program is free software.
  You can distribute/modify this program
  under the same terms as GPL3.
  NO WARRANTY.
*/

#include <ruby.h>
#include "numo/narray.h"
#include "numo/template.h"
#include <gsl/gsl_rstat.h>


/* :nodoc: */
static VALUE
rstat_s_alloc(VALUE klass)
{
    gsl_rstat_workspace *rstat;

    rstat = gsl_rstat_alloc();
    return Data_Wrap_Struct(klass, 0, gsl_rstat_free, rstat);
}


/*
  @overload reset()
*/
static VALUE
rstat_reset(VALUE self)
{
    gsl_rstat_workspace *rstat;

    Data_Get_Struct(self, gsl_rstat_workspace, rstat);
    gsl_rstat_reset(rstat);
    return self;
}

/*
  This function returns the number of data so far added to the accumulator.
  @overload n()
*/
static VALUE
rstat_n(VALUE self)
{
    gsl_rstat_workspace *rstat;
    size_t n;

    Data_Get_Struct(self, gsl_rstat_workspace, rstat);
    n = gsl_rstat_n(rstat);
    return SIZET2NUM(n);
}


static void
iter_rstat_add(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1;
    ssize_t  s1;
    size_t  *idx1;
    double   x;
    gsl_rstat_workspace *w = (gsl_rstat_workspace*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);

    if (idx1) {
        for (i=0; i<n; i++) {
            GET_DATA_INDEX(p1,idx1,double,x);
            gsl_rstat_add(x, w);
        }
    } else {
        for (i=0; i<n; i++) {
            GET_DATA_STRIDE(p1,s1,double,x);
            gsl_rstat_add(x, w);
        }
    }
}

/*
  This function adds the data point x to the statistical accumulator,
  updating calculations of the mean, variance, standard deviation,
  skewness, kurtosis, and median.

  @overload add(data)
  @param  [DFloat]  data  Data array.
*/
static VALUE
rstat_add(VALUE self, VALUE data)
{
    gsl_rstat_workspace *rstat;
    ndfunc_arg_in_t ain[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_rstat_add, STRIDE_LOOP, 1, 0, ain, 0};

    Data_Get_Struct(self, gsl_rstat_workspace, rstat);
    na_ndloop3(&ndf, rstat, 1, data);
    return self;
}


<%
$defs = []

f = eval(open("gen/func_def.rb").read).
    select{|h| h[:func_name] =~ /^gsl_rstat_([a-z]+)$/ &&
               h[:func_type] == "double" &&
               h[:args] == [["gsl_rstat_workspace *", "w"]] }

f.each do |h|
  name = h[:func_name].sub(/^gsl_rstat_/,"")
  $defs << "rb_define_method(cRstat, \"#{name}\", rstat_#{name}, 0);"
%>
/*
  @overload <%= name %>
  @return [Float or DFloat]  returns <%= name %>

<%= h[:desc] %>
 */
static VALUE
rstat_<%=name%>(VALUE self)
{
    gsl_rstat_workspace *r;

    Data_Get_Struct(self, gsl_rstat_workspace, r);
    return DBL2NUM(gsl_rstat_<%=name%>(r));
}
<% end %>



/* --------------------------------------------------------- */


/* :nodoc: */
static VALUE
rquantile_s_alloc(VALUE klass)
{
    gsl_rstat_quantile_workspace *w;

    w = ALLOC(gsl_rstat_quantile_workspace);
    return Data_Wrap_Struct(klass, 0, gsl_rstat_quantile_free, w);
}

static VALUE
rquantile_init(VALUE self, VALUE p)
{
    gsl_rstat_quantile_workspace *w, *v;

    Data_Get_Struct(self, gsl_rstat_quantile_workspace, v);
    w = gsl_rstat_quantile_alloc(NUM2DBL(p));
    MEMCPY(v, w, gsl_rstat_quantile_workspace, 1);
    free(w);
    return self;
}


static void
iter_rquantile_add(na_loop_t *const lp)
{
    size_t   n, i;
    char    *p1;
    ssize_t  s1;
    size_t  *idx1;
    double   x;
    gsl_rstat_quantile_workspace *w = (gsl_rstat_quantile_workspace*)(lp->opt_ptr);

    INIT_COUNTER(lp, n);
    INIT_PTR_IDX(lp, 0, p1, s1, idx1);

    if (idx1) {
        for (i=0; i<n; i++) {
            GET_DATA_INDEX(p1,idx1,double,x);
            gsl_rstat_quantile_add(x, w);
        }
    } else {
        for (i=0; i<n; i++) {
            GET_DATA_STRIDE(p1,s1,double,x);
            gsl_rstat_quantile_add(x, w);
        }
    }
}

/*
  This function adds the data point x to the statistical accumulator,
  updating calculations of the mean, variance, standard deviation,
  skewness, kurtosis, and median.

  @overload add(data)
  @param  [DFloat]  data  Data array.
  @return  self
*/
static VALUE
rquantile_add(VALUE self, VALUE data)
{
    gsl_rstat_quantile_workspace *w;
    ndfunc_arg_in_t ain[1] = {{numo_cDFloat,0}};
    ndfunc_t ndf = {iter_rquantile_add, STRIDE_LOOP, 1, 0, ain, 0};

    Data_Get_Struct(self, gsl_rstat_quantile_workspace, w);
    na_ndloop3(&ndf, w, 1, data);
    return self;
}

/*
  @overload get
  @return [Float]

  This function returns the current estimate of the p-quantile.
 */
static VALUE
rquantile_get(VALUE self)
{
    gsl_rstat_quantile_workspace *r;

    Data_Get_Struct(self, gsl_rstat_quantile_workspace, r);
    return DBL2NUM(gsl_rstat_quantile_get(r));
}



void
Init_rstat()
{
    VALUE mNumo, mGsl, cRstat, cQuantile;

    mNumo = rb_define_module("Numo");
    mGsl = rb_define_module_under(mNumo, "GSL");

/*
   * Document-class: Numo::GSL::Rstat

   Class for computing running statistics,
   also known as online statistics, of data. These routines are
   suitable for handling large datasets for which it may be
   inconvenient or impractical to store in memory all at once. The
   data can be processed in a single pass, one point at a
   time. Each time a data point is added to the accumulator,
   internal parameters are updated in order to compute the current
   mean, variance, standard deviation, skewness, and
   kurtosis. These statistics are exact, and are updated with
   numerically stable single-pass algorithms. The median and
   arbitrary quantiles are also available, however these
   calculations use algorithms which provide approximations, and
   grow more accurate as more data is added to the accumulator.

   See {https://www.gnu.org/software/gsl/manual/html_node/Running-Statistics.html "Running Statistics"}
*/
    cRstat = rb_define_class_under(mGsl, "Rstat", rb_cObject);
/*
   * Document-class: Numo::GSL::Rstat::Quantile

   The functions in this section estimate quantiles dynamically
   without storing the entire dataset, using the algorithm of Jain and
   Chlamtec, 1985. Only five points (markers) are stored which
   represent the minimum and maximum of the data, as well as current
   estimates of the p/2-, p-, and (1+p)/2-quantiles. Each time a new
   data point is added, the marker positions and heights are updated.

   See {https://www.gnu.org/software/gsl/manual/html_node/Running-Statistics-Quantiles.html "Running Statistics Quantiles"}
*/
    cQuantile = rb_define_class_under(cRstat, "Quantile", rb_cObject);

    rb_define_alloc_func(cRstat, rstat_s_alloc);
    rb_define_method(cRstat, "reset", rstat_reset, 0);
    rb_define_method(cRstat, "n", rstat_n, 0);
    rb_define_method(cRstat, "add", rstat_add, 1);
    rb_define_alias(cRstat, "size", "n");
    rb_define_alias(cRstat, "length", "n");

    <% $defs.each do |x| %>
    <%=x%><% end %>

    rb_define_method(cQuantile, "initialize", rquantile_init, 1);
    rb_define_alloc_func(cQuantile, rquantile_s_alloc);
    rb_define_method(cQuantile, "add", rquantile_add, 1);
    rb_define_method(cQuantile, "get", rquantile_get, 0);
}

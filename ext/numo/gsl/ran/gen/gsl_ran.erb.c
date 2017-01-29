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

/*
  This function returns a pointer to a structure that contains the
  lookup table for the discrete random number generator.
  The array P[] contains the probabilities of the discrete events;
  these array elements must all be positive, but they needn’t add up
  to one (so you can think of them more generally as “weights”) —
  the preprocessor will normalize appropriately. This return value is
  used as an argument for the gsl_ran_discrete function below.
 */
static VALUE
ran_discrete_init(VALUE self, VALUE P)
{
    narray_t *na;
    double *d;
    gsl_ran_discrete_t *g1, *g2;

    P = rb_funcall(cDF,rb_intern("cast"),1,P);
    GetNArray(P,na);
    d = (double*)na_get_pointer_for_read(P);
    g2 = gsl_ran_discrete_preproc(na->size, d);

    Data_Get_Struct(self, gsl_ran_discrete_t, g1);
    MEMCPY(g1, g2, gsl_ran_discrete_t, 1);
    free(g2);
    return self;
}

/*
  Returns the probability P[k] of observing the variable k. Since P[k]
  is not stored as part of the lookup table, it must be recomputed;
  this computation takes O(K), so if K is large and you care about the
  original array P[k] used to create the lookup table, then you should
  just keep this original array P[k] around.
 */
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


/*
  General Discrete Distributions

  Given K discrete events with different probabilities P[k], produce a random value k consistent with its probability.

  The obvious way to do this is to preprocess the probability list by generating a cumulative probability array with K+1 elements:

          C[0] = 0
        C[k+1] = C[k]+P[k].

  Note that this construction produces C[K]=1. Now choose a uniform deviate u between 0 and 1, and find the value of k such that C[k] <= u < C[k+1]. Although this in principle requires of order \log K steps per random number generation, they are fast steps, and if you use something like \lfloor uK \rfloor as a starting point, you can often do pretty well.

  But faster methods have been devised. Again, the idea is to preprocess the probability list, and save the result in some form of lookup table; then the individual calls for a random discrete event can go rapidly. An approach invented by G. Marsaglia (Generating discrete random variables in a computer, Comm ACM 6, 37–38 (1963)) is very clever, and readers interested in examples of good algorithm design are directed to this short and well-written paper. Unfortunately, for large K, Marsaglia’s lookup table can be quite large.

  A much better approach is due to Alastair J. Walker (An efficient method for generating discrete random variables with general distributions, ACM Trans on Mathematical Software 3, 253–256 (1977); see also Knuth, v2, 3rd ed, p120–121,139). This requires two lookup tables, one floating point and one integer, but both only of size K. After preprocessing, the random numbers are generated in O(1) time, even for large K. The preprocessing suggested by Walker requires O(K^2) effort, but that is not actually necessary, and the implementation provided here only takes O(K) effort. In general, more preprocessing leads to faster generation of the individual random numbers, but a diminishing return is reached pretty early. Knuth points out that the optimal preprocessing is combinatorially difficult for large K.

  This method can be used to speed up some of the discrete random number generators below, such as the binomial distribution. To use it for something like the Poisson Distribution, a modification would have to be made, since it only takes a finite set of K outcomes.
*/
    cDisc = rb_define_class_under(mRan, "Discrete", rb_cObject);
    rb_define_alloc_func(cDisc, ran_discrete_s_alloc);
    rb_define_method(cDisc, "initialize", ran_discrete_init, 1);
    rb_define_method(cDisc, "pdf", ran_discrete_pdf, 1);
}

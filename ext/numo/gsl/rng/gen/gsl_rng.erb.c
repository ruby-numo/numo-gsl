/*
  gsl_rng.c
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
#include <gsl/gsl_rng.h>

<% RNG_TYPES = "
GSL_VAR const gsl_rng_type *gsl_rng_borosh13;
GSL_VAR const gsl_rng_type *gsl_rng_coveyou;
GSL_VAR const gsl_rng_type *gsl_rng_cmrg;
GSL_VAR const gsl_rng_type *gsl_rng_fishman18;
GSL_VAR const gsl_rng_type *gsl_rng_fishman20;
GSL_VAR const gsl_rng_type *gsl_rng_fishman2x;
GSL_VAR const gsl_rng_type *gsl_rng_gfsr4;
GSL_VAR const gsl_rng_type *gsl_rng_knuthran;
GSL_VAR const gsl_rng_type *gsl_rng_knuthran2;
GSL_VAR const gsl_rng_type *gsl_rng_knuthran2002;
GSL_VAR const gsl_rng_type *gsl_rng_lecuyer21;
GSL_VAR const gsl_rng_type *gsl_rng_minstd;
GSL_VAR const gsl_rng_type *gsl_rng_mrg;
GSL_VAR const gsl_rng_type *gsl_rng_mt19937;
GSL_VAR const gsl_rng_type *gsl_rng_mt19937_1999;
GSL_VAR const gsl_rng_type *gsl_rng_mt19937_1998;
GSL_VAR const gsl_rng_type *gsl_rng_r250;
GSL_VAR const gsl_rng_type *gsl_rng_ran0;
GSL_VAR const gsl_rng_type *gsl_rng_ran1;
GSL_VAR const gsl_rng_type *gsl_rng_ran2;
GSL_VAR const gsl_rng_type *gsl_rng_ran3;
GSL_VAR const gsl_rng_type *gsl_rng_rand;
GSL_VAR const gsl_rng_type *gsl_rng_rand48;
GSL_VAR const gsl_rng_type *gsl_rng_random128_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random128_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random128_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_random256_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random256_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random256_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_random32_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random32_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random32_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_random64_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random64_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random64_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_random8_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random8_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random8_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_random_bsd;
GSL_VAR const gsl_rng_type *gsl_rng_random_glibc2;
GSL_VAR const gsl_rng_type *gsl_rng_random_libc5;
GSL_VAR const gsl_rng_type *gsl_rng_randu;
GSL_VAR const gsl_rng_type *gsl_rng_ranf;
GSL_VAR const gsl_rng_type *gsl_rng_ranlux;
GSL_VAR const gsl_rng_type *gsl_rng_ranlux389;
GSL_VAR const gsl_rng_type *gsl_rng_ranlxd1;
GSL_VAR const gsl_rng_type *gsl_rng_ranlxd2;
GSL_VAR const gsl_rng_type *gsl_rng_ranlxs0;
GSL_VAR const gsl_rng_type *gsl_rng_ranlxs1;
GSL_VAR const gsl_rng_type *gsl_rng_ranlxs2;
GSL_VAR const gsl_rng_type *gsl_rng_ranmar;
GSL_VAR const gsl_rng_type *gsl_rng_slatec;
GSL_VAR const gsl_rng_type *gsl_rng_taus;
GSL_VAR const gsl_rng_type *gsl_rng_taus2;
GSL_VAR const gsl_rng_type *gsl_rng_taus113;
GSL_VAR const gsl_rng_type *gsl_rng_transputer;
GSL_VAR const gsl_rng_type *gsl_rng_tt800;
GSL_VAR const gsl_rng_type *gsl_rng_uni;
GSL_VAR const gsl_rng_type *gsl_rng_uni32;
GSL_VAR const gsl_rng_type *gsl_rng_vax;
GSL_VAR const gsl_rng_type *gsl_rng_waterman14;
GSL_VAR const gsl_rng_type *gsl_rng_zuf;
".split(/$/).map{|x| /gsl_rng_(\w+);/=~x; $1}.compact
def camelize(s)
  s.capitalize.gsub(/_([a-z])/){$1.upcase}
end
%>

/* :nodoc: */
static VALUE
rng_s_alloc(VALUE klass)
{
    gsl_rng *rng;

    rng = gsl_rng_alloc(gsl_rng_default);
    return Data_Wrap_Struct(klass, 0, gsl_rng_free, rng);
}

<% RNG_TYPES.each do |x| %>
/* :nodoc: */
static VALUE
rng_<%=x%>_s_alloc(VALUE klass)
{
    gsl_rng *rng;

    rng = gsl_rng_alloc(gsl_rng_<%=x%>);
    return Data_Wrap_Struct(klass, 0, gsl_rng_free, rng);
}
<% end %>

/*
  Creates a new PRNG using +seed+ to set the initial state.
  If +seed+ is omitted, the generator is initialized with
  Numo::GSL::Rng.default_seed.
  @overload initialize([seed])
*/
static VALUE
rng_init(int argc, VALUE *argv, VALUE self)
{
    gsl_rng *rng;

    if (argc == 1) {
        Data_Get_Struct(self, gsl_rng, rng);
        gsl_rng_set(rng, NUM2ULONG(argv[0]));
    } else if (argc > 1) {
        rb_raise(rb_eArgError,"wrong number of arguments (given %d, expected 1)", argc);
    }
    return self;
}


static VALUE
rng_set(VALUE self, VALUE vseed)
{
    gsl_rng *r;
    unsigned long seed;

    seed = NUM2ULONG(vseed);
    Data_Get_Struct(self, gsl_rng, r);
    gsl_rng_set(r, seed);
    return Qnil;
}

/*
  This function returns a random integer from the generator.
  The minimum and maximum values depend on the algorithm used, but all
  integers in the range [min,max] are equally likely.
  The values of min and max can be determined using the auxiliary
  functions gsl_rng_max (r) and gsl_rng_min (r).

  @overload get
  @return [Integer]  returns random number
*/
static VALUE
rng_get(VALUE self)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return ULONG2NUM(gsl_rng_get(r));
}

/*
  This function returns a double precision floating point number
  uniformly distributed in the range [0,1). The range includes 0.0 but
  excludes 1.0. The value is typically obtained by dividing the result
  of gsl_rng_get(r) by gsl_rng_max(r) + 1.0 in double precision. Some
  generators compute this ratio internally so that they can provide
  floating point numbers with more than 32 bits of randomness (the
  maximum number of bits that can be portably represented in a single
  unsigned long int).

  @overload uniform
  @return [Float]  returns random number
*/
static VALUE
rng_uniform(VALUE self)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return rb_float_new(gsl_rng_uniform(r));
}

/*
  This function returns a positive double precision floating point
  number uniformly distributed in the range (0,1), excluding both 0.0
  and 1.0. The number is obtained by sampling the generator with the
  algorithm of gsl_rng_uniform until a non-zero value is obtained. You
  can use this function if you need to avoid a singularity at 0.0.

  @overload uniform_pos
  @return [Float]  returns random number
 */
static VALUE
rng_uniform_pos(VALUE self)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return rb_float_new(gsl_rng_uniform_pos(r));
}

/*
  This function returns a random integer from 0 to n-1 inclusive by
  scaling down and/or discarding samples from the generator r. All
  integers in the range [0,n-1] are produced with equal
  probability. For generators with a non-zero minimum value an offset
  is applied so that zero is returned with the correct probability.

  Note that this function is designed for sampling from ranges smaller
  than the range of the underlying generator. The parameter n must be
  less than or equal to the range of the generator r. If n is larger
  than the range of the generator then the function calls the error
  handler with an error code of GSL_EINVAL and returns zero.

  In particular, this function is not intended for generating the full
  range of unsigned integer values [0,2^32-1]. Instead choose a
  generator with the maximal integer range and zero minimum value,
  such as gsl_rng_ranlxd1, gsl_rng_mt19937 or gsl_rng_taus, and sample
  it directly using gsl_rng_get. The range of each generator can be
  found using the auxiliary functions described in the next section.

  @overload uniform_int(n)
  @param  [Integer]  n
  @return [Float]  returns random number
 */
static VALUE
rng_uniform_int(VALUE self, VALUE n)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return ULONG2NUM(gsl_rng_uniform_int(r, NUM2ULONG(n)));
}

/*
  This function returns a pointer to the name of the generator.
*/
static VALUE
rng_name(VALUE self)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return rb_str_new2(gsl_rng_name(r));
}

/*
  This function returns the largest value that gsl_rng_get can return.
*/
static VALUE
rng_max(VALUE self, VALUE s)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return ULONG2NUM(gsl_rng_max(r));
}

/*
  This function returns the smallest value that gsl_rng_get can
  return. Usually this value is zero. There are some generators with
  algorithms that cannot return zero, and for these generators the
  minimum value is 1.
*/
static VALUE
rng_min(VALUE self, VALUE s)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return ULONG2NUM(gsl_rng_min(r));
}

/*
  This function return the size of the state of generator.
*/
static VALUE
rng_size(VALUE self, VALUE s)
{
    gsl_rng *r;

    Data_Get_Struct(self, gsl_rng, r);
    return ULONG2NUM(gsl_rng_size(r));
}

static VALUE
rng_clone(VALUE self)
{
    gsl_rng *r, *clone;

    Data_Get_Struct(self, gsl_rng, r);
    clone = gsl_rng_clone(r);
    return Data_Wrap_Struct(CLASS_OF(self), 0, gsl_rng_free, clone);
}


/* Default seed */
static VALUE
rng_s_default_seed(VALUE self)
{
    return ULONG2NUM(gsl_rng_default_seed);
}


void
Init_rng()
{
    VALUE mNumo, mGsl, cRng;

    mNumo = rb_define_module("Numo");
    mGsl = rb_define_module_under(mNumo, "GSL");
    cRng = rb_define_class_under(mGsl, "Rng", rb_cObject);

    gsl_rng_env_setup();

    rb_define_alloc_func(cRng, rng_s_alloc);
    rb_define_method(cRng, "initialize", rng_init, -1);

    rb_define_method(cRng, "set", rng_set, 1);
    rb_define_alias( cRng, "set_seed", "set");
    rb_define_alias( cRng, "seed=", "set");
    rb_define_method(cRng, "get", rng_get, 0);
    rb_define_method(cRng, "uniform", rng_uniform, 0);
    rb_define_method(cRng, "uniform_pos", rng_uniform_pos, 0);
    rb_define_method(cRng, "uniform_int", rng_uniform_int, 1);

    rb_define_method(cRng, "name", rng_name, 0);
    rb_define_method(cRng, "max", rng_max, 0);
    rb_define_method(cRng, "min", rng_min, 0);
    rb_define_method(cRng, "size", rng_size, 0);

    rb_define_method(cRng, "clone", rng_clone, 0);
    rb_define_alias( cRng, "dup", "clone");
    rb_define_singleton_method(cRng, "default_seed", rng_s_default_seed, 0);

    <% RNG_TYPES.each do |x| c = camelize(x)%>{
      VALUE c<%=c%> = rb_define_class_under(cRng, "<%=c%>", cRng);
      rb_define_alloc_func(c<%=c%>, rng_<%=x%>_s_alloc);
    }<% end %>
}

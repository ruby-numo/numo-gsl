require_relative '../extconf_gsl.rb'

# source file to compile
srcs = %w(
 gsl_rng
)
$objs = srcs.collect{|i| i+".o"}

create_makefile('numo/gsl/rng')

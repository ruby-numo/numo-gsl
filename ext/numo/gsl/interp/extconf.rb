require_relative '../extconf_gsl.rb'

# source file to compile
srcs = %w(
 gsl_interp
)
$objs = srcs.collect{|i| i+".o"}

create_makefile('numo/gsl/interp')

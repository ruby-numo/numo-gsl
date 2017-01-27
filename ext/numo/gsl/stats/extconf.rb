require_relative '../extconf_gsl.rb'

# source file to compile
srcs = %w(
 gsl_stats
)
$objs = srcs.collect{|i| i+".o"}

create_makefile('numo/gsl/stats')

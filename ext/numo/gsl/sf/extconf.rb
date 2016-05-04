require 'rbconfig.rb'
require 'numo/narray'

#RbConfig::MAKEFILE_CONFIG["optflags"] = "-g3 -gdwarf-2"

require 'mkmf'

# configure options: --with-gsl-lib=path
#dir_config("gsl")

# check gsl-config command
print "checking for gsl-config... "
begin
  gsl_libs = `gsl-config --libs`
rescue
  puts "no"
  exit 1
end
puts "yes"

# parse GSL libs
libs = []
gsl_libs.split(/\s+/).each do |x|
  case x
  when /^-L(.+)/
    $LIBPATH.push($1)
  when /^-l(.+)/
    libs.unshift($1)
  end
end

# check library
libs.each do |x|
  exit 1 unless have_library(x)
end

#$CFLAGS="-g -O0"

$LOAD_PATH.each do |x|
  if File.exist? File.join(x,'numo/numo/narray.h')
    $INCFLAGS = "-I#{x}/numo " + $INCFLAGS
    break
  end
end

srcs = %w(
gsl_sf
)

$objs = srcs.collect{|i| i+".o"}
fflags = ""

if !have_header('numo/narray.h')
  print "Header numo/narray.h was not found. Give pathname as follows:
  % ruby extconf.rb --with-narray-include=narray_h_dir"
  exit 1
end

create_makefile('numo/gsl/sf')

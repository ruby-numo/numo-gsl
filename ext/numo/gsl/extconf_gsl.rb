require 'rbconfig.rb'
require 'numo/narray'
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

# check narray.h
$LOAD_PATH.each do |x|
  if File.exist? File.join(x,'numo','numo/narray.h')
    $INCFLAGS = "-I#{x}/numo " + $INCFLAGS
    break
  end
end
exit 1 unless have_header('numo/narray.h')

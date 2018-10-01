require 'rbconfig.rb'
require 'numo/narray'
require 'mkmf'
require_relative './mkmf_gsl'

# configure options: --with-gsl-lib=path
#dir_config("gsl")

# check gsl-config command
print "checking for gsl-config... "
gsl_config = nil
begin
  # MinGW fails to invoke shell script command (gsl-config)
  gsl_config = `which gsl-config`.chomp
  raise unless $?.success?
rescue
  puts "no"
  exit 1
end
puts "yes"

# parse GSL libs
libs = []
gsl_libs = `sh -c '#{gsl_config} --libs'`.chomp
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

# GSL include files
gsl_cflags = `sh -c '#{gsl_config} --cflags'`.chomp
$INCFLAGS = [gsl_cflags,$INCFLAGS].join(" ")

# check narray.h
find_narray_h
if !have_header("numo/narray.h")
  puts "Header numo/narray.h was not found. Give pathname as follows:
  % ruby extconf.rb --with-narray-include=narray_h_dir"
  exit(1)
end

# check libnarray.a
if RUBY_PLATFORM =~ /mswin|cygwin|mingw/
  find_libnarray_a
  unless have_library("narray","nary_new")
    puts "libnarray.a not found"
    exit(1)
  end
end

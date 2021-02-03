#!/bin/env ruby
require 'pp'

# One time script to sort the func_def.rb 
# or the func_<version>.rb function definition files

infile = ARGV[0] || raise("need input file name argument")
outfile = infile + '.sort'
funcs = eval(File.read(infile))
raise "expecting array" unless funcs.is_a? Array
funcs.sort! { |a,b| a[:func_name] <=> b[:func_name] }
File.open(outfile, "w") { |fh| PP.pp(funcs,fh); fh.sync }

if File.exist?(outfile)
  File.rename(infile, infile + '.unsort')
  File.rename(outfile, infile)
end

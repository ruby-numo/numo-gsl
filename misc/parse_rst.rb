#!/bin/env ruby

class CfuncProto
  def initialize(rawstr)
    @func_name = nil
    @func_type = nil
    @args = []
    # remove markup before parsing as a c-function-prototype
    str = rawstr.gsub(/:(data|code):`([^`]*)`/,"\\2")
    parse(str)
  end
  
  #example str:
  #  'int gsl_sf_legendre_H3d_1_e (double lambda, double eta, gsl_sf_result * result)'
  def parse(str)
    matcher = str.match(%r/\A (?<fprefix>.*) \s* \( \s* (?<args>.*) \s* \) \s* (?<tail>.*) \s* \z/x)
    raise "bad match `#{str}`" unless matcher
    unless matcher[:tail].empty? || matcher[:tail] == ';'
      raise "unexpected tail `#{matcher[:tail]}` in line #{str}"
    end
    *ftypelist, @func_name = matcher[:fprefix].split
    @func_type = ftypelist.join(' ')
    argstrs = matcher[:args].split(/\s*,\s*/)
    @args = argstrs.map { |a| *pfx, var = a.split ; [pfx.join(' '), var] }
  end
  def to_h
    {func_name: @func_name, func_type: @func_type, args: @args}
  end
end

class RstMacro
  attr_reader :name
  def initialize(mline)
    @name = mline.strip
    @desc = []
  end
  def add_desc(desc)
    @desc << desc.strip
  end
  def get_desc
    str = @desc.join(" ") + ' '
    str.gsub!(/:math:`([^`]*)`/,"\\1")
    str
  end
end
  
class RstFuncGroup
  def initialize(funcline=nil)
    @functions = []
    @desc = []
    add_func(funcline) if funcline
  end
  def add_func(funcline)
    func = funcline.strip
    return nil if func.empty?
    @functions << CfuncProto.new(func)
  end
  def add_desc(desc)
    @desc << desc
  end

  # join and filter the description on the way out
  def get_desc
    str = @desc.reject{|s| s.empty?}.join("\n")
    str.gsub!(/:(data|code|func|math|macro):`([^`]*)`/,"\\2")
    #str.gsub!(/:math:`([^`]*)`/,"$\\1$")
    return str
  end
    
  def to_a
    @functions.map do |func|
      h = func.to_h
      h[:desc] = get_desc
      h # returnval
    end
  end
  
end

class ParseGslRst

  def initialize(fn, debug: false)
    @funcs = []
    @macros = []
    @debug = debug
    parse(fn)
  end

  attr_reader :funcs, :macros, :debug
  alias_method :tables, :macros
  alias_method :deftypefun, :funcs

  def parse(fn)
    lines = File.readlines(fn)
    allfgrps = []
    macros = []
    state = nil
    funcgrp, curmacro = nil, nil
    
    lines.each do |line|
      if line =~ /^\.\. function::\s*$/
        # beginning of a function-group, but without a function on the line
        # in this case, the function intdentation will be 3 chars.
        state = :func3
        funcgrp = RstFuncGroup.new
        allfgrps << funcgrp
        
      elsif line =~ /^\.\. function:: (.*)$/
        # Capture a c-function signature.  There may be more than one.
        state = :func14
        funcgrp = RstFuncGroup.new($1)
        allfgrps << funcgrp
        
      elsif line =~ /^\.\. macro:: (.*)$/
        # macros in .rst typically contain the contents of what
        # @table contained in .texi
        state = :macro
        curmacro = RstMacro.new($1)
        macros << curmacro
        
      elsif line =~ /^\.\. (Exceptional Return Values:.*)$/
        # comment for a function
        funcgrp.add_desc($1)
        state = :fcomment
        
      elsif line =~ /^\.\./
        # other not-macro/function indented section
        # this will reset our state machine
        state = nil
        

      elsif %i[func3 func14].include?(state) && line.strip.empty?
        # if we're in a function group and hit an empty line then
        # the function group is "closed" and now were in a comment.
        state = :fcomment

      elsif state == :func14 && line =~ /^\s{14}(.*)$/
        # an additional function that is fully indented (14-spcs)
        funcgrp.add_func($1)

      elsif state == :func3 && line =~ /^\s{3}(.*)$/
        # an additional function that is fully indented (3-spcs)
        funcgrp.add_func($1)

      elsif %i[func14 fcomment].include?(state) && line =~ /^\s{3}(\S.*)/
        raw_desc = $1
        next if raw_desc =~ /^\s*\.\. image::/ # skip images
        # comment for a function
        funcgrp.add_desc(raw_desc)
        state = :fcomment

      elsif (state == :macro || state == :mcomment) && line =~ /^\s{3}(\S.*)/
        # comment for macro
        curmacro.add_desc($1)
        state = :mcomment
        
      elsif line =~ /^\w/ 
        # if we are in an indented block and hit a line that starts
        # with a word-character then our indented block is finished.
        state = nil
      end
      #DEBUG-PARSE:
      p [state, line] if debug
    end

    # We now have everything as a list of Objects, but we
    # want to map these into a similar data structure set to what was used
    # for the .texi the backend processing can be reused.
    funcs = allfgrps.flat_map { |fg| fg.to_a }
    @funcs = funcs.sort { |a,b| a[:func_name] <=> b[:func_name] }

    @macros = macros.map {|c| [[ c.name, c.get_desc ]] }
    return self
    
  end
end


# Debug mode
if __FILE__ == $0
  require 'pp'
  require 'fileutils'
  require 'optparse'
  require_relative 'parse_texi'

  debug = nil
  OptionParser.new do |opts|
    opts.banner = "Usage: parse_rst.rb [options]"
    opts.on("-d", "--debug", "debug parse") { debug = true }
  end.parse!

  ARGV.each do |fn|
    p fn
    data = ParseGslRst.new(fn, debug: debug)
    puts "## Functions ##"
    pp data.funcs
    puts "## Macros ##"
    pp data.macros
  end

end







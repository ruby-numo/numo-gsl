class ParseGslTexi

  def initialize
    @func_list = []
    @tables = []
  end

  attr_reader :deftypefun, :tables

  def parse(texi_array)
    texi_array.each do |a|
      parse_block(a)
    end
    @deftypefun = @func_list.map{|x| parse_func(*x)}
  end

  def parse_block(a,desc=[])
    case a[0]
    when "@deftypefun"
      @func_list << [a[1],desc]
    when "@table"
      @tables << parse_table(a[2])
      return
    when "@example"
    when "@ifinfo"
    else
      return
    end
    a[2].each do |l|
      case l.size
      when 1
        if /^@\w+$/ !~ l[0]
          desc << l[0]
        end
      when 2
        case l[0]
        when "@deftypefunx"
          @func_list << [l[1],desc]
        when "@comment"
          desc << l[1]
        end
      when 3
        case l[0]
        when "@tex"
        else
          parse_block(l,desc)
        end
      end
    end
  end

  def parse_table(a)
    table = []
    a.each do |x|
      if x[0] == "@item"
        table << [x[1],[]]
      elsif /^@\w+$/ !~ x[0] && !table.empty?
        table.last[1].concat(x)
      end
    end
    table.each{|x| x[1] = ParseTexi.decode(x[1].join(" "))}
    table
  end

  def parse_func(func,desc)
    func = ParseTexi.decode(func)
    if /([^\(\)]*)\(([^\(\)]*)\)/ =~ func.strip
      a = [$1,$2]
      funcs = parse_type_name(a[0])
      args = a[1].split(/,/).map{|x| parse_type_name(x)}
    else
      funcs = [line]
      args = []
    end
    { func_name:funcs[1],
      func_type:funcs[0],
      args:args,
      desc:ParseTexi.decode(desc.join("\n")) }
  end

  def parse_type_name(line)
    if /^(.*?)([\[\]\w]+)$/ =~ line.strip
      [$1.strip.tr("{}",""),$2.strip]
    else
      [line]
    end
  end

  def to_s
    @func+"\n"+[@funcs,@args].inspect+"\n--\n"+@desc+"\n--\n"
  end

end


module ParseMacro
  module_function

  def parse_const(f)
    const = []
    f = f.gsub(%r|/\*.*?\*/|,"").gsub(%r|//.*$|,"")
    f.each_line do |line|
      case line
      when /\s*#define\s+([A-Z]\w*)(.*)$/
        m,d = $1,$2
        if /^\(/ !~ d
          const << [m]
        end
      end
    end
    const
  end

  def parse_enum(f)
    enum = []
    #f = f.gsub(%r|/\*.*?\*/|,"").gsub(%r|//.*$|,"")
    f.scan(/\benum\s*\{(.*?)\}/m) do |s,|
      m = 0
      s.scan(/(\w+)(?:\s*=\s*([-0-9]+))?(?:\s*,)?(?:\s*\/\*(.*?)\*\/)?/) do |k,n,c|
        n = n ? n.to_i : m
        c = c ? c.strip : ""
        enum << [k,n,c]
        m = n + 1
      end
    end
    enum
  end

  def parse_type(f)
    t = []
    f = f.gsub(%r|/\*.*?\*/|,"").gsub(%r|//.*$|,"")
    f.each_line do |line|
      case line
      when /^\s*GSL_VAR const gsl_\w+_type\s*\*\s*(gsl_\w+)\s*;/
        t << $1
      end
    end
    t
  end

end


def write_def(out_path, def_file, version, content)
  fn = File.join(out_path, def_file % version)
  open(fn,"w"){|f| PP.pp(content,f); f.sync }
  puts "Wrote #{content.size} items to "+fn
  dn = File.join(out_path, def_file % "def")
  if File.exist?(dn)
    if system("diff -q #{fn} #{dn}")
      File.delete(fn)
      puts "Delete #{fn} due to same contents"
    end
  else
    File.rename(fn,dn)
    puts "Rename #{fn} #{dn}"
  end
end

def gendef_func(src_dir, src_files)
  /gsl-([\d.]+)/ =~ src_dir
  version    = $1
  const_file = "const_%s.rb"
  func_file  = "func_%s.rb"
  type_file  = "type_%s.rb"

  src_files.each do |texi_pat,out_path,h_pat,name_re|
    funcs = []
    const = {}
    types = []

    if h_pat
      Dir.glob(File.join(src_dir,h_pat)) do |fn|
        puts "# read #{File.basename(fn)}"
        t = ParseMacro.parse_type(open(fn).read)
        types.concat(t)
      end
    end

    if h_pat && name_re
      Dir.glob(File.join(src_dir,h_pat)) do |fn|
        puts "# read #{File.basename(fn)}"
        t = ParseMacro.parse_const(open(fn).read)
        t.each do |x|
          if name_re =~ x[0]
            const[x[0]] = x[1]
          end
        end
      end
    end

    Dir.glob(File.join(src_dir,texi_pat)) do |fn|
      puts "# #{File.basename(fn)}"
      a = ParseTexi.parse(open(fn))
      g = ParseGslTexi.new
      g.parse(a)
      g.tables.each do |t|
        t.each do |x|
          if name_re && name_re =~ x[0]
            const[x[0].strip] = x[1]
          end
        end
      end
      f = g.deftypefun
      f = f.select{|h| name_re =~ h[:func_name]} if name_re
      funcs.concat(f)
    end

    FileUtils.mkdir_p(out_path)

    if !const.empty?
      clist = const.keys.sort.map{|k| [k,const[k]]}
      write_def(out_path, const_file, version, clist)
    end

    if !funcs.empty?
      write_def(out_path, func_file, version, funcs)
    end

    if !types.empty?
      write_def(out_path, type_file, version, types)
    end
  end
end

def gendef_enum(src_dir,enum_files)
  /gsl-([\d.]+)/ =~ src_dir
  version   = $1
  enum_file = "enum_%s.rb"
  enum_files.each do |out_path,h_pat|
    enum = []
    h_pat.each do |h_file|
      Dir.glob(File.join(src_dir,h_file)) do |fn|
        puts "# read #{File.basename(fn)}"
        enum.concat ParseMacro.parse_enum(open(fn).read)
      end
    end

    FileUtils.mkdir_p(out_path)

    if !enum.empty?
      write_def(out_path, enum_file, version, enum)
    end
  end
end


if __FILE__ == $0
  require 'pp'
  require 'fileutils'
  require_relative 'parse_texi'

  enum_files =
  [
   ["../ext/numo/gsl/sys",
    %w[
     eigen/gsl_eigen.h
     err/gsl_errno.h
     err/gsl_message.h
     ieee-utils/gsl_ieee_utils.h
     integration/gsl_integration.h
     monte/gsl_monte_vegas.h
    ],
   ],
  ]

  src_files =
  [
   ["doc/const.texi",
    "../ext/numo/gsl/const",
    "const/gsl_const_*.h",
    /^GSL_CONST_(.*)$/,
   ],
   ["doc/math.texi",
    "../ext/numo/gsl/sys",
    nil,
    /.*/
   ],
   ["doc/specfunc-*.texi",
    "../ext/numo/gsl/sf"],
   ["doc/statistics.texi",
    "../ext/numo/gsl/stats"],
   ["doc/randist.texi",
    "../ext/numo/gsl/ran"],
   ["doc/randist.texi",
    "../ext/numo/gsl/pdf",
    nil,
    /^gsl_.*pdf$/
   ],
   ["doc/randist.texi",
    "../ext/numo/gsl/cdf",
    nil,
    /^gsl_cdf_/
   ],
   ["doc/rng.texi",
    "../ext/numo/gsl/rng",
    "rng/gsl_rng.h",
   ],
   ["doc/rstat.texi",
    "../ext/numo/gsl/rstat"],
   ["doc/histogram.texi",
    "../ext/numo/gsl/histogram"],
   ["doc/interp.texi",
    "../ext/numo/gsl/interp",
    "interpolation/gsl_interp*.h",
   ],
   ["doc/dwt.texi",
    "../ext/numo/gsl/wavelet",
    "wavelet/gsl_wavelet.h",
   ],
   ["doc/fitting.texi",
    "../ext/numo/gsl/fit",
    nil,
    /^gsl_fit_(.*)$/,
   ],
   ["doc/*fit*.texi",
    "../ext/numo/gsl/multifit",
    "multifit_nlinear/gsl_multifit*.h",
    /^gsl_multifit_(.*)$/,
   ],
   ["doc/fitting.texi",
    "../ext/numo/gsl/multilarge",
    nil,
    /^gsl_multilarge_(.*)$/,
   ],
   ["doc/sp[bml]*.texi",
    "../ext/numo/gsl/spmatrix",
    nil,
    /^GSL_(.*)$/,
   ],
   ["doc/sp[bml]*.texi",
    "../ext/numo/gsl/spmatrix",
    "splinalg/gsl_splinalg.h",
    /^gsl_sp(.*)$/,
   ],
  ]
=begin
  src_files =
  [
  ]
  enum_files = []
=end
  Dir.glob("../../gsl-*").reverse.each do |src_dir|
    puts src_dir
    gendef_func(src_dir,src_files)
    gendef_enum(src_dir,enum_files)
  end
end

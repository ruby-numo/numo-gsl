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
end


if __FILE__ == $0
  require 'pp'
  require 'fileutils'
  require_relative 'parse_texi'

  src_files =
  [
   ["doc/const.texi",
    "../ext/numo/gsl/const/gen",
    "const/gsl_const_*.h",
    /^GSL_CONST_(.*)$/,
   ],
   ["doc/math.texi",
    "../ext/numo/gsl/sys/gen",
    nil,
    /^M_(.*)$/,
   ],
   ["doc/specfunc-*.texi",
    "../ext/numo/gsl/sf/gen"],
   ["doc/statistics.texi",
    "../ext/numo/gsl/stats/gen"],
   ["doc/randist.texi",
    "../ext/numo/gsl/ran/gen"],
   ["doc/rstat.texi",
    "../ext/numo/gsl/rstat/gen"],
  ]
  src_dir = "../../gsl-2.1"

  src_files.each do |texi_pat,out_path,h_pat,name_re|
    funcs = []
    const = {}

    if h_pat && name_re
      Dir.glob(File.join(src_dir,h_pat)) do |fn|
        puts "# read #{File.basename(fn)}"
        t = ParseMacro.parse_const(open(fn))
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
      funcs.concat g.deftypefun
    end
    FileUtils.mkdir_p(File.dirname(out_path))
    if !const.empty?
      clist = const.keys.sort.map{|k| [k,const[k]]}
      PP.pp(clist,open(File.join(out_path,"const_def.rb"),"w"))
      puts "Wrote #{clist.size} constants to #{out_path}/const_def.rb"
    end
    if !funcs.empty?
      PP.pp(funcs,open(File.join(out_path,"func_def.rb"),"w"))
      puts "Wrote #{funcs.size} functions to #{out_path}/func_def.rb"
    end
  end

end

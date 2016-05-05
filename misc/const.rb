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
    #pp a
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
    "const/gsl_const_*.h",
    /^GSL_CONST_(.*)$/,
    "../ext/numo/gsl/const/gen/const_def.rb"],
   ["doc/math.texi",
    "none",
    /^M_(.*)$/,
    "../ext/numo/gsl/sys/gen/const_def.rb"],
   #["specfunc-legendre.texi","gsl_sf_def.rb"]
  ]
  src_dir = "../../gsl-2.1"

  src_files.each do |texi_pat,h_pat,name_re,out_path|
    list = {}
    Dir.glob(File.join(src_dir,h_pat)) do |fn|
      puts "# #{File.basename(fn)}"
      t = ParseMacro.parse_const(open(fn))
      t.each do |x|
        if name_re =~ x[0]
          list[x[0]] = x[1]
        end
      end
    end
    Dir.glob(File.join(src_dir,texi_pat)) do |fn|
      puts "# #{File.basename(fn)}"
      a = ParseTexi.parse(open(fn))
      #pp a
      g = ParseGslTexi.new
      g.parse(a)
      g.tables.each do |t|
        t.each do |x|
          if name_re =~ x[0]
            list[x[0].strip] = x[1]
          end
        end
      end
      #list.concat DefTypeFun.parse(a)
      #list = b.map{|x| DefTypeFun.new(*x)}
      #list.each{|x| puts x if /^gsl_sf_/=~x.func_name}
    end
    list2 = list.keys.sort.map{|k| [k,list[k]]}
    FileUtils.mkdir_p(File.dirname(out_path))
    PP.pp(list2,open(out_path,"w"))
    puts "Wrote #{list2.size} definitions to #{out_path}"
  end
end

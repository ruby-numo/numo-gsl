module DefTypeFun

  module_function

  def parse(texi_array)
    list = []
    texi_array.each do |a|
      parse_block(a,list)
    end
    list.map{|x| parse_func(*x)}
  end

  def parse_block(a,list,desc=[])
    case a[0]
    when "@deftypefun"
      list << [a[1],desc]
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
          list << [l[1],desc]
        when "@comment"
          desc << l[1]
        end
      when 3
        case l[0]
        when "@tex"
        else
          parse_block(l,list,desc)
        end
      end
    end
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

if __FILE__ == $0
  require 'pp'
  require 'fileutils'
  require_relative 'parse_texi'

  texi_files =
  [
   ["specfunc-*.texi","../ext/numo/gsl/sf/gen/sf_def.rb"],
   ["math.texi","../ext/numo/gsl/sys/gen/sys_def.rb"],
   ["statistics.texi","../ext/numo/gsl/stats/gen/stats_def.rb"],
   #["specfunc-legendre.texi","gsl_sf_def.rb"]
  ]
  doc_dir = "../../gsl-2.1/doc"

  texi_files.each do |pat,out_path|
    list = []
    Dir.glob(File.join(doc_dir,pat)) do |fn|
      puts "# #{File.basename(fn)}"
      a = ParseTexi.parse(open(fn))
      #pp a
      list.concat DefTypeFun.parse(a)
      #list = b.map{|x| DefTypeFun.new(*x)}
      #list.each{|x| puts x if /^gsl_sf_/=~x.func_name}
    end
    FileUtils.mkdir_p(File.dirname(out_path))
    PP.pp(list,open(out_path,"w"))
    puts "Wrote #{list.size} definitions to #{out_path}."
  end
end

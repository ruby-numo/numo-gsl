module ParseC

  module_function

  def parse(file_name)
    this_file = true
    lines = ""
    opt = "" # "-C"
    IO.popen("cpp #{opt} #{file_name}").each_line do |line|
      if /^#(.*)$/ =~ line
        prep = $1
        if /^\s*\d+ "([^"]*)"/ =~ prep
          this_file = ($1 == file_name)
        end
      else
        if this_file
          lines << line
        end
      end
    end
    result = []
    while lines.sub!(/(.*?)(\/\*.*?\*\/)/m,"")
      a,b = $1,$2
      a = a.gsub(/struct\s*\{[^}]*\}/m,"struct {}")
      p a
      result.concat a.split(/;/).map{|x| x.strip}
      #result << a.strip
      result << b.strip
      #result << " "+b.gsub(/^ \*\s?/m,"  ")
    end
    a = lines.gsub(/struct\s*\{[^}]*\}/m,"struct {}")
    result.concat a.split(/;/).map{|x| x.strip}
    result
  end

  def decode(s)
    s = s.dup
    # matches nested braces
    while s.gsub!(/@\w+(?<paren>\{(?:[^{}]|\g<paren>)*\})/){|x| $1[1..-2]}
    end
    s
  end

end

if __FILE__ == $0
  require 'pp'

  Dir.glob('../../gsl-2.1/specfunc/gsl_sf_*.h') do |fn|
    #puts "#--- #{File.basename(fn)} ---"
    a = ParseC.parse(fn)
    #a.each{|l| p l}
    #next
    func_list = []
    a.each do |l|
      if /^\/\*/ !~ l
        if x=l.sub(/(?<paren>\((?:[^()]|\g<paren>)*\))$/,"")
          args = $1
          if /\b(\w+)\s*\Z/ =~ x
            func_name = $1
            func_list << func_name
            if func_name == "int"
              p [x,args,l]
            end
          end
        end
      end
    end
    func_list.each{|l| puts l}
    #pp a
    #exit
    #deffun(a)
  end
end
